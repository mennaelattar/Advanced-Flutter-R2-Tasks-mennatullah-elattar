import 'car.dart';

class Toyota extends Car {
  void printInfoToyota() {
    print("ex of super");
    super.printInfoCar();
  }

  @override
  void move() {
    print("move function in Toyota class");
  }
}
