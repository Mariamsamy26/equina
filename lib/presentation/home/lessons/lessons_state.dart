import '../../../core/models/equina_model.dart';

abstract class LessonsState {}
class LessonsInitial extends LessonsState {}


class LessonsLoading extends LessonsState {}

class LessonsLoaded extends LessonsState {
  final List<EquinaModel> lessons;
  LessonsLoaded(this.lessons);
}

class LessonsEmpty extends LessonsState {}

class LessonsError extends LessonsState {
  final String message;
  LessonsError(this.message);
}