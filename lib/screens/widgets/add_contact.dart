import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todomodelhive/logic/contact_notifer.dart';
import 'package:todomodelhive/model/contactmodel.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nameControler = TextEditingController();
    TextEditingController ageControler = TextEditingController();
    return AlertDialog(
      title: const Text("Add Contacts"),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameControler,
              decoration: const InputDecoration(labelText: "Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a name";
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: ageControler,
              decoration: const InputDecoration(labelText: "Age"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter a number";
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text("Submit"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              final contactNotifier =
                  Provider.of<ContactNotifer>(context, listen: false);

              final newContact = ContactModel(
                  age: int.parse(ageControler.text), name: nameControler.text);

              contactNotifier.addcontact(newContact);

              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  addcontact(ContactModel contactModel) {
    final contactBox = Hive.box('contacts');
    contactBox.add(contactModel);
  }
}
