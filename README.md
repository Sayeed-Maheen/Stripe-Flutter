# Stripe Flutter

Stripe Flutter is a Flutter application that demonstrates the integration of Stripe for payment processing. The app uses the GetX package for efficient state management, making the code structure clean and maintainable.

## Features

- **Stripe Payment Integration**: Supports Stripe for payment processing in test mode.
- **GetX State Management**: Efficient state management using the GetX package.
- **Flutter Framework**: Developed using Flutter for cross-platform compatibility.

## Getting Started

### Prerequisites

Before running the app, ensure you have the following installed:

- [Flutter](https://flutter.dev/docs/get-started/install) (version 3.0 or later)
- [Dart](https://dart.dev/get-dart) (version 2.17 or later)
- An active Stripe account for testing (get your test API keys from [Stripe Dashboard](https://dashboard.stripe.com/test/apikeys))

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Sayeed-Maheen/Stripe-Flutter.git
    ```
2. Change to the project directory:
    ```bash
    cd stripe-flutter
    ```
3. Install the required dependencies:
    ```bash
    flutter pub get
    ```

### Configuration

1. Add your Stripe test keys to the project:

   ```dart
   const String stripePublishableKey = "Your Publishable Key";
   const String stripeSecretKey = "Your Secret Key";
   
 ```bash
    flutter run
  ```

lib
├── controllers           # GetX controllers
│
├── widgets               # Used in app
│
└── main.dart             # Entry point of the app
│
└── payment_screen.dart   # Payment related UI



Testing

You can test the Stripe integration using the test card details provided by Stripe, such as:

    Card Number: 4242 4242 4242 4242
    Expiry Date: Any future date
    CVC: Any 3-digit number
    Country: Any
    Zip Code: Any

For more test card details, check the Stripe Testing Documentation.
Contributing

If you wish to contribute to this project, feel free to create a pull request or report any issues you encounter.
License

This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgements

    Stripe for their excellent payment platform.
    GetX for state management in Flutter.
