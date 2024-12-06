import 'package:flutter/material.dart';
import 'taskScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: SafeArea(child: Taskscreen()),
    );
  }
}

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Task Manager"),
      ),
      body: Column(
        children: [
          // Tabs for categories
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                _buildCategoryTab("Cá nhân", true),
                _buildCategoryTab("Công ty", false),
                _buildCategoryTab("Gia đình", false),
                _buildCategoryTab("Gia đình", false),
                _buildCategoryTab("Gia đình", false),
                _buildCategoryTab("Gia đình", false),

              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                _buildSection("Cá nhân", [
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Đang thực hiện", Icons.edit),
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Chưa bắt đầu", Icons.menu),
                ]),
                _buildSection("Công ty", [
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Đang thực hiện", Icons.edit),
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Chưa bắt đầu", Icons.menu),
                ]),
                _buildSection("Task miss", [
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Đang thực hiện", Icons.edit),
                  _buildTaskCard("Hoàn thiện todo", "3 steps", "Chưa bắt đầu", Icons.add),
                ]),
              ],
            ),
          ),
        ],
      ),

    );
  }

  Widget _buildCategoryTab(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        label: Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> tasks, {TextStyle? titleStyle, EdgeInsetsGeometry? padding}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Text(
            title,
            style: titleStyle ?? TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        if (tasks.isNotEmpty) ...tasks else Text('No tasks available'),
      ],
    );
  }

  Widget _buildTaskCard(String title, String subtitle, String status, IconData icon) {
    Color statusColor = status == "Đang thực hiện" ? Colors.green : Colors.orange;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor,
          child: Icon(Icons.check, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle),
            Text(
              status,
              style: TextStyle(color: statusColor),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(icon),
          onPressed: () {},
        ),
      ),
    );
  }
}
