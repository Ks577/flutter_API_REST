import 'package:flutter/material.dart';
import 'dart:async';
import '../components/search_form.dart';
import '../data/gifs_service.dart';
import '../widgets/grid_view.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _gifService = GifService();
  String value = '';
  late Future<List<dynamic>> gifsList;
  @override
  void initState() {
    super.initState();
    gifsList = _gifService.getGifsByParameters(value);
  }

  void changeValue(val) {
    gifsList = _gifService.getGifsByParameters(val);
    setState(() {});
    value = val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search gifs'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SearchForm(onSearch: changeValue),
            GifView(gifsList: gifsList)
          ],
        ));
  }
}