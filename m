Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5787310E474
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Feb 2022 15:08:43 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed,  9 Feb 2022 20:37:59 +0530
Message-Id: <20220209150759.4845-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_extended: Add test for extended
 mode
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
List-ID: <igt-dev@lists.freedesktop.org>

Add test for validation of extended mode.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_extended.c | 244 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 245 insertions(+)
 create mode 100644 tests/kms_extended.c

diff --git a/tests/kms_extended.c b/tests/kms_extended.c
new file mode 100644
index 00000000..7d8cd85d
--- /dev/null
+++ b/tests/kms_extended.c
@@ -0,0 +1,244 @@
+/*
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Authors:
+ *    Jeevan B <jeevan.b@intel.com>
+ */
+#include "config.h"
+
+#include "igt.h"
+#include <cairo.h>
+#include <errno.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <string.h>
+#include <sys/time.h>
+#include <math.h>
+
+static int drm_fd;
+static drmModeRes *resources;
+
+struct test_output {
+	int mode_valid;
+	drmModeModeInfo kmode[4];
+	drmModeEncoder *kencoder[4];
+	drmModeConnector *kconnector[4];
+	uint32_t _connector[4];
+	uint32_t _crtc[4];
+	int _pipe[4];
+	int count; /* 1:1 mapping between crtc:connector */
+	int pipe; /* primary pipe for vblank */
+	unsigned int fb_width;
+	unsigned int fb_height;
+	unsigned int fb_ids[3];
+	struct igt_fb fb_info[3];
+};
+
+static void free_test_output(struct test_output *o)
+{
+	int i;
+
+	for (i = 0; i < o->count; i++) {
+		drmModeFreeEncoder(o->kencoder[i]);
+		drmModeFreeConnector(o->kconnector[i]);
+	}
+}
+
+static bool mode_compatible(const drmModeModeInfo *a, const drmModeModeInfo *b)
+{
+	int d_refresh;
+
+	if (a->hdisplay != b->hdisplay)
+		return false;
+
+	if (a->vdisplay != b->vdisplay)
+		return false;
+
+	d_refresh = a->vrefresh - b->vrefresh;
+	if (d_refresh < -1 || d_refresh > 1)
+		return false;
+
+	return true;
+}
+
+static void connector_find_compatible_mode(int crtc_idx0, int crtc_idx1,
+					   struct test_output *o)
+{
+	struct kmstest_connector_config config[2];
+	drmModeModeInfo *mode[2];
+	int n, m;
+
+	if (!kmstest_get_connector_config(drm_fd, o->_connector[0],
+					  1 << crtc_idx0, &config[0]))
+		return;
+
+	if (!kmstest_get_connector_config(drm_fd, o->_connector[1],
+					  1 << crtc_idx1, &config[1])) {
+		kmstest_free_connector_config(&config[0]);
+		return;
+	}
+
+	mode[0] = &config[0].default_mode;
+	mode[1] = &config[1].default_mode;
+	if (!mode_compatible(mode[0], mode[1])) {
+		for (n = 0; n < config[0].connector->count_modes; n++) {
+			mode[0] = &config[0].connector->modes[n];
+			for (m = 0; m < config[1].connector->count_modes; m++) {
+				mode[1] = &config[1].connector->modes[m];
+				if (mode_compatible(mode[0], mode[1]))
+					goto found;
+			}
+		}
+
+		mode[1] = mode[0] = &config[0].default_mode;
+	}
+
+found:
+	o->pipe = config[0].pipe;
+	o->fb_width = mode[0]->hdisplay;
+	o->fb_height = mode[0]->vdisplay;
+	o->mode_valid = 1;
+
+	o->kconnector[0] = config[0].connector;
+	o->kencoder[0] = config[0].encoder;
+	o->_crtc[0] = config[0].crtc->crtc_id;
+	o->_pipe[0] = config[0].pipe;
+	o->kmode[0] = *mode[0];
+
+	o->kconnector[1] = config[1].connector;
+	o->kencoder[1] = config[1].encoder;
+	o->_crtc[1] = config[1].crtc->crtc_id;
+	o->_pipe[1] = config[1].pipe;
+	o->kmode[1] = *mode[1];
+
+	drmModeFreeCrtc(config[0].crtc);
+	drmModeFreeCrtc(config[1].crtc);
+}
+
+
+static int run_extendedmode_basic(void)
+{
+	int i, j, m, n, modes = 0, ret = 0;
+	struct test_output o;
+
+	resources = drmModeGetResources(drm_fd);
+	igt_require(resources);
+
+	/* Find a pair of connected displays*/
+	for (i = 0; i < resources->count_connectors; i++) {
+		for (n = 0; n < resources->count_crtcs; n++) {
+			for (j = i + 1; j < resources->count_connectors; j++) {
+				for (m = n + 1; m < resources->count_crtcs; m++) {
+					memset(&o, 0, sizeof(o));
+					o.count = 2;
+					o._connector[0] = resources->connectors[i];
+					o._connector[1] = resources->connectors[j];
+
+					connector_find_compatible_mode(n, m, &o);
+					if (o.mode_valid)
+						modes++;
+
+					free_test_output(&o);
+
+				}
+			}
+		}
+	}
+
+	/* If we have fewer than 2 connected outputs then we won't have any
+	 * configuration at all. So skip in that case. */
+	igt_require_f(modes, "At least two displays required\n");
+
+	/* Find a pair of connected displays */
+	for (i = 0; i < resources->count_connectors; i++) {
+		for (n = 0; n < resources->count_crtcs; n++) {
+			for (j = i + 1; j < resources->count_connectors; j++) {
+				for (m = n + 1; m < resources->count_crtcs; m++) {
+					int crtc_idxs[2];
+
+					memset(&o, 0, sizeof(o));
+					o.count = 2;
+					o._connector[0] = resources->connectors[i];
+					o._connector[1] = resources->connectors[j];
+
+					crtc_idxs[0] = n;
+					crtc_idxs[1] = m;
+
+					connector_find_compatible_mode(crtc_idxs[0], crtc_idxs[1], &o);
+					if (!o.mode_valid)
+						return 1;
+					igt_assert_eq(o.count, 2);
+
+					igt_debug("Running Extended Mode on Pipe %s & %s Connector-%s%d-%s%d\n",
+						  kmstest_pipe_name(o._pipe[0]), kmstest_pipe_name(o._pipe[1]),
+						  kmstest_connector_type_str(o.kconnector[0]->connector_type),
+						  o.kconnector[0]->connector_type_id,
+						  kmstest_connector_type_str(o.kconnector[1]->connector_type),
+						  o.kconnector[1]->connector_type_id);
+
+					o.fb_ids[0] = igt_create_color_pattern_fb(drm_fd,
+						      o.fb_width, o.fb_height, DRM_FORMAT_XRGB8888,
+						      DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &o.fb_info[0]);
+					igt_assert(o.fb_ids[0]);
+
+					o.fb_ids[1] = igt_create_color_pattern_fb(drm_fd,
+						      o.fb_width, o.fb_height, DRM_FORMAT_XRGB8888,
+						      DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &o.fb_info[1]);
+					igt_assert(o.fb_ids[1]);
+
+					ret = drmModePageFlip(drm_fd, o._crtc[0], o.fb_ids[0], DRM_MODE_PAGE_FLIP_EVENT, NULL);
+					igt_assert_eq(ret, 0);
+
+					ret = drmModePageFlip(drm_fd, o._crtc[1], o.fb_ids[1], DRM_MODE_PAGE_FLIP_EVENT, NULL);
+					igt_assert_eq(ret, 0);
+
+					igt_remove_fb(drm_fd, &o.fb_info[1]);
+					igt_remove_fb(drm_fd, &o.fb_info[0]);
+
+					free_test_output(&o);
+
+					return 0;
+				}
+			}
+		}
+	}
+
+	drmModeFreeResources(resources);
+	return 1;
+}
+
+igt_main
+{
+
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_enable_connectors(drm_fd);
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("This test is to validate pageflip on extended mode");
+	igt_subtest("extended-mode-basic") {
+		run_extendedmode_basic();
+	}
+
+	igt_fixture {
+		drmModeFreeResources(resources);
+		close(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7003d064..15825a4a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -28,6 +28,7 @@ test_progs = [
 	'kms_dither',
 	'kms_dp_aux_dev',
 	'kms_dp_tiled_display',
+	'kms_extended',
 	'kms_flip',
 	'kms_flip_event_leak',
 	'kms_force_connector_basic',
-- 
2.17.1
