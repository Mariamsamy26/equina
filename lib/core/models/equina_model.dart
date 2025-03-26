class EquinaResponse {
  final int status;
  final List<EquinaModel> lessons;

  EquinaResponse({
    required this.status,
    required this.lessons,
  });

  factory EquinaResponse.fromJson(Map<String, dynamic> json) {
    var lessonsList = json['lessons'] as List;
    List<EquinaModel> lessons = lessonsList
        .map((lesson) => EquinaModel.fromJson(lesson))
        .toList();

    return EquinaResponse(
      status: json['status'] as int? ?? 1,
      lessons: lessons,
    );
  }
}

class EquinaModel {
  final String name;
  final String clubName;
  final String description;
  final String lessonType;
  final double classDuration;
  final double numOfClasses;

  EquinaModel({
    required this.name,
    required this.clubName,
    required this.description,
    required this.lessonType,
    required this.classDuration,
    required this.numOfClasses,
  });

  factory EquinaModel.fromJson(Map<String, dynamic> json) {
    return EquinaModel(
      name: json['name'] as String? ?? 'No name',
      clubName: json['club_name'] as String? ?? 'No club',
      description: json['description'] as String? ?? 'No description',
      lessonType: json['lessontype'] as String? ?? 'No type',
      classDuration: (json['class_duration'] as num?)?.toDouble() ?? 0.0,
      numOfClasses: (json['num_of_classes'] as num?)?.toDouble() ?? 0.0,
    );
  }
}