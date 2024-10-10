enum AppRoute {
  splash('/'),
  login('/login'),
  register('/register'),
  allChats('/allChat'),
  chat('/chat'),
  setting('/setting'),
  
  ;

  final String route;

  const AppRoute(this.route);
}

enum DeviceScreenType { mobile, tablet }

enum SupportTheme {
  dark('Dark Mod'),
  light('Light Mod');

  final String themeMod;

  const SupportTheme(this.themeMod);
}

enum ThemeColor {
  base,
  reverseBase,
  primary,
  secondary,
  textPrimary,
  textAccent,
  textSecondary,
  cardPrimary,
  cardSecondary,
  successColor,
  errorColor,
  warningColor,
}
