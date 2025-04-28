import 'dart:math';

// 1. Класс "Человек"
class Person {
  String _name;
  int _age;
  String _gender;

  Person(this._name, this._age, this._gender);

  // Методы
  void printInfo() {
    print('Name: $_name, Age: $_age, Gender: $_gender');
  }

  void increaseAge() {
    _age++;
  }

  void changeName(String newName) {
    _name = newName;
  }
}

// 2. Наследование: Класс "Работник" и "Менеджер"

class Worker extends Person {
  double _salary;

  Worker(String name, int age, String gender, this._salary)
      : super(name, age, gender);

  void printSalary() {
    print('Salary: $_salary');
  }
}

class Manager extends Worker {
  List<Worker> _subordinates = [];

  Manager(String name, int age, String gender, double salary)
      : super(name, age, gender, salary);

  void addSubordinate(Worker worker) {
    _subordinates.add(worker);
  }
}

// 3. Полиморфизм: Животные
abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() => print('Гав!');
}

class Cat implements Animal {
  @override
  void makeSound() => print('Мяу!');
}

class Cow implements Animal {
  @override
  void makeSound() => print('Муу!');
}

void demoPolymorphism() {
  List<Animal> animals = [Dog(), Cat(), Cow()];
  animals.forEach((animal) => animal.makeSound());
}

// 4. Абстрактный класс "Транспорт"
abstract class Transport {
  void move();
}

class Car extends Transport {
  @override
  void move() => print('Машина едет');
}

class Bike extends Transport {
  @override
  void move() => print('Велосипед крутит педали');
}

// 5. Класс "Книга" и "Библиотека"
class Book {
  final String title;
  final String author;
  final int year;

  Book(this.title, this.author, this.year);
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) => _books.add(book);

  List<Book> findByAuthor(String author) {
    return _books.where((book) => book.author == author).toList();
  }

  List<Book> findByYear(int year) {
    return _books.where((book) => book.year == year).toList();
  }
}

// 6. Инкапсуляция: Банк

class BankAccount {
  final String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  void deposit(double amount) {
    if (amount > 0) _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }

  double get balance => _balance;
}

//7
class Counter {
  static int _count = 0;

  Counter() {
    _count++;
  }

  static int get count => _count;
}
// 8. Площадь фигур
abstract class Shape {
  double getArea();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double getArea() => 3.14 * radius * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double getArea() => width * height;
}

// 9. Наследование: Животные и их движения
class Animal {
  void move() => print('Животное двигается');
}

class Fish extends Animal {
  @override
  void move() => print('Рыба плавает');
}

class Bird extends Animal {
  @override
  void move() => print('Птица летает');
}

class Dog extends Animal {
  @override
  void move() => print('Собака бегает');
}

//10. Работа с коллекциями: Университет
class Student {
  final String name;
  final String group;
  final double grade;

  Student(this.name, this.group, this.grade);
}

class University {
  final List<Student> _students = [];

  void addStudent(Student student) => _students.add(student);

  List<Student> sortByName() {
    _students.sort((a, b) => a.name.compareTo(b.name));
    return _students;
  }

  List<Student> filterByGrade(double minGrade) {
    return _students.where((s) => s.grade >= minGrade).toList();
  }
}

//11. Класс "Магазин"

class Product {
  final String name;
  final double price;
  int quantity;

  Product(this.name, this.price, this.quantity);
}

class Store {
  final List<Product> _products = [];

  void addProduct(Product product) => _products.add(product);

  void removeProduct(String name) {
    _products.removeWhere((p) => p.name == name);
  }

  Product? findByName(String name) {
    return _products.firstWhere((p) => p.name == name);
  }
}
//12. Интерфейс "Платежная система"
abstract class PaymentSystem {
  void pay(double amount);
  void refund(double amount);
}

class CreditCard implements PaymentSystem {
  @override
  void pay(double amount) => print('Оплата картой: $amount');

  @override
  void refund(double amount) => print('Возврат на карту: $amount');
}

class PayPal implements PaymentSystem {
  @override
  void pay(double amount) => print('Оплата PayPal: $amount');

  @override
  void refund(double amount) => print('Возврат через PayPal: $amount');
}
//13. Генерация уникальных идентификаторов
class UniqueID {
  static int _nextId = 1;
  final int id;

