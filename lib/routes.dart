import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_shmet/screens/home_screen.dart';
import 'package:pet_shmet/scaffold_with_navbar.dart';
import 'package:pet_shmet/screens/movie_details_screen.dart';
import 'package:pet_shmet/screens/movie_screen.dart';
import 'package:pet_shmet/screens/splash_screen.dart';
import 'package:pet_shmet/screens/wether_screen.dart';
import 'package:pet_shmet/screens/settings_screen.dart';
import 'package:pet_shmet/screens/wether_five_day_screen.dart';
import 'package:pet_shmet/main.dart';
import 'package:pet_shmet/screens/login_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();
final _moviesNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) => GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      redirect: (context, state) {
        bool isLoggedIn = ref.watch(isAuthorize);

        if (!isLoggedIn) {
          return '/login';
        } else {
          return null;
        }
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
          // builder: (context, state) => const SplashScreen(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavbar(navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                name: 'home',
                path: '/',
                builder: (context, state) => const MyHomePage(),
              ),
            ]),
            // StatefulShellBranch(routes: <RouteBase>[
            //   GoRoute(
            //     name: 'movie',
            //     path: '/movie',
            //     builder: (context, state) => const MoviePage(),
            //   ),
            // ]),
            StatefulShellBranch(
              navigatorKey: _moviesNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  name: 'movie',
                  path: '/movie',
                  builder: (context, state) => const MoviePage(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: 'movieDetails',
                      path: '/:id',
                      builder: (BuildContext context, GoRouterState state) {
                        final String movieId = state.pathParameters['id']!;
                        return MovieDetailsScreen(movieId: movieId);
                      },
                    )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorKey,
              routes: <RouteBase>[
                GoRoute(
                  name: 'wether',
                  path: '/wether',
                  builder: (context, state) => const WetherScreen(),
                  routes: <RouteBase>[
                    GoRoute(
                      name: 'five-days',
                      path: '/five-days',
                      builder: (context, state) => const WetherFiveDayScreen(),
                    )
                  ],
                ),
              ],
            ),
            StatefulShellBranch(routes: <RouteBase>[
              GoRoute(
                name: 'settings',
                path: '/settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ])
          ],
        ),
      ],
    ));
