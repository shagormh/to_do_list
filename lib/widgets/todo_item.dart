import 'package:flutter/material.dart';
import 'package:to_do_list/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final String taskTitle; // Task title
  final bool isCompleted; // Task completion status
  final Function(bool?)? onChanged; // Callback for checkbox
  final VoidCallback? onDelete; // Callback for delete action

  ToDoItem({
    required this.taskTitle,
    required this.isCompleted,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10), // Add spacing between items
      child: ListTile(
        onTap: () {
          // Perform task-specific action on tap
          if (onChanged != null) {
            onChanged!(!isCompleted); // Toggle completion status
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Checkbox(
          value: isCompleted,
          onChanged: onChanged,
          activeColor: tdBlue,
        ),
        title: Text(
          taskTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete, // Delete task on button press
        ),
      ),
    );
  }
}
