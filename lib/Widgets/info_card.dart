import 'package:flutter/material.dart';
import 'package:shopwebsitewithflutter/model/info.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/scroll_ofset.dart';

class InfoCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData iconData;
  InfoCard(
      {super.key,
      required this.title,
      required this.iconData,
      required this.description});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisplayOffset, ScrollOffset>(
        buildWhen: (previous, current) {
      if (current.scrollOfsetValue >= 2200) {
        return true;
      } else
        return false;
    }, builder: (context, state) {

      return AnimatedCrossFade(
        crossFadeState: state.scrollOfsetValue >= 2400
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 575),
        reverseDuration: Duration(milliseconds: 375),
        alignment: Alignment.center,
        firstCurve: Curves.easeOut,
        secondCurve: Curves.easeOut,
        firstChild: Container(
          height: 260,
          width: 220,
          margin: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        ),
        secondChild: Container(
          margin: EdgeInsets.all(25),
          height: 260,
          width: 220,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFFBE133C),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    widget.iconData,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.title,
                  style: GoogleFonts.quicksand(
                      fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.description,
                  style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
