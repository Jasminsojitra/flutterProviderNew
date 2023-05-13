

import 'package:providerdemo/models/movies_model.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../res/app_url.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices() ;

  Future<MovieListModel> movieListData() async {
    try{
      dynamic respo=await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return respo=MovieListModel.fromJson(respo);
    }
    catch(ex){
      throw ex;
    }
  }
}