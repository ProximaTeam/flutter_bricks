// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part '{{model_name.snakeCase()}}.freezed.dart';
part '{{model_name.snakeCase()}}.g.dart';

@freezed
abstract class {{model_name.pascalCase()}} with _${{model_name.pascalCase()}} {
  const factory {{model_name.pascalCase()}}({
    @JsonKey(name: 'JsonKey') required num flutterKey,
  }) = _{{model_name.pascalCase()}}Data;

  factory {{model_name.pascalCase()}}.fromJson(dynamic json) =>
      _${{model_name.pascalCase()}}FromJson(json as Map<String, dynamic>);
}
