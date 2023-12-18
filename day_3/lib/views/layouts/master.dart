import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_3/Core/color_app.dart';
import 'package:day_3/model_view/user_model_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MasterWidget extends StatelessWidget {
  Widget screenContent;
  String screenTitle;
  bool screenFotter;
  MasterWidget(
      {super.key,
      required this.screenContent,
      required this.screenTitle,
      required this.screenFotter});

  @override
  Widget build(BuildContext context) {
    if (screenFotter) {
      return Consumer<UserModelView>(
          builder: (context, userModelViewObj, child) {
        return Scaffold(
          drawer: Drawer(
            child: Container(
              padding: EdgeInsets.all(15),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            "images/avatar.avif",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: ListTile(
                            title: Text("menna elattar"),
                            subtitle: Text("mennaelattar3@gmail.com"),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.home,
                          color: ColorApp.mainColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: ColorApp.mainColor),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed("home");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: ColorApp.mainColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(color: ColorApp.mainColor),
                        )
                      ],
                    ),
                    onTap: () async {
                      SharedPreferences shPref =
                          await SharedPreferences.getInstance();
                      shPref.remove("login");
                      Navigator.of(context).pushNamed("profile");
                    },
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: ColorApp.secondColor,
          appBar: AppBar(
            backgroundColor: ColorApp.mainColor,
            title: Text(screenTitle),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: InkWell(
                  child: Column(
                    children: [
                      Text("Hello"),
                      Text(
                        "${userModelViewObj.getUsername()}",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("profile");
                  },
                ),
              )
            ],
          ),
          body: screenContent,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 20),
            color: ColorApp.mainColor,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    Text(
                      "All",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Text(
                      "Completed",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    Text(
                      "Not-Completed",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
              ],
            ),
            width: double.infinity,
            height: 100,
          ),
        );
      });
    } else {
      return Scaffold(
        backgroundColor: ColorApp.secondColor,
        appBar: AppBar(
          backgroundColor: ColorApp.mainColor,
          title: Text(screenTitle),
        ),
        body: screenContent,
      );
    }
  }
}
