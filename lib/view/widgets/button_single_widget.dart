import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_font_size.dart';

import '../../core/constants/app_colors.dart';

class ButtonSingleWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonSingleWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.color970707,
            AppColors.color7B0202,
            AppColors.color6C0303,
            AppColors.color810505,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20.r), // Match button's border radius
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.colorTransparent,
            foregroundColor: AppColors.colorD9D9D9,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
              side: BorderSide(
                color: AppColors.colorD39F38,
                width: 2.w
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppFontSize.textSize18,
              fontWeight: FontWeight.w400,
              color: AppColors.colorEFBE5D,
            ),
          ),
        )
    );


    // return ElevatedButton(
    //   onPressed: () {},
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: AppColors.color7B0202,
    //     foregroundColor: const Color(0xFFFFE28A),
    //     padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(25.r),
    //       side: BorderSide(
    //         color: AppColors.colorD39F38,
    //         width: 2.w
    //       ),
    //     ),
    //   ),
    //   child: Text(
    //     text,
    //     style: TextStyle(
    //       fontSize: AppFontSize.textSize18,
    //       fontWeight: FontWeight.w400,
    //       color: AppColors.colorEFBE5D,
    //     ),
    //   ),
    // );

    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //       colors: [
    //         AppColors.color970707,
    //         AppColors.color7B0202,
    //         AppColors.color6C0303,
    //         AppColors.color810505,
    //       ],
    //       begin: Alignment.topCenter,
    //       end: Alignment.bottomCenter,
    //     ),
    //     borderRadius: BorderRadius.circular(26.r),
    //     border: Border.all(
    //       color: AppColors.colorD39F38,
    //       width: 2.w,
    //     ),
    //   ),
    //   child: ElevatedButton(
    //     onPressed: () {},
    //     style: ElevatedButton.styleFrom(
    //       backgroundColor: Colors.transparent,
    //       shadowColor: Colors.transparent,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(26.r),
    //       ),
    //       padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
    //     ),
    //     child: Text(
    //       "เริ่มต้นใช้งาน",
    //       style: TextStyle(
    //         fontSize: AppFontSize.textSize18,
    //         fontWeight: FontWeight.w400,
    //         color: AppColors.colorEFBE5D,
    //       ),
    //     ),
    //   ),
    // );

    // return GestureDetector(
    //   onTap: onPressed,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         colors: [
    //           AppColors.color970707,
    //           AppColors.color7B0202,
    //           AppColors.color6C0303,
    //           AppColors.color810505,
    //         ],
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //       ),
    //       borderRadius: BorderRadius.circular(50),
    //       border: Border.all(
    //         color: const Color(0xFFD4AF37), // สีทอง
    //         width: 2,
    //       ),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.black.withOpacity(0.15),
    //           offset: const Offset(0, 3),
    //           blurRadius: 5,
    //         ),
    //       ],
    //     ),
    //     child: Center(
    //       child: Text(
    //         text,
    //         style: const TextStyle(
    //           color: Color(0xFFFFE28A), // สีทองอ่อน
    //           fontSize: 20,
    //           fontWeight: FontWeight.w700,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}