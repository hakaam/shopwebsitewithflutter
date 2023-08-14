import 'package:flutter/material.dart';
import 'package:shopwebsitewithflutter/Widgets/text_reveal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopwebsitewithflutter/model/scroll_ofset.dart';
import '../Widgets/item_card.dart';
import '../model/items.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000),
        reverseDuration: Duration(milliseconds: 375));
    textRevealAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeOut)));

    textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeOut)));
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<DisplayOffset,ScrollOffset>(
          buildWhen: (previous,current){
            if((current.scrollOfsetValue >=900 && current.scrollOfsetValue <=1300)
              || controller.isAnimating){
        return true;

    }
    else return false;

    },
          builder: (context,state) {
            if(state.scrollOfsetValue > 1100){
              controller.forward();
            }
            else{
              controller.reverse();
            }
            return TextReveal(
              textOpacityAnimation: textOpacityAnimation,
              textRevealAnimation: textRevealAnimation,
              maxHeight: 70,
              controller: controller,
              child: Text(
                'Dish of the Day',
                style: GoogleFonts.quicksand(
                    fontSize: 55, fontWeight: FontWeight.w700),
              ),
            );
          }
        ),
        SizedBox(
          height: 100,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 70.0,
            spacing: 100,
            children: items.map<Widget>((item) {
              return ItemCard(
                image: item.image,
                title: item.title,
                subtitle: item.subtitle,
                description: item.description,
                price: item.price,
                index: items.indexOf(item),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
