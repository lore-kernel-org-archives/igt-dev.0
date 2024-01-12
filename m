Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4210E149
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 22:32:04 +0000 (UTC)
Message-ID: <477888e4-637a-4704-88f5-cde3c10e0ae0@nvidia.com>
Date: Fri, 12 Jan 2024 14:31:58 -0800
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH v2] tests/syncobj_timeline: test delayed submission with,
 WAIT_AVAILABLE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The syncobj_timeline test suite includes cases where
drmSyncobjTimelineWait is called with the WAIT_FOR_SUBMIT flag before
the timeline point has been submitted. Then, after a short delay, the
timeline point does get submitted and signaled and the test verifies
that the drmSyncobjTimelineWait call is unblocked as expected.

Alas, while this was working correctly with the WAIT_FOR_SUBMIT flag, if
the WAIT_AVAILABLE flag is used instead the wait will *always* block for
the full timeout duration even if the timeline point is submitted
earlier due to a bug in the kernel. The return value would still
indicate that the wait completed successfully, though. That is, it
wouldn't return -ETIME.

To ensure test coverage for such a scenario, this change adds delayed
submission test cases which use the WAIT_AVAILABLE flag. These will be
similar to the WAIT_FOR_SUBMIT cases mentioned above except that, after
the delay, the timeline point will only submitted, not signaled.

Furthermore, it adds an assertion that the drmSyncobjTimelineWait call
returned *before* the timeout expired, which it always should since the
timeout is a full 100ms longer than the delay.

v1 -> v2: added documentation for new test cases

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 tests/syncobj_timeline.c | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index ea8341a30..25ccd6889 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -394,6 +394,9 @@
  * SUBTEST: wait-all-for-submit-delayed-submit
  * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
  *
+ * SUBTEST: wait-all-available-delayed-submit
+ * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
+ *
  * SUBTEST: wait-all-for-submit-snapshot
  * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
  *
@@ -425,6 +428,9 @@
  * SUBTEST: wait-for-submit-delayed-submit
  * Description: Verifies wait behavior on a timeline syncobj with a delayed signal from a different thread
  *
+ * SUBTEST: wait-available-delayed-submit
+ * Description: Verifies wait behavior on a timeline syncobj with a delayed submit from a different thread
+ *
  * SUBTEST: wait-for-submit-snapshot
  * Description: Verifies waiting on a list of timeline syncobjs with different thread for wait/signal
  */
@@ -490,6 +496,13 @@ syncobj_trigger(int fd, uint32_t handle, uint64_t point)
 	close(timeline);
 }
 
+static void
+syncobj_submit(int fd, uint32_t handle, uint64_t point)
+{
+	int timeline = syncobj_attach_sw_sync(fd, handle, point);
+	close(timeline);
+}
+
 static timer_t
 set_timer(void (*cb)(union sigval), void *ptr, int i, uint64_t nsec)
 {
@@ -534,8 +547,17 @@ syncobj_trigger_free_pair_func(union sigval sigval)
 	free(pair);
 }
 
+static void
+syncobj_submit_free_pair_func(union sigval sigval)
+{
+	struct fd_handle_pair *pair = sigval.sival_ptr;
+	syncobj_submit(pair->fd, pair->handle, pair->point);
+	free(pair);
+}
+
 static timer_t
-syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
+syncobj_delayed_operation(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec,
+			  void (*operation)(union sigval))
 {
 	struct fd_handle_pair *pair = malloc(sizeof(*pair));
 
@@ -543,7 +565,7 @@ syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
 	pair->handle = syncobj;
 	pair->point = point;
 
-	return set_timer(syncobj_trigger_free_pair_func, pair, 0, nsec);
+	return set_timer(operation, pair, 0, nsec);
 }
 
 static const char *test_wait_bad_flags_desc =
@@ -942,18 +964,26 @@ test_wait_delayed_signal(int fd, uint32_t test_flags)
 	uint64_t point = 1;
 	int timeline = -1;
 	timer_t timer;
+	uint64_t start_time;
 
 	if (test_flags & WAIT_FOR_SUBMIT) {
-		timer = syncobj_trigger_delayed(fd, syncobj, point, SHORT_TIME_NSEC);
+		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
+						  syncobj_trigger_free_pair_func);
+	} else if (test_flags & WAIT_AVAILABLE) {
+		timer = syncobj_delayed_operation(fd, syncobj, point, SHORT_TIME_NSEC,
+						  syncobj_submit_free_pair_func);
 	} else {
 		timeline = syncobj_attach_sw_sync(fd, syncobj, point);
 		timer = set_timer(timeline_inc_func, NULL,
 				  timeline, SHORT_TIME_NSEC);
 	}
 
+	start_time = gettime_ns();
 	igt_assert(syncobj_timeline_wait(fd, &syncobj, &point, 1,
-				gettime_ns() + SHORT_TIME_NSEC * 2,
+				start_time + SHORT_TIME_NSEC * 2,
 				flags, NULL));
+	/* ensure we were unblocked before the timeout expired */
+	igt_assert(gettime_ns() - start_time < SHORT_TIME_NSEC * 2);
 
 	timer_delete(timer);
 
@@ -1809,6 +1839,10 @@ igt_main
 	igt_subtest("wait-for-submit-delayed-submit")
 		test_wait_delayed_signal(fd, WAIT_FOR_SUBMIT);
 
+	igt_describe(test_wait_delayed_signal_desc);
+	igt_subtest("wait-available-delayed-submit")
+		test_wait_delayed_signal(fd, WAIT_AVAILABLE);
+
 	igt_describe(test_wait_delayed_signal_desc);
 	igt_subtest("wait-all-delayed-signal")
 		test_wait_delayed_signal(fd, WAIT_ALL);
@@ -1817,6 +1851,10 @@ igt_main
 	igt_subtest("wait-all-for-submit-delayed-submit")
 		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_FOR_SUBMIT);
 
+	igt_describe(test_wait_delayed_signal_desc);
+	igt_subtest("wait-all-available-delayed-submit")
+		test_wait_delayed_signal(fd, WAIT_ALL | WAIT_AVAILABLE);
+
 	igt_describe(test_reset_unsignaled_desc);
 	igt_subtest("reset-unsignaled")
 		test_reset_unsignaled(fd);
-- 
2.43.0

