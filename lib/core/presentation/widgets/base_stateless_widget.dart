import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:m_one_task/core/presentation/utilities/color/app_colors.dart';
import 'package:m_one_task/core/presentation/utilities/color/color_scheme.dart';
import 'package:m_one_task/core/presentation/utilities/strings/app_strings.dart';
import 'package:m_one_task/core/presentation/widgets/custom_widgets/custom_text_field.dart';

// An abstract base class for stateless widgets in the app.
//
// Provides common utilities and helpers used across multiple screens, including:
// - Access to the app's color scheme via colors.
// - Access to localized strings via appStrings.
// - A reference to context to allow usage in non-build methods.
// - Methods to hide the keyboard using hideKeyboard.
// - A base method baseBuild that subclasses must implement instead of `build`.
// - A reusable dialog showAddTaskDialog to add a new task with title and description.
//
abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({super.key});

  AppColors get colors => Theme.of(context).colorScheme.appColors;

  AppStrings get appStrings => AppStrings();

  late BuildContext context;

  void hideKeyboard() {
    FocusScope.of(context).unfocus();
  }

  Widget baseBuild(BuildContext context);

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return baseBuild(context);
  }

  void showAddTaskDialog(
    BuildContext context,
    Function(String title, String description) save,
  ) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appStrings.addNewTask,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              CustomTextField(
                controller: titleController,
                label: appStrings.title,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descController,
                label: appStrings.description,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.blackColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    save(titleController.text, descController.text);
                  },
                  child: Text(
                    appStrings.save,
                    style: TextStyle(fontSize: 16, color: colors.whiteColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
