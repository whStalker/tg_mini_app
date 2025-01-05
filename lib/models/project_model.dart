class Project {
  final int id;
  final String name;
  final String description;
  final int ownerID;
  final bool isPublic;
  final int totalTask;
  final int tasksInMaxStatus;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.ownerID,
    required this.isPublic,
    required this.totalTask,
    required this.tasksInMaxStatus,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      ownerID: json['owner'],
      isPublic: json['is_public'],
      totalTask: json['total_tasks'],
      tasksInMaxStatus: json['tasks_in_max_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'owner': ownerID,
      'is_public': isPublic,
      'total_tasks': totalTask,
      'tasks_in_max_status': tasksInMaxStatus,
    };
  }
}
