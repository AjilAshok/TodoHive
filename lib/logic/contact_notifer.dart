import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todomodelhive/model/contactmodel.dart';

class ContactNotifer extends ChangeNotifier {
  final int _contactsCount = 0;
  int get contactsCount => _contactsCount;
  final contactBox = Hive.box('contacts');
  addcontact(ContactModel contactModel) {
    final contactBox = Hive.box('contacts');
    contactBox.add(contactModel);
    notifyListeners();
  }

  ContactModel getContact(int index) {
    final constactlist = contactBox.get(index);

    return constactlist as ContactModel;
  }

  int getCount() {
    final contactsCount = contactBox.length;
    notifyListeners();
    return contactsCount;
  }

  deletelist(index) async {
    await contactBox.delete(index);
   
  }
}
