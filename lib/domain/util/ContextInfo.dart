import 'dart:async';
import 'dart:convert';
import 'package:fundamentalista_app/domain/model/Usuario.dart';
import 'package:universal_html/html.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'Constants.dart';

class ContextInfo {
  final _storage = new FlutterSecureStorage();
  final Storage _localStorage = window.localStorage;

  ContextInfo._();

  static final ContextInfo _instance = ContextInfo._();

  factory ContextInfo() {
    return _instance;
  }

  Future<void> clean() async {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      await _storage.deleteAll();
    } else {
      _localStorage.clear();
    }
  }

  Future<void> cleanByKey(String key) async {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      await _storage.delete(key: key);
    } else {
      _localStorage.remove(key);
    }
  }

  Future<void> save(String key, String value) async {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      await _storage.write(key: key, value: value);
    } else {
      //save to browser localStorage
      //CUIDADO - OS DADOS FICAM ABERTOS NO LOCALSTORAGE DO BROWSER
      _localStorage[key] = value;
    }
  }

  Future<String?> get(String key) async {
    if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      return _storage.read(key: key);
    } else {
      //return from browser localStorage, if exists
      return _localStorage[key];
    }
  }

  dynamic getFuture(String key) {
    return Future<dynamic>.delayed(
      Duration.zero,
      () => ContextInfo().get(key),
    );
  }

  Future<Usuario> getUsuario() async {
    String? strUser = await ContextInfo().get(KUsuarioModel);
    Usuario result = Usuario();
    if (strUser != null) {
      Map<String, dynamic> loginMap = jsonDecode(strUser) as Map<String, dynamic>;
      result = Usuario.fromJson(loginMap);
    }
    return result;
  }
}
