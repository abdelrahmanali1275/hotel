import 'package:flutter/material.dart';
import 'package:hotel_app/core/app_assets.dart';
import 'package:hotel_app/core/app_strings.dart';
import 'package:hotel_app/core/app_style.dart';

import '../../domain/entities/hotel_entity.dart';


class HotelCardItem extends StatelessWidget {
  const HotelCardItem({
    super.key,
    required this.hotel,

  });

  final HotelEntity hotel;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.network(
                  hotel.image,
                  fit: BoxFit.cover,
                )),
             Row(
              children: [
                Text(
                 hotel. stars.toString(),
                  style: AppStyle.style16,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(AppStrings.hotel, style: AppStyle.style16),
              ],
            ),
             Text( hotel.name,
                style: AppStyle.style18),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child:  Text("${ hotel.reviewScore}"),
                ),
                const SizedBox(
                  width: 5,
                ),
                 Text(
                   hotel.review,
                  style: AppStyle.style16,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(Icons.location_on_sharp,
                    color: Colors.black, size: 15),
                 Text(
                   hotel. address,
                  style: AppStyle.style16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
