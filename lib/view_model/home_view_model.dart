import 'package:flutter/material.dart';
import 'package:providerdemo/repository/home_repository.dart';

import '../data/response/api_response.dart';
import '../models/movies_model.dart';

class HomeViewViewModel with ChangeNotifier {


  final _myRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    _myRepo.movieListData().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });
  }
}