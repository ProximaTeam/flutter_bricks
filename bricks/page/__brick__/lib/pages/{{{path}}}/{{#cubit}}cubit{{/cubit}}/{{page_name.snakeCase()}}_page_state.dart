part of '{{page_name.snakeCase()}}_page_cubit.dart';

// Run: dart run build_runner build

@freezed
abstract class {{page_name.pascalCase()}}PageState with _${{page_name.pascalCase()}}PageState {
  const factory {{page_name.pascalCase()}}PageState.initial({
    @Default(false) bool isInitialized,
  }) = _Initial;
}