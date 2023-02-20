import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '{{page_name.snakeCase()}}_page_state.dart';

class {{page_name.pascalCase()}}PageCubit extends Cubit<{{page_name.pascalCase()}}PageState> {
  {{page_name.pascalCase()}}PageCubit() : super(const {{page_name.pascalCase()}}PageInitial());
}
