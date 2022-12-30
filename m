Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4C10E485
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 17:53:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 30 Dec 2022 23:18:14 +0530
Message-Id: <20221230174825.3016716-40-bhanuprakash.modem@intel.com>
In-Reply-To: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
References: <20221230174825.3016716-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v6 39/50] tests/i915/kms_cdclk: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

V2: - Use updated helper name
V3: - Fix "mode-transition-all-outputs"

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_cdclk.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
index 991a7c50..f1a46a7d 100644
--- a/tests/i915/kms_cdclk.c
+++ b/tests/i915/kms_cdclk.c
@@ -257,15 +257,23 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	for_each_connected_output(&data->display, output)
 		valid_outputs++;
 
+	i = 0;
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		igt_output_set_pipe(output, PIPE_NONE);
-
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
+
+		mode_hi = get_highres_mode(output);
+		igt_require(mode_hi != NULL);
+
+		igt_output_set_pipe(output, i);
+		igt_output_override_mode(output, mode_hi);
+		i++;
 	}
+	igt_require(i915_pipe_output_combo_valid(display));
+	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
@@ -332,13 +340,18 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-			if (igt_pipe_connector_valid(pipe, output)) {
-				if (flags & TEST_PLANESCALING)
-					test_plane_scaling(data, pipe, output);
-				if (flags & TEST_MODETRANSITION)
-					test_mode_transition(data, pipe, output);
-			}
+		igt_output_set_pipe(output, pipe);
+		if (!i915_pipe_output_combo_valid(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
+			if (flags & TEST_PLANESCALING)
+				test_plane_scaling(data, pipe, output);
+			if (flags & TEST_MODETRANSITION)
+				test_mode_transition(data, pipe, output);
+		}
 	}
 }
 
-- 
2.39.0
