import 'package:dio/dio.dart';
import 'package:hotel_app/core/error/error_message_model.dart';
import 'package:hotel_app/core/error/exception.dart';
import 'package:hotel_app/feature/hotel/data/models/hotel_model.dart';


abstract class BaseHotelRemoteDataSource{
  Future<List<HotelModel>> hotelDetails();
}

class HotelRemoteDataSource extends BaseHotelRemoteDataSource{
  
  @override
  Future<List<HotelModel>> hotelDetails()async {
  final response = await Dio().get("https://www.hotelsgo.co/test/hotels");

  if(response.statusCode == 200 ) {
      return List<HotelModel>.from(
          (response.data as List).map((e) => HotelModel.fromJson(e)));
    }else{
    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromJson(response.data),
    );
  }
  }

}