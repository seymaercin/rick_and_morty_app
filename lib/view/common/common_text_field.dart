import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;

  const CommonTextField({
    super.key,
    this.controller,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            label: label != null
                ? Text(
                    label ?? "",
                  )
                : null,
            labelStyle: const TextStyle(color: Color.fromARGB(255, 10, 75, 75)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 10, 75, 75)),
            )),
        cursorColor: const Color.fromARGB(255, 10, 75, 75));
  }
}
