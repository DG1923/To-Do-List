import 'package:flutter/material.dart';

import '../../../widgets/constants.dart';
class Sidebar extends StatelessWidget {
  const Sidebar({super.key});
  Widget _sideBarSection(List<String> sections,Icon icon){
    return  Column(
      children: sections.map((String title){
        return ListTile(
          title: Text(title),
          subtitle: Text("3/4 tasks"),
          leading: Icon(Icons.adb_outlined),
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    List<String> sectionTask = [
      "Personal",
      "Company",
      "Family",
      "Start-up",
    ];
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("oke"),
            accountEmail: Text("giap@gmail.com"),
            currentAccountPicture: Image.asset("assets/image/photo.png",fit: BoxFit.contain,),
            arrowColor: kPrimaryColor,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                gradient: LinearGradient(colors:[Colors.lightBlueAccent,Colors.black],)
            ),
          ),
          _sideBarSection(sectionTask, Icon(Icons.add_business_outlined)),
        ],
      ),
    );
  }
}
