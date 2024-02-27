import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../../ui/constants.dart';
import '../utils/utils.dart';
import '../utils/validators/validators.dart';
import 'form_fields/custom_form_field.dart';

class PassResetMailDialog extends StatelessWidget {
  final void Function() onPressed;
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  PassResetMailDialog({
    required this.onPressed,
    required this.formKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
      title: Text(
        "Forgot Password",
        style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: screenHeight * 0.030685206,
            ),
      ),
      content: Container(
        width: screenWidth * 0.80,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.028246941),
              CustomTextFormField(
                fieldController: emailController,
                hintText: "Enter registered email",
                prefixImage: "assets/icons/auth_icons/mail.svg",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                validator: (value)=>TcValidator.validateEmail(value!),
                maxLines: 1, currentNode: FocusNode(),
              ),
              SizedBox(height: screenHeight * 0.025246941),
              Text(
                "A link will be sent to your registered email Id. Click on the link to reset your password",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: screenHeight * 0.025),
              // ElevatedButton(
              //   padding: EdgeInsets.zero,
              //   onPressed: () async {
              //     await CustomerSupport.mailToSupport(
              //       subject: "Trouble Signing In",
              //       body: "Please%20explain%20your%20issue%briefly",
              //     );
              //     await FirebaseAnalytics.instance
              //         .logEvent(name: 'trouble_signing_in');
              //   },
              //   child: Text(
              //     "Trouble signing in? Contact Us",
              //     style: Theme.of(context)
              //         .textTheme
              //         .caption
              //         ?.copyWith(fontWeight: FontWeight.w600),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () async {
                  // await CustomerSupport.mailToSupport(
                  //   subject: "Trouble Signing In",
                  //   body: "Please%20explain%20your%20issue%20briefly",
                  // );
                  await FirebaseAnalytics.instance
                      .logEvent(name: 'trouble_signing_in');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  textStyle: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                child: Text("Trouble signing in? Contact Us"),
              ),

            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("CANCEL"),
        ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text("CONFIRM"),
          ),
        ],
    );
  }
}
