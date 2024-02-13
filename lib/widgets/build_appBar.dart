import 'package:flutter/material.dart';
import 'package:aplikasi_todo_list/constants/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/wahyu.jpg'),
          ),
        )
      ],
    ),
  );
}