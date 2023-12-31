import 'package:flutter/material.dart';
import 'package:mel_store/app/app.bottomsheets.dart';
import 'package:mel_store/app/app.dialogs.dart';
import 'package:mel_store/app/app.locator.dart';
import 'package:mel_store/app/app.router.dart';
import 'package:mel_store/ui/common/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  // Register dependencies
  setupLocator();
  // Register Services
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mel Store',
      theme: Theme.of(context).copyWith(
        primaryColor: kcBackgroundColor,
        focusColor: kcPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
            ),
      ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
