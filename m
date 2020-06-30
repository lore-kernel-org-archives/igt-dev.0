Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50F06E43C
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 16:03:55 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 30 Jun 2020 19:03:43 +0300
Message-Id: <20200630160344.15886-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_flip: Check for link reset
 during TS calibration as well
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

The timestamp calibration can fail when using certain monitors with a
behavior described in

commit 60e8be7ccc72086a88d2eff3bcd02495fad5fa46
Author: Imre Deak <imre.deak@intel.com>
Date:   Mon May 11 22:08:53 2020 +0300

    tests/kms_flip: Retry test in case of a DP/HDMI link reset

As in the above commit, retry the calibration once if a hotplug was
detected during the calibration.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_flip.c | 75 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 23 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 3a7314ad..86c5e871 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1115,7 +1115,7 @@ static void free_test_output(struct test_output *o)
 	}
 }
 
-static void calibrate_ts(struct test_output *o, int crtc_idx)
+static bool calibrate_ts(struct test_output *o, int crtc_idx)
 {
 #define CALIBRATE_TS_STEPS 16
 	drmVBlank wait;
@@ -1125,6 +1125,7 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 	double expected;
 	double mean;
 	double stddev;
+	bool failed = false;
 	int n;
 
 	memset(&wait, 0, sizeof(wait));
@@ -1176,7 +1177,18 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 			igt_assert_eq(errno, EINTR);
 		}
 		igt_assert(read(drm_fd, &ev, sizeof(ev)) == sizeof(ev));
-		igt_assert_eq(ev.sequence, last_seq + 1);
+
+		if (failed)
+			continue;
+
+		if (ev.sequence != last_seq + 1) {
+			igt_debug("Unexpected frame sequence %d vs. expected %d\n",
+				  ev.sequence, last_seq + 1);
+			failed = true;
+
+			/* Continue to flush all the events queued up */
+			continue;
+		}
 
 		now = ev.tv_sec;
 		now *= 1000000;
@@ -1188,6 +1200,9 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 		last_seq = ev.sequence;
 	}
 
+	if (failed)
+		return false;
+
 	expected = mode_frame_time(o);
 
 	mean = igt_stats_get_mean(&stats);
@@ -1207,6 +1222,30 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 	}
 
 	o->vblank_interval = mean;
+
+	return true;
+}
+
+/*
+ * Some monitors with odd behavior signal a bad link after waking from a power
+ * saving state and the subsequent (successful) modeset. This will result in a
+ * link-retraining (DP) or async modeset (HDMI), which in turn makes the test
+ * miss vblank/flip events and fail.  Work around this by retrying the test
+ * once in case of such a link reset event, which the driver signals with a
+ * hotplug event.
+ */
+static bool needs_retry_after_link_reset(struct udev_monitor *mon)
+{
+	bool hotplug_detected;
+
+	igt_suspend_signal_helper();
+	hotplug_detected = igt_hotplug_detected(mon, 3);
+	igt_resume_signal_helper();
+
+	if (hotplug_detected)
+		igt_debug("Retrying after a hotplug event\n");
+
+	return hotplug_detected;
 }
 
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
@@ -1259,6 +1298,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		kmstest_dump_mode(&o->kmode[i]);
 
 retry:
+	memset(&o->vblank_state, 0, sizeof(o->vblank_state));
+	memset(&o->flip_state, 0, sizeof(o->flip_state));
+
 	kmstest_unset_all_crtcs(drm_fd, resources);
 
 	igt_flush_uevents(mon);
@@ -1282,8 +1324,13 @@ retry:
 	}
 
 	/* quiescent the hw a bit so ensure we don't miss a single frame */
-	if (o->flags & TEST_CHECK_TS)
-		calibrate_ts(o, crtc_idxs[0]);
+	if (o->flags & TEST_CHECK_TS && !calibrate_ts(o, crtc_idxs[0])) {
+		igt_assert(!retried && needs_retry_after_link_reset(mon));
+
+		retried = true;
+
+		goto retry;
+	}
 
 	if (o->flags & TEST_BO_TOOBIG) {
 		int err = do_page_flip(o, o->fb_ids[1], true);
@@ -1316,28 +1363,10 @@ retry:
 	if (o->flags & TEST_VBLANK)
 		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
 
-	/*
-	 * Some monitors with odd behavior signal a bad link after waking from
-	 * a power saving state and the subsequent (successful) modeset. This
-	 * will result in a link-retraining (DP) or async modeset (HDMI),
-	 * which in turn makes the test miss vblank/flip events and fail.
-	 * Work around this by retrying the test once in case of such a link
-	 * reset event, which the driver signals with a hotplug event.
-	 */
 	if (!state_ok) {
-		bool hotplug_detected;
+		igt_assert(!retried && needs_retry_after_link_reset(mon));
 
-		igt_suspend_signal_helper();
-		if (!retried)
-			hotplug_detected = igt_hotplug_detected(mon, 3);
-		igt_resume_signal_helper();
-
-		igt_assert(!retried && hotplug_detected);
-
-		igt_debug("Retrying after a hotplug event\n");
 		retried = true;
-		memset(&o->vblank_state, 0, sizeof(o->vblank_state));
-		memset(&o->flip_state, 0, sizeof(o->flip_state));
 
 		goto retry;
 	}
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
