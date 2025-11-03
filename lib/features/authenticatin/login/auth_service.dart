import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final GoogleSignIn _google = GoogleSignIn.instance;
  static bool isInitialize=false;
 static Future<void> _IntiSignin() async {
    if(!isInitialize) {
      await _google.initialize(
        clientId:
        '760020282271-0jhq74fu8iq63oh6e0bu76ucerrtkbpn.apps.googleusercontent.com',
      );
    }
    isInitialize=true;

  }

 static Future<UserCredential>signInWithGoogle()async{
    _IntiSignin();
    GoogleSignInAccount account= await _google.authenticate();
    final idToken=account.authentication.idToken;
    final authClient=account.authorizationClient;
    final GoogleSignInClientAuthorization? auth =await authClient.authorizationForScopes(['email','profile']);
    final accessToken=auth?.accessToken;
    final credential=GoogleAuthProvider.credential(idToken:idToken,accessToken: accessToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
 }


}