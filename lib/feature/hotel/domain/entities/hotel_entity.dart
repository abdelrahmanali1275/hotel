import 'package:equatable/equatable.dart';

class HotelEntity extends Equatable {
  final String name;
  final int stars;
  final String image;
  final String review;
  final double reviewScore;
  final String address;

  const HotelEntity({
    required this.name,
    required this.stars,
    required this.image,
    required this.review,
    required this.reviewScore,
    required this.address,
  });

  @override
  List<Object> get props => [name, stars, image, review, reviewScore, address,];
}
