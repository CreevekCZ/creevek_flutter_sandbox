// example
enum Routes {
  home('/'),
  login('/login');

  const Routes(this.rawValue);
  final String rawValue;
}
