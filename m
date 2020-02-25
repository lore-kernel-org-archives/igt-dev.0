Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01B6E0B9
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 23:05:57 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 25 Feb 2020 23:05:48 +0000
Message-Id: <20200225230548.1330092-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/sw_sync: Fix race condition for
 multi-producer termination
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Both the producer/consumer were using a timeout, relying on the consumer
completing after the producers -- which 50% of the time doesn't happen.
Close the timelines (previously leaked!) to cancel the producer threads.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/sw_sync.c | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tests/sw_sync.c b/tests/sw_sync.c
index 63791e0e8..d3d2bec15 100644
--- a/tests/sw_sync.c
+++ b/tests/sw_sync.c
@@ -487,7 +487,6 @@ static void * test_sync_multi_consumer_thread(void *arg)
 
 static void test_sync_multi_consumer(void)
 {
-
 	data_t data_arr[MULTI_CONSUMER_THREADS];
 	pthread_t thread_arr[MULTI_CONSUMER_THREADS];
 	sem_t sem;
@@ -620,10 +619,9 @@ static int test_mspc_wait_on_fence(int fence)
 
 static struct {
 	int threads;
-	int counter;
+	_Atomic(uint32_t) counter;
 	int cons_timeline;
 	int *prod_timeline;
-	pthread_mutex_t lock;
 } test_mpsc_data;
 
 static void *mpsc_producer_thread(void *d)
@@ -632,10 +630,14 @@ static void *mpsc_producer_thread(void *d)
 	int *prod_timeline = test_mpsc_data.prod_timeline;
 	int cons_timeline = test_mpsc_data.cons_timeline;
 	int seqno = 0;
-	int fence;
 
-	igt_until_timeout(1) {
-		fence = sw_sync_timeline_create_fence(cons_timeline, seqno++);
+	while (1) {
+		int fence;
+
+		fence = __sw_sync_timeline_create_fence(cons_timeline,
+							seqno++);
+		if (fence < 0)
+			break;
 
 		/* Wait for the consumer to finish. Use alternate
 		 * means of waiting on the fence
@@ -648,12 +650,7 @@ static void *mpsc_producer_thread(void *d)
 				     "Failure waiting on fence\n");
 		}
 
-		/* Every producer increments the counter, the consumer
-		 * checks and erases it
-		 */
-		pthread_mutex_lock(&test_mpsc_data.lock);
-		test_mpsc_data.counter++;
-		pthread_mutex_unlock(&test_mpsc_data.lock);
+		atomic_fetch_add(&test_mpsc_data.counter, 1);
 
 		sw_sync_timeline_inc(prod_timeline[id], 1);
 		close(fence);
@@ -664,16 +661,22 @@ static void *mpsc_producer_thread(void *d)
 
 static int mpsc_consumer_thread(void)
 {
-	int fence, merged, tmp, i;
 	int *prod_timeline = test_mpsc_data.prod_timeline;
 	int cons_timeline = test_mpsc_data.cons_timeline;
 	int n = test_mpsc_data.threads;
 	int seqno = 0;
 
 	igt_until_timeout(1) {
+		int fence;
+
 		fence = sw_sync_timeline_create_fence(prod_timeline[0],
 						      ++seqno);
-		for (i = 1; i < n; i++) {
+		if (fence < 0)
+			break;
+
+		for (int i = 1; i < n; i++) {
+			int tmp, merged;
+
 			tmp = sw_sync_timeline_create_fence(prod_timeline[i],
 							    seqno);
 			merged = sync_fence_merge(tmp, fence);
@@ -719,7 +722,6 @@ static void test_sync_multi_producer_single_consumer(void)
 	test_mpsc_data.cons_timeline = cons_timeline;
 	test_mpsc_data.threads = n;
 	test_mpsc_data.counter = 0;
-	pthread_mutex_init(&test_mpsc_data.lock, NULL);
 
 	for (i = 0; i < n; i++) {
 		pthread_create(&threads[i], NULL, (void * (*)(void *))
@@ -729,8 +731,11 @@ static void test_sync_multi_producer_single_consumer(void)
 
 	mpsc_consumer_thread();
 
-	for (i = 0; i < n; i++)
+	close(cons_timeline);
+	for (i = 0; i < n; i++) {
 		pthread_join(threads[i], NULL);
+		close(prod_timeline[i]);
+	}
 }
 
 static void test_sync_expired_merge(void)
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
