import 'package:either_dart/either.dart';

import 'zerror.dart';

typedef Result<T> = Either<ZError, T>;

typedef AsyncResult<T> = Future<Result<T>>;

AsyncResult<T> asyncResult<T>(T value) => Future.value(Right(value));

AsyncResult<T> asyncError<T>(ZError error) => Future.value(Left(error));

extension EitherX<L, R> on Either<L, R> {
  Either<L, R> withRight(void Function(R) block) {
    if (isRight) block.call(right);
    return this;
  }

  Either<L, R> withLeft(void Function(L) block) {
    if (isLeft) block.call(left);
    return this;
  }
}

extension AsyncResultX<T> on AsyncResult<T> {
  AsyncResult<T> withRight(void Function(T) block) =>
      then((either) => either.withRight(block));

  AsyncResult<T> withLeft(void Function(ZError) error) =>
      then((either) => either.withLeft(error));
}
