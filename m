Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9049210EDA8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 14:06:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 19:33:14 +0530
Message-Id: <20220909140331.1041095-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 35/52] tests/kms_vblank: Add support for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vblank.c | 54 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e65e8522..fc555322 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -175,6 +175,22 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	cleanup_crtc(data, fd, output);
 }
 
+static bool
+pipe_output_combo_valid(igt_display_t *display,
+			enum pipe pipe, igt_output_t *output)
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
 static void crtc_id_subtest(data_t *data, int fd)
 {
 	igt_display_t *display = &data->display;
@@ -188,6 +204,15 @@ static void crtc_id_subtest(data_t *data, int fd)
 		uint64_t val;
 		union drm_wait_vblank vbl;
 
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, p);
+		if (!i915_pipe_output_combo_valid(display))
+			continue;
+
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(p), igt_output_name(output));
+
 		crtc_id = display->pipes[p].crtc_id;
 		if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
 			expected_crtc_id = crtc_id;
@@ -449,10 +474,18 @@ static void run_subtests_for_pipe(data_t *data)
 			igt_subtest_f("pipe-%s-%s-%s",
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
+				int found = 0;
+
 				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
+						continue;
+
 					data->flags = m->flags | NOHANG;
 					run_test(data, f->func);
+
+					found++;
 				}
+				igt_require_f(found, "No valid pipe/output combo found.\n");
 			}
 
 			/* Skip the -hang version if NOHANG flag is set */
@@ -464,13 +497,20 @@ static void run_subtests_for_pipe(data_t *data)
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
 				igt_hang_t hang;
+				int found = 0;
 
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
 				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
+						continue;
+
 					data->flags = m->flags;
 					run_test(data, f->func);
+
+					found++;
 				}
 				igt_disallow_hang(data->display.drm_fd, hang);
+				igt_require_f(found, "No valid pipe/output combo found.\n");
 			}
 		}
 	}
@@ -482,12 +522,22 @@ static void invalid_subtest(data_t *data, int fd)
 	unsigned long valid_flags;
 	igt_display_t* display = &data->display;
 	enum pipe pipe = 0;
-	igt_output_t* output = igt_get_single_output_for_pipe(display, pipe);
+	igt_output_t *output;
+
+	igt_display_reset(display);
+
+	output = igt_get_single_output_for_pipe(display, pipe);
+	igt_require(output);
 
 	data->pipe = pipe;
 	data->output = output;
+
 	igt_output_set_pipe(output, pipe);
-	igt_display_require_output_on_pipe(display, pipe);
+	igt_require(i915_pipe_output_combo_valid(display));
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	prepare_crtc(data, fd, output);
 
 	/* First check all is well with a simple query */
-- 
2.35.1
