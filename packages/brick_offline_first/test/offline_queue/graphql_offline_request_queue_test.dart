import 'package:brick_offline_first/src/offline_queue/graphql_request_sqlite_cache_manager.dart';
import 'package:brick_offline_first/src/offline_queue/graphql_offline_request_queue.dart';
import 'package:brick_offline_first/src/offline_queue/graphql_offline_queue_client.dart';
import 'package:gql_link/gql_link.dart';
import 'package:test/test.dart';

void main() {
  final offlineClient = GraphqlOfflineQueueClient(
    Link.split(
      (request) => false,
      const PassthroughLink(),
    ),
    GraphqlRequestSqliteCacheManager('db'),
  );

  group('GraphqlOfflineRequestQueue', () {
    test('#start', () {
      final queue = GraphqlOfflineRequestQueue(client: offlineClient);
      queue.start();
      expect(queue.isRunning, isTrue);
      queue.stop();
    });

    test('#stop', () {
      final queue = GraphqlOfflineRequestQueue(client: offlineClient);
      queue.start();
      expect(queue.isRunning, isTrue);
      queue.stop();
      expect(queue.isRunning, isFalse);
    });
  });
}
