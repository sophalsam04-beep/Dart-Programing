// function in flutter
// returntype functionName{
      // code here
//}

// 1. Function No parameter and No return tpye
void printName() {
  print("Un virak");
}

void greet() {
  print("Hello sophal");
}

// 2. Function have parameter
void fullname(String name){
    print("Hello! ${name}");
}

void address(String a){
    print("Current address : ${a}");
}


// 3. Function have parameter and have return type
int add(int a, int b){
  return (a+b);
}

int sub(int a, int b){
  return a-b;
}

int mul(int a, int b){
    return a*b;
}
void main(List<String> args) {
   
      greet();
      printName();
      fullname("Sam sophal");
      address("Phnom Penh");
      print(add(3, 7));
      print(sub(4, 3));
      print(mul(7, 2));

}