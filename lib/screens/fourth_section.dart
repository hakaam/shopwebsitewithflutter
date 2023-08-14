import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopwebsitewithflutter/Widgets/text_reveal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/scroll_ofset.dart';
class FourthSection extends StatefulWidget {
  const FourthSection({super.key});

  @override
  State<FourthSection> createState() => _FourthSectionState();
}

class _FourthSectionState extends State<FourthSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;

  late Animation<double> textttRevealAnimation;
  late Animation<double> textOpacityAnimation;
  late Animation<double> subTextOpacityAnimation;
  late Animation<double> subImageRevealAnimation;




  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
        reverseDuration: Duration(milliseconds: 375));


    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeOut)));

    subTextOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.50, 0.80, curve: Curves.easeOut)));

    subImageRevealAnimation = Tween<double>(begin: 0.0, end: 90.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.70, 1.0, curve: Curves.easeOut)));

    imageRevealAnimation = Tween<double>(begin: 500.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.40, curve: Curves.easeOut)));
    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.30, 0.40, curve: Curves.easeOut)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
          if (current.scrollOfsetValue >= 2800) {
            return true;
          } else
            return false;
        }, builder: (context, state) {
          if(state.scrollOfsetValue >2900){

            controller.forward();

          } else{
            controller.reverse();

          }
        return SizedBox(
          height: 500,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Flexible(
                child: Stack(
                  children: [

                    Container(
                      width: 400,
                      padding: EdgeInsets.all(1.0),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1548940740-204726a19be3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=389&q=80',
                        fit: BoxFit.cover,
                      ),
                    ),
                    AnimatedBuilder(
                        animation: imageRevealAnimation,
                        builder: (context, child) {
                          return Container(
                            height: imageRevealAnimation.value,
                            width: double.infinity,
                            color: Colors.white,
                            alignment: Alignment(0.0, -1.0),
                          );
                        }),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              AnimatedBuilder(
                animation: textRevealAnimation,
                builder: (context,child) {
                  return Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextReveal(
                          textRevealAnimation: textRevealAnimation,
                          textOpacityAnimation: textOpacityAnimation,
                          maxHeight:55,
                          controller: controller,
                          child: Text(
                            'Order Your',
                            style: GoogleFonts.quicksand(
                                fontSize: 45, fontWeight: FontWeight.w700),
                          ),
                        ),
                        TextReveal(
                          controller: controller,
                          textRevealAnimation: textRevealAnimation,
                          textOpacityAnimation: textOpacityAnimation,
                          maxHeight:55,
                          child: Text(
                            'Favorite Food',
                            style: GoogleFonts.quicksand(
                                fontSize: 45, fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AnimatedBuilder(
                          animation: subTextOpacityAnimation,
                          builder: (context,child) {
                            return FadeTransition(
                              opacity: subTextOpacityAnimation,
                              child: Text(
                                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                style: GoogleFonts.quicksand(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            );
                          }
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AnimatedBuilder(
                          animation: subTextOpacityAnimation,
                          builder: (context,child) {
                            return FadeTransition(
                              opacity: subTextOpacityAnimation,
                              child: Text(
                                'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                                style: GoogleFonts.quicksand(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            );
                          }
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 120,
                          alignment: Alignment(0.0, -1.0),
                          child: AnimatedBuilder(
                            animation: subImageRevealAnimation,
                            builder: (context,child) {
                              return SizedBox(
                                height: subImageRevealAnimation.value,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1510629954389-c1e0da47d414?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.network(
                                      'https://images.unsplash.com/photo-1576402187878-974f70c890a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1033&q=80',
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              );
                            }
                          ),
                        )
                    ],
                  ),
                      ));
                }
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
            ],
          ),
        );
      }
    );
  }
}
