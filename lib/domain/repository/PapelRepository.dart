import 'package:fundamentalista_app/domain/model/Papel.dart';
import 'dart:developer' as developer;

import 'package:fundamentalista_app/domain/util/GraphqlClient.dart';
import 'package:graphql/client.dart';

class PapelRepository {
  GraphQLHelper _helper = GraphQLHelper.client();

  Future<List<Papel>> analisar() async {
    developer.log('analisar', name: 'domain.repository.PapelRepository');
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

    final QueryResult result = await _helper.client.query(options);
    if (result.hasException) {
      developer.log('analisar error', name: 'domain.repository.PapelRepository', error: result.exception.toString());
    }
    developer.log('analisar - sucesso', name: 'domain.repository.PapelRepository');
    final List<dynamic> listaPapeis = result.data!['papelAnalizar'] as List<dynamic>;
    if (listaPapeis.isNotEmpty) {
      listaPapeis.forEach((dynamic parsedJson) => {
            resultado.add(Papel.fromJson(parsedJson as Map<String, dynamic>)),
          });
    }

    return resultado;
  }
}
