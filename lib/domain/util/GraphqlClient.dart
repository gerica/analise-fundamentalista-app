import 'package:graphql/client.dart';

class GraphQLHelper {
  late GraphQLClient client;

  GraphQLHelper.client() {
    final policies = Policies(
      fetch: FetchPolicy.networkOnly,
    );

    final Link _link = HttpLink(
      'http://192.168.0.12:5000',
      // 'https://fundamentalista-api.herokuapp.com/',
    );

    client = GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
      defaultPolicies: DefaultPolicies(
        watchQuery: policies,
        query: policies,
        mutate: policies,
      ),
    );
  }
}
