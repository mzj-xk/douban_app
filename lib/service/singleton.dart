import 'package:douban/dio_util/dio_util.dart';

class Singleton {
  // 静态变量指向自身
  static final Singleton _instance = Singleton._();
  // 私有构造器
  Singleton._();
  // 方案1：静态方法获得实例变量
  static Singleton getInstance() => _instance;
  // 方案2：工厂构造方法获得实例变量
  factory Singleton() => _instance;
  // 方案3：静态属性获得实例变量
  static Singleton get instance => _instance;
}

// void main() {
//   Singleton s1 = Singleton();
//   Singleton s2 = Singleton();

//   print(s1 == s2); // true
// }

void main() {
  DioUtil d1 = DioUtil();
  DioUtil d2 = DioUtil();
  print(d1 == d2);
}
