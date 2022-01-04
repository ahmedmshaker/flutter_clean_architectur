
import 'package:flutter/material.dart';
import 'package:rent_ready_task/features/accounts/presentation/screens/accounts_screen.dart';
import 'package:responsive_builder/responsive_builder.dart';


class ResponsiveAccountsScreen extends StatelessWidget {
  const ResponsiveAccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const AccountsScreen(),
      tablet: (BuildContext context) => const AccountsScreen(margin: EdgeInsets.symmetric(horizontal: 64),),
      desktop: (BuildContext context) => const AccountsScreen(margin: EdgeInsets.symmetric(horizontal: 224),),
    );
  }
}
