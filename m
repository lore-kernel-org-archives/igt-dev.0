Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B9110E02C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 13:25:07 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 15:24:52 +0200
Message-ID: <20231116132452.2671-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
References: <20231116132452.2671-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_power_basic: Add basic power
 measurement test
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add a small test measuring total system power via the
igt_power sysfs power_supply/BAT based mechanism.

For a bit of variation the test accepts some
command line options:
 -n		disable primary plane
 -b <index>	battery index
 -S <seconds>	settling duration
 -s <seconds>	measurement duration
 -m <modifier>	modifier to use
 -r <vrefresh>  vertical refresh rate

But apart from that the test doesn't do any complex multi-pipe/plane
scenarios or anything like that. I think of it as more of a quick
way to verify that certain basic power management features are
working as expected, and as an example how to use igt_power when
implementing more specific tests.

Obviously as the igt_power stuff depeds on the power_suppy/BAT
stuff this is only useful for battery powered devices which
still have a working battery :)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_power_basic.c | 160 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 tests/kms_power_basic.c

diff --git a/tests/kms_power_basic.c b/tests/kms_power_basic.c
new file mode 100644
index 000000000000..4b12a5286ae6
--- /dev/null
+++ b/tests/kms_power_basic.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_power.h"
+
+/**
+ * TEST: kms power basic
+ * Category: Display
+ * Description: Basic display power measurement
+ *
+ * SUBTEST:
+ * Description: Basic display power measurement
+ */
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	int pipe;
+	igt_output_t *output;
+	struct igt_power power;
+	uint64_t modifier;
+	int battery_index;
+	int settle_duration;
+	int measurement_duration;
+	int refresh_rate;
+	bool enable_plane;
+} data_t;
+
+static void test_pipe(data_t *data)
+{
+	struct power_sample pre, post;
+	struct igt_fb plane_fb = {};
+	drmModeModeInfo *mode;
+	igt_plane_t *plane;
+
+	igt_output_set_pipe(data->output, data->pipe);
+
+	plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+
+	mode = igt_memdup(igt_output_get_mode(data->output), sizeof(*mode));
+	if (data->refresh_rate) {
+		mode->clock = mode->clock * data->refresh_rate / mode->vrefresh;
+		mode->vrefresh = data->refresh_rate;
+		igt_output_override_mode(data->output, mode);
+	}
+
+	if (data->enable_plane || !data->display.is_atomic) {
+		igt_create_pattern_fb(data->drm_fd,
+				      mode->hdisplay, mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      data->modifier, &plane_fb);
+		igt_plane_set_fb(plane, &plane_fb);
+	} else {
+		igt_plane_set_fb(plane, NULL);
+	}
+
+	igt_display_commit2(&data->display,
+			    data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	if (!data->enable_plane && !data->display.is_atomic) {
+		igt_plane_set_fb(plane, NULL);
+		igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
+	}
+
+	igt_debug_wait_for_keypress("settle");
+
+	sleep(data->settle_duration);
+
+	igt_debug_wait_for_keypress("measure");
+
+	igt_power_get_energy(&data->power, &pre);
+	sleep(data->measurement_duration);
+	igt_power_get_energy(&data->power, &post);
+
+	igt_debug_wait_for_keypress("done");
+
+	igt_info("energy %f mJ, power %f mW, time %f s\n",
+		 igt_power_get_mJ(&data->power, &pre, &post),
+		 igt_power_get_mW(&data->power, &pre, &post),
+		 igt_power_get_s(&pre, &post));
+
+	igt_output_override_mode(data->output, NULL);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(data->drm_fd, &plane_fb);
+
+	free(mode);
+}
+
+static void run_tests(data_t *data)
+{
+	for_each_pipe_with_single_output(&data->display, data->pipe, data->output) {
+		test_pipe(data);
+		break;
+	}
+}
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'n':
+		data->enable_plane = false;
+		break;
+	case 'b':
+		data->battery_index = atoi(optarg);
+		break;
+	case 'S':
+		data->settle_duration = atoi(optarg);
+		break;
+	case 's':
+		data->measurement_duration = atoi(optarg);
+		break;
+	case 'm':
+		data->modifier = igt_fb_modifier_for_name(optarg);
+		break;
+	case 'r':
+		data->refresh_rate = atoi(optarg);
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char help_str[] =
+	"  -n\t\tdisable primary plane>\n"
+	"  -b <index>\tbattery index\n"
+	"  -S <seconds>\tsettling duration\n"
+	"  -s <seconds>\tmeasurement duration\n"
+	"  -m <modifier>\tmodifier to use\n"
+	"  -r <vrefresh>\tvertical refresh rate\n"
+	;
+
+static data_t data = {
+	.enable_plane = true,
+};
+
+igt_simple_main_args("nb:S:s:m:r:", NULL, help_str, opt_handler, &data)
+{
+	data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+	kmstest_set_vt_graphics_mode();
+
+	igt_display_require(&data.display, data.drm_fd);
+
+	igt_require(igt_power_bat_open(&data.power, data.battery_index) == 0);
+
+	run_tests(&data);
+
+	igt_power_close(&data.power);
+
+	igt_display_fini(&data.display);
+	close(data.drm_fd);
+}
diff --git a/tests/meson.build b/tests/meson.build
index 3e4d546017f0..679d9f8491fe 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -48,6 +48,7 @@ test_progs = [
 	'kms_plane_lowres',
 	'kms_plane_multiple',
 	'kms_plane_scaling',
+	'kms_power_basic',
 	'kms_prime',
 	'kms_prop_blob',
 	'kms_properties',
-- 
2.41.0
