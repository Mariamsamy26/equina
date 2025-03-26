import 'package:equina/core/color_mang.dart';
import 'package:equina/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/text_mang.dart';
import '../../core/widgets/custom_card_home.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actionsData = [
      {
        'icon': "assets/images/family.png",
        'onPressed': () {},
      },
      {
        'icon': "assets/images/notification.png",
        'onPressed': () {},
      },
      {
        'icon': "assets/images/profile.png",
        'onPressed': () => _navigateToScreen(context, const ProfileScreen()),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.w),
          child: Image.asset("assets/images/horse.png"),
        ),
        title: Text("equinaCLUB", style: TextManager.bold()),
        actions: actionsData.map((action) => _buildActionIcon(action)).toList(),
      ),
      body: Column(
        children: [_searchAndFilter(), Expanded(child: _assessmentData())],
      ),
    );
  }

  Widget _buildActionIcon(Map<String, dynamic> action) {
    return IconButton(
      onPressed: action['onPressed'],
      icon: Container(
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(2.r),
        ),
        width: 30.w,
        height: 30.h,
        child: Image.asset(
          action['icon'],
          width: 29.w,
          height: 29.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _searchAndFilter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              colorBorder: ColorManager.lightGrey,
              controller: _searchController,
              hintText: "Search",
              hintStyle: TextManager.regular(),
              keyboardType: TextInputType.text,
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.w),
                child: Image.asset(
                  "assets/images/search_icon.png",
                  width: 15.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/filter.png",
              width: 50.w,
              height: 55.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  Widget _assessmentData() {
    return Container(
      color: ColorManager.lightGrey.withAlpha(30),
      padding: EdgeInsets.all(16.w),
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CustomCard(
            title: "Assessment Tina",
            clubName: "Talaat Club",
            description: "Learn horse riding with expert trainers.",
            type: "Assessment",
            duration: "45 min",
            numberOfClasses: 13,
            price: "150",
            imagePath: "assets/images/girl_rider.jpg",
            discountText: "Buy and Get\n5% and 500 Points",
          ),

        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
