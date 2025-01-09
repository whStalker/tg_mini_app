class User {
  final int id;
  final int tgId;
  final String firstName;
  final String username;

  User({
    required this.id,
    required this.tgId,
    required this.firstName,
    required this.username,
  });

  factory User.fromjson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      tgId: json['tg_id'],
      firstName: json['first_name'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tg_id': tgId,
      'first_name': firstName,
      'username': username,
    };
  }
}

class Status {
  final int id;
  final String? project;
  final String name;
  final int value;

  Status({
    required this.id,
    this.project,
    required this.name,
    required this.value,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      project: json['project'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project': project,
      'name': name,
      'value': value,
    };
  }
}

class Priority {
  final int id;
  final String? project;
  final String name;
  final int value;

  Priority({
    required this.id,
    this.project,
    required this.name,
    required this.value,
  });

  factory Priority.fromJson(Map<String, dynamic> json) {
    return Priority(
      id: json['id'],
      project: json['project'],
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'project': project,
      'name': name,
      'value': value,
    };
  }
}

class TaskModel {
  final String name;
  final String description;
  final int project;
  final User taskCreator;
  final User? taskImplementer;
  final Status status;
  final Priority priority;
  final DateTime? endAt;

  TaskModel({
    required this.name,
    required this.description,
    required this.project,
    required this.taskCreator,
    this.taskImplementer,
    required this.status,
    required this.priority,
    this.endAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'],
      description: json['description'],
      project: json['project'],
      taskCreator: User.fromjson(json['creator_mapped']),
      taskImplementer: User.fromjson(json['implementer_mapped']),
      status: Status.fromJson(json['status_mapped']),
      priority: Priority.fromJson(json['priority_mapped']),
      endAt: DateTime.parse(json['end_at']),
    );
  }
}