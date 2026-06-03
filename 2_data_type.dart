// Data type in flutter
import 'dart:ffi';

void main(List<String> args) {
    int id = 101;
    String name = "un virak";
    double price = 4.3;
    bool istrue = true;
    
    // List
    List<int> numbers = [1,2,3,4,5,6,7,8,9,10];
    List<String> items = ["Un virak","Prum chansamedy","Rous rachana","Kong bonna"];

    // Maps
    Map<String, dynamic> person = {
      "name" : "Un virak",
      "age" : 39,
    };

    dynamic data = "No data";
    data = 101;

    print(numbers);
    print(items);

    print(person['name']);
    print(person['age']);

    print(data);



}