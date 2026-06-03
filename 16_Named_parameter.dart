// Named Parameter in flutter
void showInfo({
  required String name,
  required String age,
}){
  print("Name : $name");
  print("Age : $age");

}

void CardSystem({
  required String id,
  required String name,
}){
    print("ID : $id");
    print("Name : $name");

}
void main(List<String> args) {
    showInfo(name: "Sam sophal", age: "25");
    showInfo(name: "un virak", age: "38");
    showInfo(name: "101", age: "System card");
    showInfo(name: "102", age: "core banking");
}