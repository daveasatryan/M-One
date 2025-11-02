import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:m_one_task/core/data/utilities/filters_enum.dart';
import 'package:m_one_task/core/data/utilities/sl/service_locator_factory.dart';
import 'package:m_one_task/core/presentation/views/todos_page/store/todos_store.dart';
import 'package:m_one_task/core/presentation/widgets/base_stateless_widget.dart';
import 'package:provider/provider.dart';

class TodoPage extends BaseStatelessWidget {
  TodoPage({super.key});

  @override
  Widget baseBuild(BuildContext context) {
    final store = context.read<SlFactory>().get<TodosStore>();

    return Scaffold(
      backgroundColor: colors.whiteColor,
      appBar: AppBar(
        backgroundColor: colors.mainAppColor,
        title: Text(
          appStrings.myTodos,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
            color: colors.whiteColor,
          ),
        ),
        actions: [
          PopupMenuButton<Filter>(
            icon: Icon(Icons.filter_list, color: colors.whiteColor),
            onSelected: store.setFilter,
            itemBuilder: (_) => [
              PopupMenuItem(value: Filter.all, child: Text(appStrings.all)),
              PopupMenuItem(
                value: Filter.active,
                child: Text(appStrings.active),
              ),
              PopupMenuItem(
                value: Filter.completed,
                child: Text(appStrings.completed),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.delete_forever, color: colors.whiteColor),
            onPressed: store.clearAllTasks,
          ),
        ],
      ),
      body: Observer(
        builder: (_) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: store.filteredTasks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.task_alt,
                        size: 80,
                        color: colors.deepPurpuleColor,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        appStrings.noTasks,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colors.blackColor,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: store.filteredTasks.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (_, i) {
                    final task = store.filteredTasks[i];
                    return Padding(
                      key: ValueKey(task.id),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Material(
                        color: colors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                        elevation: 3,
                        child: ListTile(
                          leading: Checkbox(
                            activeColor: colors.mainAppColor,
                            value: task.completed,
                            onChanged: (_) => store.toggleComplete(task),
                          ),
                          title: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              decoration: task.completed
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: task.completed
                                  ? colors.grrayColor
                                  : colors.blackColor,
                            ),
                            child: Text(task.title),
                          ),
                          subtitle: Text(
                            task.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: colors.redColor,
                            ),
                            onPressed: () => store.removeTask(task.id),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.mainAppColor,
        child: Icon(Icons.add, color: colors.whiteColor),
        onPressed: () {
          showAddTaskDialog(context, (title, description) {
            if (title.isNotEmpty && description.isNotEmpty) {
              store.addTask(title, description);
              Navigator.pop(context);
            }
          });
        },
      ),
    );
  }
}
