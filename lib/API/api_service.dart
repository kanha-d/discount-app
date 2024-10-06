import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';
import 'AppConstants.dart';

class APIService {

      static var client = http.Client();

      // static Future<dynamic> getUsers() async {
      //     Map<String, String> requestHeaders = {
      //       'Content-Type':'application/json'
      //     };
      //
      //     var url = Uri.https(AppConstants.URL,'/api/user');
      //
      //     var response = await client.get(url,headers: requestHeaders);
      //
      //     if(response.statusCode==200){
      //     }else{
      //       return null;
      //     }
      // }

      static Future<String> loginUser(email,password) async {

            var url = Uri.https(AppConstants.URL,'api/user');
            String res = "";
            var data={
              "user":email,
              "password":password,
              "userLogin":"true"
            };

            var response = await http.post(
                url,
                body:data
            );

            var jRes = json.decode(response.body);

            if(response.statusCode == 201){
              res = "1";
              AppConstants.prefs = await SharedPreferences.getInstance();
              jRes = jRes['user'];
              User user = User(jRes['id'].toString(),jRes['name'].toString(),jRes['email'].toString(),jRes['mobile'].toString(),jRes['profile'].toString());
              String userdata = jsonEncode(user);
              AppConstants.prefs?.setString("user",userdata);
              AppConstants.prefs?.setBool("session",true);

            }else if(response.statusCode == 401){
              res = "4";
            }else{
              res = "0";
            }
            return res;
      }

      static Future<String> signupUser(mobile) async {

        var url = Uri.https(AppConstants.URL,'api/user');
        String res = "";
        var data={
          "mobile":mobile,
          "userSignup":"true"
        };

        var response = await http.post(
            url,
            body:data
        );

        var jRes = json.decode(response.body);

        if(response.statusCode == 201){
          res = "1";
          AppConstants.prefs = await SharedPreferences.getInstance();
          jRes = jRes['user'];
          User user = User(jRes['id'].toString(),jRes['name'].toString(),jRes['email'].toString(),jRes['mobile'].toString(),jRes['profile'].toString());
          String userdata = jsonEncode(user);
          AppConstants.prefs?.setString("user",userdata);
          AppConstants.prefs?.setBool("session",true);

        }else if(response.statusCode == 403){
          res = "3";
        }else{
          res = "0";
        }
        return res;
      }

      static Future<String> verifyOTP(otp) async {

        var url = Uri.https(AppConstants.URL,'api/user');
        String res = "";
        var data={
          "user_id":otp,
          "userOtpVerify":"true"
        };

        var response = await http.post(
            url,
            body:data
        );

        var jRes = json.decode(response.body);

        if(response.statusCode == 201){
          res = "1";
          AppConstants.prefs = await SharedPreferences.getInstance();
          jRes = jRes['user'];
          User user = User(jRes['id'].toString(),jRes['name'].toString(),jRes['email'].toString(),jRes['mobile'].toString(),jRes['profile'].toString());
          String userdata = jsonEncode(user);
          AppConstants.prefs?.setString("user",userdata);
          AppConstants.prefs?.setBool("session",true);

        }else if(response.statusCode == 403){
          res = "3";
        }else{
          res = "0";
        }
        return res;
      }


