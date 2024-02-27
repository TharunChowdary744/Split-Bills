import 'package:bill_split/src/data/user/user_repository.dart';
import 'package:bill_split/src/exceptions/platform_exceptions.dart';
import 'package:bill_split/src/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../navigation_menu.dart';
import '../../features/authentication/screens/onboarding/onboarding.dart';
import '../../exceptions/firebase_auth_exceptions.dart';
import '../../exceptions/firebase_exceptions.dart';
import '../../exceptions/format_exceptions.dart';
import '../../features/authentication/screens/login/login_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();

  }

  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => LoginPage())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  // -----------------------------------------Email & Password sign-in----------------------------------------------

  ///[EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[EmailVerification] - FORGOT PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  ///[ReAuthenticate] - RE AUTHENTICATE USER
  Future<void>  reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential= EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // --------------------------------Fedrated identity & social sign-in-------------------------------------


  ///[GoogleAuthentication] - GOOGLE SIGN
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  Future<void>  deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  // -------------------------------------LogOut all credentials--------------------------------------------

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      throw TcFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TcFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TcFormatException();
    } on PlatformException catch (e) {
      throw TcPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
