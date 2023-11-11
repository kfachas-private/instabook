import 'package:app/core/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: MainRoute.page,
      children: [
        AutoRoute(
          path: 'dashboard',
          page: DashboardRoute.page,
        ),
        AutoRoute(
          path: 'counter',
          page: CounterRoute.page,
        ),
      ],
    ),
    //AutoRoute(path: '/login', page: LoginRoute.page)
  ];


  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next();

    //if(isAuthenticated || resolver.route.name == LoginRoute.name){
      // we continue navigation
    //resolver.next();
    //}else{
      // else we navigate to the Login page so we get authenticateed

      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
    //resolver.redirect(LoginRoute(onResult:(didLogin)=> resolver.next(didLogin)))
    }
}