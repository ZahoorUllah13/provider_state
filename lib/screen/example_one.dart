import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/screen/favouritescreen/favourite_screen.dart';
import 'package:provider_state/screen/theme_changer.dart';
import '../provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  @override
  // void initState() {
  // final countProvider=Provider.of<CountProvider>(context,listen: false);
  // Timer.periodic(Duration(seconds:1), (timer) {
  //   countProvider.setCount();
  // });
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      drawer: const Drawer(
        child: ThemeChangerScreeen(),
      ),
      appBar: AppBar(
        title: const Text('provider'),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>const FavouriteScreen()));
              },
              child:const Text('favourite =>',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CountProvider>(builder: (context, value, child) {
            return Text(
              value.value.toString(),
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Consumer<ShowProvider>(
            builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            },
          ),
          Consumer<ShowProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(value.value),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(value.value),
                    ),
                  ),
                )
              ],
            );
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
