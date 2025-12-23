part of '{{bloc_name.snakeCase()}}_bloc.dart';

// Run: dart run build_runner build

@freezed
sealed class {{bloc_name.pascalCase()}}State with _${{bloc_name.pascalCase()}}State {
  const factory {{bloc_name.pascalCase()}}State.initial({
    @Default(false) bool isInitialized,
  }) = _Initial;
}