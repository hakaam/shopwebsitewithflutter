import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopwebsitewithflutter/Widgets/text_reveal.dart';
import 'package:shopwebsitewithflutter/model/info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Widgets/info_card.dart';
import '../model/scroll_ofset.dart';

class ThirdSection extends StatefulWidget {
  const ThirdSection({super.key});

  @override
  State<ThirdSection> createState() => _ThirdSectionState();
}

class _ThirdSectionState extends State<ThirdSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> imageRevealAnimation;
  late Animation<double> textRevealAnimation;

  late Animation<double> textttRevealAnimation;
  late Animation<double> textOpacityAnimation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 375));
    textRevealAnimation = Tween<double>(begin: 70.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.30, 0.40, curve: Curves.easeOut)));
    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.3, curve: Curves.easeOut)));

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.9,
      height: 515,
      color: Color(0xFFBE133C).withOpacity(0.1),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          BlocBuilder<DisplayOffset,ScrollOffset>(
              buildWhen: (previous,current){
                if((current.scrollOfsetValue >=1900 && current.scrollOfsetValue <=2300)
                    || controller.isAnimating){
                  return true;

                }
                else return false;

              },
              builder: (context,state) {
                if(state.scrollOfsetValue > 2100){
                  controller.forward();
                }
                else{
                  controller.reverse();
                }
              return TextReveal(
                controller: controller,
                textRevealAnimation: textRevealAnimation,
                textOpacityAnimation: textOpacityAnimation,
                maxHeight: 70,
                child: Text(
                  'How It Works',
                  style: GoogleFonts.quicksand(
                      fontSize: 45, fontWeight: FontWeight.w700),
                ),
              );
            }
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: infos
                    .map<Widget>((info) => InfoCard(
                          title: info.title,
                          iconData: info.iconData,
                          description: info.description,
                        ))
                    .toList(),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
