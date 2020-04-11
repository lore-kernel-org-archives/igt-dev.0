Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB5A6E055
 for <igt-dev@lists.freedesktop.org>; Sat, 11 Apr 2020 11:14:55 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 11 Apr 2020 12:14:27 +0100
Message-Id: <20200411111427.2749626-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
References: <20200411111427.2749626-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] kms_flip: Convert to dynamic CRTC test
 groups
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Use igt_dynamic_f for the dynamic discovered CRTC sets for each test.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Martin Peres <martin.peres@linux.intel.com>
---
 tests/kms_flip.c | 93 ++++++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 46 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 4535ecc8b..41d33f75a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1185,52 +1185,17 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 	o->vblank_interval = mean;
 }
 
-static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
-				 int crtc_count, int duration_ms)
+static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
+				   int crtc_count, int duration_ms)
 {
-	char test_name[128];
-	unsigned elapsed;
 	unsigned bo_size = 0;
+	bool vblank = true;
+	unsigned elapsed;
 	uint64_t tiling;
 	int i;
-	bool vblank = true;
-
-	switch (crtc_count) {
-	case RUN_TEST:
-		connector_find_preferred_mode(o->_connector[0], crtc_idxs[0], o);
-		if (!o->mode_valid)
-			return;
-		snprintf(test_name, sizeof(test_name),
-			 "%s on pipe %s, connector %s-%d",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(o->_pipe[0]),
-			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
-			 o->kconnector[0]->connector_type_id);
-		break;
-	case RUN_PAIR:
-		connector_find_compatible_mode(crtc_idxs[0], crtc_idxs[1], o);
-		if (!o->mode_valid)
-			return;
-		snprintf(test_name, sizeof(test_name),
-			 "%s on pipe %s:%s, connector %s-%d:%s-%d",
-			 igt_subtest_name(),
-			 kmstest_pipe_name(o->_pipe[0]),
-			 kmstest_pipe_name(o->_pipe[1]),
-			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
-			 o->kconnector[0]->connector_type_id,
-			 kmstest_connector_type_str(o->kconnector[1]->connector_type),
-			 o->kconnector[1]->connector_type_id);
-		break;
-	default:
-		igt_assert(0);
-	}
-
-	igt_assert_eq(o->count, crtc_count);
 
 	last_connector = o->kconnector[0];
 
-	igt_info("Beginning %s\n", test_name);
-
 	if (o->flags & TEST_PAN)
 		o->fb_width *= 2;
 
@@ -1274,7 +1239,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		 */
 		igt_assert_f(crtc_count > 1 || crtc_idxs[0] < 2,
 			     "set_mode may only fail on the 3rd pipe or in multiple crtc tests\n");
-		igt_info("\n%s: SKIPPED\n\n", test_name);
 		goto out;
 	}
 	igt_assert(fb_is_bound(o, o->fb_ids[0]));
@@ -1322,8 +1286,6 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	if (o->flags & TEST_VBLANK)
 		check_final_state(o, &o->vblank_state, elapsed);
 
-	igt_info("\n%s: PASSED\n\n", test_name);
-
 out:
 	igt_remove_fb(drm_fd, &o->fb_info[2]);
 	igt_remove_fb(drm_fd, &o->fb_info[1]);
@@ -1334,6 +1296,45 @@ out:
 	free_test_output(o);
 }
 
+static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
+				 int crtc_count, int duration_ms)
+{
+	char test_name[128];
+
+	switch (crtc_count) {
+	case RUN_TEST:
+		connector_find_preferred_mode(o->_connector[0], crtc_idxs[0], o);
+		if (!o->mode_valid)
+			return;
+		snprintf(test_name, sizeof(test_name),
+			 "%s::%s-%d",
+			 kmstest_pipe_name(o->_pipe[0]),
+			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
+			 o->kconnector[0]->connector_type_id);
+		break;
+	case RUN_PAIR:
+		connector_find_compatible_mode(crtc_idxs[0], crtc_idxs[1], o);
+		if (!o->mode_valid)
+			return;
+		snprintf(test_name, sizeof(test_name),
+			 "%s:%s::%s-%d:%s-%d",
+			 kmstest_pipe_name(o->_pipe[0]),
+			 kmstest_pipe_name(o->_pipe[1]),
+			 kmstest_connector_type_str(o->kconnector[0]->connector_type),
+			 o->kconnector[0]->connector_type_id,
+			 kmstest_connector_type_str(o->kconnector[1]->connector_type),
+			 o->kconnector[1]->connector_type_id);
+		break;
+	default:
+		igt_assert(0);
+	}
+
+	igt_assert_eq(o->count, crtc_count);
+
+	igt_dynamic_f("%s", test_name)
+		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
+}
+
 static int run_test(int duration, int flags)
 {
 	struct test_output o;
@@ -1584,7 +1585,7 @@ igt_main
 		test_nonblocking_read(drm_fd);
 
 	for (i = 0; i < sizeof(tests) / sizeof (tests[0]); i++) {
-		igt_subtest_f("%s%s",
+		igt_subtest_with_dynamic_f("%s%s",
 			      tests[i].flags & TEST_BASIC ? "basic-" : "",
 			      tests[i].name)
 			run_test(tests[i].duration, tests[i].flags);
@@ -1592,7 +1593,7 @@ igt_main
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
-		igt_subtest_f( "2x-%s", tests[i].name)
+		igt_subtest_with_dynamic_f("2x-%s", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
 
@@ -1618,13 +1619,13 @@ igt_main
 		if (tests[i].flags & (TEST_EINVAL | TEST_EBUSY | TEST_HANG))
 			continue;
 
-		igt_subtest_f( "%s-interruptible", tests[i].name)
+		igt_subtest_with_dynamic_f("%s-interruptible", tests[i].name)
 			run_test(tests[i].duration, tests[i].flags);
 
 		if (tests[i].flags & TEST_NO_2X_OUTPUT)
 			continue;
 
-		igt_subtest_f( "2x-%s-interruptible", tests[i].name)
+		igt_subtest_with_dynamic_f("2x-%s-interruptible", tests[i].name)
 			run_pair(tests[i].duration, tests[i].flags);
 	}
 	igt_stop_signal_helper();
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
