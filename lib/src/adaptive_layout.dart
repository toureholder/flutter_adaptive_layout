import 'package:flutter/widgets.dart';
import 'breakpoints.dart';

/// {@template adaptive_layout}
/// A [StatelessWidget] whose [build] method will return the widget that
/// corresponds to the current screen width.
/// {@endtemplate}
class AdaptiveLayout extends StatelessWidget {
  /// {@macro adaptive_layout}
  AdaptiveLayout({
    Key? key,
    this.smallLayout,
    this.mediumLayout,
    this.largeLayout,
    this.forcedFormFactor,
  })  : assert(!(smallLayout == null &&
            mediumLayout == null &&
            largeLayout == null)),
        super(key: key);

  /// This widget will render when the screen width is less than the
  /// defined medium screen minimum width breakpoint.
  final Widget? smallLayout;

  /// This widget will render when the screen width is greater than
  /// or equal to the defined medium screen minimum width breakpoint.
  final Widget? mediumLayout;

  /// This widget will render when the screen width is greater than
  /// or equal to the defined large screen minimum width breakpoint.
  final Widget? largeLayout;

  /// If set, the [build] function will return the widget that corresponds
  /// to this [FormFactor], regardless of the screen width.
  final FormFactor? forcedFormFactor;

  /// The current [Breakpoints] instance
  static Breakpoints _breakpoints = Breakpoints();

  /// Sets current [Breakpoints] instance values
  static void setBreakpoints({
    /// Optional. Double which represents the minimum width of a "medium" sized screen
    double? mediumScreenMinWidth,

    /// Optional. Double which represents the minimum width of a "large" sized screen
    double? largeScreenMinWidth,
  }) {
    _breakpoints.mediumScreenMinWidth =
        mediumScreenMinWidth ?? DEFAULT_MEDUIM_SCREEN_MIN_WIDTH;

    _breakpoints.largeScreenMinWidth =
        largeScreenMinWidth ?? DEFAULT_LARGE_SCREEN_MIN_WIDTH;
  }

  /// Gets current [Breakpoints] instance
  static Breakpoints getBreakpoints() => _breakpoints;

  @override
  Widget build(BuildContext context) {
    final formFactor = forcedFormFactor ??
        _getFormFactor(
          MediaQuery.of(context).size.width,
        );

    return _getLayout(formFactor)!;
  }

  FormFactor _getFormFactor(double width) {
    if (width >= _breakpoints.largeScreenMinWidth) {
      return FormFactor.large;
    }

    if (width >= _breakpoints.mediumScreenMinWidth) {
      return FormFactor.medium;
    }

    return FormFactor.small;
  }

  Widget? _getLayout(FormFactor formFactor) {
    switch (formFactor) {
      case FormFactor.large:
        return largeLayout ?? mediumLayout ?? smallLayout;
      case FormFactor.medium:
        return mediumLayout ?? largeLayout ?? smallLayout;
      default:
        return smallLayout ?? mediumLayout ?? largeLayout;
    }
  }
}

/// An enum of available screen width groupings.
enum FormFactor { small, medium, large }
