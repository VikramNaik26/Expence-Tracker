import 'dart:ui';

Color getTextColor(Color color) {
  int d = 0;

  // Counting the perceptive luminance - human eye favors green color...
  double luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  if (luminance > 0.5) {
    d = 0; // bright colors - black font
  } else {
    d = 255; // dark colors - white font
  }

  return Color.fromARGB(color.alpha, d, d, d);
}
