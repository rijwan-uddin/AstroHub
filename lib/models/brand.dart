
const String collectionBrand = 'Brands';
const String brandFieldId = 'id';
const String brandFieldName= 'name';

class Brand {
  String? id;
  String name;

  Brand({
    this.id,
    required this.name,
  });
  Map<String , dynamic> toMap(){
    return <String, dynamic> {
      brandFieldId : id,
      brandFieldName : name,
    };
  }
  factory Brand.fromMap(Map<String , dynamic> map) => Brand(
    id: map[brandFieldId],
    name: map[brandFieldName],
  );
}
