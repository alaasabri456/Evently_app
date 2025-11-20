import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/login_request.dart';
import 'package:evently/models/register_request.dart';
import 'package:evently/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseService {
  static Future<UserCredential> register(RegisterRequest request)  async {
    UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: request.email,password: request.password);
    return userCredential;
  }



  static Future<UserCredential> login(LoginRequest request)async{
    UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: request.email, password: request.password);
    return userCredential;
  }

  // static Future< void > addUserToFireStore(UserModel user){
  //   FirebaseFirestore db=FirebaseFirestore.instance;
  //   CollectionReference<Map<String, dynamic>> usersCollection =db.collection("Users");
  //   DocumentReference<Map<String, dynamic>> userDocument=usersCollection.doc(user.id);//lw mb3tsh hy3ml auto_generate msh h3rf a3ml retrieve
  //   return userDocument.set(user.toJson());
  // }

//   static Future<UserModel> getUserFromFireStore(String uid)async{
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     CollectionReference<Map<String, dynamic>> usersCollection =db.collection("Users");
//     DocumentReference<Map<String, dynamic>> userDocument=usersCollection.doc(uid);
//     DocumentSnapshot <Map<String, dynamic>> documentSnapshot=await userDocument.get();
//     var  json=documentSnapshot.data();
// return UserModel.fromJson(json!);
//
//   }

  static CollectionReference<UserModel> _getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> usersDocument=usersCollection.doc(user.id);
    return usersDocument.set(user);
  }

  static Future<UserModel?> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = _getUsersCollection();
    DocumentReference<UserModel> usersDocument=usersCollection.doc(uid);
    DocumentSnapshot<UserModel> documentSnapshot =await usersDocument.get();
    return documentSnapshot.data();
  }

  static CollectionReference<EventModel> _getEventsCollection(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!,context),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }
  static Future<void> addEventToFireStore(EventModel event,BuildContext context) {
    CollectionReference<EventModel> eventsCollection =_getEventsCollection(context);
    DocumentReference<EventModel> eventDocument=eventsCollection.doc();
    event.id=eventDocument.id;
    event.uid=UserModel.currentUser!.id;
    return eventDocument.set(event);
  }

  static  Future<List<EventModel>>  getEventsFromFireStore(BuildContext context,CategoryModel category)async{
    CollectionReference<EventModel> eventsCollection =_getEventsCollection(context);
    QuerySnapshot<EventModel> querySnapshot=await eventsCollection.where("categoryId", isEqualTo: category.categId=="0"?null:category.categId).orderBy("dateTime").get();
    List<EventModel>events= querySnapshot.docs.map((documentSnapshot)=>documentSnapshot.data()).toList();
    return events;
  }


  static   Stream<List<EventModel>> getEventsFromFireStoreRealTimeUpdate(BuildContext context,CategoryModel category)async*{
    CollectionReference<EventModel> eventsCollection =_getEventsCollection(context);
    Stream<QuerySnapshot<EventModel>> querySnapshot=eventsCollection.where("categoryId", isEqualTo: category.categId=="0"?null:category.categId).orderBy("dateTime").snapshots();
    Stream<List<EventModel>> events =querySnapshot.map((snapShot)=>snapShot.docs.map((documentSnapshot)=>documentSnapshot.data()).toList());
    //List<EventModel>events= querySnapshot.docs.map((documentSnapshot)=>documentSnapshot.data()).toList();
    yield* events;
  }

  static Future<void> deleteEvent(BuildContext context,String eventId) async {
    await _getEventsCollection(context).doc(eventId).delete();
  }

  static Future<void> updateEvent(BuildContext context,EventModel event) async {
    await _getEventsCollection(context).doc(event.id).update(event.toJson());
  }

}