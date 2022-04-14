import 'package:flutter/material.dart';
import 'package:music_rental_flutter/pages/verification/components/verification_provider.dart';
import 'package:music_rental_flutter/widgets/my_button.dart';
import 'package:provider/provider.dart';

class VerificationPage extends StatefulWidget {
  final data;
  const VerificationPage(this.data, {Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController verificationCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    VerificationProvider verificationProvider =
        Provider.of<VerificationProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verification",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "The verification code has been sent to your email.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: verificationCode,
                decoration: const InputDecoration(
                  hintText: "Verification code",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              verificationProvider.loading == false
                  ? MyButton(
                      onPressed: () {
                        verificationProvider.verifyUser(
                          verificationCode: verificationCode,
                          data: widget.data,
                          context: context,
                        );
                      },
                      btnText: "Submit Code",
                      color: const [Color(0xff027f47), Color(0xff01a95c)],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
