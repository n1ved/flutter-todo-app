import 'package:flutter/material.dart';
import 'package:todo/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/completed');
              },
              child: const Text('Completed Tasks >')),
          const SizedBox(width: 10)
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: toDoItems.length,
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
                    Text(toDoItems[index],
                        style: TextStyle(
                          fontSize: 15,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        )),
                    Checkbox(
                        value: isChecked[index],
                        onChanged: (value) {
                          setState(() {
                            isChecked[index] = true;
                            checkedToDos.add(toDoItems[index]);
                            toDoItems.removeAt(index);
                            isChecked.removeAt(index);
                          });
                        }),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            openDialog();
          });
        },
        tooltip: "New entry",
        label: Text("New Task",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer)),
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Create New Task"),
            content: TextField(
              controller: controller,
              autofocus: true,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                      controller.text = '';
                    });
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      toDoItems.add(controller.text);
                      isChecked.add(false);
                      controller.text = '';
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text("Save")),
            ],
          );
        });
  }
}
