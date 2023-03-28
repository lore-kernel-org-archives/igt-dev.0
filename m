Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0292510E89A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 12:36:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 ankit.k.nautiyal@intel.com, karthik.b.s@intel.com
Date: Tue, 28 Mar 2023 18:02:09 +0530
Message-Id: <20230328123210.3781976-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230328123210.3781976-1-bhanuprakash.modem@intel.com>
References: <20230328123210.3781976-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 5/6] tests/kms_flip: Fix Bigjoiner checks
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_flip.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 5e82f4a2f84..7cb8749c930 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -81,8 +81,6 @@
 #define RUN_TEST		1
 #define RUN_PAIR		2
 
-#define MAX_HDISPLAY_PER_CRTC 5120
-
 #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
 #define DRM_CAP_TIMESTAMP_MONOTONIC 6
 #endif
@@ -96,6 +94,7 @@ uint32_t devid;
 int test_time = 3;
 static bool monotonic_timestamp;
 static pthread_t vblank_wait_thread;
+static int max_dotclock;
 
 static drmModeConnector *last_connector;
 
@@ -1528,19 +1527,19 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	/*
 	 * Handle BW limitations:
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
 	for (i = 0; i < crtc_count; i++) {
-		if (((o->kmode[i].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		if ((igt_bigjoiner_possible(&o->kmode[i], max_dotclock) &&
 		     ((crtc_idxs[i] >= (total_crtcs - 1)) ||
 		      ((i < (crtc_count - 1)) && (abs(crtc_idxs[i + 1] - crtc_idxs[i]) <= 1)))) ||
-		    ((i > 0) && (o->kmode[i - 1].hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+		    ((i > 0) && igt_bigjoiner_possible(&o->kmode[i - 1], max_dotclock) &&
 		     (abs(crtc_idxs[i] - crtc_idxs[i - 1]) <= 1))) {
 
 			igt_debug("Combo: %s is not possible with selected mode(s).\n", test_name);
@@ -1822,6 +1821,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++)
 				tests[i].flags &= ~(TEST_CHECK_TS | TEST_VBLANK_EXPIRED_SEQ);
 		}
+		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
 	igt_describe("Tests that nonblocking reading fails correctly");
-- 
2.40.0
