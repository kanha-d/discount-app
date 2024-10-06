import 'package:discountnearme/API/AppConstants.dart';
import 'package:discountnearme/ui/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:discountnearme/constants.dart';
import 'package:discountnearme/ui/screens/widgets/profile_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            height: size.height,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage(
                        'assets/images/profile.jpg'),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.primaryColor.withOpacity(.5),
                      width: 5.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * .3,
                  child: Row(
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: Constants.blackColor,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                          height: 24,
                          child: Image.asset("assets/images/verified.png")),
                    ],
                  ),
                ),
                Text(
                  'johndoe@gmail.com',
                  style: TextStyle(
                    color: Constants.blackColor.withOpacity(.3),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: size.height * .7,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ProfileWidget(
                        icon: Icons.person,
                        title: 'My Profile',
                      ),
                      const ProfileWidget(
                        icon: Icons.settings,
                        title: 'Settings',
                      ),
                      const ProfileWidget(
                        icon: Icons.notifications,
                        title: 'Notifications',
                      ),
                      const ProfileWidget(
                        icon: Icons.chat,
                        title: 'FAQs',
                      ),
                      const ProfileWidget(
                        icon: Icons.share,
                        title: 'Share',
                      ),
                      InkWell(
                        onTap: () async {
                          logoutUser(context);
                        },
                        child: const ProfileWidget(
                          icon: Icons.logout,
                          title: 'Log Out',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void logoutUser(context) async{
    AppConstants.prefs = await SharedPreferences.getInstance();

    await AppConstants.prefs?.remove("session");
    await AppConstants.prefs?.remove("user");
    await AppConstants.prefs?.clear();

    Navigator.pushReplacement(
        context,
        PageTransition(
            child: const SignIn(),
            type: PageTransitionType.bottomToTop));
  }




}


