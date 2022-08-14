Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925568D306
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:52 +0530
Message-Id: <20220814180908.2553394-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 35/51] tests/kms_vblank: Add support for Bigjoiner
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vblank.c | 54 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e65e8522..811ba6d0 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -175,6 +175,21 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	cleanup_crtc(data, fd, output);
 }
 
+static bool
+is_valid_combo(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+{
+	bool ret = true;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	return ret;
+}
+
 static void crtc_id_subtest(data_t *data, int fd)
 {
 	igt_display_t *display = &data->display;
@@ -188,6 +203,15 @@ static void crtc_id_subtest(data_t *data, int fd)
 		uint64_t val;
 		union drm_wait_vblank vbl;
 
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, p);
+		if (!igt_test_constraint(display))
+			continue;
+
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(p), igt_output_name(output));
+
 		crtc_id = display->pipes[p].crtc_id;
 		if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
 			expected_crtc_id = crtc_id;
@@ -449,10 +473,18 @@ static void run_subtests_for_pipe(data_t *data)
 			igt_subtest_f("pipe-%s-%s-%s",
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
+				int found = 0;
+
 				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+					if (!is_valid_combo(&data->display, data->pipe, data->output))
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
@@ -464,13 +496,20 @@ static void run_subtests_for_pipe(data_t *data)
 				      kmstest_pipe_name(data->pipe),
 				      f->name, m->name) {
 				igt_hang_t hang;
+				int found = 0;
 
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
 				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+					if (!is_valid_combo(&data->display, data->pipe, data->output))
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
@@ -482,12 +521,23 @@ static void invalid_subtest(data_t *data, int fd)
 	unsigned long valid_flags;
 	igt_display_t* display = &data->display;
 	enum pipe pipe = 0;
-	igt_output_t* output = igt_get_single_output_for_pipe(display, pipe);
+	igt_output_t *output;
+
+	igt_display_reset(display);
+	igt_display_require_output_on_pipe(display, pipe);
+
+	output = igt_get_single_output_for_pipe(display, pipe);
+	igt_require(output);
 
 	data->pipe = pipe;
 	data->output = output;
+
 	igt_output_set_pipe(output, pipe);
-	igt_display_require_output_on_pipe(display, pipe);
+	igt_require(igt_test_constraint(display));
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	prepare_crtc(data, fd, output);
 
 	/* First check all is well with a simple query */
-- 
2.35.1
