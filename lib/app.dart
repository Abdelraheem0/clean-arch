import 'package:clean_arch/config/themes/app_theme.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:clean_arch/features/presentation/screens/quote_screen.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme().getTheme(Brightness.light),
      home: const QuoteScreen(),
    );
  }
}
