import 'package:consulting_app/models/change_favoirites_model.dart';
import 'package:consulting_app/models/logout_model.dart';
import 'package:consulting_app/models/messages/get_chat_model.dart';

abstract class MessageStates {}

class MessageInitialState extends MessageStates {}

class LoadingCreatMessageState extends MessageStates {}

class SuccessCreatMessageState extends MessageStates {
  final GetChatModel getChatModel;

  SuccessCreatMessageState(this.getChatModel);
}

class ErrorCreatMessageState extends MessageStates {
  final String error;

  ErrorCreatMessageState(this.error);
}

class LoadingCreatChateState extends MessageStates {}

class SuccessCreatChatState extends MessageStates {
  final GetChatModel getChatModel;

  SuccessCreatChatState(this.getChatModel);
}

class ErrorCreatChatState extends MessageStates {
  final String error;

  ErrorCreatChatState(this.error);
}
