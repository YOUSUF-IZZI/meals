import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_two/src/route/go_router_provider.dart';
import 'package:task_two/theme/color_schemes.g.dart';
import 'package:task_two/theme/custom_color.g.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: TaskTwo()));
}


class TaskTwo extends ConsumerWidget {
  const TaskTwo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routingProvider = ref.watch(goRouterProvider);
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;
        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);
          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp.router(
              routerDelegate: routingProvider.routerDelegate,
              routeInformationParser: routingProvider.routeInformationParser,
              routeInformationProvider: routingProvider.routeInformationProvider,

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightScheme,
                extensions: [lightCustomColors],
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkScheme,
                extensions: [darkCustomColors],
              ),
            );
          }
        );
      },
    );
  }
}

