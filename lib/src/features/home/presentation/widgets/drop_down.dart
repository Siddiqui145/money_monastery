import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final String title;
  final List<String> items;
  final TextEditingController controller;

  const Dropdown({
    super.key,
    required this.title,
    required this.items,
    required this.controller,
  });

  @override
  DropdownState createState() => DropdownState();
}

class DropdownState extends State<Dropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller.text.isNotEmpty ? widget.controller.text : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: widget.items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.controller.text = value ?? "";
        });
      },
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        filled: true,
        fillColor: const Color.fromRGBO(204, 196, 196, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
