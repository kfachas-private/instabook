import 'package:app/core/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'MainRoute')
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        DashboardRoute(),
        CounterRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(label: 'Dashboard',icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(label: 'Counter', icon: Icon(Icons.safety_check_rounded)
            ),
          ],
        );
      },
    );
  }
}