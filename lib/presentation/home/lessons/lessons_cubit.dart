import 'package:equina/data/api_funtion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lessons_state.dart';

class LessonsCubit extends Cubit<LessonsState> {
  LessonsCubit() : super(LessonsInitial());

  Future<void> fetchLessons() async {
    try {
      emit(LessonsLoading());

      final response = await ApiFunction.fetchLessons();

      if (response.lessons.isEmpty) {
        emit(LessonsEmpty());
      } else {
        emit(LessonsLoaded(response.lessons));
      }
    } catch (e) {
      emit(LessonsError(e.toString()));
    }
  }
}