import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:swp_gold_bullion_v2/core/constants/app_assets.dart';
import 'package:swp_gold_bullion_v2/view/intro/widget/intro_body_widget.dart';
import 'package:swp_gold_bullion_v2/view_model/intro/intro_cubit.dart';
import '../../services/preferences_service.dart';
import '../../routes/route_paths.dart';
import '../../core/constants/app_colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          _buildBackgroundWidget(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.r),
                  child: SmoothPageIndicator(
                    controller: _pageController,  // PageController
                    count: 3,
                    effect: ScaleEffect(
                      dotColor: AppColors.colorA7A7A7,
                      activeDotColor: AppColors.color7B0202,
                      dotHeight: 12.r,
                      dotWidth: 12.r,
                      activeStrokeWidth: 0,
                      spacing: 14.r
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {

                    },
                    children: <Widget>[
                      IntroBodyWidget(
                        title: "ซื้อ-ขายทองทันใจ\nทำกำไรไม่สะดุด",
                        detail: "ซื้อขายทองคำได้สะดวก ตลอดเกือบ 24 ชั่วโมง\nด้วยระบบ Wallet ในแอปฯ ที่พร้อมตัดเงินได้ทันที\nไร้กังวลทุกปัญหาการทำธุรกรรมข้ามธนาคาร",
                      ),
                      IntroBodyWidget(
                        title: 'สร้างพอร์ตทองคำตามใจคุณ\nด้วย "ออมทอง" และ "กระปุก"',
                        detail: 'เลือกแผน "ออมทอง"\nตามเวลาหรือตามเป้าหมายน้ำหนักทองที่ต้องการ\nพร้อมแยกแผนการเก็บทองและเงินในบัญชี "กระปุก"\nได้หลายช่องทางอย่างเป็นระบบ',
                      ),
                      IntroBodyWidget(
                        title: "คว้าโอกาสทอง แม้เงิน\nยังไม่พร้อม ด้วยวงเงินซื้อขาย!",
                        isLastPage: true,
                        onCheckBox: () {
                          context.read<IntroCubit>().onChangeRadio();
                        },
                        onStart: () async {
                          final getIsCheckRadioIntro = context.read<IntroCubit>().state.isCheckRadioIntro;
                          await PreferencesService.setIsShowIntro(getIsCheckRadioIntro);
                          if(!context.mounted) return;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RoutePaths.home,
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundWidget(){
    return Positioned(
      left: -0.5.sw,
      top: 0.15.sh,
      child: SizedBox(
        height: 1.5.sh,
        width: 1.5.sw,
        child: Image.asset(
          AppAssets.logoSwpY1,
        ),
      ),
    );
  }
}