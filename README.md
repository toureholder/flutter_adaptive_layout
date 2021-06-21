<h1 align="center">Adaptive Layout</h1>

<p align="center">A flutter package that facilitates implementing layouts that adapt to different screen widths. Try out our <a href="https://flutter-adaptive-layout.surge.sh">live example app</a>.</p><br>

<p align="center">
  <a href="https://travis-ci.com/toureholder/flutter_adaptive_layout">
    <img src="https://travis-ci.com/toureholder/flutter_adaptive_layout.svg?branch=main"
      alt="Build Status" />
  </a>

  <a href='https://coveralls.io/github/toureholder/flutter_adaptive_layout?branch=main'>
    <img src='https://coveralls.io/repos/github/toureholder/flutter_adaptive_layout/badge.svg?branch=main' alt='Coverage Status' />
  </a>
</p>

<!-- omit in toc -->
# Table of contents
- [Installing](#installing)
  - [1. Depend on it](#1-depend-on-it)
  - [2. Import it](#2-import-it)
- [Usage](#usage)
  - [Screen-size buckets](#screen-size-buckets)
  - [Breakpoints](#breakpoints)
- [Maintainers](#maintainers)

# Installing

## 1. Depend on it

Depend on this package as a **dependency** by running `flutter pub add adaptive_layout`.

This will install the package and add an entry to your package's `pubspec.yaml` file:

```yaml
dependencies:
  adaptive_layout: ^0.1.0
```

## 2. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:adaptive_layout/adaptive_layout.dart';
```

# Usage

`AdaptiveLayout` is a _Stateless Widget_ whose `build` method will return one of the `Widget`s provided to it according to the current width of the screen.

Include it in your `build` method like:

```dart
AdaptiveLayout(
  smallLayout: Container(width: 300),
  mediumLayout: Container(width: 700),
  largeLayout: Container(width: 900),
)
```

In the above example `AdaptiveLayout` will render a `Container` with a width of 300dpi on a small screen, a `Container` with a width of 700dpi on a medium sized screen and a `Container` with a width of 900dpi on a large screen.

## Screen-size buckets

`AdaptiveLayout` supports three screen-size buckets: small, medium, and large.

The `AdaptiveLayout` constructor accepts any `Widget` for each screen-size bucket and at least one screen-size bucket must have its layout defined by a widget. The constructor will throw an `AssertionError` if no layouts are defined.

For example:

```dart
// Bad. Calling the constructor with no arguments will throw an error
AdaptiveLayout()
```

```dart
// Good. Calling the constructor with only one argument will not throw an error
AdaptiveLayout(smallLayout: Container(width: 300))
```

## Breakpoints
The default definitions are:
 - large screens are at least 1200dpi wide
 - medium screens are at least 720dpi wide
 - small screens are less thatn 720dpi wide

The breakpoints can be easily configured by calling the static method `AdaptiveLayout.setBreakpoints` like:

```dart
void main() {
  AdaptiveLayout.setBreakpoints(
    mediumScreenMinWidth: 640,
    largeScreenMinWidth: 960,
  );

  runApp(MyApp());
}
```
# Maintainers

- [Touré Holder](https://github.com/toureholderl)