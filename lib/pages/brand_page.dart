import 'package:astroscope_hub/providers/telescope_provider.dart';
import 'package:astroscope_hub/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class BrandPage extends StatelessWidget {
  static const String routeName = 'brand';

  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Brands'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSingleTextInputDialog(
            context: context,
            title: 'Add Brand',
            onSubmit: (value) {
              EasyLoading.show(status: 'please wait');
              Provider.of<TelescopeProvider>(context, listen: false)
                  .addBrand(value)
                  .then((value) {
                EasyLoading.dismiss();
                showMsg(context ,'Brand Added');
              });
            },
          );
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => provider.brandList.isEmpty
            ? const Center(
                child: Text('No Brand Found'),
              )
            : ListView.builder(
                itemCount: provider.brandList.length,
                itemBuilder: (context, index) {
                  final brand = provider.brandList[index];
                  return ListTile(
                    title: Text(brand.name),
                  );
                },
              ),
      ),
    );
  }
}
