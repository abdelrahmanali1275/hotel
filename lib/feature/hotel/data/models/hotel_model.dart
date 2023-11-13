

import 'package:hotel_app/feature/hotel/domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  const HotelModel({
    required super.name,
    required super.stars,
    required super.image,
    required super.review,
    required super.reviewScore,
    required super.address,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        name: json["name"],
        stars: json["starts"],
        image: json["image"],
        review: json["review"],
        reviewScore: json["review_score"].toDouble(),
        address: json["address"],
      );
}
