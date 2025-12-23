import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'no_auth_api.g.dart';

@RestApi()
sealed class NoAuthApi {
  factory NoAuthApi(Dio dio, {required String baseUrl}) = _NoAuthApi;

  /* 
    Generate LoginResponse and LoginRequest with `mason make model`
    
    @POST('/login')
    Future<LoginResponse> login(
      @Body() LoginRequest data,
    ); 
  */
}
