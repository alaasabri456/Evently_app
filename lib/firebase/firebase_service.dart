import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/login_request.dart';
import 'package:evently/models/register_request.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<UserCredential> register(RegisterRequest request)  async {
    UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: request.email,password: request.password);
    return userCredential;
  }



  static Future<UserCredential> login(LoginRequest request)async{
    UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: request.email, password: request.password);
    return userCredential;
  }

  static Future< void > addUserToFireStore(UserModel user){
    FirebaseFirestore db=FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection =db.collection("Users");
    DocumentReference<Map<String, dynamic>> userDocument=usersCollection.doc(user.id);//lw mb3tsh hy3ml auto_generate msh h3rf a3ml retrieve
    return userDocument.set({
      "id":user.id,
        "email": user.email,
      "name":user.name
    });
  }

  static Future<UserModel> getUserFromFireStore(String uid)async{
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection =db.collection("Users");
    DocumentReference<Map<String, dynamic>> userDocument=usersCollection.doc(uid);
    DocumentSnapshot <Map<String, dynamic>> documentSnapshot=await userDocument.get();
    var  json=documentSnapshot.data();
return UserModel(id: json?["id"], email:json?["email"] , name:json?["name"]);

  }


}