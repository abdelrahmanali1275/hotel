import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_app/feature/hotel/data/data_sources/hotel_remote_data_source.dart';
import 'package:hotel_app/feature/hotel/data/models/hotel_model.dart';
import 'package:hotel_app/feature/hotel/data/repositories/hotel_repository.dart';
import 'package:hotel_app/feature/hotel/domain/entities/hotel_entity.dart';
import 'package:hotel_app/feature/hotel/domain/repositories/base_hotel_repository.dart';
import 'package:hotel_app/feature/hotel/domain/use_cases/view_hotel_details_use_case.dart';

import 'package:meta/meta.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit({required this.viewHotelDetails}) : super(HotelInitial());

  final ViewHotelDetails viewHotelDetails ;


  getData()async{
    emit(Loading());
    var result =await viewHotelDetails.execute();
    result.fold((l) {
      emit(Error(message: l.message));
    }, (r){
      emit(Success(data: r));
            } );
  }

}
