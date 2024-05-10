import '../models/image_model.dart';

num priceAfterDiscount(num price , num discount) =>
    price - (price * discount / 100);

List<Map<String, dynamic>> toImageMapList(List<ImageModel> imageModels){
  return List.generate(imageModels.length, (index) => imageModels[index].toJson());
}