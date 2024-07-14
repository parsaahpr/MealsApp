import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmmeals_app/Tabs.dart';
// import 'package:mmmeals_app/categorie.dart';

// import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 155, 28, 113),
  ),
  // textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme, debugShowCheckedModeBanner: false, home: TabsScreen());
  }
}
