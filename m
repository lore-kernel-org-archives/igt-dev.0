Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784B910E0E3
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 22:17:10 +0000 (UTC)
Message-ID: <58b60f0a-f28b-42b5-b94b-91c8a5db8465@nvidia.com>
Date: Fri, 12 Jan 2024 14:17:02 -0800
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
From: Erik Kurzinger <ekurzinger@nvidia.com>
Subject: [PATCH] tests/syncobj_timeline: test delayed submission with,
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

Signed-off-by: Erik Kurzinger <ekurzinger@nvidia.com>
---
 tests/syncobj_timeline.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/tests/syncobj_timeline.c b/tests/syncobj_timeline.c
index ea8341a30..1815c2941 100644
--- a/tests/syncobj_timeline.c
+++ b/tests/syncobj_timeline.c
@@ -490,6 +490,13 @@ syncobj_trigger(int fd, uint32_t handle, uint64_t point)
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
@@ -534,8 +541,17 @@ syncobj_trigger_free_pair_func(union sigval sigval)
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
 
@@ -543,7 +559,7 @@ syncobj_trigger_delayed(int fd, uint32_t syncobj, uint64_t point, uint64_t nsec)
 	pair->handle = syncobj;
 	pair->point = point;
 
-	return set_timer(syncobj_trigger_free_pair_func, pair, 0, nsec);
+	return set_timer(operation, pair, 0, nsec);
 }
 
 static const char *test_wait_bad_flags_desc =
@@ -942,18 +958,26 @@ test_wait_delayed_signal(int fd, uint32_t test_flags)
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
 
@@ -1809,6 +1833,10 @@ igt_main
 	igt_subtest("wait-for-submit-delayed-submit")
 		test_wait_delayed_signal(fd, WAIT_FOR_SUBMIT);
 
+	igt_describe(test_wait_delayed_signal_desc);
+	igt_subtest("wait-available-delayed-submit")
+		test_wait_delayed_signal(fd, WAIT_AVAILABLE);
+
 	igt_describe(test_wait_delayed_signal_desc);
 	igt_subtest("wait-all-delayed-signal")
 		test_wait_delayed_signal(fd, WAIT_ALL);
@@ -1817,6 +1845,10 @@ igt_main
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

