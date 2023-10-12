# Dice Roller App

## Overview

This Flutter application is a simple dice roller that allows users to roll a virtual six-sided die. The app features a visually appealing gradient background and displays the rolled number along with an animated dice image.

## Getting Started

To use this application, follow these steps:

1. **Clone the repository to your local machine.**
2. **Open the project in Flutter.**
3. **Run the application on your preferred emulator or physical device.**

## Dependencies

This project uses the following dependencies:

- `flutter/material.dart`
- `dart:async`
- `dart:math`

Make sure to check the Flutter documentation for the latest information on these dependencies.

## Usage

The main entry point of the application is `main.dart`, which initializes the Flutter app with a `MaterialApp` and a `Scaffold` containing a `GradientContainer`. The `GradientContainer` widget displays a gradient background and contains the `DiceRoller` widget in its center.

## Components

### GradientContainer

The `GradientContainer` widget is responsible for displaying a gradient background. It takes a list of colors as a parameter and creates a linear gradient from the top right to the bottom left. Inside the container, it contains a `DiceRoller` widget at the center.

### DiceRoller

The `DiceRoller` widget is the core of the application. It is a stateful widget that animates the rolling of a dice. It uses the `RotationTransition` to create a spinning animation when the dice is rolled. The widget also contains a button (`CustomButton`) to trigger the dice roll and display the rolled number.

### CustomText

The `CustomText` widget is a simple text widget with custom styling. It is used to display various text elements in the app, such as the instruction to roll the dice and the rolled number.

### CustomButton

The `CustomButton` widget is a customizable button that takes a function to execute when pressed, background color, width, text, and a disabled state. It is used for the roll button in the `DiceRoller` widget.

Feel free to explore and modify the code to suit your needs. Happy coding!
