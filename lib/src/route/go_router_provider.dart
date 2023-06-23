import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:task_two/src/common/common_pages/scaffold_with_nav_bar.dart';
import 'package:task_two/src/features/profile/presentaion_layer/pages/profile_page.dart';
import 'package:task_two/src/features/recipes/presentation_layer/pages/add_recipe_page.dart';
import 'package:task_two/src/features/recipes/presentation_layer/pages/recipes_page.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/pages/add_item_page.dart';
import 'package:task_two/src/features/refrigerator/presentation_layer/pages/refrigerator_page.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/pages/add_tip_page.dart';
import 'package:task_two/src/features/storage_tips/presentation_layer/pages/storage_tips_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/auth_checker.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/alert_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/gender_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/login_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/registration_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/select_profile_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/shopping_frequency_page.dart';
import 'package:task_two/src/features/user_managements/presentation_layer/pages/verification_page.dart';



final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/AuthPage',
    routes: [
      GoRoute(
        path: '/AuthPage',
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: '/LoginPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoginPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's value
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/RegisterPage',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: RegisterPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Change the opacity of the screen using a Curve based on the the animation's value
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
        routes: [
          GoRoute(
            path: 'VerificationPage',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: VerificationPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  // Change the opacity of the screen using a Curve based on the the animation's value
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  );
                },
              );
            },
            routes: [
              GoRoute(
                path: 'GenderPage',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: GenderPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                routes: [
                  GoRoute(
                    path: 'SelectProfilePage',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: const SelectProfilePage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                      routes: [
                        GoRoute(
                          path: 'ShoppingFrequencyPage',
                          pageBuilder: (context, state) {
                            return CustomTransitionPage(
                              key: state.pageKey,
                              child: const ShoppingFrequencyPage(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                // Change the opacity of the screen using a Curve based on the the animation's value
                                return FadeTransition(
                                  opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                                  child: child,
                                );
                              },
                            );
                          },
                          routes: [
                            GoRoute(
                              path: 'AlertPage',
                              pageBuilder: (context, state) {
                                return CustomTransitionPage(
                                  key: state.pageKey,
                                  child: AlertPage(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    // Change the opacity of the screen using a Curve based on the the animation's value
                                    return FadeTransition(
                                      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                                      child: child,
                                    );
                                  },
                                );
                              },
                            ),
                          ]
                        ),
                      ]
                  ),
                ]
              ),
            ]
          ),
        ]
      ),
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithNavbar(child);
          },
          routes: [
            GoRoute(
                path: '/MyRefridgeratorPage',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: MyRefridgeratorPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'AddItemPage',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: AddItemPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ]
            ),
            GoRoute(
                path: '/RecipesPage',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: RecipesPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'AddRecipePage',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: AddRecipePage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ]
            ),
            GoRoute(
                path: '/StorageTipsPage',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: StorageTipsPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      // Change the opacity of the screen using a Curve based on the the animation's value
                      return FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'AddTipPage',
                    pageBuilder: (context, state) {
                      return CustomTransitionPage(
                        key: state.pageKey,
                        child: AddTipPage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          // Change the opacity of the screen using a Curve based on the the animation's value
                          return FadeTransition(
                            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                            child: child,
                          );
                        },
                      );
                    },
                  ),
                ]
            ),
            GoRoute(
              path: '/MyProfilePage',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: MyProfilePage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    // Change the opacity of the screen using a Curve based on the the animation's value
                    return FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                      child: child,
                    );
                  },
                );
              },
            ),
          ]
      ),
    ],
  );
});
