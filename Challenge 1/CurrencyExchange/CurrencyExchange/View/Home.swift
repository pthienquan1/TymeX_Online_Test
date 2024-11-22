import SwiftUI

struct Home: View {
    @StateObject var viewModel = FetchData()
    @State private var amount: String = "" //input amount
    @State private var fromCurrency: String = "USD" // original currency
    @State private var toCurrency: String = "EUR" // destination currency
    @State private var convertedAmount: Double? = nil //result

    var body: some View {
        VStack(spacing: 15) {
            if viewModel.conversionData.isEmpty {
                ProgressView()
            } else {
                HStack(spacing: 15) {
                    // Picker cho "From Currency"
                    Picker("From:", selection: $fromCurrency) {
                        ForEach(sortedCurrencies(conversionData: viewModel.conversionData), id: \.self) { currency in
                            Text("\(getFlag(currency: currency)) \(currency)")
                                .font(.system(size: 16))
                                .tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)

                    // Picker for "To Currency"
                    Picker("To:", selection: $toCurrency) {
                        ForEach(sortedCurrencies(conversionData: viewModel.conversionData), id: \.self) { currency in
                            Text("\(getFlag(currency: currency)) \(currency)")
                                .font(.system(size: 16))
                                .tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)

                // Input amount
                TextField("Enter amount", text: $amount)
                    .font(.system(size: 28))
                    .padding()
                    .frame(height: 60)
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
                    .onChange(of: amount) { newValue in
                        // handle invalid input like alphabet and negative num
                        let validAmount = isValidAmount(newValue)
                        if !validAmount {
                            amount = "" // reset value if invalid input
                        }
                        calculateConversion() //update result
                    }

                // display result
                if let result = convertedAmount {
                    Text("\(amount) \(fromCurrency) = \(String(format: "%.2f", result)) \(toCurrency)")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top, 15)
                }
            }
        }
        .onAppear {
            viewModel.updateData(base: "USD")
        }
        .onChange(of: fromCurrency) { _ in
            calculateConversion()
        }
        .onChange(of: toCurrency) { _ in
            calculateConversion()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }

    // calculate to convert
    private func calculateConversion() {
        guard let amountValue = Double(amount),
              let fromRate = viewModel.conversionData.first(where: { $0.currencyName == fromCurrency })?.currencyValue,
              let toRate = viewModel.conversionData.first(where: { $0.currencyName == toCurrency })?.currencyValue else {
            convertedAmount = nil
            return
        }

        convertedAmount = CurrencyExchange.calculateConversion(amount: amountValue, fromRate: fromRate, toRate: toRate)
    }
}

#Preview {
    Home()
}
