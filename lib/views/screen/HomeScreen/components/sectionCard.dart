import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Sectioncard extends StatelessWidget {
  Sectioncard({super.key, required this.sectionTask, required this.titleTasks});
  late List<String> sectionTask=[];
  late List<String> titleTasks=[];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: sectionTask.map((String titleCard){
          return _sectionTitleCard(titleCard);
        }).toList(),
      ),
    );
  }
  Widget _sectionTitleCard(String titleSection){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          titleSection,
          style: kTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(bottom: 5, left: 5),
                child: Divider(
                  height: 1,
                  color: kPrimaryColor,
                )))
      ],
    ),
        SizedBox(height: 10),
        //Task to do
        Column(
          children: titleTasks.map((String titleTask){
            return Container(
              margin: EdgeInsets.only(bottom: 5),
                child: _taskCard(titleTask));
          }).toList(),
        ),
        SizedBox(height: 10)
      ],
    );
  }
  Widget _taskCard(String titleTask){
    if( titleTask.isEmpty){
      return Text("is null here");
    }
    print(titleTask);
    return Row(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              height: 33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kThirdColor,
              ),
              child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.2,
                  motion: const DrawerMotion(),
                  children: [
                    SlidableAction(
                      padding: EdgeInsets.zero,
                      onPressed: (_){},
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),
                      ),

                    )
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        Text(
                          titleTask,
                          style: kTextStyle.copyWith(
                            fontSize: 13,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        style: IconButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: (){}, icon: Icon(Icons.more_vert_sharp,))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          //Button (do it!) when click moving on pomodoro screen
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 24,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Do it!",
                  style: kTextStyle.copyWith(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]);
  }
}
