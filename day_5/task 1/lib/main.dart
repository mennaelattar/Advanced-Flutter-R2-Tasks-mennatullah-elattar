import 'car.dart';
import 'toyota.dart';

void main() {
  var car1 = Car("car name", "123", "model1", "1999");
  var car2 = Car.namedConst2({
    "name": "car name 2",
    "color": "123",
    "model": "model2",
    "makeYear": "1999"
  });
  var toyotaInst = Toyota();
  toyotaInst.printInfoToyota();
  car1.printInfoCar();

// override
  var car3 = Toyota();
  car1.move();
}
