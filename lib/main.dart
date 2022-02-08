import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:save_me_vpn/app/constants.dart';
import 'package:save_me_vpn/app/state/is_active.provider.dart';
import 'package:save_me_vpn/meta/home.page.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => IsActive(),
    )
  ], child: const VpnApp()));
}

class VpnApp extends StatelessWidget {
  const VpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Gilfory",
          brightness: Brightness.dark,
          scaffoldBackgroundColor: bgColor,
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0.0,
              color: Colors.transparent,
              titleTextStyle: TextStyle(fontFamily: "Gilfory", fontSize: 18))),
      home: const HomePage(),
    );
  }
}
