import 'package:craftybay_ecommerce/data/models/network_response.dart';
import 'package:craftybay_ecommerce/data/models/slider_model.dart';
import 'package:craftybay_ecommerce/data/services/network_caller.dart';
import 'package:craftybay_ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{

  bool _getHomeSliderInProgress = false;
  SliderModel _sliderModel = SliderModel();
  String _message = '';

  SliderModel get sliderModel => _sliderModel;

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;
  String get message => _message;

  Future<bool> getHomeSlider () async {
    _getHomeSliderInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller().getRequest(Urls.getHomeSlider);
    _getHomeSliderInProgress = false;
    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {} );
      update();
      return true;
    }else{
      update();
      return false;
    }

  }



}