import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khata_app/app/provider/expanses_provider.dart';
import 'package:khata_app/app/provider/theme_provider.dart';
import 'package:khata_app/app/services/hive/transaction.dart';
import 'package:khata_app/app/ui/transacion_table.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  await Hive.openBox<Transaction>('transactions');
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
            home: TransactionTable(),
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
