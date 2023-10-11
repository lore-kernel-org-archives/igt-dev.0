Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA3710E805
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 13:30:31 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 19:01:13 +0530
Message-Id: <20231011133114.68627-3-swati2.sharma@intel.com>
In-Reply-To: <20231011133114.68627-1-swati2.sharma@intel.com>
References: <20231011133114.68627-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/kms_vblank: convert test to
 dynamic
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

Convert existing subtests to dynamic subtests at pipe/output level
and update testplan documentation.

v2: -Remove redundant debug prints
    -Convert all subtests into dynamic
v3: -Use pipe & output from struct data_t
v4: -Directly use data->pipe instead of using p
v5: -Use for_each_pipe_with_valid_output()

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_vblank.c | 251 +++++++++++++++------------------------------
 1 file changed, 81 insertions(+), 170 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index bcfd8d012..4edd3f6bc 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -56,107 +56,63 @@
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-dpms-rpm
+ * SUBTEST: ts-continuation-dpms-rpm
  * Description: Test TS continuty with DPMS & RPM while hanging by introducing
- *              NOHANG flag on %arg[1]
+ *              NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-dpms-suspend
+ * SUBTEST: ts-continuation-dpms-suspend
  * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
- *              NOHANG flag on %arg[1]
+ *              NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-suspend
+ * SUBTEST: ts-continuation-suspend
  * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
- *              flag on %arg[1]
+ *              flag
  * Driver requirement: i915, xe
  * Functionality: hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-modeset-rpm
+ * SUBTEST: ts-continuation-modeset-rpm
  * Description: Test TS continuty during Modeset with Suspend while hanging by
- *              introducing NOHANG flag on %arg[1]
+ *              introducing NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-accuracy-idle
+ * SUBTEST: accuracy-idle
  * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
- *              flag on %arg[1]
+ *              flag
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: pipe-%s-%s
- * Description: Test %arg[2] while hanging by introducing NOHANG flag on %arg[1]
+ * SUBTEST: %s
+ * Description: Test %arg[1] while hanging by introducing NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: pipe-%s-%s-hang
- * Description: Test %arg[2] with injected hang is working properly on %arg[1]
+ * SUBTEST: %s-hang
+ * Description: Test %arg[1] with injected hang is working properly
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
@@ -164,17 +120,6 @@
  *
  * arg[1]:
  *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
- *
- * arg[2]:
- *
  * @query-idle:              Time taken to Query vblank counters
  * @query-forked:            Time taken to Query vblank counters (multithreaded)
  * @query-busy:              Time taken to Query vblank counters (during V-active)
@@ -270,10 +215,6 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (data->flags & RPM)
 		igt_require(igt_setup_runtime_pm(fd));
 
-	igt_info("Beginning %s on pipe %s, connector %s\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
-		 igt_output_name(output));
-
 	if (!(data->flags & NOHANG)) {
 		ahnd = is_i915_device(fd) ?
 			get_reloc_ahnd(fd, 0) :
@@ -314,9 +255,6 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (!(data->flags & NOHANG))
 		igt_post_hang_ring(fd, hang);
 
-	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
-
 	put_ahnd(ahnd);
 
 	/* cleanup what prepare_crtc() has done */
@@ -342,63 +280,50 @@ pipe_output_combo_valid(igt_display_t *display,
 static void crtc_id_subtest(data_t *data, int fd)
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
+	enum pipe p = data->pipe;
+	igt_output_t *output = data->output;
+	struct drm_event_vblank buf;
+	const uint32_t pipe_id_flag = kmstest_get_vbl_flag(p);
+	unsigned crtc_id, expected_crtc_id;
+	uint64_t val;
+	union drm_wait_vblank vbl;
 
-		igt_display_reset(display);
+	crtc_id = display->pipes[p].crtc_id;
+	if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
+		expected_crtc_id = crtc_id;
+	else
+		expected_crtc_id = 0;
 
-		igt_output_set_pipe(output, p);
-		if (!i915_pipe_output_combo_valid(display))
-			continue;
+	prepare_crtc(data, fd, output);
 
-		igt_info("Using (pipe %s + %s) to run the subtest.\n",
-			 kmstest_pipe_name(p), igt_output_name(output));
+	memset(&vbl, 0, sizeof(vbl));
+	vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
+	vbl.request.type |= pipe_id_flag;
+	vbl.request.sequence = 1;
+	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
-		crtc_id = display->pipes[p].crtc_id;
-		if (drmGetCap(display->drm_fd, DRM_CAP_CRTC_IN_VBLANK_EVENT, &val) == 0)
-			expected_crtc_id = crtc_id;
-		else
-			expected_crtc_id = 0;
+	igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+	igt_assert_eq(buf.crtc_id, expected_crtc_id);
 
-		data->pipe = p;
-		prepare_crtc(data, fd, output);
+	do_or_die(drmModePageFlip(fd, crtc_id,
+				  data->primary_fb.fb_id,
+				  DRM_MODE_PAGE_FLIP_EVENT, NULL));
 
-		memset(&vbl, 0, sizeof(vbl));
-		vbl.request.type = DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT;
-		vbl.request.type |= pipe_id_flag;
-		vbl.request.sequence = 1;
-		igt_assert_eq(wait_vblank(fd, &vbl), 0);
+	igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
+	igt_assert_eq(buf.crtc_id, expected_crtc_id);
 
-		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-		igt_assert_eq(buf.crtc_id, expected_crtc_id);
+	if (display->is_atomic) {
+		igt_plane_t *primary = igt_output_get_plane(output, 0);
 
-		do_or_die(drmModePageFlip(fd, crtc_id,
-					  data->primary_fb.fb_id,
-					  DRM_MODE_PAGE_FLIP_EVENT, NULL));
+		igt_plane_set_fb(primary, &data->primary_fb);
+		igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 
 		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
 		igt_assert_eq(buf.crtc_id, expected_crtc_id);
-
-		if (display->is_atomic) {
-			igt_plane_t *primary = igt_output_get_plane(output, 0);
-
-			igt_plane_set_fb(primary, &data->primary_fb);
-			igt_display_commit_atomic(display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
-
-			igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
-			igt_assert_eq(buf.crtc_id, expected_crtc_id);
-		}
-
-		cleanup_crtc(data, fd, output);
-		return;
 	}
+
+	cleanup_crtc(data, fd, output);
+	return;
 }
 
 static void accuracy(data_t *data, int fd, int nchildren)
@@ -576,7 +501,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 			estimated_vblanks, seq2, seq1 + estimated_vblanks);
 }
 
