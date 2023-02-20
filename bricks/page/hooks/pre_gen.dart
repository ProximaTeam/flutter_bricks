import 'package:mason/mason.dart';

void run(HookContext context) async {
  final pageName = context.vars['page_name'];

  final path = pageName.toString().split('/');

  context.vars['page_name'] = path.last;
  context.vars['path'] = path.map((item) => item.snakeCase).join('/');
}
