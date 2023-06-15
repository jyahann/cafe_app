import 'package:cafe_app/app_config/colors.dart';
import 'package:cafe_app/src/main/user_location/cubit/user_location_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
        bottom: 8.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<UserLocationCubit, UserLocationState>(
            builder: (context, state) {
              final dateFormat = DateFormat("dd MMMM, yyyy");
              final time = Text(
                dateFormat.format(DateTime.now()),
                style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                      fontSize: 14.0,
                      color: hintColor,
                    ),
              );
              if (state is! UserLocationDefined) {
                return time;
              }
              return Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Image.asset(
                      "assets/user_location_icons/map_pin.png",
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.currentUserCity,
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      time,
                    ],
                  )
                ],
              );
            },
          ),
          GestureDetector(
            child: CircleAvatar(
              radius: 22,
              backgroundImage: Image.asset(
                "assets/user_photo/avatar.jpg",
              ).image,
            ),
          ),
        ],
      ),
    );
  }
}
