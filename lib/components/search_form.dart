import 'package:flutter/material.dart';
class SearchForm extends StatefulWidget {
  final Function(String) onSearch;
  const SearchForm({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 15),
        width: 250,
        height: 70,
        child: TextField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
          onSubmitted: ((value) {
            widget.onSearch(value);
          }),
        ));
  }
}