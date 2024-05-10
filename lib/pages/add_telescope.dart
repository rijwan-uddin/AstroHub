import 'dart:io';

import 'package:astroscope_hub/providers/telescope_provider.dart';
import 'package:astroscope_hub/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();
  Brand? brand;

  String? imageLocalPath;
  DateTime? dateTime;
  String mountDescription = TelescopeUtils.mountList.first;
  String focusType = TelescopeUtils.focusList.first;
  String telescopeType = TelescopeUtils.typeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Telescopes'),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              Card(
                child: Column(
                  children: [
                    imageLocalPath == null
                        ? Icon(
                            Icons.photo,
                            size: 100,
                          )
                        : Image.file(
                            File(imageLocalPath!),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                    Text(
                      'Select Telescope Image\nfrom',
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.camera),
                          label: Text('Camera'),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.browse_gallery),
                          label: Text('Gallary'),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Consumer<TelescopeProvider>(
                    builder: (context, provider, child) =>
                        DropdownButtonFormField<Brand>(
                      decoration: InputDecoration(border: InputBorder.none),
                      hint: Text('Select Barnd'),
                      isExpanded: true,
                      value: brand,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a brand';
                        }
                        return null;
                      },
                      items: provider.brandList
                          .map((item) => DropdownMenuItem<Brand>(
                                value: item,
                                child: Text(item.name),
                              ))
                          .toList(),
                      onChanged: (value) {
                        brand = value;
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
//167 4.00
