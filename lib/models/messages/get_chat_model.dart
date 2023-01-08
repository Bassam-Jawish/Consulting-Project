import 'dart:io';

class GetChatModel {
  bool? status;
  String? message;
  List<ChatDadtaModel>? data;

  GetChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    message = json['message'];

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((element) {
        data!.add(ChatDadtaModel.fromJson(element));
      });
    }
  }
}

class ChatDadtaModel {
  String? name;
  String? lastmessage;
  String? lasttime;
  int? chatid;
  File? image;

  ChatDadtaModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastmessage = json['lastMessage'];
    lasttime = json['lastMessageTime'];
    image = json['image'];
    chatid = json['chat_id'];
  }
}
