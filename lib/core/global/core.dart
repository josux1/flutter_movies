import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final logger = Logger();
final net = Connectivity();
final dioGlobal = Dio(BaseOptions());
