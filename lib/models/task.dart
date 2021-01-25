class Task {
  final String title;
  bool checked;

  Task({this.title, this.checked = false});
  void checkTask() {
    checked = !checked;
  }
}
