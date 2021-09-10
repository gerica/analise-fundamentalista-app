import 'package:flutter/services.dart';
import 'package:fundamentalista_app/domain/model/Papel.dart';

import 'package:fundamentalista_app/domain/util/GraphqlClient.dart';
import 'package:graphql/client.dart';
import 'package:logger/logger.dart';

class PapelRepository {
  var logger = Logger();
  GraphQLHelper _helper = GraphQLHelper.client();

  Future<List<Papel>> analisar() async {
    List<Papel> resultado = [];

    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
         query papelAnalizar {       
          papelAnalizar {
            nome
            papel
            fundamentos {
              descricao
              valor
            }
            rank
          }
        }
      ''',
      ),
    );
    try {
      // logger.v("Verbose log");
      //
      // logger.d("Debug log");

      logger.i("analisar");

      // logger.w("Warning log");
      //
      // logger.e("Error log");
      //
      // logger.wtf("What a terrible failure log");
      final QueryResult result = await _helper.client.query(options);
      if (result.hasException) {
        logger.e(result.exception.toString());
      }
      logger.i('analisar - sucesso');
      final List<dynamic> listaPapeis = result.data!['papelAnalizar'] as List<dynamic>;
      if (listaPapeis.isNotEmpty) {
        listaPapeis.forEach((dynamic parsedJson) => {
              resultado.add(Papel.fromJson(parsedJson as Map<String, dynamic>)),
            });
      }
    } catch (error) {
      throw new PlatformException(code: '400', message: error.toString());
    }

    return resultado;
  }

  Future<String> carga() async {
    logger.i('Carga');
    final MutationOptions options = MutationOptions(
      document: gql(
        r'''
         mutation {       
          carga 
         }
      ''',
      ),
    );
    try {
      final QueryResult result = await _helper.client.mutate(options);
      if (result.hasException) {
        logger.e(result.exception.toString());
      }
      logger.i('analisar - sucesso');
      return result.data!['carga'] as String;
    } catch (error) {
      throw new PlatformException(code: '400', message: error.toString());
    }
  }
}
