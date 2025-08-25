# Affirmation App

A beautiful Flutter app for daily affirmations organized by categories.

## Features

- 12 categories of affirmations: Love, Confidence, Health, Wealth, Peace, Motivation, Success, Happiness, Gratitude, Positivity, Focus, and Calm
- Beautiful Material 3 design with Google Fonts
- Grid layout with 3x4 categories on the home screen
- Each category contains 10+ thoughtfully crafted affirmations
- Smooth navigation between screens
- Responsive and intuitive UI

## Categories

1. **Love** - Affirmations about self-love and loving relationships
2. **Confidence** - Building self-confidence and belief in yourself
3. **Health** - Physical and mental wellness affirmations
4. **Wealth** - Financial abundance and prosperity mindset
5. **Peace** - Inner peace and tranquility
6. **Motivation** - Drive and inspiration for achieving goals
7. **Success** - Mindset for achieving success in all areas
8. **Happiness** - Joy and positive emotions
9. **Gratitude** - Appreciation and thankfulness
10. **Positivity** - Maintaining a positive outlook
11. **Focus** - Mental clarity and concentration
12. **Calm** - Serenity and stress relief

## Getting Started

### Prerequisites
- Flutter SDK >=3.22.0
- Dart SDK >=3.3.0

### Installation
1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

### Building APK
Run `flutter build apk --release` to build a release APK.

## Dependencies
- flutter
- cupertino_icons: ^1.0.6
- google_fonts: ^6.3.0

## GitHub Actions
This project includes a GitHub Actions workflow that automatically builds an APK on every push to main branch. The APK is uploaded as an artifact named `affirmation_app-release.apk`.
