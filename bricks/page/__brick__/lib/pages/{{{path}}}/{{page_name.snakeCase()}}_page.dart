import 'package:{{project_name.snakeCase()}}/common/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';

class {{page_name.pascalCase()}}Page extends StatelessWidget {
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageWrapper();
  }
}
