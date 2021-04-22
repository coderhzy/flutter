class Student extends Person {
  // 定义类的变量
  String _school; // 通过下划线来表示私有字段（变量）
  String city;
  String country;
  String name;
  String sub;

  /// 构造方法：
  /// 通过this._school初始化自有参数
  /// name,age交给父类进行初始化
  /// city是可选参数
  /// country是默认参数
  Student(this._school, String name, int age,
      // 使用{}这个时候city是可选参数，country是默认参数
      {this.city, this.country = 'China',this.sub})
      :
      // 如果我们在初始化name的时候，希望做一些调整，那么我们需要在初始化列表中去更改
      // 初始化列表： 除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，不同的初始化变量之间用逗号隔开
        name = '$country.$city',
        // 如果父类没有默认构造方法（无参的构造方法）,则需要在初始化列表中调用父类的构造方法进行初始化
        super(name, age) {
    // 构造方法方法体
    print('构造方法体不是必须的');
  }
}

/// 定义一个Dart类，所有的类都继承Object
class Person {
  String name;
  int age;

  // 类的构造方法,类的初始化
  // 标准构造函数
  Person(this.name, this.age);

  // override可以重载，这里重载Object方法
  // 重写父类的方法
  @override
  String toString() {
    return 'name:$name,age:$age';
  }
}
