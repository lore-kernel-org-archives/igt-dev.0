Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC2010E3E0
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 15:09:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:33:23 +0530
Message-Id: <20230629150324.3079878-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629150324.3079878-1-bhanuprakash.modem@intel.com>
References: <20230629150324.3079878-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 4/5] tests/kms_flip: Fix Bigjoiner checks
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

Bigjoiner will come in the picture when the resolution > 5K or
clock > max dot-clock. Add a support to check the selected mode
clock is greater than the max dot-clock.

V2: - Limit the bigjoiner checks to intel hardware

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_flip.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index d57990240..9e38eaf6a 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -87,8 +87,6 @@
 #define RUN_TEST		1
 #define RUN_PAIR		2
 
-#define MAX_HDISPLAY_PER_CRTC 5120
-
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
@@ -102,6 +100,7 @@ uint32_t devid;
 int test_time = 3;
 static bool monotonic_timestamp;
 static pthread_t vblank_wait_thread;
+static int max_dotclock;
 
 static drmModeConnector *last_connector;
 
@@ -1535,21 +1534,24 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	igt_assert_eq(o->count, crtc_count);
 
 	/*
-	 * Handle BW limitations:
+	 * Handle BW limitations on intel hardware:
 	 *
-	 * if mode.hdisplay > 5120, then ignore
+	 * if mode resolution > 5K (or) mode clock > max_dotclock, then ignore
 	 *  - last crtc in single/multi-connector config
 	 *  - consecutive crtcs in multi-connector config
 	 *
 	 * in multi-connector config ignore if
-	 *  - previous crtc mode.hdisplay > 5120 and
+	 *  - previous crtc (mode resolution > 5K or mode clock > max_dotclock) and
 	 *  - current & previous crtcs are consecutive
 	 */
+	if (!is_intel_device(drm_fd))
+		goto test;
+
 	for (i = 0; i < crtc_count; i++) {
-		if (((o->kmode[i].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		if ((igt_bigjoiner_possible(&o->kmode[i], max_dotclock) &&
 		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
 		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
-		    ((i > 0) && (o->kmode[i - 1].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		    ((i > 0) && igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock) &&
 		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
 
 			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
@@ -1557,6 +1559,7 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 		}
 	}
 
+test:
 	igt_dynamic_f("%s", test_name)
 		__run_test_on_crtc_set(o, crtc_idxs, crtc_count, duration_ms);
 }
@@ -1867,6 +1870,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++)
 				tests[i].flags &= ~(TEST_CHECK_TS | TEST_VBLANK_EXPIRED_SEQ);
 		}
+		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
 	igt_describe("Tests that nonblocking reading fails correctly");
-- 
2.40.0
