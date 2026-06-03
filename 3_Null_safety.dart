// Null safety in flutters
import 'dart:ffi';

void main(List<String> args) {
    String? name;
    name = "Un virak";
    print(name.length);
    print(name);

    // Non null safety
          int id = 101;
          String department = "Mobile App development";

    // Nullable variable
    int? data;
    print(data);


    // Null checked
    String? table = "Row";
    print(table?.length);

    // Null Coalescings
    String? role;
    print(role ?? "No null");
    Double? salary;
    print(salary ?? "No salary");

    // Null asserting 
    String? lastname = "sam";
    print(lastname!.length);

}