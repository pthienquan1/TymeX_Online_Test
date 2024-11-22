# Project Structure

## CHALLENGE 1: Currency Exchange App
This project uses SwiftUI for development. The main structure consists of 4 main folders:

## 1. **Mock**
The `Mock` folder is used to create sessions for the purpose of writing unit tests, ensuring that the actual API calls are not made during testing.

## 2. **Model**
The `Model` folder contains two classes, `Conversion.swift` and `Currency.swift`, formatted according to the API structure from the Exchange Rates API Data.

## 3. **View**
The `View` folder contains the UI components built with SwiftUI. This folder is responsible for rendering the user interface.

## 4. **ViewModel**
The `ViewModel` folder is responsible for fetching data from the API and contains various helper functions for handling the UI logic.

## 5. **Unit Tests**
In addition to the main implementation, unit tests have been written for the files in the `Model` and `ViewModel` folders. These include:

- **ConversionTest**: Unit tests for the `Conversion.swift` model.
- **CurrencyTest**: Unit tests for the `Currency.swift` model.
- **CurrencyHelperTests**: Unit tests for any helper functions related to currency.
- **FetchDataTests**: Unit tests for the data-fetching logic in the `ViewModel`.

## 6. **App Details**

### MVVM Architecture
The app follows the MVVM (Model-View-ViewModel) architecture.

- **Fetch Data from API**: 
  - I use a separate API key, which is included in the header because the Exchange Rates API requires this due to their plan limiting free requests to 100 per month. 
  - To facilitate unit testing without calling the actual API during tests, I created a custom URL session.

- **CurrencyHelper**: 
  - I created functions to handle user input, ensuring that no letters or negative numbers can be entered for currency conversion. 
  - I also use country flags to make it easier for users to visualize the currency selection. 
  - Special currencies like gold, silver, and Bitcoin are represented as icons to match the country's flag, avoiding the error "flag not found". 
  - I sorted the countries alphabetically from A to Z for better usability.

- **Model**:
  - `Currency.swift` is used to display the data, while `Conversion.swift` fetches data.

- **View**:
  - The view consists of two pickers for currency selection, input validation, and a real-time result display.

---

This structure is designed to separate the concerns of the project, making it easier to manage and test.

##CHALLENGE 2: USING SWIFT PLAYGROUND 

###Challenge 2.1 Product Inventory Management - DONE

###Challenge 2.2 Array Manipulation and Missing Number Problem - DONE


## Steps to run: git clone and run of each folder Challenge 1 and Challenge 2
