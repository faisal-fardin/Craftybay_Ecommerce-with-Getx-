import 'package:craftybay_ecommerce/data/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  bool _getPopularProductInProgress = false;

  ProductModel _productModel = ProductModel();


  ProductModel get categoryModel => _productModel;
  bool get getPopularProductInProgress => _getPopularProductInProgress;


  Future getProduct() async{

  }



}