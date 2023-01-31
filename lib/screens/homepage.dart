import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todomodelhive/logic/contact_notifer.dart';
import 'package:todomodelhive/screens/widgets/add_contact.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: Consumer<ContactNotifer>(
        builder: (context, contactlist, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final Random random = Random();
              final contact = contactlist.getContact(index);
              return Container(
                margin: const EdgeInsets.all(5),
                color: Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                    random.nextInt(255), 1),
                child: ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            // Hive.box('contacts').delete(index);
                            // final deletemethod = Provider.of<ContactNotifer>(
                            //     context,
                            //     listen: false);
                            // deletemethod.deletelist(index);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete))
                    ],
                  ),
                  title: Text(contact.name),
                  subtitle: Text(contact.age.toString()),
                ),
              );
            },
            itemCount: contactlist.getCount(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AddContact();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