  UniqueID() : id = _nextId++;
}
//14. Класс "Точка" и "Прямоугольник"
class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

class Rectangle {
  final Point topLeft;
  final Point bottomRight;

  Rectangle(this.topLeft, this.bottomRight);

  double getArea() {
    final width = bottomRight.x - topLeft.x;
    final height = topLeft.y - bottomRight.y;
    return width * height;
  }
}

//15. Комплексные числа

class ComplexNumber {
  final double real;
  final double imaginary;

  ComplexNumber(this.real, this.imaginary);

  ComplexNumber add(ComplexNumber other) {
    return ComplexNumber(
      real + other.real,
      imaginary + other.imaginary,
    );
  }

  ComplexNumber multiply(ComplexNumber other) {
    return ComplexNumber(
      real * other.real - imaginary * other.imaginary,
      real * other.imaginary + imaginary * other.real,
    );
  }
}

//16. Перегрузка операторов: Матрица
class Matrix {
  List<List<int>> data;

  Matrix(this.data);

  Matrix operator +(Matrix other) {
    List<List<int>> result = [];
    for (int i = 0; i < data.length; i++) {
      List<int> row = [];
      for (int j = 0; j < data[i].length; j++) {
        row.add(data[i][j] + other.data[i][j]);
      }
      result.add(row);
    }
    return Matrix(result);
  }

  Matrix operator *(Matrix other) {
    List<List<int>> result = [];
    for (int i = 0; i < data.length; i++) {
      List<int> row = [];
      for (int j = 0; j < other.data[0].length; j++) {
        int sum = 0;
        for (int k = 0; k < data[i].length; k++) {
          sum += data[i][k] * other.data[k][j];
        }
        row.add(sum);
      }
      result.add(row);
    }
    return Matrix(result);
  }
}

// 17. Создание игры с использованием ООП
class Player {
  String name;
  int health;
  Weapon weapon;

  Player(this.name, this.health, this.weapon);

  void attack(Enemy enemy) {
    enemy.takeDamage(weapon.damage);
  }
}

class Enemy {
  String name;
  int health;

  Enemy(this.name, this.health);

  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      print('$name defeated!');
    }
  }
}

class Weapon {
  String name;
  int damage;

  Weapon(this.name, this.damage);
}
// 18. Автоматизированная система заказов
class Order {
  int id;
  List<Product> products;

  Order(this.id, this.products);

  double getTotalCost() {
    return products.fold(0, (sum, product) => sum + product.price);
  }
}

class Customer {
  String name;
  List<Order> orders = [];

  Customer(this.name);

  void addOrder(Order order) {
    orders.add(order);
  }

  void displayOrderHistory() {
    for (var order in orders) {
      print('Order ID: ${order.id}, Total Cost: ${order.getTotalCost()}');
    }
  }
}

// 19. Наследование: Электроника
class Device {
  String brand;

  Device(this.brand);

  void turnOn() {
    print('$brand is turned on');
  }

  void turnOff() {
    print('$brand is turned off');
  }
}

class Smartphone extends Device {
  Smartphone(String brand) : super(brand);

  void takePhoto() {
    print('$brand is taking a photo');
  }
}

class Laptop extends Device {
  Laptop(String brand) : super(brand);

  void openLid() {
    print('$brand laptop lid is opened');
  }
}
// 20. Игра "Крестики-нолики"
class TicTacToeGame {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  Player player1;
  Player player2;
  Player currentPlayer;

  TicTacToeGame(this.player1, this.player2) : currentPlayer = player1;

  void makeMove(int row, int col) {
    if (board[row][col] == '') {
      board[row][col] = currentPlayer.name;
      if (checkWin()) {
        print('${currentPlayer.name} wins!');
      } else {
        currentPlayer = currentPlayer == player1 ? player2 : player1;
      }
    } else {
      print('Cell is already occupied');
    }
  }

  bool checkWin() {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] != '' && board[i][0] == board[i][1] && board[i][1] == board[i][2]) {
        return true;
      }
      if (board[0][i] != '' && board[0][i] == board[1][i] && board[1][i] == board[2][i]) {
        return true;
      }
    }
    if (board[0][0] != '' && board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      return true;
    }
    if (board[0][2] != '' && board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      return true;
    }
    return false;
  }
}
