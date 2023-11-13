part of 'hotel_cubit.dart';

@immutable
abstract class HotelState {}

class HotelInitial extends HotelState {}
class Success extends HotelState {
  final List<HotelEntity> data ;
  Success({required this.data});
}
class Loading extends HotelState {}
class Error extends HotelState {
  final String message;

  Error({required this.message});
}
