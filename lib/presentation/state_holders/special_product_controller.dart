
import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/product_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductInProgress = false;
  ProductModel _specialProductModel = ProductModel();
  String _errorMessage = '';

  ProductModel get productModel => _specialProductModel;
  bool get getSpecialProductInProgress => _getSpecialProductInProgress;
  String get errorMessage => _errorMessage;


  Future<bool> getSpecialProduct() async {
    
    _getSpecialProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductByRemarks('special'),
    );
    _getSpecialProductInProgress = false;
    if (response.isSuccess) {
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Special product fetch failed! Try again';
      update();
      return false;
    }
  }
}
