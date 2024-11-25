import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/viewmodels/taskData.dart';

class ModernTasksScreen extends StatelessWidget {
  const ModernTasksScreen({super.key});
  static const String routeName = '/modern-tasks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Công việc của tôi',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Consumer<Taskdata>(
            builder: (context, taskData, _) => Text(
              '${taskData.getCount} công việc',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _showSearchDialog(context),
        ),
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildCategoryFilter(context),
        const SizedBox(height: 16),
        Expanded(
          child: Consumer<Taskdata>(
            builder: (context, taskData, _) {
              if (taskData.taskTodo.isEmpty) {
                return _buildEmptyState(context);
              }
              return _buildTasksList(context, taskData);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _buildFilterChip('Tất cả', true),
          _buildFilterChip('Hôm nay', false),
          _buildFilterChip('Tuần này', false),
          _buildFilterChip('Quan trọng', false),
          _buildFilterChip('Đã hoàn thành', false),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        selected: isSelected,
        label: Text(label),
        onSelected: (bool value) {},
      ),
    );
  }

  Widget _buildTasksList(BuildContext context, Taskdata taskData) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: taskData.taskTodo.length,
      itemBuilder: (context, index) {
        return _buildTaskCard(context, taskData.taskTodo[index]);
      },
    );
  }

  Widget _buildTaskCard(BuildContext context, Task task) {
    return Dismissible(
      key: Key(task.nameTask),
      background: _buildDismissibleBackground(),
      child: Card(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          leading: Checkbox(
            value: task.isDone,
            shape: const CircleBorder(),
            onChanged: (bool? value) {},
          ),
          title: Text(
            task.nameTask,
            style: TextStyle(
              decoration: task.isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
              task.nameTask ?? 'Không có hạn',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: _buildTaskMenu(),
        ),
      ),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 16),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTaskMenu() {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'edit',
          child: Text('Chỉnh sửa'),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Xóa'),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt,
            size: 64,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Chưa có công việc nào',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Thêm công việc mới để bắt đầu',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddTaskDialog(context),
      icon: const Icon(Icons.add),
      label: const Text('Thêm công việc'),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const AddTaskSheet(),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showSearch(
      context: context,
      delegate: TaskSearchDelegate(),
    );
  }
}

// Các widget phụ trợ cần được định nghĩa riêng
class AddTaskSheet extends StatelessWidget {
  const AddTaskSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Nhập công việc mới',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 8),
                    Text('Đặt thời hạn'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.flag),
                    SizedBox(width: 8),
                    Text('Đặt mức độ ưu tiên'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TaskSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => query = '',
        ),
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}