Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A610E145
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 11:06:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 16:34:55 +0530
Message-Id: <20220318110455.490869-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Add support to handle
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

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index d5cb45d438..4ea1986aeb 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -37,6 +37,8 @@
 /* max combinations with repetitions */
 #define MAX_COMBINATION_ELEMS   MAX_CRTCS
 
+#define MAX_HDISPLAY_PER_CRTC 5120
+
 static int drm_fd;
 static drmModeRes *drm_resources;
 static int filter_test_id;
@@ -663,10 +665,27 @@ static void test_one_combination(const struct test_config *tconf,
 			pos += get_test_name_str(&crtcs[i], &test_name[pos], ARRAY_SIZE(test_name) - pos);
 		}
 
+		for (i = 0; i < crtc_count; i++) {
+			struct crtc_config *crtc = &crtcs[i];
+
+			/*
+			 * if mode.hdisplay > 5120, then ignore
+			 *   - last crtc in single/multi-connector config
+			 *   - consecutive crtcs in multi-connector config
+			 */
+			if ((crtc->mode.hdisplay > MAX_HDISPLAY_PER_CRTC) &&
+			    ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
+			     (i < (crtc_count - 1) && abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1))) {
+				igt_info("Combo: %s is not possible with selected mode(s).\n", test_name);
+				goto out;
+			}
+		}
+
 		igt_dynamic_f("%s", test_name)
 			test_crtc_config(tconf, crtcs, crtc_count);
 	}
 
+out:
 	cleanup_crtcs(crtcs, crtc_count);
 }
 
-- 
2.35.1
