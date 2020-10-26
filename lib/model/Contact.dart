class Contact {
  final int id;
  final String name;
  final String telephone;
  final String email;

  Contact(this.name, this.telephone, this.email, {this.id = 0});

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, telephone: $telephone, email: $email}';
  }
}