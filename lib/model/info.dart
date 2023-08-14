import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info{

  String title;
  String description;
  IconData iconData;


  Info({

    required this.title,
    required this.iconData,
    required this.description


});



}


List<Info> infos=[

  Info(
      title: 'Pick Meals',
      iconData: Icons.mouse_rounded,
description: 'Lorem ipsum is a placeholder text commonly used to demonst document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available'),

  Info(
      title: 'Choose Payment',
      iconData: Icons.monetization_on_outlined,
      description: 'Lorem ipsum is a placeholder text commonly used to demonst document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available'),

  Info(
      title: 'Select Location',
      iconData: Icons.location_on_outlined,
      description: 'Lorem ipsum is a placeholder text commonly used to demonst document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available'),

  Info(
      title: 'Fast Delivery',
      iconData: Icons.delivery_dining_outlined,
      description: 'Lorem ipsum is a placeholder text commonly used to demonst document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available'),




];