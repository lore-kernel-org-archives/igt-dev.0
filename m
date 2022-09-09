Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D528710ED87
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:06:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:32:45 +0530
Message-Id: <20220909140331.1041095-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 06/52] tests/kms_atomic_transition: Add support
 for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 50 ++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 4c62e909..f6434d70 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -68,6 +68,10 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	unsigned flags = DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET;
 
 	igt_display_reset(&data->display);
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -487,6 +491,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	unsigned flags = 0;
 	int ret;
 
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	if (fencing)
 		prepare_fencing(data, pipe);
 	else
@@ -753,8 +760,13 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 			if (output->pending_pipe != PIPE_NONE)
 				continue;
 
-			mode = igt_output_get_mode(output);
-			break;
+			igt_output_set_pipe(output, pipe);
+			if (i915_pipe_output_combo_valid(&data->display)) {
+				mode = igt_output_get_mode(output);
+				break;
+			} else {
+				igt_output_set_pipe(output, PIPE_NONE);
+			}
 		}
 
 		if (!mode)
@@ -839,8 +851,17 @@ retry:
 				continue;
 
 			igt_output_set_pipe(output, i);
-			mode = igt_output_get_mode(output);
-			break;
+			if (i915_pipe_output_combo_valid(&data->display)) {
+				mode = igt_output_get_mode(output);
+
+				igt_info("(pipe %s + %s), mode:",
+					 kmstest_pipe_name(i), igt_output_name(output));
+				kmstest_dump_mode(mode);
+
+				break;
+			} else {
+				igt_output_set_pipe(output, PIPE_NONE);
+			}
 		}
 
 		if (mode) {
@@ -979,6 +1000,21 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 	igt_remove_fb(data->drm_fd, &data->fbs[1]);
 }
 
+static bool pipe_output_combo_valid(igt_display_t *display,
+				    enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1078,6 +1114,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 
+			if (!pipe_output_combo_valid(&data.display, pipe, output))
+				continue;
+
 			pipe_count++;
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 				run_primary_test(&data, pipe, output);
@@ -1104,6 +1143,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				if (pipe_count == 2 * count && !data.extended)
 					break;
 
+				if (!pipe_output_combo_valid(&data.display, pipe, output))
+					continue;
+
 				pipe_count++;
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe),
-- 
2.35.1
