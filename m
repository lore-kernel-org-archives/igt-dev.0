Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C1D6E4A1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Oct 2021 20:35:02 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 21 Oct 2021 23:34:58 +0300
Message-Id: <20211021203458.18828-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC][PATCH i-g-t] tests/kms_atomic_benchmark: Benchmark
 TEST_ONLY atomic commits
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Simon Ser <contact@emersion.fr>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a benchmark to make sure atomic TEST_ONLY commits
are reasonably fast.

More of an RFC at this stage. I don't really have the time
to work on this for real. But figured I'd hack something
together quickly and check if anyone is interested. I was
also a bit curious how we're doing at the moment; Not as
bad as I feared :)

TODO:
* Figure out reasonable limits (50usec per commit passed on
  my snb here with drm.debug=0 so used that for now)
* Come up with a plan for drm.debug since it will destroy
  performance. Maybe just disable it while running this test?
* Not sure using igt_kms for this is a good idea, it might
  do something funny we don't really expect, invalidating the
  test a bit
* Add some other subtests. Lots of planes in one commit
  for instance?
* Figure out what i915 is doing to make the page-flip test
  more expensive than the modeset test, pretty sure both
  should go through the same plane calculations/checks,
  and obviously the modeset should go through additonal
  modeset checks.
* Actually optimize drivers based on this?

Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_atomic_benchmark.c | 246 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 2 files changed, 247 insertions(+)
 create mode 100644 tests/kms_atomic_benchmark.c

