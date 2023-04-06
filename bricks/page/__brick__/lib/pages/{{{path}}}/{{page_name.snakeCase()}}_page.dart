import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:flutter/material.dart';

@RoutePage()

class {{page_name.pascalCase()}}Page extends StatelessWidget {
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWrapper();
  }
}
