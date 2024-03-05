import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_bike/models/bike.dart';
import 'package:rent_a_bike/screens/bike_info_screen.dart';
import 'package:rent_a_bike/services/bike_service.dart';
import 'package:rent_a_bike/widgets/text_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List category = [
    "Adventure",
    "Cruiser",
    "Sports Bike",
    "Touring Bikes",
    "Standard",
    "OFF-Road"
  ];
  BikeService service = BikeService();
  Map<String, dynamic> jsonData = {};

  @override
  void initState() {
    super.initState();
    service.getBikes();
  }

  @override
  Widget build(BuildContext context) {
    var bikes = Provider.of<BikeService>(context).getBikes();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Container(
                  width: 60,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    "https://imgv3.fotor.com/images/gallery/Realistic-Male-Profile-Picture.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Text.rich(
                TextSpan(
                    text: ' Welcome\n ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'James Thomas',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      )
                    ]),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Flexible(
              fit: FlexFit.loose,
              flex: 2,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none),
                    hintText: 'Search Bikes',
                    hintStyle:
                        const TextStyle(color: Colors.grey, fontSize: 18),
                    prefixIcon: const Icon(Icons.search)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 4, top: 4, bottom: 4),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.only(
                                    right: 5, left: 5, bottom: 5)),
                            animationDuration: Duration(seconds: 2)),
                        child: Text(category[index])),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildTextSubtitle("Popular ", "Bikes"),
            const SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: bikes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final bikes = snapshot.data ?? [];

                    return Flexible(
                      flex: 8,
                      fit: FlexFit.loose,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: bikes.length,
                          itemBuilder: (context, index) {
                            final bike = bikes[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/bikeInfo', arguments: index!);

                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (context) => BikeInfoScreen(),
                                // ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                height: 170,
                                width: 143,
                                margin: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 5),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      bike.image.toString(),
                                      fit: BoxFit.fill,
                                      height: 150,
                                      width: 150,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      bike.name.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("${bike.rentPerHourInr}/per day")
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                }),
            SizedBox(height: 10),
            buildTextSubtitle("Recently ", "Viewed"),

            BikeList(service: service),
          ]),
        ));
  }
}

class BikeList extends StatelessWidget {
  const BikeList({
    super.key,
    required this.service,
  });

  final BikeService service;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: service.getBikes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final bikes = snapshot.data ?? [];

            return Flexible(
              flex: 10,
              fit: FlexFit.loose,
              child: ListView.builder(
                  shrinkWrap: true,
                  dragStartBehavior: DragStartBehavior.start,
                  scrollDirection: Axis.vertical,
                  itemCount: bikes.length,
                  itemBuilder: (context, index) {
                    final bike = bikes[index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              bike.image.toString(),
                              fit: BoxFit.fill,
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "${bike.name}\n${bike.rentPerHourInr}/per day",
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              style: const ButtonStyle(),
                              child: const Text("AVAILABLE",
                                  style: TextStyle(fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }
        });
  }
}
