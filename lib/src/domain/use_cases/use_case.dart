import 'dart:async';

import 'package:dartz/dartz.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<L extends Exception, R, Param> {
  FutureOr<Either<L, R>> call(Param param);
}
