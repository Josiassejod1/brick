import 'package:brick_offline_first/src/offline_queue/rest_offline_request_queue.dart';
import 'package:brick_offline_first/src/offline_queue/rest_request_sqlite_cache_manager.dart';
import 'package:test/test.dart';
import 'package:brick_offline_first/src/offline_queue/offline_queue_http_client.dart';

import '__helpers__.dart';

void main() {
  final offlineClient = OfflineQueueHttpClient(stubResult(), RestRequestSqliteCacheManager('db'));

  group('OfflineRestRequestQueue', () {
    test('#start', () {
      final queue = RestOfflineRequestQueue(client: offlineClient);
      queue.start();
      expect(queue.isRunning, isTrue);
      queue.stop();
    });

    test('#stop', () {
      final queue = RestOfflineRequestQueue(client: offlineClient);
      queue.start();
      expect(queue.isRunning, isTrue);
      queue.stop();
      expect(queue.isRunning, isFalse);
    });
  });
}
