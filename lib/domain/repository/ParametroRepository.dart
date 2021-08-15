import 'package:flutter/services.dart';
import 'package:fundamentalista_app/domain/model/Parametro.dart';
import 'dart:developer' as developer;

import 'package:fundamentalista_app/domain/util/GraphqlClient.dart';
import 'package:graphql/client.dart';

class ParametroRepository {
  GraphQLHelper _helper = GraphQLHelper.client();

  Future<List<Parametro>> recuperar() async {
    developer.log('Recuperar', name: this.toString());
    List<Parametro> resultado = [];

    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
         query {       
           parametroMany {
            _id
            descricao
            ativo
            valorRef
            maiorMelhor    
          }
        }
      ''',
      ),
    );
    try {
      final QueryResult result = await _helper.client.query(options);
      if (result.hasException) {
        developer.log('analisar error', name: this.toString(), error: result.exception.toString());
        throw new PlatformException(code: '400', message: result.exception.toString());
      }
      final List<dynamic> listaRsult = result.data!['parametroMany'] as List<dynamic>;
      if (listaRsult.isNotEmpty) {
        listaRsult.forEach((dynamic parsedJson) => {
              resultado.add(Parametro.fromJson(parsedJson as Map<String, dynamic>)),
            });
      }
    } catch (error) {
      throw new PlatformException(code: '400', message: error.toString());
    }

    return resultado;
  }

  Future<String> alterar(Parametro parametro) async {
    developer.log('Alterar', name: this.toString());
    final MutationOptions options = MutationOptions(
      document: gql(
        r'''
         mutation UpdateById($id: MongoID!, $ativo: Boolean!, $maiorMelhor: Boolean!, $valorRef: Float!){       
          parametroUpdateById(_id:$id, record:{
                  ativo: $ativo
                  maiorMelhor: $maiorMelhor
                  valorRef: $valorRef
                  }) {
            recordId
          }
         }
      ''',
      ),
      variables: <String, dynamic>{
        'id': parametro.id,
        'ativo': parametro.ativo,
        'maiorMelhor': parametro.maiorMelhor,
        'valorRef': parametro.valorRef,
      },
    );
    try {
      final QueryResult result = await _helper.client.mutate(options);
      if (result.hasException) {
        developer.log('analisar error', name: this.toString(), error: result.exception.toString());
      }
      developer.log('analisar - sucesso', name: this.toString());
      return "Operação realizada com suesso";
    } catch (error) {
      throw new PlatformException(code: '400', message: error.toString());
    }
  }
}
