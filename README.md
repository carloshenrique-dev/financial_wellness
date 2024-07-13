# Financial Wellness App

This Flutter application helps users track their financial wellness by allowing them to input their annual gross income and average monthly costs. Based on this information, the app calculates a financial wellness score indicating how healthy their financial situation is.

## Structure

- `lib/`
  - `main.dart`: Entry point of the application.
  - `screens/financial_form_screen.dart`: Screen with the form to input financial data.
  - `screens/result_screen.dart`: Screen with the result of the analysis.
  - `models/financial_data.dart`: Model representing the financial data.
  - `services/financial_service.dart`: Service for calculating the financial wellness score.
  - `utils/app_colors.dart`: Class to represent app colors.
  - `utils/currency_formatter.dart`: Class to represent our currency formatter.
  - `widgets/custom_text_field.dart`: Custom text field widget for reusable form fields.
  - `widgets/custom_button.dart`: Custom button widget for reusable buttons.
  - `widgets/custom_container.dart`: Custom container widget for reusable container widgets with symbol.
  - `widgets/custom_rich_text.dart`: Custom rich text widget for reusable rich text widgets with different font weight.
  - `widgets/result_bar.dart`: Financial wellness bar widget to show financial wellness score.
  - `widgets/security_widget.dart`: Security widget advisor to show information about user data.

## Tests

This project covers all files/widgets/classes with 100% coverage.

## Business Rules

- The user has to pay 8% of their annual gross income.
- If the user's annual costs are ≤ 25% of their annual net compensation, the score is `HEALTHY`.
- If the user's annual costs are > 25% and ≤ 75% of their annual net compensation, the score is `AVERAGE`.
- If the user's annual costs are > 75% of their annual net compensation, the score is `UNHEALTHY`.

## Validation

- Annual income must be greater than zero.
- Monthly costs must be greater than zero.
- Inputs should only accept numbers.
- Inputs are required.

## How to Run

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the application.
5. Run tests `flutter test` to run tests. 

## Decisions

- The project is organized to separate concerns into models, services, widgets, and screens for better maintainability and scalability.
- Custom widgets are used to make the code reusable and cleaner.
- The app uses flutter best pratices to make it simple
---

This README provides an overview of the project structure, business rules, validation, and instructions on how to run the app. It also explains the decisions made during the development to ensure the code is maintainable and scalable.
