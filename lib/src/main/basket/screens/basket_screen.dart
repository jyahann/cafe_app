import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/components/template_screens/primary_scroll_screen.dart';
import 'package:cafe_app/src/main/basket/widgets/basket_list.dart';
import 'package:cafe_app/src/main/basket/widgets/basket_pay_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryScrollScreen(
      scrollChild: BasketList(),
      footer: BasketPayButton(),
    );
  }
}
