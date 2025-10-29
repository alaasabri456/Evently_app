import 'package:evently/models/login_request.dart';
import 'package:evently/models/register_request.dart';
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
}