import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_course_demo/app/utils/element/save_or_cancel_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow,
        content: Container(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //get user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Add a new task...",
                ),
              ),

              //save or cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save button
                  SaveOrCancelButton(text: "Save", onPressed: onSave),

                  //the filler
                  const SizedBox(width: 10),

                  //cancel button
                  SaveOrCancelButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ));
  }
}