      //
      // static Future<int> deleteAccount(email) async {
      //
      //   var url = Uri.https(AppConstants.URL,'user');
      //   var data={
      //     "email":email,
      //     "delete_account":"true"
      //   };
      //   var response = await http.post(url, body:data);
      //
      //   return response.statusCode;
      // }
      //
      // static Future<int> changePassword(password,current,user) async {
      //
      //   var url = Uri.https(AppConstants.URL,'student');
      //
      //   var data={
      //     "newPass":password,
      //     "currentPass":current,
      //     "changePassword":user
      //   };
      //
      //   var response = await http.post(
      //       url,
      //       body:data
      //   );
      //
      //   return response.statusCode;
      // }
      //
      // static Future<String> oneTapLogin(name,email,imgUrl,type) async {
      //
      //   var url = Uri.https(AppConstants.URL,'user');
      //   String res = "";
      //
      //   var data={
      //     "email":email.toString(),
      //     "name":name.toString(),
      //     "img_url":imgUrl,
      //     "onetap_login":type
      //   };
      //
      //   var response = await http.post(
      //       url,
      //       body:data
      //   );
      //
      //   var jRes = json.decode(response.body);
      //
      //   if(response.statusCode == 201){
      //     res = "1";
      //     AppConstants.prefs = await SharedPreferences.getInstance();
      //     jRes = jRes['user'];
      //     User user = User(jRes['id'].toString(),jRes['name'].toString(),jRes['email'].toString(),jRes['mobile'].toString(),jRes['profile'].toString());
      //     String userdata = jsonEncode(user);
      //
      //     AppConstants.prefs?.setString("user",userdata);
      //     AppConstants.prefs?.setBool("session",true);
      //
      //   }
      //
      //   return res;
      // }
      //
      // static Future<String> registerUser(email) async {
      //
      //   String res = "";
      //
      //   var url = Uri.https(AppConstants.URL,'user');
      //   var data={
      //     "email":email,
      //     "email_register":"true"
      //   };
      //
      //   var response = await http.post(url, body:data);
      //   var j_res = json.decode(response.body);
      //
      //   if(response.statusCode == 201){
      //     res = "1,"+j_res['otp'].toString();
      //   }else if(response.statusCode==503){
      //     res = "2";
      //   }else {
      //     res = "0";
      //   }
      //   return res;
      // }
      //
      // static Future<int> verficationUser(email,otp) async {
      //
      //   var url = Uri.https(AppConstants.URL,'user');
      //   var data={
      //     "email":email,
      //     "otp":otp,
      //     "email_verify":"true"
      //   };
      //
      //   var response = await http.post(url, body:data);
      //   var j_res = json.decode(response.body);
      //
      //   AppConstants.prefs = await SharedPreferences.getInstance();
      //   if(response.statusCode == 201){
      //
      //     j_res = j_res['user'];
      //
      //     User user = User(j_res['id'].toString(),j_res['name'].toString(),j_res['email'].toString(),j_res['mobile'].toString(),j_res['profile'].toString());
      //
      //     String userdata = jsonEncode(user);
      //
      //     AppConstants.prefs?.setString("user",userdata);
      //     AppConstants.prefs?.setBool("session",true);
      //     return 1;
      //   }else {
      //     return 0;
      //   }
      // }
      //
      // static Future<List<Course>> getRecommendedCourse(String user,int offset,int limit,int type) async{
      //
      //   var url = Uri.https(AppConstants.URL,'home',{'course_rec':user,'offset':offset.toString(),'limit':limit.toString(),'course_type':type.toString()});
      //
      //   final response = await http.get(url);
      //
      //   Map data = jsonDecode(response.body);
      //
      //   List _temp = [];
      //
      //   for(var i in data['courses']){
      //     _temp.add(i);
      //   }
      //   return Course.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Course>> getSearchCourses(String user_id,String search,int offset,int type) async{
      //
      //   var url = Uri.https(AppConstants.URL,'home',{'course_search':user_id,'keyword':search,'offset':offset.toString(),'course_type':type.toString()});
      //
      //   final response = await http.get(url);
      //
      //   Map data = jsonDecode(response.body);
      //
      //   List _temp = [];
      //
      //   for(var i in data['courses']){
      //     _temp.add(i);
      //   }
      //   return Course.courseFromSnapshot(_temp);
      // }
      //
      // static Future<List<Trans>> getUserTransactions(String user_id) async{
      //
      //   var url = Uri.https(AppConstants.URL,'student',{'my_transactions':'true','user':user_id});
      //
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode==201) {
      //     for (var i in data['transactions']) {
      //       _temp.add(i);
      //     }
      //   }
      //   return Trans.transFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Course>> getCategoryCourses(String user_id,String cat,int offset,int type) async{
      //
      //   var url = Uri.https(AppConstants.URL,'home',{'course_cat':user_id,'category':cat,'offset':offset.toString(),'course_type':type.toString()});
      //
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   for(var i in data['courses']){
      //     _temp.add(i);
      //   }
      //   return Course.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Course>> getTrainerCourses(String user_id,String trainer,int offset,int type) async{
      //
      //   var url = Uri.https(AppConstants.URL,'home',{'course_mentors':user_id,'trainer':trainer,'offset':offset.toString(),'course_type':type.toString()});
      //
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   for(var i in data['courses']){
      //     _temp.add(i);
      //   }
      //   return Course.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Course>> getMostPopularCoursees(String user,int offset,int limit,int type) async{
      //
      // var url = Uri.https(AppConstants.URL,'home',{'course_pop':user,'offset':offset.toString(),'limit':limit.toString(),'course_type':type.toString()});
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //   for(var i in data['courses']){
      //     _temp.add(i);
      //   }
      //   return Course.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Enrolled>> getEnrolledCourses(String user_id,String type) async{
      //
      //   var url = Uri.https(AppConstants.URL,'student',{'my_enrolled':'true','enrol_type':type,'student_id':user_id});
      //   final response = await http.get(url);
      //
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode == 201) {
      //         for (var i in data['enrolled']) {
      //           _temp.add(i);
      //         }
      //   }
      //   return Enrolled.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<QuestionModal>> getQuesitons(String user_id,String qid) async{
      //
      //   var url = Uri.https(AppConstants.URL,'course',{'quiz_id':qid,'quiz_details':user_id});
      //   final response = await http.get(url);
      //
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode == 201) {
      //     for (var i in data['quiz']) {
      //       _temp.add(i);
      //     }
      //   }
      //   return QuestionModal.courseFromSnapshot(_temp);
      //
      // }
      //
      // static Future<List<Enrolled>> getProgramModules(String user_id,String program) async{
      //
      //   var url = Uri.https(AppConstants.URL,'program',{'program_modules':'true','program_id':program,'student_id':user_id});
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode == 201) {
      //     for (var i in data['enrolled']) {
      //       _temp.add(i);
      //     }
      //   }
      //   return Enrolled.courseFromSnapshot(_temp);
      // }
      //
      // static Future<List<Enrolled>> getCrashCourseModules(String user_id,String crash_id) async{
      //
      //   var url = Uri.https(AppConstants.URL,'program',{'crash_modules':'true','crash_id':crash_id,'student_id':user_id});
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode == 201) {
      //     for (var i in data['enrolled']) {
      //       _temp.add(i);
      //     }
      //   }
      //   return Enrolled.courseFromSnapshot(_temp);
      //
      // }
      //
      //
      // static Future<List<Workshop>> getWorkshops() async{
      //
      //   var url = Uri.https(AppConstants.URL,'course',{'workshops':'true',});
      //   final response = await http.get(url);
      //
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //
      //   if(response.statusCode == 201) {
      //     for (var i in data['workshops']) {
      //       _temp.add(i);
      //     }
      //   }
      //   return Workshop.workshopFromSnapshot(_temp);
      // }
      //
      // static Future<List<Section>> getSections(String userId,String cid,productId,productType) async{
      //
      //   var url = Uri.https(AppConstants.URL,'course',{'course_lessons':'true','user_id':userId,'course_id':cid,'product_id':productId,'product_type':productType});
      //   final response = await http.get(url);
      //   Map data = jsonDecode(response.body);
      //   List _temp = [];
      //   for(var i in data['section']){
      //     _temp.add(i);
      //   }
      //
      //   return Section.courseFromSnapshot(_temp);
      //
      // }


}