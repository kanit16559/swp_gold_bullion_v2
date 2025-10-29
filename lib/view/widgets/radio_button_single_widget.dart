import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_colors.dart';

class RadioButtonSingleWidget extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const RadioButtonSingleWidget({
    super.key,
    required this.value,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          onChanged!(!value);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: 23.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: AppColors.colorEFECEC,
                shape: BoxShape.circle,
                border: Border.all(
                  color: value ? AppColors.colorBD1E2E : AppColors.colorA7A7A7,
                  width: 2.5.w,
                ),
              ),
              child: value ? Center(
                child: Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.colorBD1E2E,
                    shape: BoxShape.circle,
                  ),
                ),
              ) : null,
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return RadioGroup<bool>(
  //     groupValue: null,
  //     onChanged: (bool? value) {
  //       if(onChanged != null){
  //         onChanged!(value);
  //       }
  //     },
  //     child: Transform.scale(
  //       scale: 1.3.r,
  //       child: Radio<bool>(
  //         value: true,
  //         fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //           return (value) ? AppColors.color970707 : AppColors.colorD9D9D9;
  //         }),
  //         backgroundColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
  //           return AppColors.colorD9D9D9;
  //         }),
  //       ),
  //     ),
  //   );
  // }

}
