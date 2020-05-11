Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD7A891FA
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2020 18:26:15 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 11 May 2020 21:25:34 +0300
Message-Id: <20200511182534.14395-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: Retry test in case of a
 DP/HDMI link reset
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

At least an IIyama and LG monitor have a strange behaviour when waking
from a power saving state and getting enabled with an otherwise
successful modeset: after the modeset in ~2 sec they signal a bad link
state, either due to a lost CR/EQ in case of DP or a lost
scrambling/TMDS clock setting in case of HDMI link. In response the
driver resets the link with either a link-retraining or a modeset, which
in turn makes the test miss vblank/flip events and fail.

Work around the above issue, by retrying the test once if the test
detects after a failure that a link reset happened during the test and a
corresponding hotplug uevent was sent by the driver.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_flip.c | 113 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 31 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5e3e196c0..84cfdd363 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -482,7 +482,7 @@ static void vblank_handler(int fd, unsigned int frame, unsigned int sec,
 	fixup_premature_vblank_ts(o, &o->vblank_state);
 }
 
-static void check_state(const struct test_output *o, const struct event_state *es)
+static bool check_state(const struct test_output *o, const struct event_state *es)
 {
 	struct timeval diff;
 
@@ -496,7 +496,7 @@ static void check_state(const struct test_output *o, const struct event_state *e
 	}
 
 	if (es->count == 0)
-		return;
+		return true;
 
 	timersub(&es->current_ts, &es->last_received_ts, &diff);
 	igt_assert_f(timercmp(&es->last_received_ts, &es->current_ts, <),
@@ -507,10 +507,12 @@ static void check_state(const struct test_output *o, const struct event_state *e
 	/* check only valid if no modeset happens in between, that increments by
 	 * (1 << 23) on each step. This bounding matches the one in
 	 * DRM_IOCTL_WAIT_VBLANK. */
-	if (!(o->flags & (TEST_DPMS | TEST_MODESET | TEST_NO_VBLANK)))
-		igt_assert_f(es->current_seq - (es->last_seq + o->seq_step) <= 1UL << 23,
-			     "unexpected %s seq %u, should be >= %u\n",
-			     es->name, es->current_seq, es->last_seq + o->seq_step);
+	if (!(o->flags & (TEST_DPMS | TEST_MODESET | TEST_NO_VBLANK)) &&
+	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
+		igt_debug("unexpected %s seq %u, should be >= %u\n",
+			  es->name, es->current_seq, es->last_seq + o->seq_step);
+		return false;
+	}
 
 	if (o->flags & TEST_CHECK_TS) {
 		double elapsed, expected;
@@ -525,17 +527,25 @@ static void check_state(const struct test_output *o, const struct event_state *e
 			  elapsed, expected, expected * 0.005,
 			  fabs((elapsed - expected) / expected) * 100);
 
-		igt_assert_f(fabs((elapsed - expected) / expected) <= 0.005,
-			     "inconsistent %s ts/seq: last %.06f/%u, current %.06f/%u: elapsed=%.1fus expected=%.1fus\n",
-			     es->name, timeval_float(&es->last_ts), es->last_seq,
-			     timeval_float(&es->current_ts), es->current_seq,
-			     elapsed, expected);
+		if (fabs((elapsed - expected) / expected) > 0.005) {
+			igt_debug("inconsistent %s ts/seq: last %.06f/%u, current %.06f/%u: elapsed=%.1fus expected=%.1fus\n",
+				  es->name, timeval_float(&es->last_ts), es->last_seq,
+				  timeval_float(&es->current_ts), es->current_seq,
+				  elapsed, expected);
 
-		igt_assert_f(es->current_seq == es->last_seq + o->seq_step,
-			     "unexpected %s seq %u, expected %u\n",
-			     es->name, es->current_seq,
-			     es->last_seq + o->seq_step);
+			return false;
+		}
+
+		if (es->current_seq != es->last_seq + o->seq_step) {
+			igt_debug("unexpected %s seq %u, expected %u\n",
+				  es->name, es->current_seq,
+				  es->last_seq + o->seq_step);
+
+			return false;
+		}
 	}
+
+	return true;
 }
 
 static void check_state_correlation(struct test_output *o,
@@ -562,7 +572,7 @@ static void check_state_correlation(struct test_output *o,
 		     es1->name, es2->name, usec_diff / USEC_PER_SEC);
 }
 
-static void check_all_state(struct test_output *o,
+static bool check_all_state(struct test_output *o,
 			    unsigned int completed_events)
 {
 	bool flip, vblank;
@@ -570,14 +580,17 @@ static void check_all_state(struct test_output *o,
 	flip = completed_events & EVENT_FLIP;
 	vblank = completed_events & EVENT_VBLANK;
 
-	if (flip)
-		check_state(o, &o->flip_state);
-	if (vblank)
-		check_state(o, &o->vblank_state);
+	if (flip && !check_state(o, &o->flip_state))
+		return false;
+
+	if (vblank && !check_state(o, &o->vblank_state))
+		return false;
 
 	/* FIXME: Correlation check is broken. */
 	if (flip && vblank && 0)
 		check_state_correlation(o, &o->flip_state, &o->vblank_state);
+
+	return true;
 }
 
 static void recreate_fb(struct test_output *o)
@@ -982,7 +995,7 @@ static bool fb_is_bound(struct test_output *o, int fb)
 	return true;
 }
 
-static void check_final_state(const struct test_output *o,
+static bool check_final_state(const struct test_output *o,
 			      const struct event_state *es,
 			      unsigned int elapsed)
 {
@@ -999,11 +1012,16 @@ static void check_final_state(const struct test_output *o,
 		igt_debug("expected %d, counted %d, encoder type %d\n",
 			  (int)(elapsed / actual_frame_time(o)), count,
 			  o->kencoder[0]->encoder_type);
-		igt_assert_f(elapsed >= min && elapsed <= max,
-			     "dropped frames, expected %d, counted %d, encoder type %d\n",
-			     (int)(elapsed / actual_frame_time(o)), count,
-			     o->kencoder[0]->encoder_type);
+		if (elapsed < min || elapsed > max) {
+			igt_debug("dropped frames, expected %d, counted %d, encoder type %d\n",
+				  (int)(elapsed / actual_frame_time(o)), count,
+				  o->kencoder[0]->encoder_type);
+
+			return false;
+		}
 	}
+
+	return true;
 }
 
 /*
@@ -1050,7 +1068,8 @@ static unsigned int wait_for_events(struct test_output *o)
 }
 
 /* Returned the elapsed time in us */
-static unsigned event_loop(struct test_output *o, unsigned duration_ms)
+static bool event_loop(struct test_output *o, unsigned duration_ms,
+		       unsigned *elapsed)
 {
 	unsigned long start, end;
 	int count = 0;
@@ -1063,7 +1082,10 @@ static unsigned event_loop(struct test_output *o, unsigned duration_ms)
 		completed_events = run_test_step(o);
 		if (o->pending_events)
 			completed_events |= wait_for_events(o);
-		check_all_state(o, completed_events);
+
+		if (!check_all_state(o, completed_events))
+			return false;
+
 		update_all_state(o, completed_events);
 
 		if (count && (gettime_us() - start) / 1000 >= duration_ms)
@@ -1078,7 +1100,9 @@ static unsigned event_loop(struct test_output *o, unsigned duration_ms)
 	if (o->pending_events)
 		wait_for_events(o);
 
-	return end - start;
+	*elapsed = end - start;
+
+	return true;
 }
 
 static void free_test_output(struct test_output *o)
@@ -1188,8 +1212,11 @@ static void calibrate_ts(struct test_output *o, int crtc_idx)
 static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 				   int crtc_count, int duration_ms)
 {
+	struct udev_monitor *mon = igt_watch_hotplug();
 	unsigned bo_size = 0;
 	bool vblank = true;
+	bool retried = false;
+	bool state_ok;
 	unsigned elapsed;
 	uint64_t tiling;
 	int i;
@@ -1231,8 +1258,11 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	for (i = 0; i < o->count; i++)
 		kmstest_dump_mode(&o->kmode[i]);
 
+retry:
 	kmstest_unset_all_crtcs(drm_fd, resources);
 
+	igt_flush_hotplugs(mon);
+
 	if (set_mode(o, o->fb_ids[0], 0, 0)) {
 		/* We may fail to apply the mode if there are hidden
 		 * constraints, such as bandwidth on the third pipe.
@@ -1279,12 +1309,31 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	/* We run the vblank and flip actions in parallel by default. */
 	o->seq_step = max(o->vblank_state.seq_step, o->flip_state.seq_step);
 
-	elapsed = event_loop(o, duration_ms);
+	state_ok = event_loop(o, duration_ms, &elapsed);
 
 	if (o->flags & TEST_FLIP && !(o->flags & TEST_NOEVENT))
-		check_final_state(o, &o->flip_state, elapsed);
+		state_ok &= check_final_state(o, &o->flip_state, elapsed);
 	if (o->flags & TEST_VBLANK)
-		check_final_state(o, &o->vblank_state, elapsed);
+		state_ok &= check_final_state(o, &o->vblank_state, elapsed);
+
+	/*
+	 * Some monitors with odd behavior signal a bad link after waking from
+	 * a power saving state and the subsequent (successful) modeset. This
+	 * will result in a link-retraining (DP) or async modeset (HDMI),
+	 * which in turn makes the test miss vblank/flip events and fail.
+	 * Work around this by retrying the test once in case of such a link
+	 * reset event, which the driver signals with a hotplug event.
+	 */
+	if (!state_ok) {
+		igt_assert(!retried && igt_hotplug_detected(mon, 3));
+		igt_debug("Retrying after a hotplug event\n");
+
+		retried = true;
+		memset(&o->vblank_state, 0, sizeof(o->vblank_state));
+		memset(&o->flip_state, 0, sizeof(o->flip_state));
+
+		goto retry;
+	}
 
 out:
 	igt_remove_fb(drm_fd, &o->fb_info[2]);
@@ -1294,6 +1343,8 @@ out:
 	last_connector = NULL;
 
 	free_test_output(o);
+
+	igt_cleanup_hotplug(mon);
 }
 
 static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
