import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part '{{bloc_name.snakeCase()}}_event.dart';
part '{{bloc_name.snakeCase()}}_state.dart';

class {{bloc_name.pascalCase()}}Bloc extends Bloc<{{bloc_name.pascalCase()}}Event, {{bloc_name.pascalCase()}}State> {
  {{bloc_name.pascalCase()}}Bloc() : super({{bloc_name.pascalCase()}}Initial()) {
    on<{{bloc_name.pascalCase()}}Event>((event, emit) {
      // TODO: implement event handler
    });
  }
}
