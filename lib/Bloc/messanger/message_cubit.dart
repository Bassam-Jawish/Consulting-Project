import 'package:consulting_app/Bloc/messanger/message_state.dart';
import 'package:consulting_app/UI/Components/constants.dart';
import 'package:consulting_app/models/messages/get_chat_model.dart';
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
      emit(SuccessCreatMessageState(getChatModel!));
    }).catchError((error) {
      emit(ErrorCreatMessageState(error.toString()));
      print(error.toString());
    });
  }
}
