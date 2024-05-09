import 'package:astroscope_hub/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/brand.dart';

class AddTelescopePage extends StatefulWidget {
  static const String routeName = 'addtelescope';
  const AddTelescopePage({super.key});

  @override
  State<AddTelescopePage> createState() => _AddTelescopePageState();
}

class _AddTelescopePageState extends State<AddTelescopePage> {
  final _modelController = TextEditingController();
  final _dimensionController = TextEditingController();
  final _weightController = TextEditingController();
  final _lensDiameterController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey  = GlobalKey<FormState>();
  Brand? brand ;
  String? imageLocalPath;
  DateTime? dateTime;
  String mountDescription = TelescopeUtils.mountList.first;
  String focusType = TelescopeUtils.focusList.first;
  String telescopeType = TelescopeUtils.typeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Telescopes'),),
      body: 
    );
  }
}
