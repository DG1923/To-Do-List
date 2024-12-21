import 'package:flutter/material.dart';
import 'package:to_do_list/views/widgets/constants.dart';
import 'components/categoriesTab.dart';
import 'components/searchBar.dart';
import 'components/sectionCard.dart';
import 'components/sideBar.dart';
class Taskscreen extends StatefulWidget {
  Taskscreen({super.key});

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}
class _TaskscreenState extends State<Taskscreen> {
  @override
  Widget build(BuildContext context) {
    SearchController controller = SearchController();
    List<String> titleTask = [
      "task 1",
      "task 2",
      "task 3",
      "task 4",
      "task 5",
      "task 6",
    ];
    List<String> sectionTask = [
      "Personal",
      "Company",
      "Family",
      "Start-up",
      "Home",
      "Project"
    ];
    return Scaffold(
      drawer: Sidebar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
              Icons.account_circle,
            weight: 50,
          ))
        ],
        leading: Builder(
          builder:(context)=> IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              setState(() {
                Scaffold.of(context).openDrawer();
              });
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Searchbar(controller: controller,),
            Categoriestab(sectionTask: sectionTask),
            Sectioncard(sectionTask: sectionTask, titleTasks: titleTask)
          ],
        ),
      ),
    );
  }
}
