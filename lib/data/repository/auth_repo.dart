import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/sign_up_model.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpModel signUpModel)async{
    return await apiClient.postData(AppConstants.REGISTRATION_URL, signUpModel.toJson());
  }

  saveUserToken(String token){
    apiClient.token = token;
    apiClient.updateHeader(token);
    sharedPreferences.setString("Token", token);
  }
}
