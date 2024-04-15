
import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/product_details.dart';
import 'package:craftybay_ecommerce/data/models/product_details_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{

  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;
  ProductDetails get productDetails => _productDetails;
  String get errorMessage  => _errorMessage;


  Future<bool> getProductDetails(int id) async{
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getProductDetails(id),);
    _getProductDetailsInProgress = false;
    if(response.isSuccess){
      _productDetails = ProductDetailsModel.fromJson(response.responseJson ?? {} ).data!.first;
      update();
      return true;
    }else{
      _errorMessage = ' Fetch product details failed! Try again';
      update();
      return false;
    }


  }




}