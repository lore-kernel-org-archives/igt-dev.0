Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820210E04D
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Oct 2022 18:56:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Oct 2022 00:27:56 +0530
Message-Id: <20221012185756.9088-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_vblank: Convert test to dynamic
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

Convert existing subtests to dynamic subtests at pipe/output level.

v2: -Remove redundant debug prints
    -Convert all subtests into dynamic

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_vblank.c | 159 +++++++++++++++++++++------------------------
 1 file changed, 73 insertions(+), 86 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 5bd3fefe1..1ca4c147d 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -21,11 +21,6 @@
  * IN THE SOFTWARE.
  */
 
-/** @file kms_vblank.c
- *
- * This is a test of performance of drmWaitVblank.
- */
-
 #include "igt.h"
 #include <stdlib.h>
 #include <stdio.h>
@@ -41,7 +36,7 @@
 
 #include <drm.h>
 
-IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
+IGT_TEST_DESCRIPTION("This is a test of performance of drmWaitVblank.");
 
 typedef struct {
 	igt_display_t display;
@@ -125,10 +120,6 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (data->flags & RPM)
 		igt_require(igt_setup_runtime_pm(fd));
 
-	igt_info("Beginning %s on pipe %s, connector %s\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
-		 igt_output_name(output));
-
 	if (!(data->flags & NOHANG)) {
 		ahnd = get_reloc_ahnd(fd, 0);
 		hang = igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
@@ -166,66 +157,58 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (!(data->flags & NOHANG))
 		igt_post_hang_ring(fd, hang);
 
-	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
-
 	put_ahnd(ahnd);
 
 	/* cleanup what prepare_crtc() has done */
 	cleanup_crtc(data, fd, output);
 }
 
-static void crtc_id_subtest(data_t *data, int fd)
+static void crtc_id_subtest(data_t *data, int fd, enum pipe p, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_output_t *output;
-	enum pipe p;
-
-	for_each_pipe_with_valid_output(display, p, output) {
-		struct drm_event_vblank buf;
-		const uint32_t pipe_id_flag = kmstest_get_vbl_flag(p);
-		unsigned crtc_id, expected_crtc_id;
-		uint64_t val;
-		union drm_wait_vblank vbl;
-
-		crtc_id = display->pipes[p].crtc_id;
-		if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
-			expected_crtc_id = crtc_id;
-		else
-			expected_crtc_id = 0;
+	struct drm_event_vblank buf;
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(p);
+	unsigned crtc_id, expected_crtc_id;
+	uint64_t val;
+	union drm_wait_vblank vbl;
 
-		data->pipe = p;
-		prepare_crtc(data, fd, output);
+	crtc_id = display->pipes[p].crtc_id;
+	if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
+		expected_crtc_id = crtc_id;
+	else
+		expected_crtc_id = 0;
 
-		memset(&vbl, 0, sizeof(vbl));
-		vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
-		vbl.request.type |= pipe_id_flag;
-		vbl.request.sequence = 1;
-		igt_assert_eq(wait_vblank(fd, &vbl), 0);
+	data->pipe = p;
+	prepare_crtc(data, fd, output);
 
-		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-		igt_assert_eq(buf.crtc_id, expected_crtc_id);
+	memset(&vbl, 0, sizeof(vbl));
+	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
+	vbl.request.type |= pipe_id_flag;
+	vbl.request.sequence = 1;
+	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
-		do_or_die(drmModePageFlip(fd, crtc_id,
-					  data->primary_fb.fb_id,
-					  DRM_MODE_PAGE_FLIP_EVENT, NULL));
+	igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+	igt_assert_eq(buf.crtc_id, expected_crtc_id);
 
-		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-		igt_assert_eq(buf.crtc_id, expected_crtc_id);
+	do_or_die(drmModePageFlip(fd, crtc_id,
+				  data->primary_fb.fb_id,
+				  DRM_MODE_PAGE_FLIP_EVENT, NULL));
 
-		if (display->is_atomic) {
-			igt_plane_t *primary = igt_output_get_plane(output, 0);
+	igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+	igt_assert_eq(buf.crtc_id, expected_crtc_id);
 
-			igt_plane_set_fb(primary, &data->primary_fb);
-			igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
+	if (display->is_atomic) {
+		igt_plane_t *primary = igt_output_get_plane(output, 0);
 
-			igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-			igt_assert_eq(buf.crtc_id, expected_crtc_id);
-		}
+		igt_plane_set_fb(primary, &data->primary_fb);
+		igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 
-		cleanup_crtc(data, fd, output);
-		return;
+		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+		igt_assert_eq(buf.crtc_id, expected_crtc_id);
 	}
+
+	cleanup_crtc(data, fd, output);
+	return;
 }
 
 static void accuracy(data_t *data, int fd, int nchildren)
@@ -403,8 +386,10 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 			estimated_vblanks, seq2, seq1 + estimated_vblanks);
 }
 
