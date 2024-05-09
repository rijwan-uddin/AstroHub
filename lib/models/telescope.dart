import 'package:astroscope_hub/models/brand.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'image_model.dart';
part 'telescope.freezed.dart';
part 'telescope.g.dart';

@unfreezed
class Telescope with _$Telescope {
  factory Telescope({
 String? id,
 required String model,
    required Brand brand,
    required String type,
    required String dimension,
    required num weightInPound,
    required String focustype,
    required num lensDiameterInMM,
    required String mountDescription,
    required num price,
    required num stock,
    required num avgRating,
    required num discount,
    required ImageModel thumbnail,
    required List<ImageModel> additionalImage,
    String? description

}) = _Telescope;

  factory Telescope.fromJson(Map<String, dynamic> json) =>
      _$TelescopeFromJson(json);

}

