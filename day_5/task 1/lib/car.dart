class Car {
  String? name;
  String? color;
  String? model;
  String? makeYear;

  //default constructor
  Car({this.name, this.color, this.model, this.makeYear});

  // Named Constructor
  Car.namedConst(String name, String color, String model, String makeYear) {
    this.name = name;
    this.color = color;
    this.model = model;
    this.makeYear = makeYear;
  }

  Car.namedConst2(Map<String, dynamic> data) {
    name = data["name"];
    color = data["color"];
    model = data["model"];
    makeYear = data["makeYear"];
  }

  void printInfoCar() {
    print(name);
  }

  void move() {
    print("move function in car class");
  }
}
