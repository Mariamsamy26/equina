import 'package:equina/core/color_mang.dart';
import 'package:equina/core/widgets/custom_text_form_field.dart';
import 'package:equina/core/models/equina_model.dart';
import 'package:equina/core/text_mang.dart';
import 'package:equina/core/widgets/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../profile/profile_screen.dart';
import 'lessons/lessons_cubit.dart';
import 'lessons/lessons_state.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonsCubit()..fetchLessons(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            _buildSearchAndFilter(context),
            Expanded(child: _buildLessonsList()),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.all(8.w),
        child: Image.asset("assets/images/horse.png"),
      ),
      title: Text("equinaCLUB", style: TextManager.bold()),
      actions: [
        _buildActionIcon(icon: "assets/images/family.png", onPressed: () {}),
        _buildActionIcon(
          icon: "assets/images/notification.png",
          onPressed: () {},
        ),
        _buildActionIcon(
          icon: "assets/images/profile.png",
          onPressed: () => _navigateToScreen(context, const ProfileScreen()),
        ),
      ],
    );
  }

  Widget _buildActionIcon({
    required String icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(2.r),
        ),
        width: 30.w,
        height: 30.h,
        child: Image.asset(
          icon,
          width: 30.w,
          height: 30.h,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    final searchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Expanded(
            child: AppTextFormField(
              colorBorder: ColorManager.lightGrey,
              controller: searchController,
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

  Widget _buildLessonsList() {
    return BlocBuilder<LessonsCubit, LessonsState>(
      builder: (context, state) {
        if (state is LessonsLoading) return _LessonsLoading();
        if (state is LessonsError) {
          return _LessonsError(
            onPressed: () => context.read<LessonsCubit>().fetchLessons(),
          );
        }
        if (state is LessonsEmpty) return _LessonsEmpty();
        if (state is LessonsLoaded) {
          return _LessonsLoaded(
            lessons: state.lessons,
            onPressed: () => context.read<LessonsCubit>().fetchLessons(),
          );
        }

        return const SizedBox();
      },
    );
  }

  //Lessons states ui
  Widget _LessonsLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _LessonsError({required VoidCallback onPressed}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          SizedBox(height: 16.h),
          Text(
            'Failed to load lessons',
            style: TextManager.bold().copyWith(color: Colors.red),
          ),
          SizedBox(height: 8.h),
          ElevatedButton(onPressed: onPressed, child: const Text('Retry')),
        ],
      ),
    );
  }

  Widget _LessonsEmpty() {
    return Center(
      child: Text('No lessons available', style: TextManager.bold()),
    );
  }

  Widget _LessonsLoaded({
    required List<EquinaModel> lessons,
    required VoidCallback onPressed,
  }) {
    return RefreshIndicator(
      onRefresh: () async {
        await onPressed;
      },
      child: Container(
        color: ColorManager.lightGrey.withAlpha(30),
        child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return CustomCard(
              title: lesson.name,
              clubName: lesson.clubName,
              description: lesson.description,
              type: lesson.lessonType,
              duration: "${lesson.classDuration.toInt()} min",
              numberOfClasses: lesson.numOfClasses.toInt(),
              price: "100",
              imagePath: "assets/images/girl_rider.jpg",
              discountText: "buy now and \n5% and 500 Points",
            );
          },
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
