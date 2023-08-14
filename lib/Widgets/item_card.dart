import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopwebsitewithflutter/model/scroll_ofset.dart';

class ItemCard extends StatefulWidget {
  const ItemCard(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.subtitle,
      required this.index});
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final int index;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> headingTextOpacity;
  late Animation<double> subTextOpacity;
  late Animation<double> descriptionOpacity;
  late Animation<double> priceOpacity;
  late Animation<double> imageReveal;
  late Animation<double> imageOpacity;

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1500),
        reverseDuration: Duration(milliseconds: 500));

    headingTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.3, 0.5, curve: Curves.easeOut)));

    subTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.6, curve: Curves.easeOut)));

    descriptionOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 0.8, curve: Curves.easeOut)));

    priceOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.8, 1.0, curve: Curves.easeOut)));


    imageReveal = Tween<double>(begin: 0.0, end: 170.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 0.5, curve: Curves.easeOut)));
    imageOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.5, curve: Curves.easeOut)));



    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<DisplayOffset,ScrollOffset>(
          buildWhen: (previous,current){
            if((current.scrollOfsetValue >=1000 && current.scrollOfsetValue <=1950)
                || controller.isAnimating){
              return true;

            }
            else return false;

          },
          builder: (context,state) {
            if(state.scrollOfsetValue >= (1100 + widget.index * 100)){
              controller.forward();
            }
            else{
              controller.reverse();
            }
        return Container(
          height: 180,
          width: 520,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context,child) {
              return Row(
                children: [
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: Center(
                      child: FadeTransition(
                        opacity: imageOpacity,
                        child: SizedBox(
                          height: imageReveal.value,
                          width: imageReveal.value,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.medium,
                              scale: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity:headingTextOpacity,

                          child: Text(
                            widget.title,
                            style: GoogleFonts.quicksand(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        FadeTransition(
                          opacity:subTextOpacity,
                          child: Text(
                            widget.subtitle,
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeTransition(
                          opacity:descriptionOpacity,                      child: Text(
                            widget.description,
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        FadeTransition(
                          opacity:priceOpacity,                      child: Text(
                            widget.price,
                            style: GoogleFonts.quicksand(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffBE133C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          ),
        );
      }
    );
  }
}
