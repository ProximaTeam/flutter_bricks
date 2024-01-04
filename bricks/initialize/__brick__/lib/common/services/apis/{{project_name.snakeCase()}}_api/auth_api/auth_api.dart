import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(
    Dio dio, {
    required String baseUrl,
  }) = _AuthApi;

  /* 
    Generate LoginResponse and LoginRequest with `mason make model`
    
    @POST('/login')
    Future<LoginResponse> login(
      @Body() LoginRequest data,
    ); 
  */
}
