// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CustomTheme {
//   static TextTheme lightTextTheme = TextTheme(
//     bodyText1: GoogleFonts.roboto(),
//     headline1: GoogleFonts.roboto(),
//     headline2: GoogleFonts.roboto(),
//     headline3: GoogleFonts.roboto(),
//     headline6: GoogleFonts.roboto(),
//     subtitle2: GoogleFonts.roboto(
//       fontSize: 16.0,
//       //fontWeight: FontWeight.w600,
//       //color: Colors.black,
//     ),
//     caption: GoogleFonts.roboto(
//       fontSize: 15.0,
//       //fontWeight: FontWeight.w600,
//       //color: Colors.grey,
//     ),
//   );

//   static TextTheme darkTextTheme = TextTheme(
//     bodyText1: GoogleFonts.roboto(),
//     headline1: GoogleFonts.roboto(),
//     headline2: GoogleFonts.roboto(),
//     headline3: GoogleFonts.roboto(),
//     headline6: GoogleFonts.roboto(),
//   );

//   static ThemeData light() {
//     return ThemeData(
//       brightness: Brightness.light,
//       checkboxTheme: CheckboxThemeData(
//         fillColor: MaterialStateColor.resolveWith(
//           (states) {
//             return Colors.black;
//           },
//         ),
//       ),
//       appBarTheme: const AppBarTheme(
//         foregroundColor: Colors.black,
//         backgroundColor: Colors.white,
//       ),
//       // floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       //   foregroundColor: Colors.white,
//       //   backgroundColor: Colors.black,
//       // ),
//       // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//       //   selectedItemColor: Colors.green,
//       // ),
//       textTheme: lightTextTheme,
//     );
//   }

//   static ThemeData dark() {
//     return ThemeData(
//       brightness: Brightness.dark,
//       appBarTheme: AppBarTheme(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.grey[900],
//       ),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.green,
//       ),
//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         selectedItemColor: Colors.green,
//       ),
//       textTheme: darkTextTheme,
//     );
//   }
// }
