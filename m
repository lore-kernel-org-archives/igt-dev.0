Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1678E69189
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 18:54:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7BC10E300;
	Fri, 22 Nov 2024 18:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGEAbQi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D5210E300
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 18:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732301681; x=1763837681;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8m4VGDw8LvabvMHnAfuhogBj0Sq/jpYfjLQLQN7iruM=;
 b=fGEAbQi71IGrMT62wqqscPc7TijG0eY/afz1wzzovrAErqjSfF+Cz7bL
 TNJa13qONCv2dqf7c5Jma+J5pk8FzhVqr70S696+pG1ZHE/tU142/upYR
 t2maCCVkCPWzHrxO09YBkHT2yzrLNLI3gfP/mOGUiM9jvBiTz/Nb6O0nA
 8JoRQb7+gl17nwT6jTeuwV6edC+vzHgp6sn4qQkhbzQ1HD/ZI9e4WS6wl
 bOozueLPIW8t9jp/PESDWlIGWb0CsTjYuDFti/iJaDl+UVjUVlomJlGtK
 S9TcvEp3qZHzK1p03To2Uyr+CYIqv2SSCvm3qbE1ess6KTw+U2tqLWEDU A==;
X-CSE-ConnectionGUID: izv4qL77SZmNFeNqE97Edg==
X-CSE-MsgGUID: uexl6H+jTAKyf47p625efQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="49987419"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="49987419"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 10:54:24 -0800
X-CSE-ConnectionGUID: p5Aqw+D9TV6Hg2xHXa6EJA==
X-CSE-MsgGUID: H6cT+YwsRX2GyBta8N0OAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; d="scan'208";a="113930316"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 10:54:23 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 4/4] tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
Date: Sat, 23 Nov 2024 00:27:08 +0530
Message-Id: <20241122185708.1755203-5-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241122185708.1755203-1-swati2.sharma@intel.com>
References: <20241122185708.1755203-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add new chamelium based sharpness test. Basic test is added where
we have tried comparing frame dump of unsharped and sharped image.
After, sharpness filter is applied its expected both frame dumps
will be different.

v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
    -fixed alignment (Ankit)
    -removed commit with fb_ref (Ankit)
    -set data->pipe_id (Ankit)
    -removed disable_filter_strength_on_pipe()
    -fixed CRASH
    -fixed assert condition

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../kms_chamelium_sharpness_filter.c          | 240 ++++++++++++++++++
 tests/meson.build                             |   2 +
 2 files changed, 242 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c

diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
new file mode 100644
index 000000000..d7316723a
--- /dev/null
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: kms chamelium sharpness filter
+ * Category: Display
+ * Description: Test to validate content adaptive sharpness filter using Chamelium
+ * Driver requirement: xe
+ * Functionality: chamelium, casf
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+
+/**
+ * SUBTEST: filter-basic
+ * Description: Verify basic content adaptive sharpness filter.
+ */
+
+IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
+
+#define MID_FILTER_STRENGTH		128
+
+typedef struct {
+	int drm_fd;
+	enum pipe pipe_id;
+	struct igt_fb fb, fb_ref;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	int filter_strength;
+	struct chamelium *chamelium;
+	struct chamelium_port **ports;
+	int port_count;
+} data_t;
+
+static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
+{
+	bool ret = true;
+
+	igt_output_set_pipe(data->output, pipe);
+	if (!intel_pipe_output_combo_valid(&data->display))
+		ret = false;
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
+static void set_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPNESS_STRENGTH,
+				data->filter_strength);
+}
+
+static void paint_image(igt_fb_t *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+	int img_x, img_y, img_w, img_h;
+	const char *file = "1080p-left.png";
+
+	img_x = img_y = 0;
+	img_w = fb->width;
+	img_h = fb->height;
+
+	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void setup_fb(int fd, int width, int height, uint32_t format,
+		     uint64_t modifier, struct igt_fb *fb)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
+	igt_assert(fb_id);
+
+	paint_image(fb);
+}
+
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_remove_fb(data->drm_fd, &data->fb_ref);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_output_override_mode(data->output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+
+static bool test_t(data_t *data, igt_plane_t *primary,
+		   struct chamelium_port *port)
+{
+	struct chamelium_frame_dump *dump;
+	drmModeModeInfo *mode;
+	int height, width;
+	bool ret = false;
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	mode = igt_output_get_mode(data->output);
+	height = mode->hdisplay;
+	width = mode->vdisplay;
+
+	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
+	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
+
+	igt_plane_set_fb(data->primary, &data->fb);
+	set_filter_strength_on_pipe(data);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_debug("Reading frame dumps from Chamelium...\n");
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	dump = chamelium_read_captured_frame(data->chamelium, 0);
+
+	ret = chamelium_frame_match_or_dump(data->chamelium, port,
+					    dump, &data->fb_ref,
+					    CHAMELIUM_CHECK_ANALOG);
+	chamelium_destroy_frame_dump(dump);
+	cleanup(data);
+
+	return ret;
+}
+
+static int test_setup(data_t *data, enum pipe p)
+{
+	igt_pipe_t *pipe;
+	int i = 0;
+
+	igt_display_reset(&data->display);
+	igt_modeset_disable_all_outputs(&data->display);
+	chamelium_reset_state(&data->display, data->chamelium, NULL,
+			      data->ports, data->port_count);
+
+	pipe = &data->display.pipes[p];
+	igt_require(pipe->n_planes >= 0);
+
+	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(data->primary);
+
+	/*
+	 * Prefer to run this test on HDMI connector if its connected, since on DP we
+	 * sometimes face DP FSM issue
+	 */
+        for_each_valid_output_on_pipe(&data->display, p, data->output) {
+		data->pipe_id = p;
+                for (i = 0; i < data->port_count; i++) {
+                        if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
+			    strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
+                                return i;
+                }
+        }
+
+	for_each_valid_output_on_pipe(&data->display, p, data->output) {
+		data->pipe_id = p;
+		for (i = 0; i < data->port_count; i++) {
+			if (strcmp(data->output->name,
+				   chamelium_port_get_name(data->ports[i])) == 0)
+				return i;
+		}
+	}
+
+	return -1;
+}
+
+static void test_sharpness_filter(data_t *data,  enum pipe p)
+{
+	int port_idx = test_setup(data, p);
+
+	igt_require(port_idx >= 0);
+	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
+
+	if (!pipe_output_combo_valid(data, p))
+		return;
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+		igt_assert_f(!(test_t(data, data->primary, data->ports[port_idx]) == 1), "No sharpness observed.\n");
+}
+
+static void
+run_sharpness_filter_test(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	enum pipe pipe;
+
+	igt_describe("Verify basic content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-basic") {
+		for_each_pipe(display, pipe) {
+			data->filter_strength = MID_FILTER_STRENGTH;
+			test_sharpness_filter(data, pipe);
+		}
+	}
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+
+		igt_chamelium_allow_fsm_handling = false;
+
+		/* we need to initalize chamelium after igt_display_require */
+		data.chamelium = chamelium_init(data.drm_fd, &data.display);
+		igt_require(data.chamelium);
+
+		data.ports = chamelium_get_ports(data.chamelium,
+						 &data.port_count);
+
+		if (!data.port_count)
+			igt_skip("No ports connected\n");
+		/*
+		 * We don't cause any harm by plugging
+		 * discovered ports, just incase they are not plugged
+		 * we currently skip in test_setup
+		 */
+		for(int i = 0; i < data.port_count; i++)
+			chamelium_plug(data.chamelium, data.ports[i]);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	run_sharpness_filter_test(&data);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 84d8bed4b..0a336c2c1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -340,6 +340,7 @@ chamelium_progs = [
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
+	'kms_chamelium_sharpness_filter',
 ]
 
 test_deps = [ igt_deps ]
@@ -365,6 +366,7 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
-- 
2.25.1

