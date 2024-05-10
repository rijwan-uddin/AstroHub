import 'dart:io';

import 'package:astroscope_hub/customwidgets/radio_group.dart';
import 'package:astroscope_hub/models/image_model.dart';
import 'package:astroscope_hub/models/telescope.dart';
import 'package:astroscope_hub/providers/telescope_provider.dart';
import 'package:astroscope_hub/utils/constants.dart';
import 'package:astroscope_hub/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

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

  final _formKey = GlobalKey<FormState>();
  Brand? brand;

  String? imageLocalPath;

  String mountDescription = TelescopeUtils.mountList.first;
  String focusType = TelescopeUtils.focusList.first;
  String telescopeType = TelescopeUtils.typeList.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Telescopes'),
          actions: [
            IconButton(
              onPressed: _saveTelescope,
              icon: Icon(Icons.done),
            )
          ],
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
                          onPressed: () {
                            getImage(ImageSource.camera);
                          },
                          icon: Icon(Icons.camera),
                          label: Text('Camera'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          },
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
              ),
              RadioGroup(
                label: 'Select Telescope Type',
                groupValaue: telescopeType,
                items: TelescopeUtils.typeList,
                onItemSelected: (value) {
                  telescopeType = value;
                },
              ),
              RadioGroup(
                label: 'Select Mount Type',
                groupValaue: mountDescription,
                items: TelescopeUtils.mountList,
                onItemSelected: (value) {
                  mountDescription = value;
                },
              ),
              RadioGroup(
                  label: 'Select Focus Type',
                  groupValaue: focusType,
                  items: TelescopeUtils.focusList,
                  onItemSelected: (value) {
                    focusType = value;
                  }),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _modelController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'Model'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _dimensionController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'Dimension'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'weight(lb)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _lensDiameterController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'Lens Diameter(mm)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'price'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _stockController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      labelText: 'Stock'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This filled must not be empty';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _modelController.dispose();
    _dimensionController.dispose();
    _weightController.dispose();
    _lensDiameterController.dispose();
    _stockController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  void getImage(ImageSource source) async {
    final file = await ImagePicker()
        .pickImage(source: source, imageQuality : 50);
    if(file != null){
      setState(() {
        imageLocalPath = file.path;
      });
    }
  }

  void _saveTelescope() async {
    if (imageLocalPath == null) {
      showMsg(context, 'Please select a telescope image');
      return;
    }
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait');
      try {
        final imageModel = await Provider.of<TelescopeProvider>(
          context,
          listen: false,
        ).uploadImage(imageLocalPath!);
        final telescope = Telescope(
          model: _modelController.text,
          brand: brand!,
          type: telescopeType,
          dimension: _dimensionController.text,
          weightInPound: num.parse(_weightController.text),
          focustype: focusType,
          lensDiameterInMM: num.parse(_lensDiameterController.text),
          mountDescription: mountDescription,
          price: num.parse(_priceController.text),
          stock: num.parse(_stockController.text),
          thumbnail: imageModel,
          additionalImage: [],
        );
        await Provider.of<TelescopeProvider>(context, listen: false)
            .addTelescope(telescope);
        EasyLoading.dismiss();
        showMsg(context, 'Saved');
        _resetFields();
      } catch (error) {
        EasyLoading.dismiss();
        print(error.toString());
      }
    }
  }

  void _resetFields() {
    setState(() {
      _modelController.clear();
      _dimensionController.clear();
      _weightController.clear();
      _lensDiameterController.clear();
      _stockController.clear();
      _priceController.clear();

      brand = null;
      imageLocalPath = null;
      mountDescription = TelescopeUtils.mountList.first;
      focusType = TelescopeUtils.focusList.first;
      telescopeType = TelescopeUtils.typeList.first;
    });
  }
}
