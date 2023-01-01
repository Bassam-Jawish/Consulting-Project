abstract class ReservationStates {}
class ReservationInitialState extends ReservationStates{}

class LoadingReservationDataState extends ReservationStates {}

class SuccessReservationDataState extends ReservationStates {}

class ErrorReservationtaState extends ReservationStates {
  final String error;

  ErrorReservationDataState(this.error);
}
