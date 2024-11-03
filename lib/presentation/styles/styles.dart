import 'package:kabar_harian/presentation/styles/colors.dart';

class AppStyle {
  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Rounded edge corder radii
  final Corners corners = Corners();

  /// Padding and margin values
  final Insets insets = Insets();
}

class Corners {
  final double sm = 4;
  final double base = 6;
  final double md = 8;
  final double lg = 12;
}

class Insets {
  final double xxs = 4;
  final double xs = 8;
  final double sm = 12;
  final double base = 16;
  final double md = 20;
  final double lg = 24;
  final double xl = 32;
}
