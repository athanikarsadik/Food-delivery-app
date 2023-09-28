import 'package:food_delivery/models/response_model.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/sign_up_model.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading = true;
    Response response = await authRepo.registration(signUpModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(response.body['token'], true);
    }else{
      responseModel = ResponseModel(response.statusText!, false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}