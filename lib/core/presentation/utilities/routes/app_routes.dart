import 'package:go_router/go_router.dart';
import 'package:m_one_task/core/presentation/views/todos_page/todos_page.dart';

class AppRoutes {
  static const todoListRoute = '/todos';

  static final GoRouter router = GoRouter(
    initialLocation: todoListRoute,
    routes: [
      GoRoute(
        path: todoListRoute,
        pageBuilder: (context, state) => NoTransitionPage(child: TodoPage()),
      ),
    ],
  );
}
