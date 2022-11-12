import 'package:flutter/material.dart';

import 'button_widget.dart';

class DialogBox extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  VoidCallback save;
  VoidCallback cancel;
  DialogBox({super.key, required this.controller,required this.cancel,required this.save});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[200],
      content: SizedBox(
        height: 120,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                    hintText: 'ADD NEW TASK', border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //cancel button

                  ButtonWidget(onPressed: cancel, buttonName: 'CANCEL'),
                  ButtonWidget(onPressed: save, buttonName: 'SAVE')

                  //save buttom
                ],
              )
            ]),
      ),
    );
  }
}
