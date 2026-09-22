void main() {
  executeTasks();
}

void executeTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String task = "task 1 completed";
  print(task);
}

Future task2() async {
  print("task 2 started");
  Duration delay = Duration(seconds: 3);
  String? resulte;
  await Future.delayed(delay, () {
    resulte = "task 2 completed after delay";
    print(resulte);
  });
  return resulte;
}

void task3(String task2) {
  String task = task2 + " and task 3 completed";
  print(task);
}
