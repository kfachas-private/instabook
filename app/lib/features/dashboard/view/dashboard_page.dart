import 'package:app/features/counter/counter.dart';
import 'package:app/features/dashboard/logic/dashboard_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n/generated/l10n.dart';

import '../../../core/router/router.gr.dart';

@RoutePage(name: 'DashboardRoute')
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  //@override
  //State<ClientOnboardingKitPage> createState() => DashboardView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DashboardCubit>();
    return Scaffold(
      appBar: AppBar(title: Text(I18n.current.dashboard_page_activityTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
           TextField(
             onChanged: cubit.setTextField,
           ),
          ),
          TextButton(onPressed: () {
            context.router.push(const CounterRoute());
            }, child: Text(cubit.isActive ? "Rien faire" : "Go to Counter")),

        ],
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
    return {};
  }
}