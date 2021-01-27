class Task {
  final int id;
  final String title;
  bool checked;

  Task({this.id, this.title, this.checked = false});
  void checkTask() {
    checked = !checked;
  }

  Map<String, dynamic> toMap() {
    return ({
      'id': id,
      'title': title,
      'isDone': checked,
    });
  }
}
