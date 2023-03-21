import 'package:flutter/material.dart';
import 'package:khata_app/app/provider/expanses_provider.dart';
import 'package:khata_app/app/provider/theme_provider.dart';
import 'package:khata_app/app/theme/themes.dart';
import 'package:khata_app/app/ui/home_screen.dart';
import 'package:provider/provider.dart';

import 'app/ui/expanses_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ExpansesProvider()),
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(),
        // child: Consumer(
        builder: (BuildContext ctx, Widget? child) {
          return const MaterialApp(
            title: 'Codemicros',
            // theme: themeProvider.isDark
            //     ? AppThemes.darkTheme
            //     : AppThemes.lightTheme,
            home: const ExpansesDetailScreen(),
          );
        },
        // ),
      ),
    ]);

    // ChangeNotifierProvider(
    //   create: (_) => ThemeProvider(),
    //   child: Consumer(
    //     builder:
    //         (BuildContext ctx, ThemeProvider themeProvider, Widget? child) {
    //       return

    //       MaterialApp(
    //         title: 'Codemicros',
    //         // theme: themeProvider.isDark
    //         //     ? AppThemes.darkTheme
    //         //     : AppThemes.lightTheme,
    //         home: const ExpansesDetailScreen(),
    //       );
    //     },
    // ),
    // );
  }
}
