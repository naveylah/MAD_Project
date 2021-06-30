import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mad_mad/Models/sidebar.dart';
import 'package:mad_mad/screens/homePage.dart';
import 'package:mad_mad/screens/transactionPage.dart';
import '../colour.dart';

// ignore: camel_case_types
class subjectPage extends StatefulWidget {
  @override
  _subjectPageState createState() => _subjectPageState();
}

// ignore: camel_case_types
class _subjectPageState extends State<subjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe7f4f5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black26,
          ),
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme().apply(bodyColor: Colors.white),
            ),
            child: PopupMenuButton<int>(
              color: Colors.white38.withOpacity(0.4),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text('Profile'),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text('Message'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text('Sign Out'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.pngio.com/e-learning-100-free-icons-svg-eps-psd-png-files-learn-png-600_564.png'),
                              fit: BoxFit.contain)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "English Literature",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "More than 30'000 PT3 Past Year Questions Exercise with Latest KSSR Syllabus. Get in touch with the tutors to learn and discuss your questions and answers",
                      style: TextStyle(
                        fontFamily: 'circe',
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tutors available",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            tutorWidget(
                                "https://image.flaticon.com/icons/png/512/194/194938.png",
                                "Amina",
                                "24",
                                lightBlue,
                                darkBlue),
                            tutorWidget(
                                "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png",
                                "San Polo",
                                "37",
                                yellow,
                                Color(0xff4d4d4d)),
                            tutorWidget(
                                "https://image.flaticon.com/icons/png/512/147/147144.png",
                                "Andrew",
                                "21",
                                pink,
                                Color(0xff4a155f))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Modules",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                          fontFamily: 'product'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            courseWidget(
                                "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/1e81ef4a-0b2a-493c-94b5-0209141c3c2f/d4y9lvp-2b82297b-5713-4964-add2-2e3fe839ce27.png",
                                "Grammar & Vocab",
                                "Q&A to test your skills!",
                                Colors.purple[200],
                                Colors.white),
                            courseWidget(
                                "https://img.pngio.com/time-clock-icon-transparent-png-svg-vector-time-clock-png-512_512.png",
                                "Essay & Writing",
                                "summaries of novels",
                                Colors.orange[200],
                                Color(0xff4a155f))
                          ],
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     IconButton(
                    //       onPressed: () {
                    //         Navigator.push(
                    //           context,
                    //           MaterialPageRoute(
                    //               builder: (context) => subjectPage()),
                    //         );
                    //       },
                    //       icon: Icon(
                    //         Icons.arrow_forward_ios,
                    //         color: Colors.white,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(darkBlue)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => trxConfirm()),
                            );
                          },
                          child: Text(
                            'Start trial with 10 ether',
                            style: GoogleFonts.lato(),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container tutorWidget(
      String img, String name, String age, Color color, Color textColor) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "$age years old.",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                )
              ],
            ),
          ),
          Container(
            height: 90,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('$img'), fit: BoxFit.contain)),
          )
        ],
      ),
    );
  }

  Container courseWidget(
      String img, String name, String desc, Color color, Color textColor) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  desc,
                  style: TextStyle(color: Colors.white60, fontSize: 11),
                )
              ],
            ),
          ),
          Container(
            height: 90,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('$img'), fit: BoxFit.contain)),
          )
        ],
      ),
    );
  }
}
