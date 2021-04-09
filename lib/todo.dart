class Todo{
  String name;
  String token;
  String password;
  Todo.fromMap(Map map):
      this.name=map['name'],
      this.password=map['password'],
      this.token=map['token'];
   Map toMap(){
     return{
       'name':this.name,
       'password':this.password,
       'token':this.token
     };

   }


}