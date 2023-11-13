import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/error/failure.dart';
import 'package:hotel_app/feature/hotel/domain/entities/hotel_entity.dart';

abstract class BaseHotelRepository{
  Future<Either<Failure,List<HotelEntity>>> hotelDetails();
}