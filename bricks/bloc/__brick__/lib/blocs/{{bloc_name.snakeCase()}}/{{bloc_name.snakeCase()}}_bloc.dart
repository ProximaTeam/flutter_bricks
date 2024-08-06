import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{bloc_name.snakeCase()}}_bloc.freezed.dart';
part '{{bloc_name.snakeCase()}}_event.dart';
part '{{bloc_name.snakeCase()}}_state.dart';

class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
  {{bloc_name.pascalCase()}}Bloc() : super({{bloc_name.pascalCase()}}State.initial()) {
    on<{{bloc_name.pascalCase()}}Event>(_onUserEvent);
  }

  void _on{{bloc_name.pascalCase()}}Event(
    {{bloc_name.pascalCase()}}Event event,
    Emitter<{{bloc_name.pascalCase()}}State> emit
  ) {
    // implement event handler
  }
}
