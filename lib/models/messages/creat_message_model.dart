// class GetMessagemodel {
//   GetMessagemodel.fromJson(dynamic json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != '' ? Data.fromJson(json['data']) : null;
//   }

//   bool? status;
//   String? message;
//   Data? data;
// }

// class Data {
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['experiences'] != null) {
//       messagedata = [];
//       json['experiences'].forEach((element) {
//         messagedata!.add(Messagedata.fromJson(element));
//       });
//     }
//   }
//   List<Messagedata>? messagedata;
// }

// class Messagedata {
//   Messagedata.fromJson(dynamic json) {
//     message = json['message'];
//     ismymessage = json['isMyMessage'];
   
//   }

//   String? message;
//   bool? ismymessage;
  
// }
