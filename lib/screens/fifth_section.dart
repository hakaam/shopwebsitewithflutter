import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopwebsitewithflutter/Widgets/text_reveal.dart';
import 'package:shopwebsitewithflutter/model/chefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/chef_card.dart';
import '../model/scroll_ofset.dart';
class FifithSection extends StatefulWidget {
  const FifithSection({super.key});

  @override
  State<FifithSection> createState() => _FifithSectionState();
}

class _FifithSectionState extends State<FifithSection>  with SingleTickerProviderStateMixin{
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
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 375));

    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.3, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0,0.3, curve: Curves.easeOut)));



    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        BlocBuilder<DisplayOffset, ScrollOffset>(
            buildWhen: (previous, current) {
              if (current.scrollOfsetValue >= 3000) {
                return true;
              } else
                return false;
            }, builder: (context, state) {
          if(state.scrollOfsetValue >3100){

            controller.forward();

          } else{
            controller.reverse();

          }
               return TextReveal(
                 controller: controller,
                 textRevealAnimation: textRevealAnimation,
                 textOpacityAnimation: textOpacityAnimation,
                 maxHeight: 55,

                 child: Text('Most Experts Chefs',
                   textAlign: TextAlign.center,
                   style: GoogleFonts.quicksand(
                   fontSize: 40,
                   fontWeight: FontWeight.w700


                 ),),
               );
             }
           ),
        SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: chefs.map<Widget>((chef) => ChefCard(
            chef: chef,

          )).toList(),


        )


        
        
      ],


    );
  }
}
