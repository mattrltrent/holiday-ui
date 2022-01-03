import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CW_perks_tile.dart';

class VacationScreen extends StatefulWidget {
  @override
  _VacationScreenState createState() => _VacationScreenState();
}

class _VacationScreenState extends State<VacationScreen>
    with TickerProviderStateMixin {

  // Animation for rotating profile picture #1
  AnimationController avatar1Controller;
  Animation avatar1Anim;

  // Animation for rotating profile picture #2
  AnimationController avatar2Controller;
  Animation avatar2Anim;

  // Animation for pulling the whole column from the right to on top the image resting against the left
  AnimationController columnSlideController;
  Animation columnSliderAnim;

  // Animation for scaling the row of buttons at bottom of screen
  AnimationController buttonRowController;
  Animation buttonRowAnim;

  // Animation for scaling nav button (in top left)
  AnimationController navButtonController;
  Animation navButtonAnim;

  // Animation for scaling button #1 in the row (counting left -> right)
  AnimationController button1Controller;
  Animation button1Anim;

  // Animation for scaling button #2 in the row (counting left -> right)
  AnimationController button2Controller;
  Animation button2Anim;

  // Animation for scaling button #3 in the row (counting left -> right)
  AnimationController button3Controller;
  Animation button3Anim;

  // This method starts/staggers the rotation animation for profile pics #1 & #2 at a delay (after they've slid in from right)
  void startDelayedAvatarAnim(avatarID) async {
    if (avatarID == 1) {
      await Future.delayed(Duration(milliseconds: 500));
      avatar1Controller.forward();
    }
    else if (avatarID == 2){
      await Future.delayed(Duration(milliseconds: 1000));
      avatar2Controller.forward();
    }
  }

  // This method starts the scaling animation for the bottom row of buttons after stated delay
  void startDelayedButtonRowAnim() async {
    await Future.delayed(Duration(milliseconds: 500));
    buttonRowController.forward();
  }

  @override
  void initState() {
    super.initState();
    initialSetup(); // Sets up all the animations in this method
  }

  @override
  void dispose() {
    // This disposes all the animation controllers (make sure to put before [super.dispose()])
    columnSlideController.dispose();
    avatar1Controller.dispose();
    avatar2Controller.dispose();
    buttonRowController.dispose();
    button1Controller.dispose();
    button2Controller.dispose();
    button3Controller.dispose();
    super.dispose();
  }

  // This method (called on initState) initializes all the animations and calls various methods for some delayed animations
  void initialSetup() {
    columnSlideController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    columnSliderAnim = CurvedAnimation(
        parent: columnSlideController, curve: Curves.easeInOutQuint);
    columnSlideController.addListener(() {
      setState(() {});
    });
    columnSlideController.forward();
    avatar1Controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    avatar1Anim = CurvedAnimation(
        parent: avatar1Controller, curve: Curves.easeInOutQuint);
    avatar1Controller.addListener(() {
      setState(() {});
    });
    startDelayedAvatarAnim(1);
    avatar2Controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    avatar2Anim = CurvedAnimation(
        parent: avatar2Controller, curve: Curves.easeInOutQuint);
    avatar2Controller.addListener(() {
      setState(() {});
    });
    startDelayedAvatarAnim(2);
    buttonRowController = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    buttonRowAnim = CurvedAnimation(
        parent: buttonRowController, curve: Curves.easeInOutQuint);
    buttonRowController.addListener(() {
      setState(() {});
    });
    startDelayedButtonRowAnim();
    button1Controller = AnimationController(
      duration: Duration(milliseconds: 25),
      vsync: this,
    );
    button1Anim = IntTween(begin: 100, end: 110).animate(button1Controller);
    button1Controller.addListener(() {
      setState(() {});
    });
    button2Controller = AnimationController(
      duration: Duration(milliseconds: 25),
      vsync: this,
    );
    button2Anim = IntTween(begin: 100, end: 110).animate(button2Controller);
    button2Controller.addListener(() {
      setState(() {});
    });
    button3Controller = AnimationController(
      duration: Duration(milliseconds: 25),
      vsync: this,
    );
    button3Anim = IntTween(begin: 100, end: 110).animate(button3Controller);
    button3Controller.addListener(() {
      setState(() {});
    });
    navButtonController = AnimationController(
      duration: Duration(milliseconds: 25),
      vsync: this,
    );
    navButtonAnim = IntTween(begin: 100, end: 110).animate(navButtonController);
    navButtonController.addListener(() {
      setState(() {});
    });
  }

  // Notices when SCSV starts being dragged and executes animation to scale down bottom button row
  _onStartScroll(ScrollMetrics metrics) {
    buttonRowController.reverse();
  }

  // Notices when SCSV ends being dragged and executes animation to scale up bottom button row
  _onEndScroll(ScrollMetrics metrics) {
    buttonRowController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // The below floating action button slot containers my custom nav button
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(30),
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () { // Animates (scale) nav button then pops the current context
              navButtonController.forward();
              navButtonAnim.addStatusListener((status) {
                if (status == AnimationStatus.completed) {
                  navButtonController.reverse();
                }
              });
              Navigator.pop(context);
            },
            child: Transform.scale(
              scale: navButtonAnim.value / 100,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black.withOpacity(0.3), width: 1),
                  color: Colors.black38.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.55,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(2, 1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      child: Image.asset(
                        'images/vacation1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.55,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Transform.translate(
                          offset: Offset(MediaQuery.of(context).size.width - (columnSliderAnim.value * MediaQuery.of(context).size.width), 0), // This makes the column slide in from right -> left (translate animation, triggered on initState)
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '\$283 / night',
                                style: TextStyle(
                                    fontFamily: 'Ub',
                                    color: Colors.white,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Get into our new',
                                style: TextStyle(
                                    fontFamily: 'Ub',
                                    color: Colors.white,
                                    fontSize: 25),
                              ),
                              Text(
                                'Sea Haven in Hawaii',
                                style: TextStyle(
                                    fontFamily: 'Ub',
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row( // This row contains the 2 animated profile pictures and text
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        width: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                        ),
                                        child: Container(
                                          width: 30,
                                          child: Transform.rotate(
                                            angle: avatar1Anim.value * 6.28319,
                                            child:
                                                Image.asset('images/person3.png'),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 35),
                                        child: Container(
                                          width: 45,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: Container(
                                            width: 30,
                                            child: Transform.rotate(
                                              angle: avatar2Anim.value * 6.28319,
                                              child: Image.asset(
                                                  'images/person2.png'),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Melody, Karen + 13 more',
                                    style: TextStyle(
                                        fontFamily: 'Ub',
                                        color: Colors.white,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Row( // This row contains the icons/text that are a custom widget (from file: CW_perks_tile.dart)
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  PerksTile(
                    firstLine: 'Verified',
                    secondLine: 'Resort',
                    displayIcon: Icons.verified_user,
                  ),
                  PerksTile(
                    firstLine: 'Safe',
                    secondLine: 'Location',
                    displayIcon: Icons.lock_outline,
                  ),
                  PerksTile(
                    firstLine: 'Breakfast',
                    secondLine: 'Included',
                    displayIcon: Icons.fastfood,
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Container(
                  color: Colors.grey,
                  width: 15,
                  height: 2,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 0),
                  child: NotificationListener<ScrollNotification>( // this calls the methods (_onStartScroll & _onEndScroll) when the SCSV below starts/stops getting dragged
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollStartNotification) {
                        _onStartScroll(scrollNotification.metrics);
                      } else if (scrollNotification is ScrollEndNotification) {
                        _onEndScroll(scrollNotification.metrics);
                      }
                      return true; // just to get the underlines away
                    },
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15, top: 35),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In non nulla sed lorem condimentum aliquam. Curabitur tincidunt risus vel eleifend ultricies. Pellentesque eu lacinia diam. Suspendisse sollicitudin tellus ac tempor gravida. Cras sed erat non metus interdum imperdiet in vitae urna. Pellentesque molestie, erat et lacinia lobortis, nisi tortor dignissim nulla, nec vulputate neque massa vestibulum libero. Curabitur dictum quam id imperdiet gravida. Cras fermentum sed sem at maximus. Suspendisse sollicitudin congue mauris, vel volutpat urna ullamcorper non. Vestibulum eu mattis augue, at vestibulum metus. Nullam nec nunc quis erat tempus accumsan. Nullam bibendum egestas lectus quis varius. Suspendisse non malesuada nisi, et vulputate neque. Quisque rhoncus dui nisl, ac luctus quam sodales maximus. Sed nec laoreet nisi, sed tempor est. Fusce pellentesque porta lorem, vitae accumsan ligula pulvinar eu. Aenean posuere ex sed est convallis, sed maximus metus mollis. Aliquam dapibus ante nec lectus gravida auctor. Quisque id sollicitudin turpis. Mauris mollis ac ligula volutpat volutpat. Proin felis erat, congue eu cursus non, condimentum a nibh. Maecenas efficitur elit ac urna luctus vestibulum. Morbi sed mauris ac felis tristique malesuada ut ac odio. Nam ipsum dui, interdum pharetra est in, dapibus molestie lectus. Proin eu nisl tincidunt, efficitur neque non, tincidunt ligula. Phasellus lectus leo, aliquam sit amet pellentesque varius, euismod finibus nulla. Nam congue tincidunt diam, a gravida odio vehicula ac. Curabitur ultrices dolor vitae turpis euismod ultrices.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Ub',
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Below column contains the bottom row of buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Transform.scale(
                  scale: buttonRowAnim.value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () { // Animates (scale) button #1 (counting left -> right)
                          button1Controller.forward();
                          button1Anim.addStatusListener((status) {
                            if (status == AnimationStatus.completed) {
                              button1Controller.reverse();
                            }
                          });
                        },
                        child: Transform.scale(
                          scale: button1Anim.value / 100,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.pink.withOpacity(0.3),
                                  width: 1),
                              color: Colors.redAccent.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () { // Animates (scale) button #2 (counting left -> right)
                          button2Controller.forward();
                          button2Anim.addStatusListener((status) {
                            if (status == AnimationStatus.completed) {
                              button2Controller.reverse();
                            }
                          });
                        },
                        child: Transform.scale(
                          scale: button2Anim.value / 100,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue.withOpacity(0.5),
                                  width: 1),
                              color: Colors.white.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.map,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () { // Animates (scale) button #3 (counting left -> right)
                          button3Controller.forward();
                          button3Anim.addStatusListener((status) {
                            if (status == AnimationStatus.completed) {
                              button3Controller.reverse();
                            }
                          });
                        },
                        child: Transform.scale(
                          scale: button3Anim.value / 100,
                          child: Container(
                            width: 140,
                            height: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.lightGreen.withOpacity(0.5),
                                    width: 1),
                                color: Colors.greenAccent.withOpacity(0.6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Center(
                                child: Text(
                              'BOOK NOW',
                              style: TextStyle(
                                  fontFamily: 'Ub',
                                  fontSize: 15,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w800),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
