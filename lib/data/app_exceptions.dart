
class appExceptions implements Exception{
  final _messege;
  final _prefix;
  appExceptions([this._messege,this._prefix]);

  String toString(){
    return '$_messege$_prefix';
  }
}


class FetchDataException extends appExceptions{
  FetchDataException([String? messege]): super(messege,"Error during communication");
}

class BadRequestException extends appExceptions{
  BadRequestException([String? messege]): super(messege,"Invalid Request");
}

class UnatuthorisedException extends appExceptions{
  UnatuthorisedException([String? messege]): super(messege,"UnatuthorisedException");
}

class InvalidInputException extends appExceptions{
  InvalidInputException([String? messege]): super(messege,"Invalid Input Exception");
}