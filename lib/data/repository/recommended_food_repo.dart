import 'package:get/get.dart';

import '../../utils/app_constants.dart';
import '../api/api_client.dart';

class RecommendedFoodRepo extends GetxService{
  final ApiClient apiClient;

  RecommendedFoodRepo({required this.apiClient});

  Future<Response> getRecommendedFoodList()async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }
}