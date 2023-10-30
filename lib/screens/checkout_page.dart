import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bike_service.dart';
import '../widgets/text_widgets.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int ;
    final provider = Provider.of<BikeService>(context);
    final bike = provider.bikes[index!];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, left: 15),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back),
                            iconSize: 29,
                            color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 31,
                          left: 30,
                        ),
                        child: Container(
                          width: 275,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "Check Out",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 330,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: TextField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(18),
                                    suffixIconColor: Colors.black,
                                    label: Text(
                                      'START DATE',
                                    ),
                                    alignLabelWithHint: true,
                                    suffixIcon: Icon(Icons.calendar_month)),
                                controller: startDateController,
                                onTap: () {
                                  selectDate(startDateController);
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: TextField(
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(18),
                                    label: Text('END DATE'),
                                    suffixIcon: Icon(Icons.calendar_month),
                                    suffixIconColor: Colors.black),
                                controller: endDateController,
                                onTap: () {
                                  selectDate(endDateController);
                                },
                              ),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                            EdgeInsets.only(left: 5, right: 240)),
                        iconColor: MaterialStatePropertyAll(Colors.grey),
                        foregroundColor: MaterialStatePropertyAll(Colors.grey),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(2))))),
                    onPressed: () {},
                    child: Text("Apply Coupon"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 330,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Details",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1.0,
                          width: 330.0,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Days"), Text("4")],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Rent"), Text("5996")],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Additional items"), Text("6400")],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Coupon discount"), Text("396")],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1.0,
                          width: 330.0,
                          color: Colors.black,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text("12000")
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(
                                      right: 100,
                                      left: 100,
                                      top: 12,
                                      bottom: 12)),
                              alignment: Alignment.center,
                              shape: MaterialStateProperty.all(
                                  BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CheckoutPage(),
                            ));
                          },
                          child: Text(
                            "PAY NOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1890),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16

      setState(() {
        controller.text = pickedDate as String;
      });
    } else {
      print("Date is not selected");
    }
  }
}
