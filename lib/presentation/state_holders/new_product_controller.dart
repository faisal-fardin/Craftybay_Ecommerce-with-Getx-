
import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/product_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _getNewProductInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _errorMessage = '';

  ProductModel get productModel => _newProductModel;
  bool get getNewProductInProgress => _getNewProductInProgress;
  String get errorMessage => _errorMessage;


  Future<bool> getNewProduct() async {
    
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(
      Urls.getProductByRemarks('new'),
    );
    _getNewProductInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'New product fetch failed! Try again';
      update();
      return false;
    }
  }
}
