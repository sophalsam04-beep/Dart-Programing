// Positional Optional parameter
void showData(String name, [int? age]){
    print("Name : $name");
    print("Age : $age");

}

void validated(String username, [String? password]){
    print("Username : $username");
    print("Password : $password");

}
void main(List<String> args) {
    showData("SAM SOPHAL");
    showData("Data", 30);

    validated("SAM");
    validated("samsophal", "12345");
}

