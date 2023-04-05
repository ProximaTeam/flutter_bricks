part of '{{page_name.snakeCase()}}_page_cubit.dart';

// Run: flutter pub run build_runner build

@freezed
class {{page_name.pascalCase()}}PageState with _${{page_name.pascalCase()}}PageState {
  const factory {{page_name.pascalCase()}}PageState.initial({
    @Default(false) bool isInitialized,
  }) = _Initial;
}