import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{page_name.snakeCase()}}_page_cubit.freezed.dart';
part '{{page_name.snakeCase()}}_page_state.dart';

class {{page_name.pascalCase()}}PageCubit extends Cubit<{{page_name.pascalCase()}}PageState> {
  {{page_name.pascalCase()}}PageCubit() : super(const {{page_name.pascalCase()}}PageState.initial());
}
