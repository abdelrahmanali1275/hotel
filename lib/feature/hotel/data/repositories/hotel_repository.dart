
import 'package:dartz/dartz.dart';
import 'package:hotel_app/core/error/failure.dart';
import 'package:hotel_app/feature/hotel/data/data_sources/hotel_remote_data_source.dart';
import 'package:hotel_app/feature/hotel/domain/entities/hotel_entity.dart';
import 'package:hotel_app/feature/hotel/domain/repositories/base_hotel_repository.dart';

import '../../../../core/error/exception.dart';

class HotelRepository extends BaseHotelRepository{
  final BaseHotelRemoteDataSource baseHotelRemoteDataSource;

  HotelRepository(this.baseHotelRemoteDataSource);

  @override
  Future<Either<Failure,List<HotelEntity>>> hotelDetails() async {
    final result = await baseHotelRemoteDataSource.hotelDetails();
   try {
     return Right(result) ;
   } on ServerException catch (e) {
     return Left(ServerFailure(e.errorMessageModel.statusMessage));
   }
}


}