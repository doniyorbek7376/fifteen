import 'dart:math';

class FifteenGame {
  int n;
  List<String> numbers = [];
  List<String> solved = [];

  FifteenGame(n) {
    this.n = n;
    for (int i = 1; i < n * n; i++) {
      numbers.add("$i");
      solved.add("$i");
    }
    numbers.add("");
    solved.add("");
  }

  void randomize() {
    Random a = Random();
    int iter = a.nextInt(500*n);
    for(int i=0;i<iter;i++){
      change(a.nextInt(n*n));
    }
  }

  bool verify() {
    for (int i = 0; i < solved.length; i++) {
      if (solved[i] != numbers[i]) return false;
    }
    return true;
  }

  int change(int index) {
    for (int i = 1; i < n; i++) {
      if (index >= i * n) {
        if (numbers[index - n * i] == "") {
          for (int j = 0; j < i; j++) {
            _swap(index - n * (i - j), index - n * (i - j - 1));
          }
          return i;
        }
      }
      if (index ~/ n == (index - i) ~/ n && index != 0) {
        if(index>=i)
        if (numbers[index - i] == "") {
          for(int j=0;j<i;j++){
            _swap(index-i+j, index-i+j+1);
          }
          return i;
        }
      }
      if (index ~/ n == (index + i) ~/ n) {
        if(index+i< n*n)
        if (numbers[index + i] == "") {
          for(int j=0;j<i;j++){
            _swap(index+i-j, index+i-j-1);
          }
          return i;
        }
      }
      if (index + n*i < n * n) {
        if (numbers[index + n*i] == "") {
          for(int j=0;j<i;j++){
            _swap(index+n*(i-j), index+n*(i-j-1));
          }
          return i;
        }
      }
    }
    return 0;
  }

  void _swap(int a, int b) {
    String temp;
    temp = numbers[a];
    numbers[a] = numbers[b];
    numbers[b] = temp;
  }
}
