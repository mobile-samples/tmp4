import 'package:flutter/material.dart';

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : const Color.fromARGB(255, 245, 245, 245),
      appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(color: Colors.blueGrey),
          centerTitle: true),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.blue[100],
      ),
      colorScheme: Theme.of(context).colorScheme.copyWith(
            background: isDarkTheme ? Colors.black : Colors.white,
            primary: const Color.fromARGB(255, 245, 245, 245),
            secondary: Colors.grey,
          ),
      textTheme: Theme.of(context).textTheme.copyWith(
            bodyLarge: TextStyle(
              fontSize: 18,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            bodySmall: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            titleLarge: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            titleMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            titleSmall: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            displayLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            displayMedium: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            displaySmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(Colors.blueGrey),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.blueGrey),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
      ),
      iconTheme: const IconThemeData(color: Colors.blueGrey));
}
