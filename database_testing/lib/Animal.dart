// Defining the data that needs to be stored in the database. Will store animals so made an animal class.
import 'package:databasetesting/DatabaseHelper.dart';

class Animal {
  final int id;
  final String name;
  final String color;
  final int legs;

  Animal({this.id, this.name, this.color, this.legs});

  /// Since the database takes in data in the format of a map, we need to convert the Animal data into a map
  Map<String, dynamic> animalToMap() {
    return {
      'id': this.id,
      'name': this.name,
      'color': this.color,
      'legs': this.legs,
    };
  }

  /// This function will insert a created Animal object into into the database table we have created.
  /// It converts the Animal object into a Map in the method animalToMap().
  insertAnimal(Animal animal) async {
    await DatabaseHelper.databaseInstance.insertRow(animalToMap());
    print('REACHED insertAnimal()');
    print(animalToMap());
  }

  ///This function will get all the Animals in the database.
  String getAnimals() {
    Future<List<Map<String, dynamic>>> animals =
        DatabaseHelper.databaseInstance.queryAllRows();

    return animals.toString();
  }
}
