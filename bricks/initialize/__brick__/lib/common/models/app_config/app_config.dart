// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config.freezed.dart';
part 'app_config.g.dart';

@freezed
sealed class AppConfig with _$AppConfig {
  const factory AppConfig({
    required String {{project_name.camelCase()}}ApiUrl,
  }) = _AppConfigData;

  factory AppConfig.fromJson(dynamic json) =>
      _$AppConfigFromJson(json as Map<String, dynamic>);
}