diff --git a/tests/kms_atomic_benchmark.c b/tests/kms_atomic_benchmark.c
new file mode 100644
index 000000000000..f2c52762527c
--- /dev/null
+++ b/tests/kms_atomic_benchmark.c
@@ -0,0 +1,246 @@
+/*
+ * Copyright © 2021 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "drmtest.h"
+#include "igt_core.h"
+#include "igt_kms.h"
+
+#include <math.h>
+#include <time.h>
+
+typedef struct {
+	int drm_fd;
+	enum pipe pipe;
+	unsigned int start_us, end_us, num_commits;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *plane;
+	struct igt_fb fb[3];
+	struct drm_color_lut *lut[2];
+	int lut_size;
+	drmModeModeInfo mode[2];
+} data_t;
+
+static unsigned int clock_us(void)
+{
+	struct timespec ts;
+
+	clock_gettime(CLOCK_MONOTONIC, &ts);
+
+	return ts.tv_sec * 1000000 + ts.tv_nsec / 1000;
+}
+
+static void prep_test(data_t *data)
+{
+	drmModeModeInfo *mode;
+
+	data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
+	igt_require(data->output);
+
+	igt_output_set_pipe(data->output, data->pipe);
+
+	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+
+	mode = igt_output_get_mode(data->output);
+	data->mode[0] = *mode;
+	data->mode[0].flags ^= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PHSYNC;
+	data->mode[1] = *mode;
+	data->mode[1].flags ^= DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PVSYNC;
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb[0]);
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb[1]);
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb[2]);
+
+	igt_plane_set_fb(data->plane, &data->fb[2]);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+static void cleanup_test(data_t *data)
+{
+	igt_plane_set_fb(data->plane, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_output_override_mode(data->output, NULL);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[2]);
+}
+
+static struct drm_color_lut *create_lut(int lut_size, float exp)
+{
+	struct drm_color_lut *lut;
+
+	lut = malloc(sizeof(lut[0]) * lut_size);
+
+	for (int i = 0; i < lut_size; i++) {
+		unsigned int v = 0xffff * powf(i * 1.0f / (lut_size - 1), exp);
+
+		lut[i].red = v;
+		lut[i].green = v;
+		lut[i].blue = v;
+	}
+
+	return lut;
+}
+
+static void prep_lut(data_t *data)
+{
+	data->lut_size = igt_pipe_obj_get_prop(&data->display.pipes[data->pipe],
+					       IGT_CRTC_GAMMA_LUT_SIZE);
+
+	data->lut[0] = create_lut(data->lut_size, 0.9);
+	data->lut[1] = create_lut(data->lut_size, 1.1);
+}
+
+static void cleanup_lut(data_t *data)
+{
+	free(data->lut[0]);
+	free(data->lut[1]);
+}
+
+static void test_loop(data_t *data, void (*do_test)(data_t *data, int i))
+{
+	data->num_commits = 0;
+	data->start_us = clock_us();
+
+	do {
+		do_test(data, data->num_commits++);
+		data->end_us = clock_us();
+	} while (data->end_us - data->start_us < 200000);
+}
+
+static void check(data_t *data, unsigned int max_commit_duration_us)
+{
+	unsigned int commit_duration_us =
+		(data->end_us - data->start_us) / data->num_commits;
+
+	igt_info("%d TEST_ONLY commits in %u usecs, %u usecs / commit\n",
+		 data->num_commits, data->end_us - data->start_us, commit_duration_us);
+
+	igt_assert_lte(commit_duration_us, max_commit_duration_us);
+}
+
+static void do_page_flip(data_t *data, int i)
+{
+	struct igt_fb *fb = &data->fb[i & 1];
+
+	igt_plane_set_fb(data->plane, fb);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+}
+
+static void test_page_flip(data_t *data)
+{
+	prep_test(data);
+	test_loop(data, do_page_flip);
+	cleanup_test(data);
+
+	check(data, 50);
+}
+
+static void do_lut_update(data_t *data, int i)
+{
+	const struct drm_color_lut *lut = data->lut[i & 1];
+
+	igt_pipe_obj_replace_prop_blob(&data->display.pipes[data->pipe],
+				       IGT_CRTC_GAMMA_LUT, lut,
+				       data->lut_size * sizeof(lut[0]));
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+}
+
+static void test_gamma_lut_update(data_t *data)
+{
+	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[data->pipe],
+					  IGT_CRTC_GAMMA_LUT));
+
+	prep_test(data);
+	prep_lut(data);
+	test_loop(data, do_lut_update);
+	cleanup_lut(data);
+	cleanup_test(data);
+
+	check(data, 50);
+}
+
+static void do_modeset(data_t *data, int i)
+{
+	drmModeModeInfo *mode = &data->mode[i & 1];
+
+	igt_output_override_mode(data->output, mode);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET |
+				  DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+}
+
+static void test_modeset(data_t *data)
+{
+	prep_test(data);
+	test_loop(data, do_modeset);
+	cleanup_test(data);
+
+	check(data, 50);
+}
+
+static data_t data;
+
+igt_main
+{
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+	}
+
+	igt_describe("benchmark pure page flip TEST_ONLY atomic commits");
+	igt_subtest_with_dynamic_f("page-flip") {
+		for_each_pipe(&data.display, data.pipe) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(data.pipe))
+				test_page_flip(&data);
+		}
+	}
+
+	igt_describe("benchmark gamma LUT update TEST_ONLY atomic commits");
+	igt_subtest_with_dynamic_f("gamma-lut-update") {
+		for_each_pipe(&data.display, data.pipe) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(data.pipe))
+				test_gamma_lut_update(&data);
+		}
+	}
+
+	igt_describe("benchmark modeset TEST_ONLY atomic commits");
+	igt_subtest_with_dynamic_f("modeset") {
+		for_each_pipe(&data.display, data.pipe) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(data.pipe))
+				test_modeset(&data);
+		}
+	}
+
+	igt_fixture
+		igt_display_fini(&data.display);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0af3e03a3430..bfaef4d38e30 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -17,6 +17,7 @@ test_progs = [
 	'kms_addfb_basic',
 	'kms_async_flips',
 	'kms_atomic',
+	'kms_atomic_benchmark',
 	'kms_atomic_interruptible',
 	'kms_atomic_transition',
 	'kms_bw',
-- 
2.32.0
