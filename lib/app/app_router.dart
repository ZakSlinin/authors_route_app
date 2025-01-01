import 'package:authors_route_app/app/app_router.gr.dart';
import 'package:authors_route_app/features/authentication/auth_services.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          guards: const [AuthRouteGuard()],
          page: AuthorsRouteHomeRoute.page,
        ),
        AutoRoute(page: AuthorsAddRouteRoute.page),
        AutoRoute(page: UserProfileRoute.page),
        AutoRoute(page: AuthenticationRoute.page),
      ];
}

final class AuthRouteGuard extends AutoRouteGuard {
  const AuthRouteGuard();

  void onUserUpdate(NavigationResolver resolver) {
    if (FirebaseService().isAuthenticated) {
      resolver.next();
    } else {
      resolver.redirect(
        const AuthenticationRoute(),
      );
    }
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) =>
      FirebaseService().listenUser((user) => onUserUpdate(resolver));
}
