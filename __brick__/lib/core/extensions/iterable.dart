extension IterablePlus<T> on Iterable<T> {
  /// Returns a new iterable with [element] replaced original value from the iterable
  ///
  /// [element] must be equatable for this to work.
  /// This method is for case when equality does't cover all properties of the object. For example, when you want to add an object with the same id but different name.
  /// In this case, you can override the == operator and return true only if the id is the same.
  Iterable<T> updateElement(T element) {
    return map((e) => e == element ? element : e);
  }

  /// Returns a new iterable with [element] added to it if the iterable
  /// doesn't already contain [element]. If the iterable does contain [element],
  /// returns a new iterable with the same elements as the original iterable.
  ///
  /// [element] must be equatable for this to work.
  /// This method is for case when equality does't cover all properties of the object. For example, when you want to add an object with the same id but different name.
  /// In this case, you can override the == operator and return true only if the id is the same.
  Iterable<T> addOrUpdateElement(T element) {
    return !contains(element) ? [...this, element] : updateElement(element);
  }
}
