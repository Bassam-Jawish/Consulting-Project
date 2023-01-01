import 'dart:convert';
'package:consulting_app/UI/Screens/reservation.dart';
import 'package:bloc/bloc.dart';

class ReservationCubit extends Cubit<ReservationStates> {
  ReservationCubit() : super(ReservationInitialState());

  static ReservationCubit get(context) => BlocProvider.of(context);

  void getreservation() {
    emit(LoadingReservationDataState());
    DioHelper.getData(
      url: RESERVATION,
      token: token,
    ).then((value) {
    
      emit(SuccessUserDataState());
    }).catchError((error) {
      emit(ErrorReservationDataState(error.toString()));
    });
  }
}