-static void run_subtests_for_pipe(data_t *data)
+static void run_subtests(data_t *data)
 {
+	enum pipe p;
+
 	const struct {
 		const char *name;
 		void (*func)(data_t *, int, int);
@@ -437,21 +422,19 @@ static void run_subtests_for_pipe(data_t *data)
 		{ }
 	}, *m;
 
-	igt_fixture
-		igt_display_require_output_on_pipe(&data->display, data->pipe);
-
 	for (f = funcs; f->name; f++) {
 		for (m = modes; m->name; m++) {
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
-			igt_describe("Check if test run while hanging by introducing NOHANG flag");
-			igt_subtest_f("pipe-%s-%s-%s",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
-					data->flags = m->flags | NOHANG;
-					run_test(data, f->func);
+			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
+			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
+				for_each_pipe_with_valid_output(&data->display, p, data->output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
+						data->pipe = p;
+						data->flags = m->flags | NOHANG;
+						run_test(data, f->func);
+					}
 				}
 			}
 
@@ -459,16 +442,16 @@ static void run_subtests_for_pipe(data_t *data)
 			if (f->valid & NOHANG || m->flags & NOHANG)
 				continue;
 
-			igt_describe("check if injected hang is working properly");
-			igt_subtest_f("pipe-%s-%s-%s-hang",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
+			igt_describe("Check if injected hang is working properly.");
+			igt_subtest_with_dynamic_f("%s-%s-hang", f->name, m->name) {
 				igt_hang_t hang;
-
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
-					data->flags = m->flags;
-					run_test(data, f->func);
+				for_each_pipe_with_valid_output(&data->display, p, data->output) {
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
+						data->pipe = p;
+						data->flags = m->flags;
+						run_test(data, f->func);
+					}
 				}
 				igt_disallow_hang(data->display.drm_fd, hang);
 			}
@@ -476,18 +459,13 @@ static void run_subtests_for_pipe(data_t *data)
 	}
 }
 
-static void invalid_subtest(data_t *data, int fd)
+static void invalid_subtest(data_t *data, int fd, enum pipe pipe, igt_output_t *output)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
-	igt_display_t* display = &data->display;
-	enum pipe pipe = 0;
-	igt_output_t* output = igt_get_single_output_for_pipe(display, pipe);
-
 	data->pipe = pipe;
 	data->output = output;
-	igt_output_set_pipe(output, pipe);
-	igt_display_require_output_on_pipe(display, pipe);
+
 	prepare_crtc(data, fd, output);
 
 	/* First check all is well with a simple query */
@@ -530,6 +508,7 @@ static void invalid_subtest(data_t *data, int fd)
 igt_main
 {
 	int fd;
+	enum pipe p;
 	data_t data;
 
 	igt_fixture {
@@ -540,18 +519,26 @@ igt_main
 	}
 
 	igt_describe("Negative test for vblank request");
-	igt_subtest("invalid")
-		invalid_subtest(&data, fd);
+	igt_subtest_with_dynamic("invalid") {
+		for_each_pipe_with_valid_output(&data.display, p, data.output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data.output->name)
+				invalid_subtest(&data, fd, p, data.output);
+			break;
+		}
+	}
 
-	igt_describe("check the Vblank and flip events works with given crtc id");
-	igt_subtest("crtc-id")
-		crtc_id_subtest(&data, fd);
+	igt_describe("Test to check if vblank and flip events works with given crtc id");
+	igt_subtest_with_dynamic("crtc-id") {
+		for_each_pipe_with_valid_output(&data.display, p, data.output) {
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data.output->name)
+				crtc_id_subtest(&data, fd, p, data.output);
+		}
+	}
 
-	for_each_pipe_static(data.pipe)
-		igt_subtest_group
-			run_subtests_for_pipe(&data);
+	run_subtests(&data);
 
 	igt_fixture {
+		igt_display_fini(&data.display);
 		close(fd);
 	}
 }
-- 
2.25.1
