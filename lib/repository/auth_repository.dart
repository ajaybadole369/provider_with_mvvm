import 'package:provider_state_mgm/data/network/base_api_services.dart';
import 'package:provider_state_mgm/data/network/network_api_services.dart';

import '../res/app_endpoint.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppEndpoint.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppEndpoint.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
