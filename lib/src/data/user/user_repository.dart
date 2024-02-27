import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bill_split/src/data/authentication/authentication_repository.dart';
import 'package:bill_split/src/exceptions/firebase_exceptions.dart';
import 'package:bill_split/src/exceptions/format_exceptions.dart';
import 'package:bill_split/src/exceptions/platform_exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../features/personalization/modals/user_model.dart';



class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void>saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<UserModel>fetchUserDetails() async {
    try{
      final documentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void>updateUserDetails(UserModel updateUser) async {
    try{
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void>updateSingleField(Map<String, dynamic> json) async {
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<void>removeUserRecord(String userId) async {
    try{
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }

  Future<String> uploadImage(String path, XFile image)async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e){
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_){
      throw TcFormatException();
    } on PlatformException catch (e){
      throw TcPlatformException(e.code).message;
    } catch (e){
      throw 'Something went wrong. Please try again';
    }
  }
}
