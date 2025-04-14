Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109AC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8F510E56E;
	Mon, 14 Apr 2025 11:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KU9SP2VB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B544A10E56E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744629112; x=1776165112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sJODlmvnSLWrI6ixNeeFvHYYLIurd3vM83+bY2V2cM4=;
 b=KU9SP2VB85ou0qtV8dbdkoGyMTOb6PPYvBUIpMLD+ZvdjgFkPh064tR8
 xmFBpve1t4huqE/B5tTlC/IjB5ek0qCgfdi1Q98b0H1EMT2yTEuALJlRP
 ex+Xrl3WhuNpAd88l/sssEnPpeCW36EqXbTNemQkY0DgNJTan8LVyCLVw
 O05yL8I/Ik1q//Q6U4HrFzgCDWvwLLX8KeokgeWOlOM09ChGca181k87c
 eVsfj04XaMqn8v8t5GzK6Ti6kPPEZEc9wkVJbLlPZJddTcUtFph1Ez3Fc
 mDseThPmt0eawO1qSUahKPVtSclDfL6PtN+o5gnvCyHsF8AhX5neDIDtm Q==;
X-CSE-ConnectionGUID: KDDGiou4RlenqWFEftKmBg==
X-CSE-MsgGUID: JqTHdIMmRpGXscLn3bVWMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33706212"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="33706212"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:52 -0700
X-CSE-ConnectionGUID: QPINQyoLTKSQtPtmMqsKmA==
X-CSE-MsgGUID: bkCVddRFQbCjZn+SJSEWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134838357"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:50 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 10/10] tests/chamelium/kms_chamelium_sharpness_filter: Add basic
 test
Date: Mon, 14 Apr 2025 16:46:57 +0530
Message-Id: <20250414111657.794484-11-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414111657.794484-1-swati2.sharma@intel.com>
References: <20250414111657.794484-1-swati2.sharma@intel.com>
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

Test steps:
    1. Display a test image with no sharpness filter.
    2. Capture output (Frame 0).
    3. Enable sharpness filter at mid strength.
    4. Capture output (Frame 1).
    5. Disable the filter again.
    6. Capture output (Frame 2).
    7. Re-enable filter with same strength.
    8. Capture output (Frame 3).
    9. Compare frame pairs:
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../kms_chamelium_sharpness_filter.c          | 282 ++++++++++++++++++
 tests/meson.build                             |   2 +
 2 files changed, 284 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c

diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
new file mode 100644
index 000000000..2ac05717a
--- /dev/null
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -0,0 +1,282 @@
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
+	bool ret[4], ret_ok = false;
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
+	ret[0] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[0], frame[1]);
+
+	ret[1] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[1], frame[2]);
+
+	ret[2] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[0], frame[2]);
+
+	ret[3] = chamelium_frame_eq_or_dump_frame_pair(data->chamelium,
+						       frame[1], frame[3]);
+
+	ret_ok = (ret[0] == 0) && (ret[1] == 0) && (ret[2] == 1) && (ret[3] == 1);
+
+	destroy_frame_dumps(frame, MAX_FRAMES);
+	cleanup(data);
+
+	igt_assert_f(ret_ok, "Sharpness filter test failed:\n"
+	             "Expected: Frame[0]==Frame[1]: 0, Frame[1]==Frame[2]: 0, Frame[0]==Frame[2]: 1, Frame[1]==Frame[3]: 1\n"
+		     "Observed: Frame[0]==Frame[1]: %d, Frame[1]==Frame[2]: %d, Frame[0]==Frame[2]: %d, Frame[1]==Frame[3]: %d\n", ret[0], ret[1], ret[2], ret[3]);
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
index bef4d302c..24a9a1f28 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -348,6 +348,7 @@ chamelium_progs = [
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
+	'kms_chamelium_sharpness_filter',
 ]
 
 test_deps = [ igt_deps ]
@@ -373,6 +374,7 @@ extra_sources = {
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_dp_linktrain_fallback': [
            join_paths ('intel', 'kms_mst_helper.c'),
            join_paths ('intel', 'kms_dsc_helper.c') ],
-- 
2.25.1

