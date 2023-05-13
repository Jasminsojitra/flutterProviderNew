
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:providerdemo/data/app_exceptions.dart';
import 'package:providerdemo/data/network/BaseApiServices.dart';

class NetworkApiServices  extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async {
    dynamic jsonRespo;
   try{

     final respo=await http.get(Uri.parse(url));
     jsonRespo=returnRespo(respo);

   }on SocketException{
     throw FetchDataException("No Internet Connection");
   }
   return jsonRespo;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async {
    dynamic jsonRespo;
    try{

      final respo=await http.post(Uri.parse(url),body: data);
      jsonRespo=returnRespo(respo);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return jsonRespo;
  }

  dynamic returnRespo(http.Response response){

    switch(response.statusCode)
    {
      case 200:
        dynamic responseJson=jsonDecode(response.body);
        return responseJson;
      case 400:
      throw BadRequestException("Error with server code : ${response.body}");
      case 500:
      case 404:
        throw UnatuthorisedException("Error with server code : ${response.body}");
      default:
        throw FetchDataException("Error with server code : ${response.statusCode}");

    }
  }

}