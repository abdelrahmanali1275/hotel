import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/error/failure.dart';
import 'package:hotel_app/feature/hotel/domain/entities/hotel_entity.dart';
import 'package:hotel_app/feature/hotel/domain/repositories/base_hotel_repository.dart';

class ViewHotelDetails{
  final BaseHotelRepository baseHotelRepository ;

  ViewHotelDetails(this.baseHotelRepository);

  Future<Either<Failure,List<HotelEntity>>> execute()async{
    return await baseHotelRepository.hotelDetails();
  }
}