
import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/product_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _getPopularProductInProgress = false;
  ProductModel _popularProductModel = ProductModel();
  String _errorMessage = '';

  ProductModel get productModel => _popularProductModel;
  bool get getPopularProductInProgress => _getPopularProductInProgress;
  String get errorMessage => _errorMessage;


  Future<bool> getPopularProduct() async {
    
    _getPopularProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductByRemarks('popular'),
    );
    _getPopularProductInProgress = false;
    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Popular product fetch failed! Try again';
      update();
      return false;
    }
  }
}
