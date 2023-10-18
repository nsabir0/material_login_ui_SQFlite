class userData_Model {
  int? id;
  String name;
  String email;
  String password;

  userData_Model(
      {this.id,
      required this.name,
      required this.email,
      required this.password});

  //Converting class objects into MAP objects
  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name, 'email': email, 'password': password};

  //Converting MAP objects into class objects
  factory userData_Model.fromMap(Map<String, dynamic> json) => userData_Model(
      name: json['name'], email: json['email'], password: json['password']);
}
