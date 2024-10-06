import 'dart:async';

import 'package:discountnearme/ui/root_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';

import '../../API/api_service.dart';
import '../../constants.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  bool invalidOtp = false;
  int resendTime = 60;
  late Timer countdownTimer;
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendTime = resendTime - 1;
      });
      if (resendTime < 1) {
        countdownTimer.cancel();
      }
    });
  }

  stopTimer() {
    if (countdownTimer.isActive) {
      countdownTimer.cancel();
    }
  }

  String strFormatting(n) => n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Verification Code',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Enter the 4 digit verification code received',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myInputBox(context, txt1),
                    myInputBox(context, txt2),
                    myInputBox(context, txt3),
                    myInputBox(context, txt4),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Haven't received OTP yet?",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    resendTime == 0
                        ? InkWell(
                      onTap: () {
                        // Resend OTP Code
                        invalidOtp = false;
                        resendTime = 60;
                        startTimer();
                        //
                      },
                      child: const Text(
                        'Resend',
                        style: TextStyle(color: Colors.red, fontSize: 17),
                      ),
                    )
                        : const SizedBox()
                  ],
                ),
                const SizedBox(height: 10),
                resendTime != 0
                    ? Text(
                  'You can resend OTP after ${strFormatting(resendTime)} second(s)',
                  style: const TextStyle(fontSize: 18),
                )
                    : const SizedBox(),
                const SizedBox(height: 5),
                Text(
                  invalidOtp ? 'Invalid otp!' : '',
                  style: const TextStyle(fontSize: 20, color: Colors.red),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    final otp = txt1.text + txt2.text + txt3.text + txt4.text;
                    VerifyOtp(otp);
                  },
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: const Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


void VerifyOtp(otp) async {

    if (otp == null) {
      Fluttertoast.showToast(
          msg: "Enter Mobile Number!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.shade300,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return;
    }

    String response = await APIService.verifyOTP("5");
    var status = response.split(',');

    if(status[0]=="1") {
      Fluttertoast.showToast(
          msg: "Welcome to Discount!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );

      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const RootPage(),
              type: PageTransitionType.bottomToTop));

    } else if(status[0]=="3") {
      Fluttertoast.showToast(
          msg: "Invalid OTP!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

}





Widget myInputBox(BuildContext context, TextEditingController controller) {
  return Container(
    height: 70,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(width: .5),
      borderRadius: const BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    child: TextField(
      controller: controller,
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontSize: 35),
      decoration: const InputDecoration(
        counterText: '',
        border: InputBorder.none, // This removes the bottom border line
      ),
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
      },
    ),
  );
}