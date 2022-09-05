import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class HomePg extends StatefulWidget {
  const HomePg({Key? key}) : super(key: key);

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  Future<Data> getData() async {
    String requestUri =
        'https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?l';
    var response = await http.get(Uri.parse(requestUri));
    if (response.statusCode == 200) {
      var result = Data.fromJson(jsonDecode(response.body));
      print(result);
      return result;
    } else {
      return Text('error') as Data;
    }
  }

  late Future<Data> futureData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureData = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Overview',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
                Container(
                  height: 250,
                  child: FutureBuilder<Data>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sector'),
                                          Row(
                                            children: [
                                              Icon(Icons.account_balance),
                                              Text(snapshot.data!.Sector),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Industry'),
                                          Row(
                                            children: [
                                              Icon(Icons.account_balance),
                                              Text(snapshot.data!.Industry),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Market Cap'),
                                          Text(snapshot.data!.MCAP.toString() +
                                              " CR"),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Enterprise Value(EV)'),
                                          Text(' - '),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Book Value / share'),
                                          Text(snapshot.data!.BookNavPerShare
                                              .toStringAsFixed(2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Price-Earning ratio (PE)'),
                                          Text(snapshot.data!.TTMPE
                                              .toStringAsFixed(2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('PEG Ratio'),
                                          Text(snapshot.data!.PEGRatio
                                              .toStringAsFixed(2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Divident Yeild'),
                                          Text(snapshot.data!.Yield
                                              .toStringAsFixed(2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.9,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(' '),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'View more',
                                              style: TextStyle(
                                                  color: Colors.orange),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }
                        return Text('${snapshot.error}');
                      }),
                ),
                Text(
                  'Performance',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ));
  }
}
