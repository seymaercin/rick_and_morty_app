import 'package:flutter/material.dart';
import 'package:odev_firebase/model/character.dart';
import 'package:odev_firebase/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Characters",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 10, 75, 75),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return Consumer<HomePageViewModel>(
        builder: (context, viewModel, child) => ListView.builder(
            itemCount: viewModel.characters.length,
            itemBuilder: (context, index) {
              return Provider<Character>.value(
                value: viewModel.characters[index],
              );
            }));
  }
}
