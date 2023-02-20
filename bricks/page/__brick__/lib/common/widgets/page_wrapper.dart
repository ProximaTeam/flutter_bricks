import 'package:flutter/material.dart';

/// Reusable page wrapper, build from
/// [Scaffold] -> [SafeArea] -> [Material] -> [SingleChildScrollView].
///
/// Any above mentioned widget can be skipped or replaced
class PageWrapper extends StatelessWidget {
  const PageWrapper({
    super.key,
    this.child,
    this.skipScaffold = false,
    this.skipSafeArea = false,
    this.skipMaterial = false,
    this.skipSingleChildScrollView = false,
    this.scaffoldBuilder,
    this.safeAreaBuilder,
    this.materialBuilder,
    this.singleChildScrollViewBuilder,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  /// Flags if any of the widgets needs to be skipped.
  final bool skipScaffold;
  final bool skipSafeArea;
  final bool skipMaterial;
  final bool skipSingleChildScrollView;

  /// Replacement widgets builders
  final Scaffold Function(Widget child)? scaffoldBuilder;
  final SafeArea Function(Widget child)? safeAreaBuilder;
  final Material Function(Widget child)? materialBuilder;
  final SingleChildScrollView Function(Widget child)?
      singleChildScrollViewBuilder;

  @override
  Widget build(BuildContext context) {
    var widget = child ?? const SizedBox();

    if (!skipSingleChildScrollView) {
      widget = singleChildScrollViewBuilder?.call(widget) ??
          SingleChildScrollView(child: widget);
    }
    if (!skipMaterial) {
      widget = materialBuilder?.call(widget) ?? Material(child: widget);
    }
    if (!skipSafeArea) {
      widget = safeAreaBuilder?.call(widget) ?? SafeArea(child: widget);
    }
    if (!skipScaffold) {
      widget = scaffoldBuilder?.call(widget) ?? Scaffold(body: widget);
    }

    return widget;
  }
}