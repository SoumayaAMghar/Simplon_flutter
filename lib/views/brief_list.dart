import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/models/brief_for_listing.dart';
import 'package:myapp/views/brief_delete.dart';

import 'brief_modify.dart';

class BriefList extends StatelessWidget {

  final briefs = [
    new BriefForListing(
        briefID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        briefTitle: "Brief 1"
    ),
    new BriefForListing(
        briefID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        briefTitle: "Brief 2"
    ),
    new BriefForListing(
        briefID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        briefTitle: "Brief 3"
    ),
  ];
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(
          title: Text('Simplonline',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => BriefModify(briefID: '',)));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
          itemBuilder: (_, index) {
            return Dismissible(
              key: ValueKey(briefs[index].briefID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
              },
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context,
                    builder: (_) => BriefDelete()
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 16),
                child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
              ),
              child: ListTile(
                title: Text(
                  briefs[index].briefTitle?? '1',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text('Last edited on ${formatDateTime(briefs[index].latestEditDateTime?? DateTime.now())}'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => BriefModify(briefID: briefs[index].briefID?? '0')));
                },
              ),
            );
          },
          itemCount: briefs.length,
        ),
    );
  }
}
