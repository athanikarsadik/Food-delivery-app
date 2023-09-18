import 'package:get/get.dart';

import '../data/repository/recommended_food_repo.dart';
import '../models/popular_foods_model.dart';

class RecommendedFoodController extends GetxController{
  final RecommendedFoodRepo recommendedFoodRepo;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  RecommendedFoodController({required this.recommendedFoodRepo});
  List<dynamic> _recommendedFoodList = [];
  List<dynamic> get recommendedFoodList => _recommendedFoodList; 

  Future<void> getRecommendedFoodList()async{
    Response response = await recommendedFoodRepo.getRecommendedFoodList();
    if(response.statusCode == 200){
      _recommendedFoodList = [];
      _recommendedFoodList.addAll(PopularFood.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      Get.snackbar("Error", "Could not get products recommended");
    }
  }
}