# Book Buddy App

Book Buddy App is a versatile project designed to access books in library, search books, check availability of book, changing theme mode like dark and light mode and user profile to see name, email and logout button. This comprehensive guide will provide you with everything you need to know to get started with the project, from installation instructions to a detailed description of its features.

## Table of Contents

- Splash Screen
- User Signup Page
- User Login Page
- Custom AppBar
- HomePage
- Book Recommended section
- Search Page
- Theme Changing Icon
- Book Detail Page
- User profile Page

- [Installation](#installation)

  - Android Studios or V S Code and Simulator

  - [Clone the Repository](#clone-the-repository)

    url - https://github.com/Fardeen2001/book_buddy_app.git
    run **git clone url** in terminal

  - [Configuration](#configuration)

    #### dependencies

        1. SharedPreference - version:2.2.2 for storing the specific user locally.
        2. Fluttertoast - version:8.2.4

        Inside pubspecs.yaml file under dependencies section add

        dependencies:
          shared_preferences: ^2.2.2
          fluttertoast: ^8.2.4 **

    In terminal run **flutter pub get** to install dependencies

  - [Build and Run](#build-and-run)

    Connect simulator and run the project by clicking the command **Control + Shift + F10**

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)
