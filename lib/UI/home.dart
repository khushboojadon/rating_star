import 'package:flutter/material.dart';
import 'package:khushboo_task/UI/rating.dart';
import 'package:khushboo_task/date_format.dart';
import 'package:khushboo_task/service/api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Api _api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: SafeArea(
        child: Column(children: [
          FutureBuilder(
              future: _api.getdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.data == null
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, int index) {
                              return Card(
                                  elevation: 5.0,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40.0,
                                          backgroundImage: NetworkImage(
                                              snapshot.data[index].imageLink),
                                          backgroundColor: Colors.blue,
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(snapshot.data[index].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                              SizedBox(height: 5),
                                              Text(snapshot.data[index].price,
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              SizedBox(height: 5),
                                              Text(
                                                  date(snapshot
                                                      .data[index].createdAt),
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              SizedBox(height: 5),
                                              IconTheme(
                                                data: IconThemeData(
                                                  color: Colors.amber,
                                                  size: 24,
                                                ),
                                                child: RatingStar(
                                                  value: snapshot
                                                          .data[index].rating ??
                                                      0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                      );
              }),
        ]),
      ),
    );
  }
}
