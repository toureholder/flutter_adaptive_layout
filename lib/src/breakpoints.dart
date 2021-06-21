const double DEFAULT_MEDUIM_SCREEN_MIN_WIDTH = 720;
const double DEFAULT_LARGE_SCREEN_MIN_WIDTH = 1200;

/// {@template breakpoints}
/// A Dart class that defines breakpoints for medium and large screen min widths
/// {@endtemplate}
class Breakpoints {
  /// Double which represents the minimum width of a "medium" sized screen
  double mediumScreenMinWidth;

  /// Double which represents the minimum width of a "large" sized screen
  double largeScreenMinWidth;

  /// {@macro breakpoints}
  Breakpoints({
    this.mediumScreenMinWidth = DEFAULT_MEDUIM_SCREEN_MIN_WIDTH,
    this.largeScreenMinWidth = DEFAULT_LARGE_SCREEN_MIN_WIDTH,
  });
}
