import 'package:flutter/material.dart';
import 'package:flutter_persistence_example/database/dao/contact_dao.dart';
import 'package:flutter_persistence_example/model/Contact.dart';
import 'package:flutter_persistence_example/screens/contact_form.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final ContactDao _dao = ContactDao();
  final String myListScreenTitle = 'List';
  final String loadingMessage = 'Loading';
  final String successMessage = 'You have successfully created a transfer.';
  final String unknownErrorMessage = 'Unknown Error';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(myListScreenTitle),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text(loadingMessage),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact);
                  },
                  itemCount: contacts.length,
                );
                break;
            }
            return Center(
                child: Text(
                  unknownErrorMessage,
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
          }),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(
            MaterialPageRoute(builder: (context) => ContactForm()),
          )
              .then((message) {
            if (message is int) {
              setState(() {});
            }

            Scaffold.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 1),
              elevation: 10,
              backgroundColor: Color(0xFF008800),
              content: Text(successMessage),
            ));
          }),
          elevation: 10,
          child: Icon(Icons.add),
        ),
      ),
    );
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) => Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          contact.email,
          style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
        ),
        trailing: Text(
          contact.telephone,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
}
