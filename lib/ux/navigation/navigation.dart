import 'package:flutter/material.dart';
import 'package:note_app/ux/shared/slide_left_route.dart';
import 'package:note_app/ux/views/editor_screen.dart';
import 'package:note_app/ux/views/home_screen.dart';
import 'package:note_app/ux/views/search_notes_screen.dart';

class NavigationRoutes {}

class Navigation {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static const entry = "/";
  static const searchNotesScreen = "search_notes_screen";
  static const editorScreen = "editor_screen";

  Navigation._();

  static openRoute({required Widget widget}) {
    return widget;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case entry:
        return SlideLeftRoute(widget: const HomeScreen());
      case searchNotesScreen:
        return SlideLeftRoute(widget: const SearchNotesScreen());
      case editorScreen:
        assert(settings.arguments != null);
        assert(settings.arguments is EditorScreenData);
        final screenData = settings.arguments as EditorScreenData;
        return SlideLeftRoute(
            widget: EditorScreen(
          screenData: screenData,
        ));

      default:
        return openRoute(
          widget: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  //  static openGetStartedScreen({required BuildContext context}) {
  //   Navigator.pushNamedAndRemoveUntil(
  //     context,
  //     getStartedScreen,
  //     (route) => !Navigator.canPop(context),
  //   );
  // }

    static openHomeScreen({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(
        context, entry, (route) => !Navigator.canPop(context));
  }


  static openSearchNotesScreen({required BuildContext context}) {
    Navigator.pushNamed(context, searchNotesScreen);
  }

  static openEditorScreen({required BuildContext context, Object? arguments}) {
    Navigator.pushNamed(context, editorScreen, arguments: arguments);
  }

  static back({required BuildContext context}) {
    Navigator.pop(context);
  }

  // static openOtpVerificationScreen(
  //     {required BuildContext context, Object? arguments}) {
  //   Navigator.pushNamed(context, otpVerificationScreen, arguments: arguments);
  // }

  // static popToPaymentsScreen({required BuildContext context}) {
  //   Navigator.of(context)
  //     ..pushNamedAndRemoveUntil(
  //         homeScreen, (route) => !Navigator.canPop(context))
  //     ..pushNamed(paymentsScreen);
  // ..pushNamed(paymentsScreen);

  // ..pushNamed(paymentsScreen);
}

  // static openMain({required BuildContext context, required NavigationHostPageConfig pageConfig}) {
  //   Navigator.pushNamedAndRemoveUntil(context, main, (route) => false, arguments: pageConfig);
  // }

  // static openMainWithNavigatorKey(
  //     {required GlobalKey<NavigatorState> navigationKey, required NavigationHostPageConfig pageConfig}) {
  //   navigationKey.currentState?.pushNamedAndRemoveUntil(main, (route) => false, arguments: pageConfig);
  // }

  // static Future openTermsAndConditions({required BuildContext context}) {
  //   return openBrowser(context: context, browserConfig: BrowserConfig(url: AppStrings.policyLink));
  // }

  // static Future openBrowser({required BuildContext context, required BrowserConfig browserConfig}) {
  //   return Navigator.pushNamed(context, browser, arguments: browserConfig);
  // }

