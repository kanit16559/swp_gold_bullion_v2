import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_colors.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_font_size.dart';
import 'package:swp_gold_bullion_v2/view/widgets/button_single_widget.dart' show ButtonSingleWidget;
import 'package:swp_gold_bullion_v2/view/widgets/radio_button_single_widget.dart';
import 'package:swp_gold_bullion_v2/view_model/intro/intro_cubit.dart';

class IntroBodyWidget extends StatelessWidget {
  final String title;
  final String? detail;
  final bool isLastPage;
  final VoidCallback? onCheckBox;
  final VoidCallback? onStart;
  const IntroBodyWidget({
    super.key,
    required this.title,
    this.detail,
    this.isLastPage = false,
    this.onCheckBox,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 314.w,
          height: 0.6.sh,
          color: Colors.red,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: AppFontSize.textSize24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.colorD39F38,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (detail != null) Column(
                children: [
                  Text(
                    detail!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: AppFontSize.textSize16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color5B5B5B,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
              if(isLastPage) Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RadioButtonSingleWidget(
                        value: context.watch<IntroCubit>().state.isCheckRadioIntro,
                        onChanged:  (value){
                          onCheckBox!();
                        },
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "ไม่ต้องถามอีก",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFontSize.textSize16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color242424,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ButtonSingleWidget(
                    text: "เริ่มต้นใช้งาน",
                    onPressed: onStart!,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

}
