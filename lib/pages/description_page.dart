import 'package:astroscope_hub/providers/telescope_provider.dart';
import 'package:astroscope_hub/utils/widget_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  static const String routeName = 'description';
  final String id;
  const DescriptionPage({super.key, required this.id});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  final _controller = TextEditingController();
  String? description;

  @override
  void didChangeDependencies() {
    description = Provider.of<TelescopeProvider>(context, listen : false).findTelescopeById(widget.id).description;
    if(description != null){
      _controller.text = description!;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
        actions: [
          IconButton(
            onPressed: _saveDescription,
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.grey,
          height: double.infinity,
        child: TextField(
          controller: _controller,
          maxLines: 1000,
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _saveDescription() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Field is empty');
      return;
    }
    EasyLoading.show(status: 'please wait');
    Provider.of<TelescopeProvider>(context, listen: false)
        .updateTelescopeField(widget.id, 'description', _controller.text)
        .then((value) {
          showMsg(context, 'Description Updated');
          EasyLoading.dismiss();
    })
        .catchError((error) {
      EasyLoading.dismiss();
    });
  }
}
