import 'package:astroscope_hub/models/telescope.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/brand.dart';

class DbHelper{
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionAdmin = 'Admins';
  static const String collectionTelescope = 'Telescopes';
  static const String collectionBrand = 'Brands';


  static Future<bool> isAdmin(String uid) async{
   final snapshot =  await _db.collection(collectionAdmin).doc(uid).get();
   return snapshot.exists;
  }

  static Future<void> addBrand(Brand brand) {
 final doc =   _db.collection(collectionBrand).doc();
 brand.id = doc.id;
 return doc.set(brand.toJson());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBrands() =>
      _db.collection(collectionBrand).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllTelescopes() =>
      _db.collection(collectionTelescope).snapshots();

  static Future<void> addTelescope(Telescope telescope) {
    final doc = _db.collection(collectionTelescope).doc();
    telescope.id = doc.id;
    return doc.set(telescope.toJson());

  }

  Future<void> updateTelescopeField(id, Map<String, dynamic> map) {
return _db.collection(collectionTelescope).doc(id).update(map);

  }
}