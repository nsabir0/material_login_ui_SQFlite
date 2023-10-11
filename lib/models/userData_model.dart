class userData_Construct{
   int? id;
   String name;
   String email;
   String password;

   userData_Construct({
     this.id,
    required this.name,
    required this.email,
    required this.password
  });

   //Sending data from user as MAP Variable
   Map<String, dynamic> toMap()=>
       {'id':id, 'name':name, 'email':email, 'password':password};

   //Reading json Data from Database as Map
  factory userData_Construct.fromMap(Map<String, dynamic>json)=>
      userData_Construct(name: json['name'], email: json['email'], password: json['password']
    );



}