-static void run_subtests_for_pipe(data_t *data)
+static void run_subtests(data_t *data)
 {
 	const struct {
 		const char *name;
@@ -610,30 +535,22 @@ static void run_subtests_for_pipe(data_t *data)
 		{ }
 	}, *m;
 
-	igt_fixture
-		igt_display_require_output_on_pipe(&data->display, data->pipe);
-
 	for (f = funcs; f->name; f++) {
 		for (m = modes; m->name; m++) {
 			if (m->flags & ~(f->valid | NOHANG))
 				continue;
 
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
-			igt_subtest_f("pipe-%s-%s-%s",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
-				int found = 0;
-
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
+				for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
 						continue;
 
-					data->flags = m->flags | NOHANG;
-					run_test(data, f->func);
-
-					found++;
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+						data->flags = m->flags | NOHANG;
+						run_test(data, f->func);
+					}
 				}
-				igt_require_f(found, "No valid pipe/output combo found.\n");
 			}
 
 			/* Skip the -hang version if NOHANG flag is set */
@@ -641,24 +558,20 @@ static void run_subtests_for_pipe(data_t *data)
 				continue;
 
 			igt_describe("Check if injected hang is working properly.");
-			igt_subtest_f("pipe-%s-%s-%s-hang",
-				      kmstest_pipe_name(data->pipe),
-				      f->name, m->name) {
+			igt_subtest_with_dynamic_f("%s-%s-hang", f->name, m->name) {
 				igt_hang_t hang;
-				int found = 0;
 
 				hang = igt_allow_hang(data->display.drm_fd, 0, 0);
-				for_each_valid_output_on_pipe(&data->display, data->pipe, data->output) {
+				for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 					if (!pipe_output_combo_valid(&data->display, data->pipe, data->output))
 						continue;
 
-					data->flags = m->flags;
-					run_test(data, f->func);
-
-					found++;
+					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+						data->flags = m->flags;
+						run_test(data, f->func);
+					}
 				}
 				igt_disallow_hang(data->display.drm_fd, hang);
-				igt_require_f(found, "No valid pipe/output combo found.\n");
 			}
 		}
 	}
@@ -668,23 +581,7 @@ static void invalid_subtest(data_t *data, int fd)
 {
 	union drm_wait_vblank vbl;
 	unsigned long valid_flags;
-	igt_display_t* display = &data->display;
-	enum pipe pipe = 0;
-	igt_output_t *output;
-
-	igt_display_reset(display);
-
-	output = igt_get_single_output_for_pipe(display, pipe);
-	igt_require(output);
-
-	data->pipe = pipe;
-	data->output = output;
-
-	igt_output_set_pipe(output, pipe);
-	igt_require(i915_pipe_output_combo_valid(display));
-
-	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+	igt_output_t *output = data->output;
 
 	prepare_crtc(data, fd, output);
 
@@ -738,18 +635,32 @@ igt_main
 	}
 
 	igt_describe("Negative test for vblank request.");
-	igt_subtest("invalid")
-		invalid_subtest(&data, fd);
+	igt_subtest_with_dynamic("invalid") {
+		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
+			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
+				invalid_subtest(&data, fd);
+			break;
+		}
+	}
 
 	igt_describe("Check the vblank and flip events works with given crtc id.");
-	igt_subtest("crtc-id")
-		crtc_id_subtest(&data, fd);
+	igt_subtest_with_dynamic("crtc-id") {
+		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
+			if (!pipe_output_combo_valid(&data.display, data.pipe, data.output))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data.pipe), data.output->name)
+				crtc_id_subtest(&data, fd);
+		}
+	}
 
-	for_each_pipe_static(data.pipe)
-		igt_subtest_group
-			run_subtests_for_pipe(&data);
+	run_subtests(&data);
 
 	igt_fixture {
+		igt_display_fini(&data.display);
 		drm_close_driver(fd);
 	}
 }
-- 
2.25.1
