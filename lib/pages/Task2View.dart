import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task2view extends StatelessWidget {
  const Task2view({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        child: FractionallySizedBox(
          heightFactor: 0.99,
          widthFactor: 0.99,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Weekly Expense",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          Text(
                            'From 1-6 April,2024',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          shadowColor: Colors.black,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: Text(
                          "View Report",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(children: [ ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: Container(color: Colors.grey,child: Center(child:  Text("48%"))),
                    ),
                  ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Container(color: Colors.grey,child: Center(child:  Text("48%"))),
                      ),
                    ),
                    SizedBox(width: 2,),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Container(color: Colors.grey,child: Center(child:  Text("48%"))),
                      ),
                    ),
                    SizedBox(width: 2,),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Container(color: Colors.grey , child: Center(child:  Text("48%")),),
                      ),
                    )
                  ],),
                  Text("----------------------------------------------------------------------------------------------------"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      _Item(
                          color: Colors.purple,
                          category: "Grocery",
                          amount: "\$758.20"),
                      _Item(
                          color: Colors.green,
                          category: "Food & Drink",
                          amount: "\$758.20"),
                    ],
                  ),
                  SizedBox(height: 20),

                  SizedBox(height: 20),
                 Text("----------------------------------------------------------------------------------------------------"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _Item(
                          color: Colors.red,
                          category: "Shopping",
                          amount: "\$758.20"),
                      _Item(
                          color: Colors.orange,
                          category: "Transportation",
                          amount: "\$758.20"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _Item(
      {required Color color, required String category, required String amount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: SizedBox(
                height: 10,
                width: 10,
                child: Container(color: color),
              ),
            ),
            SizedBox(width: 10),
            Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          amount,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
