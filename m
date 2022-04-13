Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42C610F1E2
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Apr 2022 10:28:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 13 Apr 2022 15:56:07 +0530
Message-Id: <20220413102608.1795110-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20220413102608.1795110-1-bhanuprakash.modem@intel.com>
References: <20220413102608.1795110-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/kms_flip: Add support to handle
 displays having 5k+ modes
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

As single crtc can handle max of 5k resolution, and we need one
more crtc to handle > 5k modes.

This patch will skip the scenarios where those crtc/mode combinations
won't fit.

Example:
Consider two 8K panels connected via DP-1 & DP-2 resp, and we have four
pipes (A-D) got enabled. So, below are the combos for basic subtest.

pipe-A-DP-1
pipe-B-DP-1
pipe-C-DP-1
pipe-D-DP-1 is not possible
pipe-A-DP-2
pipe-B-DP-2
pipe-C-DP-2
pipe-D-DP-2 is not possible
pipe-A-DP-1-pipe-B-DP-2 is not possible
pipe-A-DP-1-pipe-C-DP-2
pipe-A-DP-1-pipe-D-DP-2 is not possible
pipe-B-DP-1-pipe-A-DP-2 is not possible
pipe-B-DP-1-pipe-C-DP-2 is not possible
pipe-B-DP-1-pipe-D-DP-2 is not possible
pipe-C-DP-1-pipe-A-DP-2
pipe-C-DP-1-pipe-B-DP-2 is not possible
pipe-C-DP-1-pipe-D-DP-2 is not possible
pipe-D-DP-1-pipe-A-DP-2 is not possible
pipe-D-DP-1-pipe-B-DP-2 is not possible
pipe-D-DP-1-pipe-C-DP-2 is not possible

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 42 ++++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 0826015e..ce452dc8 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -81,6 +81,8 @@
 #define RUN_TEST		1
 #define RUN_PAIR		2
 
+#define MAX_HDISPLAY_PER_CRTC 5120
+
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
@@ -1364,14 +1366,7 @@ retry:
 
 	igt_flush_uevents(mon);
 
-	if (set_mode(o, o->fb_ids[0], 0, 0)) {
-		/* We may fail to apply the mode if there are hidden
-		 * constraints, such as bandwidth on the third pipe.
-		 */
-		igt_assert_f(crtc_count > 1 || crtc_idxs[0] < 2,
-			     "set_mode may only fail on the 3rd pipe or in multiple crtc tests\n");
-		goto out;
-	}
+	igt_assert(!set_mode(o, o->fb_ids[0], 0, 0));
 	igt_assert(fb_is_bound(o, o->fb_ids[0]));
 
 	vblank = kms_has_vblank(drm_fd);
@@ -1443,9 +1438,11 @@ out:
 }
 
 static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
-				 int crtc_count, int duration_ms)
+				 int crtc_count, int total_crtcs,
+				 int duration_ms)
 {
 	char test_name[128];
+	int i;
 
 	switch (crtc_count) {
 	case RUN_TEST:
@@ -1477,6 +1474,29 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 
 	igt_assert_eq(o->count, crtc_count);
 
+	/*
+	 * Handle BW limitations:
+	 *
+	 * if mode.hdisplay > 5120, then ignore
+	 *  - last crtc in single/multi-connector config
+	 *  - consecutive crtcs in multi-connector config
+	 *
+	 * in multi-connector config ignore if
+	 *  - previous crtc mode.hdisplay > 5120 and
+	 *  - current & previous crtcs are consecutive
+	 */
+	for (i = 0; i < crtc_count; i++) {
+		if (((o->kmode[i].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
+		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
+		    ((i > 0) && (o->kmode[i - 1].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
+
+			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
+			return;
+		}
+	}
+
 	igt_dynamic_f("%s", test_name)
 		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
 }
@@ -1538,7 +1558,8 @@ static int run_test(int duration, int flags)
 			o.depth = 24;
 
 			crtc_idx = n;
-			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST, duration);
+			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
+					     resources->count_crtcs, duration);
 		}
 	}
 
@@ -1607,6 +1628,7 @@ static int run_pair(int duration, int flags)
 
 					run_test_on_crtc_set(&o, crtc_idxs,
 							     RUN_PAIR,
+							     resources->count_crtcs,
 							     duration);
 				}
 			}
-- 
2.35.1
