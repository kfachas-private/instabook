import 'package:app/core/router/router.dart';
import 'package:design_system/dimens.dart';
import 'package:design_system/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/generated/l10n.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return  MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        localizationsDelegates: const [
          I18n.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        supportedLocales: const [Locale('fr', '')],
        routerConfig: appRouter.config(),
      );
  }
}

class AppBootstrapError extends StatelessWidget {
  const AppBootstrapError({
    //required this.onPressed,
    super.key,
  });

  //final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      localizationsDelegates: const [
        I18n.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: const [Locale('fr', '')],
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimens.halfPadding),

        ),
      ),
    );
  }
}
