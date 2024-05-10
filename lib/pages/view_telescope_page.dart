import 'package:astroscope_hub/providers/telescope_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewTelescopePage extends StatefulWidget {
  static const String routeName = 'viewtelescope';

  const ViewTelescopePage({super.key});

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Telescopes'),
        ),
        body: Consumer<TelescopeProvider>(
          builder: (context, provider, child) => ListView.builder(
            itemCount: provider.telescopeList.length,
            itemBuilder: (context, index) {
              final telescope = provider.telescopeList[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        imageUrl: telescope.thumbnail.downloadUrl,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                telescope.brand.name,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                telescope.model,
                                style: TextStyle(
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
