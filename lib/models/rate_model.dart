class RateModel
{
  bool? status;
  String? message;
  RateModel.fromJson(Map<String ,dynamic>json)
  {
    status = json['status'];
    message = json['message'];
  }
}