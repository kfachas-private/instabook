import 'package:app/features/counter/counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n/generated/l10n.dart';

@RoutePage(name: 'SplashRoute')
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(I18n.current.accessibility_logo),
      ),
    );
  }
}
