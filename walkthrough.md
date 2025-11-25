# ECommerceApp Walkthrough

## Accomplished
- Created a Flutter Web application structure.
- Implemented MVC architecture with MobX state management.
- Configured `pubspec.yaml` with dependencies: `flutter_mobx`, `mobx`, `provider`, `intl`.
- Created Core Layer: Models (`Product`, `CartItem`, `User`) and `BaseStore`.
- Created Data Layer: `mock_data.dart` with sample products.
- Created Features Layer:
    - **Auth**: `AuthStore` and `LoginScreen`.
    - **Home**: `ProductStore` and `HomeScreen`.
    - **Product Detail**: `ProductDetailScreen`.
    - **Cart**: `CartStore` and `CartScreen`.
    - **Settings**: `SettingsStore` and `SettingsScreen`.
- Created Shared Layer: `AppLocalizations` and JSON translation files (en, vi).
- Generated MobX code using `build_runner`.
- Added placeholder assets.

## Verification Results
### Automated Tests
- `flutter pub run build_runner build` passed successfully.

### Manual Verification Steps
1. **Run the App**: `flutter run -d chrome`
2. **Login**:
    - Enter any username/password.
    - Click "Login" (or "Đăng nhập").
    - Verify redirection to Home Screen.
3. **Home Screen**:
    - Verify list of products is displayed.
    - Verify images (placeholders) and prices are shown.
    - Click on a product to view details.
4. **Product Detail**:
    - Verify product information.
    - Click "Add to Cart".
    - Verify SnackBar confirmation.
5. **Cart**:
    - Click Cart icon in AppBar.
    - Verify items are listed.
    - Test increasing/decreasing quantity.
    - Test removing item.
    - Verify Total Price updates.
6. **Settings**:
    - Click Settings icon in AppBar.
    - Toggle "Dark Mode" -> Verify app theme changes to dark.
    - Change Language -> Verify app text changes between English and Vietnamese.

## Next Steps
- Replace placeholder images with actual assets.
- Implement real authentication and backend integration.
- Add unit and widget tests.
