import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';

void main() {
  /// Optionally set custom breakpoints for medium and/or large screens.
  AdaptiveLayout.setBreakpoints(
    mediumScreenMinWidth: 600,
    largeScreenMinWidth: 1200,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layout Demo',
      home: Scaffold(
        /// Use AdaptiveLayout
        body: AdaptiveLayout(
          smallLayout: MyContainer(color: Colors.amber),
          mediumLayout: MyContainer(color: Colors.red[200]),
          largeLayout: MyContainer(color: Colors.green[200]),
        ),
      ),
    );
  }
}

/// Any widget
class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
    this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          'See how the color of my container is different on different screen widths.',
        ),
      ),
    );
  }
}
