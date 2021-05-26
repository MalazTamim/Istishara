import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpertList extends StatelessWidget {
  final List<String> expertList;
  final List<String> expertListIconss;

  ExpertList(this.expertList, this.expertListIconss);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        // Container(height: 20, child: Image.asset('assets/images/icons/doctor.png', fit: BoxFit.cover,)),

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          elevation: 8,
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 30,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.asset(
                          expertListIconss[index],
                          fit: BoxFit.cover,
                        ))),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    expertList[index],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: expertList.length,
    );
    // children: transactions.map((tx) {}).toList(),    replace tx with transactions[index]
  }
}
