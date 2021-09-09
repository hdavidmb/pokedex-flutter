import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_failure.freezed.dart';

@freezed
class DatabaseFailure with _$DatabaseFailure {
  const DatabaseFailure._();
  const factory DatabaseFailure.noConnection() = NoConnection;
  const factory DatabaseFailure.serverFailure() = ServerFailure;
}
