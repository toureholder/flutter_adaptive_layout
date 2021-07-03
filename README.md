<h1 align="center">Adaptive Layout</h1>

<p align="center">A flutter package that facilitates implementing layouts that adapt to different screen widths.</p>
<p align="center">
  Try out the <a href="https://flutter-adaptive-layout.surge.sh">live example app</a>.
  </p>
<br>

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
## Table of contents
- [Live demos](#live-demos)
- [Installing](#installing)
  - [1. Depend on it](#1-depend-on-it)
  - [2. Import it](#2-import-it)
- [Usage](#usage)
  - [Screen-size buckets](#screen-size-buckets)
  - [Order of precedence](#order-of-precedence)
  - [Breakpoints](#breakpoints)
- [Maintainers](#maintainers)

## Live demos
See the package in action:
- [pub.dev example app](https://flutter-adaptive-layout.surge.sh)
- [Adaptive layout tutorial app](https://flutter-adaptive-layout-tutorial.surge.sh)
- [Another example app](https://flutter-workshop.surge.sh)


## Installing

### 1. Depend on it

Depend on this package as a **dependency** by running `flutter pub add adaptive_layout`.

### 2. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:adaptive_layout/adaptive_layout.dart';
```

## Usage

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

### Screen-size buckets

`AdaptiveLayout` supports three screen-size buckets: small, medium, and large.

The `AdaptiveLayout` constructor accepts any `Widget` for each screen-size bucket and at least one `Widget` must be passed to the constructor. The constructor will throw an `AssertionError` if no layouts are provided.

For example:

```dart
// Bad. Calling the constructor with no arguments will throw an error.
AdaptiveLayout()
```

```dart
// Good. Calling the constructor with only one argument will not throw an error.
AdaptiveLayout(smallLayout: Container(width: 300))
```

### Order of precedence
As stated, it isn't necessary to provide a widget for each screen-size bucket. On **large** screens the order of precedence is **`largeLayout`**, `mediumLayout`, `smallLayout`. On **medium** screens the order of precedence is **`mediumLayout`**, `largeLayout`, `smallLayout`. On **small** screens the order of precedence is **`smallLayout`**, `mediumLayout`, `largeLayout`.

### Breakpoints
The default definitions are:
 - large screens are at least 1200dpi wide
 - medium screens are at least 720dpi wide
 - small screens are less than 720dpi wide

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

## Maintainers

- [Touré Holder](https://github.com/toureholderl)