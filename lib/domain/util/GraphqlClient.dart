import 'package:graphql/client.dart';

class GraphQLHelper {
  late GraphQLClient client;

  GraphQLHelper.client() {
    final Link _link = HttpLink(
      'http://192.168.0.13:5000',
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
