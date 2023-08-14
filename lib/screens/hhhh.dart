
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopwebsitewithflutter/Widgets/text_reveal.dart';

class FirstffffffffffffffffSection extends StatefulWidget {
  const FirstffffffffffffffffSection({super.key});

  @override
  State<FirstffffffffffffffffSection> createState() => _FirstffffffffffffffffSectionState();
}

class _FirstffffffffffffffffSectionState extends State<FirstffffffffffffffffSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> descriptionAnimation;
  late Animation<double> smallImageReveal;
  late Animation<double> sideImageReveal;

  late Animation<double> smallImageOpacity;
  late Animation<double> navBarOpacity;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1700),
        reverseDuration: Duration(milliseconds: 375));

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.3, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.3, curve: Curves.easeOut)));



    descriptionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.5, curve: Curves.easeOut)));



    smallImageReveal = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.5,0.7, curve: Curves.easeOut)));
    sideImageReveal = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.40, curve: Curves.easeOut)));

    smallImageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.6,0.8, curve: Curves.easeOut)));

    navBarOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.6,0.8, curve: Curves.easeOut)));



    super.initState();

    Future.delayed(Duration(milliseconds: 1000),(){
      controller.forward();


    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 100),
      child: Expanded(
          child: Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextReveal(
                      maxHeight: 90.0,
                      textRevealAnimation: textRevealAnimation,
                      textOpacityAnimation: textOpacityAnimation,
                      controller: controller,
                      child: Text(
                        'Healthy & Tasty',
                        style: GoogleFonts.quicksand(
                            fontSize: 40, fontWeight: FontWeight.w700),
                      ),

                    ),



                  ],
                ),
              ))),
    );
  }
}

