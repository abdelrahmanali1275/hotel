import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/app_strings.dart';
import 'package:hotel_app/feature/hotel/presentation/manager/hotel_cubit.dart';
import 'package:hotel_app/feature/hotel/presentation/widgets/custom_app_bar.dart';

import 'hotel_card_item.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const CustomAppBar(),
        BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            if (state is Success) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      HotelCardItem(hotel: state.data[index]),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
