import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobole2/cubits/friend_status_cubit.dart';
import 'package:uts_mobole2/cubits/menu_cubit.dart';
import 'package:uts_mobole2/cubits/theme_cubit.dart';
import 'package:uts_mobole2/cubits/visibility_cubit.dart';
import 'package:uts_mobole2/pages/profil_page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => VisibilityCubit()),
        BlocProvider(create: (_) => FriendStatusCubit()),
        BlocProvider(create: (_) => MenuCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(Brightness.light),
          darkTheme: _buildTheme(Brightness.dark),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: ProfilPage(),
        );
      },
    );
  }
  
  ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    
    // Base colors
    final primaryColor = Color(0xff3746F2);
    final backgroundColor = isDark ? Color(0xFF121212) : Colors.white;
    final cardColor = isDark ? Color(0xFF1E1E1E) : Colors.grey[100];
    
    // Create base TextTheme with consistent inherit values
    final baseTextTheme = TextTheme(
      displayLarge: TextStyle(inherit: true, fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(inherit: true, fontSize: 28, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(inherit: true, fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(inherit: true, fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(inherit: true, fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(inherit: true, fontSize: 16, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(inherit: true, fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(inherit: true, fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(inherit: true, fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(inherit: true, fontSize: 14, fontWeight: FontWeight.w500),
    );
    
    return ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      useMaterial3: true,
      
      colorScheme: isDark
          ? ColorScheme.dark(
              primary: primaryColor,
              secondary: primaryColor,
              surface: backgroundColor,
              background: backgroundColor,
            )
          : ColorScheme.light(
              primary: primaryColor,
              secondary: primaryColor,
              surface: backgroundColor,
              background: backgroundColor,
            ),
      
      // Apply Google Fonts dengan konsisten
      textTheme: GoogleFonts.poppinsTextTheme(baseTextTheme).apply(
        bodyColor: isDark ? Colors.white : Colors.black87,
        displayColor: isDark ? Colors.white : Colors.black87,
      ),
      
      // Disable animations untuk theme transition
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}