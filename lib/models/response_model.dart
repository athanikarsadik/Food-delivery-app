class ResponseModel{
  bool _isSuccess;
  String _msg;
  ResponseModel(this._msg,this._isSuccess);

  String get msg => _msg;
  bool get isSuccess => _isSuccess;
}