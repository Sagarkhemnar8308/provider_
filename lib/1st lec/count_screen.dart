import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/1st%20lec/count_provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({super.key});

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  Widget build(BuildContext context) {
    final countprovider = Provider.of<CountProvider>(context);
    return Consumer(
       builder:
              (BuildContext context, NumberListProvider value, Widget? child) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
           value.add();
            },
            child: const Icon(Icons.add),
          ),
          body: Consumer<NumberListProvider>(
            builder:
                (BuildContext context, NumberListProvider value, Widget? child) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    value.num.last.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.num.length,
                      itemBuilder: (context, index) {
                        return Text(
                          value.num[index].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            },
          ),
        ),
      );},
    );
  }
}

// Center(
//         child: Text(countprovider.count.toString()),
//       ),