Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5110E631
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 08:33:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, karthik.b.s@intel.com,
 swati2.sharma@intel.com
Date: Fri, 25 Aug 2023 13:55:41 +0530
Message-Id: <20230825082541.905799-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
References: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 5/5] tests/kms_setmode: Fix Bigjoiner checks
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
V3: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index e32c53480..df6d05067 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -101,13 +101,12 @@
 /* restricted pipe count */
 #define CRTC_RESTRICT_CNT 2
 
-#define MAX_HDISPLAY_PER_CRTC 5120
-
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
 static bool dry_run;
 static bool extended = false;
+static int max_dotclock;
 
 const drmModeModeInfo mode_640_480 = {
 	.name		= "640x480",
@@ -721,28 +720,35 @@ static void test_one_combination(const struct test_config *tconf,
 			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
 		}
 
+		if (!is_intel_device(drm_fd))
+			goto test;
+
 		for (i = 0; i < crtc_count; i++) {
 			struct crtc_config *crtc = &crtcs[i];
 
 			/*
-			 * if mode.hdisplay > 5120, then ignore
+			 * Handle BW limitations on intel hardware:
+			 *
+			 * if mode resolution > 5K (or) mode clock > max_dotclock,
+			 * then ignore
 			 *   - last crtc in single/multi-connector config
 			 *   - consecutive crtcs in multi-connector config
 			 *
 			 * in multi-connector config ignore if
-			 *   - previous crtc mode.hdisplay > 5120 and
+			 *   - previous crtc (mode resolution > 5K (or)
+			 *     mode clock > max_dotclock) and
 			 *   - current & previous crtcs are consecutive
 			 */
-			if (((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+			if ((igt_bigjoiner_possible(&crtc->mode, max_dotclock) &&
 			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
 			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
-			    ((i > 0) && (crtc[i - 1].mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+			    ((i > 0) && igt_bigjoiner_possible(&crtc[i - 1].mode, max_dotclock) &&
 			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
 				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
 				goto out;
 			}
 		}
-
+test:
 		igt_dynamic_f("%s", test_name)
 			test_crtc_config(tconf, crtcs, crtc_count);
 	}
@@ -1015,6 +1021,8 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
+
+		max_dotclock = igt_get_max_dotclock(drm_fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
-- 
2.40.0
