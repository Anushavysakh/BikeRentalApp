import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_a_bike/bike_service.dart';
import 'package:rent_a_bike/screens/checkout_page.dart';
import 'package:rent_a_bike/widgets/text_widgets.dart';

class BikeInfoScreen extends StatefulWidget {
  const BikeInfoScreen({super.key});

  @override
  State<BikeInfoScreen> createState() => _BikeInfoScreenState();
}

class _BikeInfoScreenState extends State<BikeInfoScreen> {
  get service => BikeService();
  int itemCount = 0;


  void addItem() {
    setState(() {
      itemCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
     int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int ;
    final provider = Provider.of<BikeService>(context);
    final bike = provider.bikes[index!];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Stack(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back),
                    iconSize: 29,
                    color: Colors.black,
                    focusColor: Colors.grey),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 80.0, top: 31, right: 20),
                child: Container(
                  width: 274,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    "Bike Details",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 166,
              top: 122,
              child: ClipRect(
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  fit: BoxFit.fill,
                  bike.image.toString(),
                  // "assets/images/KTM Duke 390.jpeg",
                  height: 237,
                  width: 217,
                ),
              ),
            ),
             Positioned(
                top: 115,
                left: 5,
                child: Container(child: Text(bike.name.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),)
                // Text.rich(
                //   TextSpan(
                //       text:"${bike.name?.substring(0,14)}\n",
                //       style: TextStyle(
                //           fontSize: 22, fontWeight: FontWeight.w400),
                //       children: <InlineSpan>[
                //         TextSpan(
                //           text:bike.name?.substring(15,),
                //           style: TextStyle(
                //             fontWeight: FontWeight.w700, color: Colors.black,
                //             fontSize: 21,
                //           ),
                //         )
                //       ]),
                // ),
             ),
            Positioned(
              top: 185,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                width: 136,
                height: 63,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  // color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.topLeft,
                child: buildTextCategory(
                    "Category\n", bike.category.toString()),
              ),
            ),
            Positioned(
              top: 278,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                width: 136,
                height: 63,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  // color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.topLeft,
                child: buildTextCategory(
                    "Displacement\n", bike.displacementCc.toString()),
              ),
            ),
            Positioned(
              top: 370,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                width: 136,
                height: 63,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  // color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.topLeft,
                child: buildTextCategory(
                    "Max Speed\n", bike.maxSpeedKmph.toString()),
                //  child: Text("Category\nCrusier"),
              ),
            ),
            Positioned(
              top: 370,
              left: 160,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                width: 200,
                height: 65,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    width: 2,
                  ),
                  // color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text.rich(textAlign: TextAlign.center,
                  TextSpan(
                      text: "Rent\n",
                      style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      children: <InlineSpan>[
                        TextSpan(
                          text: "\$${bike.rentPerHourInr.toString()}",
                          style: TextStyle(fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        )
                      ]),
                ),
              ),
            ),
            Positioned(top: 470, child: buildTextSubtitle("Add", " Items")),
            Positioned(
              top: 520,
              child: Container(
                width: 370,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/images/helmet.jpeg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                      Text("Helmet\n800/per day"),
                      ElevatedButton(
                        onPressed: () {
                          addItem();
                        },
                        child: itemCount == 0 ? Text("Add") : Text(
                            '$itemCount'),
                      ),
                    ]),
              ),
            ),
            Positioned(
                top: 750,
                left: 22, right: 22,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.black),

                      padding: MaterialStateProperty.all(
                          EdgeInsets.only(
                            right: 100,
                            left: 100,
                          )),
                      alignment: Alignment.center,
                      shape: MaterialStateProperty.all(
                          BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5)))),
                  child: Text("CheckOut",
                    style: TextStyle(color: Colors.white, fontSize: 18),),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/checkout', arguments: index!);

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => CheckoutPage(),
                    // ));
                  },
                ))
          ]),
        ),
      ),
    );
  }
}
