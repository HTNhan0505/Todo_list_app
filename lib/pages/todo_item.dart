import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      this.onChanged});

  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ),
            Text(
              taskName,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.black,
                  decorationThickness: 3),
            ),
          ],
        ),
      ),
    );
  }
}
