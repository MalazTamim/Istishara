import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class SkillsList extends StatefulWidget {
  List<String> skills;

  SkillsList(this.skills);

  @override
  _SkillsListState createState() => _SkillsListState();
}

class _SkillsListState extends State<SkillsList> {
  @override
  Widget build(BuildContext context) {
    return widget.skills.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No skills added yet',
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          })
        : Container(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: widget.skills.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:const EdgeInsets.only(left: 8),
                  // padding: const EdgeInsets.all(0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                        widget.skills[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                  ),
                  
                );
              },
            ),
          );
  }
}
