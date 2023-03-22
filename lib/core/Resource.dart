abstract class Resource<T> {}

class Success<T> extends Resource<T> {
  final T? data;
  Success({this.data});
}

class Error<T> extends Resource<T> {
  final T? message;
  Error({this.message});
}
