Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F1B10E0C2
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 03:32:40 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 09:02:43 +0530
Message-Id: <20230825033243.1690-3-karthik.b.s@intel.com>
In-Reply-To: <20230825033243.1690-1-karthik.b.s@intel.com>
References: <20230825033243.1690-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_big_joiner: Make use of
 big joiner helpers
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

Replace the hardcoded constraints in the test with the generic big joiner
helpers already present in lib. This ensures that all big joiner
constraints are accounted for.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/kms_big_joiner.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index d438b2211..1d32c8a12 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -31,8 +31,6 @@
  */
 #include "igt.h"
 
-#define MAX_HDISPLAY_PER_PIPE 5120
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
 typedef struct {
@@ -217,7 +215,7 @@ igt_main
 						 sort_drm_modes_by_res_dsc);
 
 			mode = &output->config.connector->modes[0];
-			if (mode->hdisplay > MAX_HDISPLAY_PER_PIPE) {
+			if (igt_bigjoiner_possible(mode, igt_get_max_dotclock(data.drm_fd))) {
 				data.big_joiner_output[count++] = output;
 
 				width = max(width, mode->hdisplay);
@@ -226,6 +224,8 @@ igt_main
 			valid_output++;
 		}
 
+		igt_require_f(count > 0, "No output with big joiner requirement found\n");
+
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i) {
 			data.n_pipes++;
@@ -233,8 +233,6 @@ igt_main
 			j++;
 		}
 
-		igt_require_f(count > 0, "No output with 5k+ mode found\n");
-
 		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
 				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 	}
@@ -243,8 +241,11 @@ igt_main
 	igt_subtest_with_dynamic("basic") {
 		for (i = 0; i < data.n_pipes - 1; i++) {
 			data.pipe1 = pipe_seq[i];
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
-				test_basic_modeset(&data);
+			igt_output_set_pipe(data.big_joiner_output[0], data.pipe1);
+			if (i915_pipe_output_combo_valid(&data.display)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
+					test_basic_modeset(&data);
+			}
 		}
 	}
 
-- 
2.39.1
