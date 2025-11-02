import 'package:flutter/material.dart';
import 'package:m_one_task/core/presentation/utilities/color/app_colors.dart';
import 'package:m_one_task/core/presentation/utilities/color/color_scheme.dart';
import 'package:m_one_task/core/presentation/utilities/strings/app_strings.dart';

// An abstract base state class for all stateful widgets in the app.
//
// Provides common utilities and helpers that are frequently used across
// multiple screens, including:
// - Access to the app's color scheme via colors.
// - Access to localized strings via appStrings.
// - Methods to hide loading dialogs and keyboard inputs.
// - Automatic cleanup of loading dialogs when the widget is disposed.
//
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  bool _isLoaderShown = false;

  AppColors get colors => Theme.of(context).colorScheme.appColors;

  AppStrings get appStrings => AppStrings();

  void hideLoading(BuildContext context) {
    if (_isLoaderShown) {
      Navigator.pop(context);
      _isLoaderShown = false;
    }
  }

  void hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    hideLoading(context);
    super.dispose();
  }
}
