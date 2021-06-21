import 'package:adaptive_layout/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:adaptive_layout/src/adaptive_layout.dart';

Widget makeTestableWidget({
  Widget? smallLayout,
  Widget? mediumLayout,
  Widget? largeLayout,
  FormFactor? formFactor,
}) {
  return MaterialApp(
    home: AdaptiveLayout(
      smallLayout: smallLayout,
      mediumLayout: mediumLayout,
      largeLayout: largeLayout,
      forcedFormFactor: formFactor,
    ),
  );
}

void main() {
  group('AdaptiveLayout', () {
    const smallLayoutKey = Key('test small layout');
    const mediumLayoutKey = Key('test medium layout');
    const largeLayoutKey = Key('test large layout');

    testWidgets('throws AssertionError when all Layouts are null',
        (WidgetTester tester) async {
      expect(() => makeTestableWidget(), throwsAssertionError);
    });

    testWidgets(
      'is created when at least one layout is not null',
      (WidgetTester tester) async {
        final testableWidget = makeTestableWidget(smallLayout: Container());

        await tester.pumpWidget(testableWidget);

        expect(testableWidget, isNot(null));
      },
    );

    group('#setBreakpoints', () {
      test('sets breakpoints', () {
        final mediumScreenMinWidth = 123.0;
        final largeScreenMinWidth = 234.0;

        AdaptiveLayout.setBreakpoints(
          mediumScreenMinWidth: mediumScreenMinWidth,
          largeScreenMinWidth: largeScreenMinWidth,
        );

        final breakpoints = AdaptiveLayout.getBreakpoints();

        expect(breakpoints.mediumScreenMinWidth, mediumScreenMinWidth);
        expect(breakpoints.largeScreenMinWidth, largeScreenMinWidth);
      });

      test('falls back to defaults', () {
        AdaptiveLayout.setBreakpoints();

        final breakpoints = AdaptiveLayout.getBreakpoints();

        expect(
          breakpoints.mediumScreenMinWidth,
          DEFAULT_MEDUIM_SCREEN_MIN_WIDTH,
        );
        expect(
          breakpoints.largeScreenMinWidth,
          DEFAULT_LARGE_SCREEN_MIN_WIDTH,
        );
      });
    });

    group('for small form factors', () {
      const formFactor = FormFactor.small;

      testWidgets(
        'renders only smallLayout if only smallLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            smallLayout: Container(
              key: smallLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(smallLayoutKey), findsOneWidget);
          expect(find.byKey(mediumLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only smallLayout if only small and mediumLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only smallLayout if only small and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            smallLayout: Container(
              key: smallLayoutKey,
            ),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(smallLayoutKey), findsOneWidget);
          expect(find.byKey(mediumLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only smallLayout if small, medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            smallLayout: Container(
              key: smallLayoutKey,
            ),
            mediumLayout: Container(),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(smallLayoutKey), findsOneWidget);
          expect(find.byKey(mediumLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only mediumLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only largeLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );
    });

    group('for medium form factors', () {
      const formFactor = FormFactor.medium;

      testWidgets(
        'renders only smallLayout if only smallLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            smallLayout: Container(
              key: smallLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(smallLayoutKey), findsOneWidget);
          expect(find.byKey(mediumLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only small and mediumLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            smallLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only small and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
            smallLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if small, medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            smallLayout: Container(),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only mediumLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            largeLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only largeLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );
    });

    group('for large form factors', () {
      const formFactor = FormFactor.large;

      testWidgets(
        'renders only smallLayout if only smallLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            smallLayout: Container(
              key: smallLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(smallLayoutKey), findsOneWidget);
          expect(find.byKey(mediumLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only small and mediumLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
            smallLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only small and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
            smallLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if small, medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
            smallLayout: Container(),
            mediumLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only mediumLayout if only mediumLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            mediumLayout: Container(
              key: mediumLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(mediumLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(largeLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only medium and largeLayouts are provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
            mediumLayout: Container(),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );

      testWidgets(
        'renders only largeLayout if only largeLayout is provided',
        (WidgetTester tester) async {
          final testableWidget = makeTestableWidget(
            formFactor: formFactor,
            largeLayout: Container(
              key: largeLayoutKey,
            ),
          );

          await tester.pumpWidget(testableWidget);

          expect(find.byKey(largeLayoutKey), findsOneWidget);
          expect(find.byKey(smallLayoutKey), findsNothing);
          expect(find.byKey(mediumLayoutKey), findsNothing);
        },
      );
    });
  });
}
