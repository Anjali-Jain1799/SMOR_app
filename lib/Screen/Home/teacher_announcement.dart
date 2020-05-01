import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_core/firebase_core.dart'; not nessecary


class Teacher_announcement extends StatefulWidget {
  @override
  _Teacher_announcementState createState() => _Teacher_announcementState();
}

class _Teacher_announcementState extends State<Teacher_announcement> {
  List<Item> items = List();
  Item item;
  DatabaseReference itemRef;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('Announcement Staff');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
  }

  _onEntryAdded(Event event) {
    setState(() {
      items.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = items.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      items[items.indexOf(old)] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Annoucement for Staff'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(
                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        decoration: InputDecoration(hintText: 'Date in format dd/mm/yyyy'),
                        initialValue: "",
                        validator:  validatedate,
                        onSaved: (val) => item.info = val,

                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        decoration: InputDecoration(hintText: 'Information'),
                        initialValue: '',
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (val) => item.info = val,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        handleSubmit();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new ListTile(
                  leading: Icon(Icons.message),
                  title: Text(items[index].date),
                  subtitle: Text(items[index].info),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  String validatedate(String value) {
    Pattern pat = r'^([0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9])$';
    RegExp regex = new RegExp(pat);
    if (!regex.hasMatch(value))
      return 'Enter Valid Date dd/mm/yyyy';
    else
      return null;
  }
}

class Item {
  String key;
  String date;
  String info;

  Item(this.date, this.info);

  Item.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        date = snapshot.value["Date"],
        info = snapshot.value["Information"];

  toJson() {
    return {
      "Date": date,
      "Information": info,
    };
  }
}
