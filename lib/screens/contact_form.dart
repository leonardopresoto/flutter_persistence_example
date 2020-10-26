import 'package:flutter/material.dart';
import 'package:flutter_persistence_example/components/editor.dart';
import 'package:flutter_persistence_example/database/dao/contact_dao.dart';
import 'package:flutter_persistence_example/model/Contact.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';


class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final String contactFormScreenTitle = 'Contact Form';
  final String fullNameLabel = 'Full Name';
  final String  fullNameHint = 'John Johnson';
  final String  telephoneLabel = 'Telephone';
  final String  telephoneHint = '(00) 00000-0000';
  final String  emailLabel = 'E-mail';
  final String  emailHint = 'xxxx@yyyy.com';
  final String  confirm = 'Confirm';
  final String  errorMessage = 'Please make sure all fields are filled in correctly!';

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerTelephone = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();

  final maskFormatter = new MaskTextInputFormatter(mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(contactFormScreenTitle),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Editor(
                    controller: _controllerName,
                    label: fullNameLabel,
                    hint: fullNameHint,
                  ),
                  Editor(
                    controller: _controllerTelephone,
                    label: telephoneLabel,
                    hint: telephoneHint,
                    textInputType: TextInputType.phone,
                    mask: maskFormatter,
                  ),
                  Editor(
                    controller: _controllerEmail,
                    label: emailLabel,
                    hint: emailHint,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    elevation: 10,
                    onPressed: () => _confirmContact(context),
                    child: Text(
                      confirm.toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearTextFields() {
    _controllerName.text = '';
    _controllerTelephone.text = '';
    _controllerEmail.text = '';
    FocusScope.of(context).previousFocus();
    FocusScope.of(context).previousFocus();
  }

  void _confirmContact(BuildContext context) {
    ContactDao _dao = ContactDao();
    print(maskFormatter.getMaskedText());
    if (_controllerName.text.isNotEmpty &&
        _controllerTelephone.text.isNotEmpty &&
        _controllerEmail.text.isNotEmpty) {
      _dao
          .save(Contact(_controllerName.text, _controllerTelephone.text,
              _controllerEmail.text))
          .then((id) => Navigator.pop(context, id));
      _clearTextFields();
    } else {
      //_clearTextFields();
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Color(0xFF880000),
          content: Text(errorMessage),
        ),
      );
    }
  }
}
