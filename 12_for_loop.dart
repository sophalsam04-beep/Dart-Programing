// For in loop in flutter
void main(List<String> args) {
      List<String> fruits = ["Apple","Banana","Cherry","Orange","Mango"];
      for(String fruit in fruits){
            print(fruit);
      }


      List<int> numbers = [1,2,3,4,5,6,7,8];
      for(int n in numbers){
          print(n);
      }

      List<int> data = [1,5,4,8,10,400];
      data.forEach((n){
          print(n);
      });


      List<int> raduis=[314,444,553,535,293];
      raduis.forEach((a){
          print(a);
      });

      for(int h = 0;h<=10;h++){
          if(h == 3){
            break;
          }
          
          print(h);
      }

      for(int j = 0;j<=30;j++){
          if(j==5){
            continue;
          }
          print(j);
      }
}