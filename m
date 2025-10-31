Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC256CCF9EE
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EC810EABF;
	Fri, 31 Oct 2025 07:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNG8heOj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACAB10EABF
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897552; x=1793433552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+6hrbnygRmQFgzuD0cBH9dBxl+uL6suzE8FTd8PcROk=;
 b=mNG8heOjNHGAmUsdFfDx+XDmfXtf4xb3erYZ1jAaHDnpnslURRtqGlMc
 fjRVNNaVLSAKjLVC4oGGcSxlCkd4U4IxhptfKEmoxoQ5cf4Czb73EB5ox
 XFhS71Mfnx2Rf96lHXUpOtFaFNsLMrbygfOb6sGjELpJMa6IB/oAwH6w5
 nbZp2c60ovQtxEJkQNlea2E2BncSGJj78ux27kIeqlcynd/YSwLtWwu6g
 SpU6PexyO/yF+/r8NiQM5AFKtFQ7qrJ3gBxhmSpe8x9DHpotJkXBCEW7A
 VCKMcWmVgVH6N461ejwTf+kAxoaxPzhFBvb8fyCmLgqwiP9r9K9XSSXTF g==;
X-CSE-ConnectionGUID: 0VGNWfOFRlGCAroL1VSLiw==
X-CSE-MsgGUID: 5bKCxucdRVuyWlAcYtOB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169907"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169907"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:59:12 -0700
X-CSE-ConnectionGUID: bDaR9ovCRB2dSy+TV4U1cg==
X-CSE-MsgGUID: EYDTgAi3RpaCJlcCNk/OpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287437"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:59:11 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v6 10/10] tests/chamelium/kms_chamelium_sharpness_filter: Add basic
 test
Date: Fri, 31 Oct 2025 13:35:34 +0530
Message-Id: <20251031080534.880321-11-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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

This test validates the content adaptive sharpness filter functionality
by toggling the sharpness property on the CRTC and capturing frames
using Chamelium. It ensures that the filter visually alters the output as
expected.

    step 1. Display a test image with no sharpness filter.
    step 2. Capture output (Frame 0).
    step 3. Enable sharpness filter at mid strength.
    step 4. Capture output (Frame 1).
    step 5. Disable the filter again.
    step 6. Capture output (Frame 2).
    step 7. Re-enable filter with same strength.
    step 8. Capture output (Frame 3).
    step 9. Compare frame pairs:
		- Frame 0 vs Frame 1 → should differ
		- Frame 1 vs Frame 2 → should differ
		- Frame 0 vs Frame 2 → should match
		- Frame 1 vs Frame 3 → should match

v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
    -fixed alignment (Ankit)
    -removed commit with fb_ref (Ankit)
    -set data->pipe_id (Ankit)
    -removed disable_filter_strength_on_pipe()
    -fixed CRASH
    -fixed assert condition
v3: -minor fixes
v4: -modified test (Ankit)
    -change in seq (Ankit)
v5: -changed igt_assert() and return type of test_t()
v6: -s/ret/match (Ankit)
    -compare with true/false instead of 1 and 0 (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 .../kms_chamelium_sharpness_filter.c          | 296 ++++++++++++++++++
 tests/meson.build                             |   2 +
 2 files changed, 298 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c

diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
new file mode 100644
index 000000000..fa397415d
--- /dev/null
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms chamelium sharpness filter
+ * Category: Display
+ * Description: Test to validate content adaptive sharpness filter using Chamelium
+ * Driver requirement: xe
+ * Mega feature: General Display Features
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
+#define MAX_FRAMES			4
+
+typedef struct {
+	int drm_fd;
+	enum pipe pipe_id;
+	struct igt_fb fb;
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
+static void reset_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPNESS_STRENGTH, 0);
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
+static void destroy_frame_dumps(struct chamelium_frame_dump *frames[], int count)
+{
+	for (int i = 0; i < count; i++) {
+		if (frames[i]) {
+			chamelium_destroy_frame_dump(frames[i]);
+			frames[i] = NULL;
+		}
+	}
+}
+
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_output_override_mode(data->output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void test_t(data_t *data, igt_plane_t *primary,
+		   struct chamelium_port *port)
+{
+	struct chamelium_frame_dump *frame[4];
+	drmModeModeInfo *mode;
+	int height, width;
+	bool match[4], match_ok = false;
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	mode = igt_output_get_mode(data->output);
+	height = mode->hdisplay;
+	width = mode->vdisplay;
+
+	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
+
+	igt_plane_set_fb(data->primary, &data->fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame[0] =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	set_filter_strength_on_pipe(data);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame[1] =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	reset_filter_strength_on_pipe(data);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame[2] =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	set_filter_strength_on_pipe(data);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame[3] =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	match[0] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[0], frame[1]);
+
+	match[1] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[1], frame[2]);
+
+	match[2] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[0], frame[2]);
+
+	match[3] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[1], frame[3]);
+
+	match_ok = (match[0] == false) && (match[1] == false) && (match[2] == true) && (match[3] == true);
+
+	destroy_frame_dumps(frame, MAX_FRAMES);
+	cleanup(data);
+
+	igt_assert_f(match_ok, "Sharpness filter test failed:\n"
+	             "Expected: Frame[0]==Frame[1]: 0, Frame[1]==Frame[2]: 0, Frame[0]==Frame[2]: 1, Frame[1]==Frame[3]: 1\n"
+		     "Observed: Frame[0]==Frame[1]: %d, Frame[1]==Frame[2]: %d, Frame[0]==Frame[2]: %d, Frame[1]==Frame[3]: %d\n", match[0], match[1], match[2], match[3]);
+}
+
+static int test_setup(data_t *data, enum pipe p)
+{
+	igt_pipe_t *pipe;
+	int i = 0;
+
+	igt_display_reset(&data->display);
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
+		for (i = 0; i < data->port_count; i++) {
+			if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+			     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
+			     strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
+				return i;
+		}
+	}
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
+		(test_t(data, data->primary, data->ports[port_idx]));
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
+		data.drm_fd = drm_open_driver_master(DRIVER_XE);
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
+		 * The behavior differs based on the availability of port mappings:
+		 * - When using port mappings (chamelium_read_port_mappings),
+		 *   ports are not plugged
+		 * - During autodiscovery, all ports are plugged at the end.
+		 *
+		 * This quick workaround (unplug, plug, and re-probe the connectors)
+		 * prevents any ports from being unintentionally skipped in test_setup.
+		 */
+		for(int i = 0; i < data.port_count; i++) {
+			chamelium_unplug(data.chamelium, data.ports[i]);
+			chamelium_plug(data.chamelium, data.ports[i]);
+			chamelium_wait_for_conn_status_change(&data.display,
+							      data.chamelium,
+							      data.ports[i],
+							      DRM_MODE_CONNECTED);
+			igt_assert_f(chamelium_reprobe_connector(&data.display,
+								 data.chamelium,
+								 data.ports[i]) == DRM_MODE_CONNECTED,
+								 "Output not connected\n");
+		}
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
index 8204aac5c..f2267bc09 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -355,6 +355,7 @@ chamelium_progs = [
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
+	'kms_chamelium_sharpness_filter',
 ]
 
 test_deps = [ igt_deps ]
@@ -380,6 +381,7 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
-- 
2.25.1

