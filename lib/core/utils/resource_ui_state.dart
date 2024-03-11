class ResourceUiState<T> {
  Status status;
  T? data;
  String? message;

  ResourceUiState({this.status = Status.ideal});

  ResourceUiState.loading({this.message}) : status = Status.loading;

  ResourceUiState.success({this.data}) : status = Status.success;

  ResourceUiState.error(this.message) : status = Status.error;

  ResourceUiState.empty() : status = Status.empty;

  ResourceUiState.ideal({this.data}) : status = Status.ideal;
}

enum Status { ideal, loading, success, error, empty }