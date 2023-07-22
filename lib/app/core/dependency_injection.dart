final dependencies = AppDeps.instance();

class AppDeps {
  AppDeps._();

  factory AppDeps.instance() => _instance;

  static final _instance = AppDeps._();

  final _depsMap = <Type, dynamic>{};

  void register<T extends Object>(T instance) {
    _depsMap[T] = instance;
  }

  T get<T>() {
    return _depsMap[T] as T;
  }
}
