import 'package:badges/badges.dart';
import 'package:banking_app/data/json.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:banking_app/widgets/action_box.dart';
import 'package:banking_app/widgets/avatar_image.dart';
import 'package:banking_app/widgets/balance_card.dart';
import 'package:banking_app/widgets/transaction_item.dart';
import 'package:banking_app/widgets/user_box.dart';
import 'package:flutter/material.dart';

final myController = TextEditingController();
final myController2 = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

int balance = 100;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: getAppBar(),
      body: getBody(),
    );
  }

  getAppBar() {
    return Container(
      height: 200,
      width: 500,
      padding: EdgeInsets.only(left: 20, right: 20, top: 35),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          boxShadow: [
            BoxShadow(
                color: shadowColor.withOpacity(0.1),
                blurRadius: .5,
                spreadRadius: .5,
                offset: Offset(0, 1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarImage(profile, isSVG: false, width: 35, height: 35),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.centerLeft,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Light ! ",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome to Decentralised Bank!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                ),
              ],
            ),
          )),
          SizedBox(
            width: 15,
          ),
         
        ],
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getAppBar(),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 120,
                            width: 300,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: shadowColor.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  colorFilter: new ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.dstATop),
                                  image: AssetImage('assets/images/bgcard.png'),
                                )),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Your Balance",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  balance.toString(),
                                  style: TextStyle(
                                      color: secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              top: 100,
                              left: 0,
                              right: 0,
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: secondary,
                                      shape: BoxShape.circle,
                                      border: Border.all()),
                                  child: Icon(Icons.ac_unit)))
                        ],
                      ),
                      Positioned(
                          top: 100,
                          left: 0,
                          right: 0,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: secondary,
                                  shape: BoxShape.circle,
                                  border: Border.all()),
                              child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            scrollable: true,
                                            title: Text('Balance'),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Form(
                                                child: Column(
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller: myController,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter Amount',
                                                        icon: Icon(
                                                            Icons.account_box),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              RaisedButton(
                                                  child: Text("Submit"),
                                                  onPressed: () {
                                                    // your code
                                                    setState(() {
                                                      balance += int.parse(
                                                          myController.text);
                                                    });
                                                    print(
                                                        'Second text field: ${myController.text}');
                                                  })
                                            ],
                                          );
                                        });
                                  },
                                  child: Icon(Icons.add))))
                    ],
                  )),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Tranfer Money'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter id',
                                      icon: Icon(Icons.add_a_photo),
                                    ),
                                  ),

                                    TextFormField(
                                                      controller: myController2,

                                    decoration: InputDecoration(
                                      labelText: 'Enter Amount',
                                      icon: Icon(Icons.account_box),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            RaisedButton(
                                child: Text("Submit"),
                                onPressed: () {
                                  setState(() {
                                                      balance -= int.parse(
                                                          myController2.text);
                                                    });
                                                    print(
                                                        'Second text field: ${myController2.text}');
                                })
                          ],
                        );
                      });
                },
              
                  child: ActionBox(
                    title: "Send",
                    icon: Icons.send_rounded,
                    bgColor: green,
                  ),
              
              )),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child:GestureDetector(
                   onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            scrollable: true,
                                            title: Text('Loan'),
                                            content: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Form(
                                                child: Column(
                                                  children: <Widget>[
                                                      TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter Description',
                                                        icon: Icon(
                                                            Icons.add_business_rounded),
                                                      ),
                                                    ),
                                                    TextFormField(
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Enter Amount',
                                                        icon: Icon(
                                                            Icons.account_box),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            actions: [
                                              RaisedButton(
                                                  child: Text("Submit"),
                                                  onPressed: () {
                                                    // your code
                                                    setState(() {
                                                      balance += int.parse(
                                                          myController.text);
                                                    });
                                                    print(
                                                        'Second text field: ${myController.text}');
                                                  })
                                            ],
                                          );
                                        });
                                  },
                    child: ActionBox(
                        title: "Loan",
                        icon: Icons.arrow_circle_down_rounded,
                        bgColor: yellow),
                  )),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),

          SizedBox(
            height: 35,
          ),
          //   getActions(),
          SizedBox(
            height: 25,
          ),
          Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Send Again",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              )),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: getRecentUsers(),
          ),
          SizedBox(
            height: 25,
          ),
         
         
        ],
      ),
    );
  }

  getActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: ActionBox(
          title: "Send",
          icon: Icons.send_rounded,
          bgColor: green,
        )),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: ActionBox(
                title: "Request",
                icon: Icons.arrow_circle_down_rounded,
                bgColor: yellow)),
        SizedBox(
          width: 15,
        ),
        Expanded(
            child: ActionBox(
                title: "More", icon: Icons.widgets_rounded, bgColor: purple)),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }

  getRecentUsers() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
              recentUsers.length,
              (index) => index == 0
                  ? Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: getSearchBox(),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: UserBox(user: recentUsers[index]))
                      ],
                    )
                  : Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: UserBox(user: recentUsers[index])))),
    );
  }

  getSearchBox() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.grey.shade300, shape: BoxShape.circle),
          child: Icon(Icons.search_rounded),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  getTransanctions() {
    return Column(
        children: List.generate(
            transactions.length,
            (index) => Container(
                margin: const EdgeInsets.only(right: 15),
                child: TransactionItem(transactions[index]))));
  }
}
