import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/feature/hotel/data/data_sources/hotel_remote_data_source.dart';
import 'package:hotel_app/feature/hotel/data/repositories/hotel_repository.dart';
import 'package:hotel_app/feature/hotel/domain/repositories/base_hotel_repository.dart';
import 'package:hotel_app/feature/hotel/domain/use_cases/view_hotel_details_use_case.dart';
import 'package:hotel_app/feature/hotel/presentation/manager/hotel_cubit.dart';
import 'package:hotel_app/feature/hotel/presentation/widgets/home_screen_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context){

        BaseHotelRemoteDataSource baseHotelRemoteDataSource = HotelRemoteDataSource();
        BaseHotelRepository baseHotelRepository = HotelRepository(baseHotelRemoteDataSource);

        return HotelCubit(viewHotelDetails: ViewHotelDetails(baseHotelRepository))..getData();
      } ,
      child: BlocBuilder<HotelCubit,HotelState>(builder: (context, state) {
        print(state);
        if(state is Success){
          print(state.data);
        }


        return const Scaffold(
          body: HomeScreenBody(),
        );
      } ,),
    );
  }


}
