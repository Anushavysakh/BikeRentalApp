import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_bike/services/accessory_service.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccessoryService>(context).getAccessories();
    return Stack(
      children: [
        Container(
          color: Colors.orange,
        ),
        Positioned(
          top: 420,
          child: FutureBuilder(
              future: provider,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final accessory = snapshot.data ?? [];
                  return Container(height: MediaQuery.of(context).size.height,
                    width: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: accessory.length,
                      itemBuilder: (context, index) {
                        print(accessory[index].rentPerDay.toString());
                        return Container(
                          width: 270,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  accessory[index].image.toString(),
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.fill,
                                ),

                                Text("${accessory[index].name.toString()}\n${accessory[index].rentPerDay}/per day",style: TextStyle(fontSize: 12),),
                                ElevatedButton(
                                  onPressed: () {
                                    //    addItem();
                                  },
                                  child: Text("Asadf"
                                      // itemCount == 0 ? Text("Add") : Text(
                                      //     '$itemCount'
                                      ),
                                ),
                              ]),
                        );
                      },
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
