import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:m_one_task/core/data/utilities/sl/service_locator_factory.dart';
import 'package:m_one_task/core/presentation/utilities/routes/app_routes.dart';
import 'package:m_one_task/core/presentation/widgets/base_state.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends BaseState<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SlFactory(getIt: GetIt.instance)),
      ],
      child: Builder(
        builder: (context) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return ScreenUtilInit(
                designSize: Size(constraints.maxWidth, constraints.maxHeight),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, _) {
                  return ResponsiveWrapper.builder(
                    MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      routerConfig: AppRoutes.router,
                    ),

                    minWidth: 450,
                    defaultScale: true,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
