import 'package:consulting_app/Bloc/messanger/message_state.dart';
import 'package:consulting_app/UI/Components/constants.dart';
import 'package:consulting_app/models/messages/creat_chat_model.dart';
import 'package:consulting_app/models/messages/get_chat_model.dart';
import 'package:consulting_app/models/messages/get_message_model.dart';
import 'package:consulting_app/network/remote/dio_helper.dart';
import 'package:consulting_app/network/remote/end_point.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageCubit extends Cubit<MessageStates> {
  MessageCubit() : super(MessageInitialState());

  static MessageCubit get(context) => BlocProvider.of(context);

  GetChatModel? getChatModel;

  void getChatData() {
    emit(LoadingCreatMessageState());
    DioHelper.getData(
      url: GETCHAT,
      token: token,
    ).then((value) {
      getChatModel = GetChatModel.fromJson(value.data);
      emit(SuccessCreatMessageState(getChatModel! as GetMessagemodel));
    }).catchError((error) {
      emit(ErrorCreatMessageState(error.toString()));
      print(error.toString());
    });
  }

  CreatChatmodel? creatChatmodel;

  void creatchat({
    required int expertid,
  }) {
    emit(LoadingCreatMessageState());
    DioHelper.postData(
      url: CREATECHAT,
      token: token,
      data: {
        'expert_id': expertid,
      },
    ).then((value) {
      //print(value.data);
      creatChatmodel = CreatChatmodel.fromJson(value.data);
      emit(SuccessCreatChatState(creatChatmodel! as GetChatModel));
    }).catchError((error) {
      emit(ErrorCreatMessageState(error.toString()));
      print(error.toString());
    });
  }

  GetMessagemodel? getMessageModel;

  void getmessage({required int id_chat}) {
    emit(LoadingGetMessagMessageState());
    DioHelper.getData(
      url: 'getMessages/$id_chat',
      token: token,
    ).then((value) {
      getMessageModel = GetMessagemodel.fromJson(value.data);
      emit(SuccessGetMessageState(getChatModel! as GetMessagemodel));
    }).catchError((error) {
      emit(ErrorGetMessageState(error.toString()));
      print(error.toString());
    });
  }

  GetMessagemodel? creatmessagemodel;

  void creatmessage({
    required int chatid,
    required String message,
  }) {
    emit(LoadingGetMessagMessageState());
    DioHelper.postData(
      url: CREATMESSAGES,
      token: token,
      data: {
        'chat_id': chatid,
        'message': message,
      },
    ).then((value) {
      //print(value.data);
      creatmessagemodel = GetMessagemodel.fromJson(value.data);
      emit(SuccessGetMessageState(creatmessagemodel! as GetMessagemodel));
    }).catchError((error) {
      emit(ErrorGetMessageState(error.toString()));
      print(error.toString());
    });
  }
}
