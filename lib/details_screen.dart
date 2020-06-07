import 'package:course_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F4EF),
          image: DecorationImage(
            image: AssetImage("assets/images/content.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.topLeft,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/arrow-left.svg"),
                      SvgPicture.asset("assets/icons/more-vertical.svg"),
                    ],
                  ),
                  SizedBox(height: 60),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: kBestSellerColor,
                      padding: EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "BestSeller".toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
            //SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(50),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50.0),
                    topRight: const Radius.circular(50.0),
                  ),
                  boxShadow: [
                    new BoxShadow(
                        color: Colors.black26,
                        offset: new Offset(20.0, 7.0),
                        blurRadius: 10.0,
                        spreadRadius: 40.0)
                  ],
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //SizedBox(height: 16),
                          //SizedBox(height: 16),

                          Row(
                            children: <Widget>[
                              SvgPicture.asset("assets/icons/person.svg"),
                              SizedBox(width: 5),
                              Text("18K"),
                              SizedBox(width: 20),
                              SvgPicture.asset("assets/icons/star.svg"),
                              SizedBox(width: 5),
                              Text("4.8")
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Start with why", style: kHeadingextStyle),
                                //SizedBox(height: 100),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.pink,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                              ]),
                          SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Text(
                                "Simon Sinek",
                                style: kSubtitleTextSyule.copyWith(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "2015",
                                style: kSubtitleTextSyule.copyWith(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),

                          //description goes here :
                          SizedBox(height: 20),
                          Text(
                                "START WITH WHY shows that the leaders who've had the greatest influence in the world all think, act, and communicate the same way -- and it's the opposite of what everyone else does. Sinek calls this powerful idea The Golden Circle, and it provides a framework upon which organizations can be built, movements can be led, and people can be inspired. And it all starts with WHY.",
                                style: kSubtitleTextSyule.copyWith(
                                  fontWeight: FontWeight.w300,
                                  height: 1,
                                ),
                              ),

                          // Comments goes here : 
                          SizedBox(height: 20),
                           Row(
                            children: <Widget>[
                              Text(
                                "Comments",
                                style: kSubtitleTextSyule.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                )),
                                Image.asset("assets/icons/line.png",height: 30,),
                                Comment(
                                  name :"zack",
                                  text : "goodbook")
                            ],
                          ),
                          // Similar books goes here : 


                          
                          /*
                          SizedBox(height: 30),
                          CourseContent(
                            number: "01",
                            duration: 5.35,
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '02',
                            duration: 19.04,
                            title: "Design Thinking - Intro",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '03',
                            duration: 15.35,
                            title: "Design Thinking Process",
                          ),
                          CourseContent(
                            number: '04',
                            duration: 5.35,
                            title: "Customer Perspective",
                          ), */
                        ],
                      ),
                    ),
                    /*
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 50,
                              color: kTextColor.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(14),
                              height: 56,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFEDEE),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: SvgPicture.asset(
                                  "assets/icons/shopping-bag.svg"),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: kBlueColor,
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ), */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Comment extends StatelessWidget {
  final String name;
  final String text;
  const Comment({
    Key key,
    this.name,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}
class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    Key key,
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: kHeadingextStyle.copyWith(
              color: kTextColor.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          SizedBox(width: 20),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: kTextColor.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: kSubtitleTextSyule.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(left: 20),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor.withOpacity(isDone ? 1 : .5),
            ),
            child: Icon(Icons.play_arrow, color: Colors.white),
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
