import 'package:flutter/material.dart';
import 'package:todo/lists.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({Key? key}) : super(key: key);

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Completed Tasks"),
      ),
      body: ListView.builder(
          itemCount: checkedToDos.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8.0, bottom: 8.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(checkedToDos[index],
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              checkedToDos.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.clear))
                    ],
                  ),
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            checkedToDos.clear();
          });
        },
        label: const Text("Clear All"),
        icon: const Icon(Icons.delete_forever),
      ),
    );
  }
}
