import 'package:dio/dio.dart';
import 'package:kpgeodataapp/config/config.dart';
import 'package:kpgeodataapp/domain/domain.dart';
import 'package:kpgeodataapp/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a Internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales no válidas');
      }

      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a Internet');
      }
      throw CustomError('Ha ocurrido un error inesperado');
    } catch (e) {
      throw CustomError('Ha ocurrido un error inesperado');
    }
  }
}
