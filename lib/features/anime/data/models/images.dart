import 'package:equatable/equatable.dart';

class Images extends Equatable {
  const Images({
    this.jpg,
  });

  final Jpg? jpg;

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      jpg: Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
    );
  }

  @override
  List<Object?> get props => [jpg];
}

class Jpg extends Equatable {
  const Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
    );
  }

  @override
  List<Object?> get props => [imageUrl, smallImageUrl, largeImageUrl];
}
