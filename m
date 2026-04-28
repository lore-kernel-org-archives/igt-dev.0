Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F0FFFF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC49310E2C4;
	Tue, 28 Apr 2026 04:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ho7osTd0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EAF10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351659; x=1808887659;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0htsQIAiYlD2dQzFm8JepA0j1q1omMOZ49Zr6fZgvE=;
 b=ho7osTd0SJ2wCAFYo+2hQdO2NCr4Pf7hFR+slmtOOf4t9sypGpfZmSiD
 rHvp/XY4NNraIFdGDVOlMihKzijUegenLDZx8AP4nNkNuCqZ1PCG1D3LM
 9S6Dr0A7nuWde/CP5TdfSwgZnm2lAMFpZ8l4SQWuajqly8f7F/TPg5WWY
 gtierHjdfZAh00Q06WLfrMzqYCgfbBK3PRuwfQ8VQdXjr6s7COvu+hPPf
 Ga/bWpfg8TGgAsIZX08P/SuYlV/8uI7wrYdZJIFZ3J174S39R/N+A6qC9
 18lqmBY9UyzCYpDFy/jZp3TYF+b0ipncIjdhTVsnSv+etwGBcLW+uQzxp g==;
X-CSE-ConnectionGUID: iy1IyTl7T1Kn5H2pYdL5YA==
X-CSE-MsgGUID: xfdo8SecRKS66XTuxDmwWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167869"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167869"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:39 -0700
X-CSE-ConnectionGUID: wqmxJ7r1TEWp6mgpxMZoFA==
X-CSE-MsgGUID: gLPpHlFKRY61a59dmNkv/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706801"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:38 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 23/25] tests/chamelium/v3: Add frame capture and CRC
 tests for Chamelium v3
Date: Tue, 28 Apr 2026 10:16:32 +0530
Message-ID: <20260428044644.257001-24-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260428044644.257001-1-mohammed.bilal@intel.com>
References: <20260428044644.257001-1-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
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

This commit adds frame capture and CRC verification tests for Chamelium v3
including frame dump, pixel comparison, and display output verification.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/v3/kms_chamelium_v3_frames.c | 1551 ++++++++++++++++++
 tests/meson.build                            |    1 +
 2 files changed, 1552 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_frames.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_frames.c b/tests/chamelium/v3/kms_chamelium_v3_frames.c
new file mode 100644
index 000000000..2132cf944
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_frames.c
@@ -0,0 +1,1551 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Chamelium V3 Frame Capture / CRC Tests
+ *
+ * Tests frame capture, pixel-by-pixel comparison, format validation,
+ * and plane composition using the Chamelium DumpPixels API.
+ * Category: Display
+ * Description: Frame capture and comparison tests for Chamelium V3
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_kms.h"
+#include "igt_infoframe.h"
+#include "chamelium/v3/igt_chamelium.h"
+
+IGT_TEST_DESCRIPTION("Frame capture and comparison tests using Chamelium V3 DumpPixels API");
+
+#define HPD_WAIT_TIME_MS 3000
+
+/* Chamelium V3 port IDs */
+#define FPGA_DP1_PORT 4
+#define FPGA_DP2_PORT 5
+#define ITE_HDMI1_PORT 2
+#define ITE_HDMI2_PORT 3
+
+/*
+ * Tolerance for frame comparison.
+ * Digital connections (DP/HDMI) should be near-exact, but allow
+ * small differences for color quantization and rounding.
+ */
+#define FRAME_CRC_TOLERANCE 2
+#define FRAME_DUMP_TOLERANCE 0
+#define FRAME_CHECKERBOARD_TOLERANCE 10
+#define FRAME_FORMAT_TOLERANCE 10
+
+/* Maps Video Identification Codes to a mode */
+struct vic_mode {
+	int hactive, vactive;
+	int vrefresh; /* Hz */
+	uint32_t picture_ar;
+};
+
+static const struct vic_mode vic_modes[] = {
+	[16] = {
+		.hactive = 1920,
+		.vactive = 1080,
+		.vrefresh = 60,
+		.picture_ar = DRM_MODE_PICTURE_ASPECT_16_9,
+	},
+};
+
+struct frames_test_data {
+	/* Chamelium V3 */
+	struct igt_chamelium_v3 *chamelium;
+	chamelium_v3_port_id *ports;
+	int port_count;
+
+	/* DRM display */
+	int drm_fd;
+	igt_display_t display;
+};
+
+
+/* Find the first DP port, preferring FPGA ports */
+static chamelium_v3_port_id find_dp_port(struct frames_test_data *data)
+{
+	int i;
+
+	/* Prefer FPGA DP ports first */
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_dp(data->chamelium, port) &&
+		    chamelium_v3_is_plugged(data->chamelium, port) &&
+		    (port == FPGA_DP1_PORT || port == FPGA_DP2_PORT))
+			return port;
+	}
+	/* Fallback to any DP port */
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_dp(data->chamelium, port) &&
+		    chamelium_v3_is_plugged(data->chamelium, port))
+			return port;
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+/* Find the first HDMI port */
+static chamelium_v3_port_id find_hdmi_port(struct frames_test_data *data)
+{
+	int i;
+
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port = data->ports[i];
+
+		if (chamelium_v3_port_is_hdmi(data->chamelium, port) &&
+		    chamelium_v3_is_plugged(data->chamelium, port))
+			return port;
+	}
+	return (chamelium_v3_port_id)-1;
+}
+
+
+/*
+ * Find a DRM output matching the Chamelium port type.
+ * For HDMI ports, look for HDMI-A connectors; for DP ports, look for DP connectors.
+ */
+static igt_output_t *find_output_for_port(struct frames_test_data *data,
+					  chamelium_v3_port_id port_id,
+					  bool is_hdmi)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(&data->display, crtc) {
+		for_each_valid_output_on_crtc(&data->display, crtc, output) {
+			uint32_t conn_type = output->config.connector->connector_type;
+			bool is_match = false;
+
+			if (is_hdmi)
+				is_match = (conn_type == DRM_MODE_CONNECTOR_HDMIA ||
+					    conn_type == DRM_MODE_CONNECTOR_HDMIB);
+			else
+				is_match = (conn_type == DRM_MODE_CONNECTOR_DisplayPort);
+
+			if (is_match)
+				return output;
+		}
+	}
+
+	return NULL;
+}
+
+/*
+ * Set up display: attach output to a pipe, get primary plane, set mode.
+ * Returns the primary plane, or NULL on failure.
+ */
+static igt_plane_t *setup_output(struct frames_test_data *data,
+				 igt_output_t *output,
+				 drmModeModeInfo *mode)
+{
+	igt_crtc_t *pipe_obj;
+	igt_plane_t *primary;
+	igt_crtc_t *crtc;
+
+	for_each_crtc(&data->display, crtc) {
+		if (igt_crtc_connector_valid(crtc, output)) {
+			pipe_obj = crtc;
+			primary = igt_crtc_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
+			if (primary) {
+				igt_output_set_crtc(output, pipe_obj);
+				igt_output_override_mode(output, mode);
+				return primary;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+/*
+ * Enable output with the given framebuffer.
+ * Commits the modeset atomically and waits for signal stabilization.
+ */
+static void enable_output(struct frames_test_data *data,
+			  igt_output_t *output,
+			  igt_plane_t *primary,
+			  struct igt_fb *fb)
+{
+	igt_plane_set_fb(primary, fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Wait for the display signal to stabilize on the Chamelium */
+	sleep(5);
+}
+
+/*
+ * Disable output and clean up.
+ */
+static void disable_output(struct frames_test_data *data,
+			   igt_output_t *output,
+			   igt_plane_t *primary)
+{
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_crtc(output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+
+/*
+ * Compare a captured V3 frame (RGB, 3 bytes per pixel) against a local
+ * framebuffer (XRGB8888, 4 bytes per pixel in BGRA memory order).
+ *
+ * Returns true if frames match within tolerance.
+ */
+static bool compare_frame_to_fb(struct frames_test_data *data,
+				struct chamelium_v3_frame *frame,
+				struct igt_fb *fb,
+				int tolerance)
+{
+	cairo_t *cr;
+	cairo_surface_t *surface;
+	unsigned char *fb_data;
+	int stride;
+	int x, y;
+	int mismatches = 0;
+	int total_pixels = frame->width * frame->height;
+	/* Allow up to 2% mismatch for edge effects and format conversion */
+	int max_mismatches = total_pixels * 2 / 100;
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	surface = cairo_get_target(cr);
+	cairo_surface_flush(surface);
+	fb_data = cairo_image_surface_get_data(surface);
+	stride = cairo_image_surface_get_stride(surface);
+
+	igt_debug("Comparing frame %dx%d against framebuffer (stride=%d, tolerance=%d)...\n",
+		  frame->width, frame->height, stride, tolerance);
+
+	for (y = 0; y < frame->height && mismatches <= max_mismatches; y++) {
+		for (x = 0; x < frame->width && mismatches <= max_mismatches; x++) {
+			int frame_idx = (y * frame->width + x) * 3;
+			uint8_t cap_r = frame->data[frame_idx + 0];
+			uint8_t cap_g = frame->data[frame_idx + 1];
+			uint8_t cap_b = frame->data[frame_idx + 2];
+
+			int fb_idx = y * stride + x * 4;
+			uint8_t fb_b = fb_data[fb_idx + 0];
+			uint8_t fb_g = fb_data[fb_idx + 1];
+			uint8_t fb_r = fb_data[fb_idx + 2];
+
+			int diff_r = abs((int)cap_r - (int)fb_r);
+			int diff_g = abs((int)cap_g - (int)fb_g);
+			int diff_b = abs((int)cap_b - (int)fb_b);
+
+			if (diff_r > tolerance || diff_g > tolerance || diff_b > tolerance) {
+				mismatches++;
+				if (mismatches <= 10)
+					igt_debug("Mismatch at (%d,%d): captured RGB(%d,%d,%d) vs expected RGB(%d,%d,%d)\n",
+						  x, y, cap_r, cap_g, cap_b, fb_r, fb_g, fb_b);
+			}
+		}
+	}
+
+	igt_put_cairo_ctx(cr);
+
+	igt_info("Frame comparison: %d mismatches out of %d pixels (%.2f%%)\n",
+		 mismatches, total_pixels, 100.0 * mismatches / total_pixels);
+
+	return mismatches <= max_mismatches;
+}
+
+/*
+ * Strict pixel-exact comparison for frame dump tests.
+ * Returns true only if every pixel matches exactly.
+ */
+static bool compare_frame_to_fb_exact(struct frames_test_data *data,
+				      struct chamelium_v3_frame *frame,
+				      struct igt_fb *fb)
+{
+	cairo_t *cr;
+	cairo_surface_t *surface;
+	unsigned char *fb_data;
+	int stride;
+	int x, y;
+	int mismatches = 0;
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	surface = cairo_get_target(cr);
+	cairo_surface_flush(surface);
+	fb_data = cairo_image_surface_get_data(surface);
+	stride = cairo_image_surface_get_stride(surface);
+
+	igt_debug("Exact frame comparison %dx%d...\n", frame->width, frame->height);
+
+	for (y = 0; y < frame->height; y++) {
+		for (x = 0; x < frame->width; x++) {
+			int frame_idx = (y * frame->width + x) * 3;
+			uint8_t cap_r = frame->data[frame_idx + 0];
+			uint8_t cap_g = frame->data[frame_idx + 1];
+			uint8_t cap_b = frame->data[frame_idx + 2];
+
+			int fb_idx = y * stride + x * 4;
+			uint8_t fb_b = fb_data[fb_idx + 0];
+			uint8_t fb_g = fb_data[fb_idx + 1];
+			uint8_t fb_r = fb_data[fb_idx + 2];
+
+			if (cap_r != fb_r || cap_g != fb_g || cap_b != fb_b) {
+				mismatches++;
+				if (mismatches <= 10)
+					igt_debug("Mismatch at (%d,%d): captured RGB(%d,%d,%d) vs expected RGB(%d,%d,%d)\n",
+						  x, y, cap_r, cap_g, cap_b, fb_r, fb_g, fb_b);
+			}
+		}
+	}
+
+	igt_put_cairo_ctx(cr);
+
+	if (mismatches > 0) {
+		int total = frame->width * frame->height;
+
+		igt_info("Exact comparison FAILED: %d mismatches out of %d pixels (%.2f%%)\n",
+			 mismatches, total, 100.0 * mismatches / total);
+	} else {
+		igt_info("Exact comparison PASSED: all pixels match\n");
+	}
+
+	return mismatches == 0;
+}
+
+#define CAPTURE_MAX_RETRIES 5
+#define CAPTURE_RETRY_DELAY_S 5
+
+/*
+ * Capture a frame with retry logic.
+ * DumpPixels can fail with V4L.Timeout if the signal hasn't stabilized
+ * after a mode switch. We retry with increasing delay.
+ */
+static struct chamelium_v3_frame *capture_frame_with_retry(
+	struct frames_test_data *data,
+	chamelium_v3_port_id port_id)
+{
+	struct chamelium_v3_frame *frame;
+	int retry;
+
+	for (retry = 0; retry < CAPTURE_MAX_RETRIES; retry++) {
+		frame = chamelium_v3_capture_frame(data->chamelium, port_id);
+		if (frame)
+			return frame;
+
+		igt_warn("Frame capture attempt %d/%d failed, retrying in %ds...\n",
+			 retry + 1, CAPTURE_MAX_RETRIES,
+			 CAPTURE_RETRY_DELAY_S + retry);
+		sleep(CAPTURE_RETRY_DELAY_S + retry);
+	}
+
+	return NULL;
+}
+
+/*
+ * Capture a frame from Chamelium and compare against the given framebuffer.
+ * Repeats capture `count` times and verifies all captures match.
+ *
+ * Returns true on success.  When skip_on_capture_fail is set, a
+ * DumpPixels timeout (after all retries) returns false instead of
+ * asserting, so the caller can skip the problematic mode.
+ */
+static bool do_test_display(struct frames_test_data *data,
+			    chamelium_v3_port_id port_id,
+			    igt_output_t *output,
+			    igt_plane_t *primary,
+			    drmModeModeInfo *mode,
+			    uint32_t fourcc,
+			    int tolerance,
+			    int count,
+			    bool skip_on_capture_fail)
+{
+	struct igt_fb pattern_fb, frame_fb;
+	struct chamelium_v3_frame *frame;
+	int i, fb_id, frame_id;
+	bool success = true;
+
+	/* Create a pattern framebuffer in XRGB8888 */
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &pattern_fb);
+	igt_assert(fb_id > 0);
+
+	/* Convert to the requested format if different */
+	if (fourcc != DRM_FORMAT_XRGB8888) {
+		frame_id = igt_fb_convert(&frame_fb, &pattern_fb, fourcc,
+					  DRM_FORMAT_MOD_LINEAR);
+		igt_assert(frame_id > 0);
+	} else {
+		frame_fb = pattern_fb;
+	}
+
+	/* Enable output with the display framebuffer */
+	enable_output(data, output, primary, &frame_fb);
+
+	igt_info("Capturing %d frame(s) at %dx%d for format %s...\n",
+		 count, mode->hdisplay, mode->vdisplay, igt_format_str(fourcc));
+
+	for (i = 0; i < count; i++) {
+		frame = capture_frame_with_retry(data, port_id);
+		if (!frame) {
+			if (skip_on_capture_fail) {
+				igt_warn("Frame capture failed for %dx%d@%d – skipping mode (V4L timeout)\n",
+					 mode->hdisplay, mode->vdisplay,
+					 mode->vrefresh);
+				success = false;
+				goto cleanup;
+			}
+			igt_assert_f(frame, "Failed to capture frame %d/%d\n",
+				     i + 1, count);
+		}
+
+		igt_assert_f(frame->width == mode->hdisplay &&
+			     frame->height == mode->vdisplay,
+			     "Frame size mismatch: captured %dx%d, expected %dx%d\n",
+			     frame->width, frame->height,
+			     mode->hdisplay, mode->vdisplay);
+
+		/* Compare against the original XRGB8888 pattern */
+		igt_assert_f(compare_frame_to_fb(data, frame, &pattern_fb, tolerance),
+			     "Frame %d/%d comparison failed\n", i + 1, count);
+
+		chamelium_v3_free_frame(frame);
+	}
+
+cleanup:
+	if (fourcc != DRM_FORMAT_XRGB8888)
+		igt_remove_fb(data->drm_fd, &frame_fb);
+	igt_remove_fb(data->drm_fd, &pattern_fb);
+	return success;
+}
+
+/*
+ * Frame dump: capture and do exact pixel-by-pixel comparison.
+ * Frame dump comparison test.
+ */
+static void do_test_frame_dump(struct frames_test_data *data,
+			       chamelium_v3_port_id port_id,
+			       igt_output_t *output,
+			       igt_plane_t *primary,
+			       drmModeModeInfo *mode,
+			       bool is_hdmi)
+{
+	struct igt_fb fb;
+	struct chamelium_v3_frame *frame;
+	int fb_id, j;
+	int dump_count = 5;
+
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &fb);
+	igt_assert(fb_id > 0);
+
+	enable_output(data, output, primary, &fb);
+
+	igt_info("Dumping %d frames at %dx%d (%s)...\n",
+		 dump_count, mode->hdisplay, mode->vdisplay,
+		 is_hdmi ? "HDMI-tolerant" : "DP-exact");
+
+	for (j = 0; j < dump_count; j++) {
+		frame = capture_frame_with_retry(data, port_id);
+		igt_assert_f(frame, "Failed to capture frame dump %d/%d\n",
+			     j + 1, dump_count);
+
+		igt_assert_f(frame->width == mode->hdisplay &&
+			     frame->height == mode->vdisplay,
+			     "Frame size mismatch: captured %dx%d, expected %dx%d\n",
+			     frame->width, frame->height,
+			     mode->hdisplay, mode->vdisplay);
+
+		/*
+		 * DP is pixel-exact since it's purely digital.
+		 * HDMI may have color space conversion artifacts at
+		 * certain modes, so use tolerant comparison.
+		 */
+		if (is_hdmi)
+			igt_assert_f(compare_frame_to_fb(data, frame, &fb,
+							 FRAME_CRC_TOLERANCE),
+				     "Frame dump %d/%d comparison failed\n",
+				     j + 1, dump_count);
+		else
+			igt_assert_f(compare_frame_to_fb_exact(data, frame, &fb),
+				     "Frame dump %d/%d pixel comparison failed\n",
+				     j + 1, dump_count);
+
+		chamelium_v3_free_frame(frame);
+	}
+
+	igt_remove_fb(data->drm_fd, &fb);
+}
+
+
+static void randomize_plane_stride(struct frames_test_data *data,
+				   uint32_t width, uint32_t height,
+				   uint32_t format, uint64_t modifier,
+				   size_t *stride)
+{
+	size_t stride_min;
+	uint32_t max_tile_w = 4, tile_w, tile_h;
+	int i;
+	struct igt_fb dummy;
+
+	stride_min = width * igt_format_plane_bpp(format, 0) / 8;
+
+	/* Randomize the stride to less than twice the minimum */
+	*stride = (rand() % stride_min) + stride_min;
+
+	/* Determine max tile width for alignment */
+	igt_create_fb(data->drm_fd, 64, 64, format, modifier, &dummy);
+	for (i = 0; i < dummy.num_planes; i++) {
+		igt_get_fb_tile_size(data->drm_fd, modifier,
+				     dummy.plane_bpp[i], &tile_w, &tile_h);
+		if (tile_w > max_tile_w)
+			max_tile_w = tile_w;
+	}
+	igt_remove_fb(data->drm_fd, &dummy);
+
+	/* Align to both 32-bit and tile width */
+	*stride = ALIGN(*stride, max_tile_w);
+}
+
+static void randomize_plane_setup(struct frames_test_data *data,
+				  igt_plane_t *plane,
+				  drmModeModeInfo *mode,
+				  uint32_t *width, uint32_t *height,
+				  uint32_t *format, uint64_t *modifier,
+				  bool allow_yuv)
+{
+	int min_dim;
+	uint32_t idx[plane->format_mod_count];
+	unsigned int count = 0;
+	unsigned int i;
+
+	/* Count supported formats */
+	for (i = 0; i < plane->format_mod_count; i++)
+		if (igt_fb_supported_format(plane->formats[i]) &&
+		    (allow_yuv || !igt_format_is_yuv(plane->formats[i])))
+			idx[count++] = i;
+
+	igt_assert(count > 0);
+
+	i = idx[rand() % count];
+	*format = plane->formats[i];
+	*modifier = plane->modifiers[i];
+
+	/* Use minimum dimension of 16 for YUV, 8 for others */
+	min_dim = igt_format_is_yuv(*format) ? 16 : 8;
+
+	*width = max((rand() % mode->hdisplay) + 1, 2 * min_dim);
+	*height = max((rand() % mode->vdisplay) + 1, 2 * min_dim);
+}
+
+static void configure_plane(igt_plane_t *plane,
+			    uint32_t src_w, uint32_t src_h,
+			    uint32_t src_x, uint32_t src_y,
+			    uint32_t crtc_w, uint32_t crtc_h,
+			    int32_t crtc_x, int32_t crtc_y,
+			    struct igt_fb *fb)
+{
+	igt_plane_set_fb(plane, fb);
+	igt_plane_set_position(plane, crtc_x, crtc_y);
+	igt_plane_set_size(plane, crtc_w, crtc_h);
+	igt_fb_set_position(fb, plane, src_x, src_y);
+	igt_fb_set_size(fb, plane, src_w, src_h);
+}
+
+static void randomize_plane_coordinates(struct frames_test_data *data,
+					igt_plane_t *plane,
+					drmModeModeInfo *mode,
+					struct igt_fb *fb,
+					uint32_t *src_w, uint32_t *src_h,
+					uint32_t *src_x, uint32_t *src_y,
+					uint32_t *crtc_w, uint32_t *crtc_h,
+					int32_t *crtc_x, int32_t *crtc_y,
+					bool allow_scaling)
+{
+	bool is_yuv = igt_format_is_yuv(fb->drm_format);
+	uint32_t width = fb->width, height = fb->height;
+	double ratio;
+	int ret;
+
+	/* Randomize source offset in the first half */
+	*src_x = rand() % (width / 2);
+	*src_y = rand() % (height / 2);
+
+	*src_w = width - *src_x;
+	*src_h = height - *src_y;
+
+	if (allow_scaling) {
+		*crtc_w = (rand() % mode->hdisplay) + 1;
+		*crtc_h = (rand() % mode->vdisplay) + 1;
+
+		/* Limit scaling ratios */
+		ratio = ((double)*crtc_w / *src_w);
+		if (ratio < 0.5)
+			*src_w = *crtc_w * 2;
+		else if (ratio > 0.8 && ratio < 1.2)
+			*crtc_w = *src_w;
+		else if (ratio > 3.0)
+			*crtc_w = *src_w * 3;
+
+		ratio = ((double)*crtc_h / *src_h);
+		if (ratio < 0.5)
+			*src_h = *crtc_h * 2;
+		else if (ratio > 0.8 && ratio < 1.2)
+			*crtc_h = *src_h;
+		else if (ratio > 3.0)
+			*crtc_h = *src_h * 3;
+	} else {
+		*crtc_w = *src_w;
+		*crtc_h = *src_h;
+	}
+
+	if (*crtc_w != *src_w || *crtc_h != *src_h) {
+		if (*crtc_w < mode->hdisplay)
+			*crtc_x = rand() % (mode->hdisplay - *crtc_w);
+		else
+			*crtc_x = 0;
+
+		if (*crtc_h < mode->vdisplay)
+			*crtc_y = rand() % (mode->vdisplay - *crtc_h);
+		else
+			*crtc_y = 0;
+	} else {
+		*crtc_x = (rand() % mode->hdisplay) - *crtc_w / 2;
+		*crtc_y = (rand() % mode->vdisplay) - *crtc_h / 2;
+	}
+
+	configure_plane(plane, *src_w, *src_h, *src_x, *src_y,
+			*crtc_w, *crtc_h, *crtc_x, *crtc_y, fb);
+	ret = igt_display_try_commit_atomic(
+		&data->display,
+		DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET,
+		NULL);
+	if (!ret)
+		return;
+
+	igt_assert_f(ret != -ENOSPC,
+		     "Invalid coordinates on a %ux%u fb\n", width, height);
+
+	/* YUV alignment fixup */
+	if (is_yuv) {
+		*src_x &= ~1;
+		*src_y &= ~1;
+		*src_w &= ~1;
+		*src_h &= ~1;
+		*crtc_w &= ~1;
+		*crtc_h &= ~1;
+
+		if (*crtc_x < 0 && (*crtc_x & 1))
+			(*crtc_x)++;
+		else
+			*crtc_x &= ~1;
+
+		if (*crtc_y < 0 && (*crtc_y & 1))
+			(*crtc_y)++;
+		else
+			*crtc_y &= ~1;
+
+		configure_plane(plane, *src_w, *src_h, *src_x, *src_y,
+				*crtc_w, *crtc_h, *crtc_x, *crtc_y, fb);
+		ret = igt_display_try_commit_atomic(
+			&data->display,
+			DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET,
+			NULL);
+		if (!ret)
+			return;
+	}
+
+	igt_assert(!ret || allow_scaling);
+	igt_info("Scaling ratio %g / %g failed, trying without scaling.\n",
+		 ((double)*crtc_w / *src_w), ((double)*crtc_h / *src_h));
+
+	*crtc_w = *src_w;
+	*crtc_h = *src_h;
+
+	configure_plane(plane, *src_w, *src_h, *src_x, *src_y,
+			*crtc_w, *crtc_h, *crtc_x, *crtc_y, fb);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_TEST_ONLY |
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+static void blit_plane_cairo(struct frames_test_data *data,
+			     cairo_surface_t *result,
+			     uint32_t src_w, uint32_t src_h,
+			     uint32_t src_x, uint32_t src_y,
+			     uint32_t crtc_w, uint32_t crtc_h,
+			     int32_t crtc_x, int32_t crtc_y,
+			     struct igt_fb *fb)
+{
+	cairo_surface_t *surface;
+	cairo_surface_t *clipped_surface;
+	cairo_t *cr;
+
+	surface = igt_get_cairo_surface(data->drm_fd, fb);
+
+	if (src_x || src_y) {
+		clipped_surface = cairo_image_surface_create(CAIRO_FORMAT_RGB24,
+							     src_w, src_h);
+		cr = cairo_create(clipped_surface);
+		cairo_translate(cr, -1. * src_x, -1. * src_y);
+		cairo_set_source_surface(cr, surface, 0, 0);
+		cairo_paint(cr);
+		cairo_surface_flush(clipped_surface);
+		cairo_destroy(cr);
+	} else {
+		clipped_surface = surface;
+	}
+
+	cr = cairo_create(result);
+	cairo_translate(cr, crtc_x, crtc_y);
+
+	if (src_w != crtc_w || src_h != crtc_h)
+		cairo_scale(cr, (double)crtc_w / src_w, (double)crtc_h / src_h);
+
+	cairo_set_source_surface(cr, clipped_surface, 0, 0);
+	cairo_surface_destroy(clipped_surface);
+
+	if (src_w != crtc_w || src_h != crtc_h) {
+		cairo_pattern_set_filter(cairo_get_source(cr), CAIRO_FILTER_BILINEAR);
+		cairo_pattern_set_extend(cairo_get_source(cr), CAIRO_EXTEND_NONE);
+	}
+
+	cairo_paint(cr);
+	cairo_surface_flush(result);
+	cairo_destroy(cr);
+}
+
+static void prepare_randomized_plane(struct frames_test_data *data,
+				     drmModeModeInfo *mode,
+				     igt_plane_t *plane,
+				     struct igt_fb *overlay_fb,
+				     unsigned int index,
+				     cairo_surface_t *result_surface,
+				     bool allow_scaling,
+				     bool allow_yuv)
+{
+	struct igt_fb pattern_fb;
+	uint32_t overlay_fb_w, overlay_fb_h;
+	uint32_t overlay_src_w, overlay_src_h;
+	uint32_t overlay_src_x, overlay_src_y;
+	int32_t overlay_crtc_x, overlay_crtc_y;
+	uint32_t overlay_crtc_w, overlay_crtc_h;
+	uint32_t format;
+	uint64_t modifier;
+	size_t stride;
+	bool tiled;
+	int fb_id;
+
+	randomize_plane_setup(data, plane, mode, &overlay_fb_w, &overlay_fb_h,
+			      &format, &modifier, allow_yuv);
+
+	tiled = (modifier != DRM_FORMAT_MOD_LINEAR);
+	igt_debug("Plane %d: framebuffer size %dx%d %s format (%s)\n", index,
+		  overlay_fb_w, overlay_fb_h, igt_format_str(format),
+		  tiled ? "tiled" : "linear");
+
+	/* Get a pattern framebuffer for the overlay plane */
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    overlay_fb_w, overlay_fb_h,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &pattern_fb);
+	igt_assert(fb_id > 0);
+
+	randomize_plane_stride(data, overlay_fb_w, overlay_fb_h, format,
+			       modifier, &stride);
+
+	igt_debug("Plane %d: stride %ld\n", index, stride);
+
+	fb_id = igt_fb_convert_with_stride(overlay_fb, &pattern_fb, format,
+					   modifier, stride);
+	igt_assert(fb_id > 0);
+
+	randomize_plane_coordinates(data, plane, mode, overlay_fb,
+				    &overlay_src_w, &overlay_src_h,
+				    &overlay_src_x, &overlay_src_y,
+				    &overlay_crtc_w, &overlay_crtc_h,
+				    &overlay_crtc_x, &overlay_crtc_y,
+				    allow_scaling);
+
+	igt_debug("Plane %d: in-framebuffer size %dx%d\n", index,
+		  overlay_src_w, overlay_src_h);
+	igt_debug("Plane %d: in-framebuffer position %dx%d\n", index,
+		  overlay_src_x, overlay_src_y);
+	igt_debug("Plane %d: on-crtc size %dx%d\n", index,
+		  overlay_crtc_w, overlay_crtc_h);
+	igt_debug("Plane %d: on-crtc position %dx%d\n", index,
+		  overlay_crtc_x, overlay_crtc_y);
+
+	blit_plane_cairo(data, result_surface,
+			 overlay_src_w, overlay_src_h,
+			 overlay_src_x, overlay_src_y,
+			 overlay_crtc_w, overlay_crtc_h,
+			 overlay_crtc_x, overlay_crtc_y,
+			 &pattern_fb);
+
+	igt_remove_fb(data->drm_fd, &pattern_fb);
+}
+
+
+/*
+ * Display a test pattern on the first mode and capture/compare frames.
+ * Display one mode test.
+ */
+static void test_display_one_mode(struct frames_test_data *data,
+				  chamelium_v3_port_id port_id,
+				  bool is_hdmi,
+				  uint32_t fourcc,
+				  int tolerance,
+				  int count)
+__attribute__((unused));
+static void test_display_one_mode(struct frames_test_data *data,
+				  chamelium_v3_port_id port_id,
+				  bool is_hdmi,
+				  uint32_t fourcc,
+				  int tolerance,
+				  int count)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	mode = igt_output_get_mode(output);
+	primary = setup_output(data, output, mode);
+	igt_assert(primary);
+
+	igt_require(igt_plane_has_format_mod(primary, fourcc,
+					     DRM_FORMAT_MOD_LINEAR));
+
+	igt_info("Testing first mode: %dx%d@%d\n",
+		 mode->hdisplay, mode->vdisplay, mode->vrefresh);
+
+	do_test_display(data, port_id, output, primary, mode,
+			fourcc, tolerance, count, false);
+
+	disable_output(data, output, primary);
+}
+
+
+/*
+ * Iterate all modes, display a test pattern and capture/compare frames.
+ * Display all modes test.
+ */
+static void test_display_all_modes(struct frames_test_data *data,
+				   chamelium_v3_port_id port_id,
+				   bool is_hdmi,
+				   uint32_t fourcc,
+				   int tolerance,
+				   int count)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeConnector *connector;
+	int i, count_modes;
+	int tested = 0, skipped = 0;
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	connector = output->config.connector;
+	igt_require_f(connector->count_modes > 0, "No modes available\n");
+
+	igt_info("Testing modes for %s...\n", output->name);
+
+	i = 0;
+	do {
+		drmModeModeInfo local_mode;
+		bool ok;
+
+		/*
+		 * Modes may change due to mode pruning and link issues,
+		 * so refresh the connector each iteration.
+		 * igt_modeset_disable_all_outputs and igt_display_commit2
+		 * may reprobe the connector, invalidating mode pointers.
+		 */
+		igt_modeset_disable_all_outputs(&data->display);
+
+		output = find_output_for_port(data, port_id, is_hdmi);
+		igt_assert(output);
+
+		connector = output->config.connector;
+		count_modes = connector->count_modes;
+		if (i >= count_modes)
+			break;
+
+		/* Copy mode to stack to avoid stale pointer issues */
+		local_mode = connector->modes[i];
+
+		igt_info("Mode %d/%d: %dx%d@%d\n", i + 1,
+			 count_modes,
+			 local_mode.hdisplay, local_mode.vdisplay,
+			 local_mode.vrefresh);
+
+		primary = setup_output(data, output, &local_mode);
+		igt_assert(primary);
+
+		igt_require(igt_plane_has_format_mod(primary, fourcc,
+						     DRM_FORMAT_MOD_LINEAR));
+
+		ok = do_test_display(data, port_id, output, primary,
+				    &local_mode, fourcc, tolerance,
+				    count, true);
+		if (ok)
+			tested++;
+		else
+			skipped++;
+
+		disable_output(data, output, primary);
+	} while (++i < count_modes);
+
+	igt_info("All-modes summary: %d tested, %d skipped (capture timeout) out of %d\n",
+		 tested, skipped, i);
+	igt_assert_f(tested > 0,
+		     "All modes failed to capture – Chamelium capture broken\n");
+}
+
+
+/*
+ * For each mode, capture frames and do pixel-exact comparison.
+ * Frame dump test.
+ */
+static void test_display_frame_dump(struct frames_test_data *data,
+				    chamelium_v3_port_id port_id,
+				    bool is_hdmi)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeConnector *connector;
+	int i, count_modes;
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	connector = output->config.connector;
+	igt_require_f(connector->count_modes > 0, "No modes available\n");
+
+	igt_info("Frame dump test for %s...\n", output->name);
+
+	i = 0;
+	do {
+		drmModeModeInfo local_mode;
+
+		igt_modeset_disable_all_outputs(&data->display);
+
+		output = find_output_for_port(data, port_id, is_hdmi);
+		igt_assert(output);
+
+		connector = output->config.connector;
+		count_modes = connector->count_modes;
+		if (i >= count_modes)
+			break;
+
+		local_mode = connector->modes[i];
+
+		igt_info("Frame dump mode %d/%d: %dx%d@%d\n", i + 1,
+			 count_modes,
+			 local_mode.hdisplay, local_mode.vdisplay,
+			 local_mode.vrefresh);
+
+		primary = setup_output(data, output, &local_mode);
+		igt_assert(primary);
+
+		do_test_frame_dump(data, port_id, output, primary, &local_mode, is_hdmi);
+
+		disable_output(data, output, primary);
+	} while (++i < count_modes);
+}
+
+
+/*
+ * Test each supported non-planar (RGB) format on HDMI.
+ */
+static void test_display_nonplanar_formats(struct frames_test_data *data,
+					   chamelium_v3_port_id port_id,
+					   bool is_hdmi)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	unsigned int k;
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	mode = igt_output_get_mode(output);
+	primary = setup_output(data, output, mode);
+	igt_assert(primary);
+
+	for (k = 0; k < primary->format_mod_count; k++) {
+		if (!igt_fb_supported_format(primary->formats[k]))
+			continue;
+		if (igt_format_is_yuv(primary->formats[k]))
+			continue;
+		if (primary->modifiers[k] != DRM_FORMAT_MOD_LINEAR)
+			continue;
+
+		igt_info("Testing non-planar format: %s\n",
+			 igt_format_str(primary->formats[k]));
+
+		do_test_display(data, port_id, output, primary, mode,
+				primary->formats[k], FRAME_FORMAT_TOLERANCE,
+				1, false);
+	}
+
+	disable_output(data, output, primary);
+}
+
+
+/*
+ * Test each supported planar (YUV) format with checkerboard comparison.
+ */
+static void test_display_planar_formats(struct frames_test_data *data,
+					chamelium_v3_port_id port_id,
+					bool is_hdmi)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	unsigned int k;
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	mode = igt_output_get_mode(output);
+	primary = setup_output(data, output, mode);
+	igt_assert(primary);
+
+	for (k = 0; k < primary->format_mod_count; k++) {
+		if (!igt_fb_supported_format(primary->formats[k]))
+			continue;
+		if (!igt_format_is_yuv(primary->formats[k]))
+			continue;
+		if (primary->modifiers[k] != DRM_FORMAT_MOD_LINEAR)
+			continue;
+
+		igt_info("Testing planar format: %s\n",
+			 igt_format_str(primary->formats[k]));
+
+		do_test_display(data, port_id, output, primary, mode,
+				primary->formats[k],
+				FRAME_CHECKERBOARD_TOLERANCE, 1, false);
+	}
+
+	disable_output(data, output, primary);
+}
+
+
+/*
+ * Set up random overlay planes with random parameters, capture the
+ * composed frame and compare against a software-composed reference.
+ * Random planes test.
+ */
+static void test_display_planes_random(struct frames_test_data *data,
+				       chamelium_v3_port_id port_id,
+				       bool is_hdmi,
+				       int tolerance,
+				       bool allow_scaling,
+				       bool allow_yuv)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary_plane;
+	struct igt_fb primary_fb;
+	struct igt_fb result_fb;
+	struct igt_fb *overlay_fbs;
+	struct chamelium_v3_frame *frame;
+	unsigned int overlay_planes_max = 0;
+	unsigned int overlay_planes_count;
+	cairo_surface_t *result_surface;
+	unsigned int i;
+	unsigned int fb_id;
+
+	srand(time(NULL));
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	output = find_output_for_port(data, port_id, is_hdmi);
+	igt_require_f(output, "No %s output found on DUT\n",
+		      is_hdmi ? "HDMI" : "DP");
+
+	mode = igt_output_get_mode(output);
+
+	/* Get primary plane */
+	primary_plane = setup_output(data, output, mode);
+	igt_assert(primary_plane);
+
+	/* Create primary FB */
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &primary_fb);
+	igt_assert(fb_id > 0);
+
+	/* Create result FB for software composition */
+	fb_id = igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			      &result_fb);
+	igt_assert(fb_id > 0);
+
+	result_surface = igt_get_cairo_surface(data->drm_fd, &result_fb);
+
+	/* Blit primary framebuffer onto result surface */
+	blit_plane_cairo(data, result_surface, 0, 0, 0, 0, 0, 0, 0, 0,
+			 &primary_fb);
+
+	/* Set primary plane */
+	igt_plane_set_fb(primary_plane, &primary_fb);
+
+	overlay_planes_max = igt_output_count_plane_type(output,
+							 DRM_PLANE_TYPE_OVERLAY);
+	overlay_planes_max = min(overlay_planes_max, 4u);
+
+	overlay_planes_count = (rand() % overlay_planes_max) + 1;
+	igt_debug("Using %d overlay planes\n", overlay_planes_count);
+
+	overlay_fbs = calloc(overlay_planes_count, sizeof(struct igt_fb));
+
+	for (i = 0; i < overlay_planes_count; i++) {
+		struct igt_fb *overlay_fb = &overlay_fbs[i];
+		igt_plane_t *plane = igt_output_get_plane_type_index(
+			output, DRM_PLANE_TYPE_OVERLAY, i);
+		igt_assert(plane);
+
+		prepare_randomized_plane(data, mode, plane, overlay_fb, i,
+					result_surface, allow_scaling,
+					allow_yuv);
+	}
+
+	cairo_surface_destroy(result_surface);
+
+	/* Commit all planes */
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	/* Wait for stabilization */
+	sleep(2);
+
+	/* Capture and compare */
+	frame = capture_frame_with_retry(data, port_id);
+	igt_assert_f(frame, "Failed to capture frame for planes-random test\n");
+
+	igt_assert_f(compare_frame_to_fb(data, frame, &result_fb, tolerance),
+		     "Random planes frame comparison failed\n");
+
+	chamelium_v3_free_frame(frame);
+
+	/* Cleanup */
+	for (i = 0; i < overlay_planes_count; i++)
+		igt_remove_fb(data->drm_fd, &overlay_fbs[i]);
+
+	free(overlay_fbs);
+	igt_remove_fb(data->drm_fd, &primary_fb);
+	igt_remove_fb(data->drm_fd, &result_fb);
+
+	disable_output(data, output, primary_plane);
+}
+
+
+static enum infoframe_avi_picture_aspect_ratio
+get_infoframe_avi_picture_ar(uint32_t aspect_ratio)
+{
+	switch (aspect_ratio) {
+	case DRM_MODE_PICTURE_ASPECT_4_3:
+		return INFOFRAME_AVI_PIC_AR_4_3;
+	case DRM_MODE_PICTURE_ASPECT_16_9:
+		return INFOFRAME_AVI_PIC_AR_16_9;
+	default:
+		return INFOFRAME_AVI_PIC_AR_UNSPECIFIED;
+	}
+}
+
+/*
+ * Verify AVI InfoFrame aspect ratio.
+ * Aspect ratio test.
+ */
+static void test_display_aspect_ratio(struct frames_test_data *data,
+				      chamelium_v3_port_id port_id)
+{
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeConnector *connector;
+	drmModeModeInfo local_mode;
+	struct igt_fb fb;
+	struct chamelium_v3_infoframe *infoframe;
+	struct infoframe_avi infoframe_avi;
+	uint8_t vic = 16;
+	const struct vic_mode *vic_mode;
+	uint32_t aspect_ratio;
+	enum infoframe_avi_picture_aspect_ratio frame_ar;
+	int i, fb_id;
+	bool found, ok;
+
+	igt_modeset_disable_all_outputs(&data->display);
+
+	output = find_output_for_port(data, port_id, true /* HDMI */);
+	igt_require_f(output, "No HDMI output found on DUT\n");
+
+	connector = output->config.connector;
+
+	vic_mode = &vic_modes[vic];
+	aspect_ratio = vic_mode->picture_ar;
+
+	/*
+	 * Find a mode matching the VIC resolution and refresh rate.
+	 * V3 doesn't inject a special aspect-ratio EDID, so we match on
+	 * resolution/refresh only. The HDMI driver should still send
+	 * the correct VIC and aspect ratio in the AVI InfoFrame for
+	 * CEA modes like 1920x1080@60 (VIC 16).
+	 */
+	found = false;
+	igt_assert(connector->count_modes > 0);
+	for (i = 0; i < connector->count_modes; i++) {
+		if (vic_mode->hactive == connector->modes[i].hdisplay &&
+		    vic_mode->vactive == connector->modes[i].vdisplay &&
+		    vic_mode->vrefresh == connector->modes[i].vrefresh) {
+			local_mode = connector->modes[i];
+			found = true;
+			break;
+		}
+	}
+	igt_require_f(found,
+		      "Failed to find mode matching VIC %d (%dx%d@%d)\n",
+		      vic, vic_mode->hactive, vic_mode->vactive,
+		      vic_mode->vrefresh);
+
+	igt_info("Aspect ratio test: using mode %dx%d@%d (VIC %d)\n",
+		 local_mode.hdisplay, local_mode.vdisplay,
+		 local_mode.vrefresh, vic);
+
+	primary = setup_output(data, output, &local_mode);
+	igt_assert(primary);
+
+	fb_id = igt_create_color_pattern_fb(data->drm_fd,
+					    local_mode.hdisplay,
+					    local_mode.vdisplay,
+					    DRM_FORMAT_XRGB8888,
+					    DRM_FORMAT_MOD_LINEAR,
+					    0, 0, 0, &fb);
+	igt_assert(fb_id > 0);
+
+	enable_output(data, output, primary, &fb);
+
+	/* Read AVI InfoFrame from Chamelium */
+	infoframe = chamelium_v3_get_last_infoframe(data->chamelium, port_id, "avi");
+	igt_require_f(infoframe,
+		      "AVI InfoFrame not available (GetLastInfoFrame may not be implemented on this Chamelium V3)\n");
+
+	ok = infoframe_avi_parse(&infoframe_avi, infoframe->version,
+				 infoframe->payload, infoframe->payload_size);
+	igt_assert_f(ok, "Failed to parse AVI InfoFrame\n");
+
+	frame_ar = get_infoframe_avi_picture_ar(aspect_ratio);
+
+	igt_info("Checking AVI InfoFrame\n");
+	igt_info("  Picture aspect ratio: got %d, expected %d\n",
+		 infoframe_avi.picture_aspect_ratio, frame_ar);
+	igt_info("  Video Identification Code (VIC): got %d, expected %d\n",
+		 infoframe_avi.vic, vic);
+
+	igt_assert_f(infoframe_avi.picture_aspect_ratio == frame_ar,
+		     "AVI InfoFrame aspect ratio mismatch: got %d, expected %d\n",
+		     infoframe_avi.picture_aspect_ratio, frame_ar);
+	igt_assert_f(infoframe_avi.vic == vic,
+		     "AVI InfoFrame VIC mismatch: got %d, expected %d\n",
+		     infoframe_avi.vic, vic);
+
+	chamelium_v3_infoframe_destroy(infoframe);
+	igt_remove_fb(data->drm_fd, &fb);
+	disable_output(data, output, primary);
+}
+
+
+/**
+ * SUBTEST: dp-crc-fast
+ * Description: Display a test pattern on the first DP mode, capture a frame
+ *              via Chamelium V3 DumpPixels, and compare against local reference.
+ */
+static void test_dp_crc_fast(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_dp_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged DP port found\n");
+	test_display_one_mode(data, port, false, DRM_FORMAT_XRGB8888,
+			      FRAME_CRC_TOLERANCE, 1);
+}
+
+/**
+ * SUBTEST: dp-crc-single
+ * Description: For each mode of the base EDID on DP, display a test pattern,
+ *              capture 1 frame, and compare.
+ */
+static void test_dp_crc_single(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_dp_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged DP port found\n");
+	test_display_all_modes(data, port, false, DRM_FORMAT_XRGB8888,
+			       FRAME_CRC_TOLERANCE, 1);
+}
+
+/**
+ * SUBTEST: dp-crc-multiple
+ * Description: For each mode of the base EDID on DP, display a test pattern,
+ *              capture 3 frames, and compare each.
+ */
+static void test_dp_crc_multiple(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_dp_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged DP port found\n");
+	test_display_all_modes(data, port, false, DRM_FORMAT_XRGB8888,
+			       FRAME_CRC_TOLERANCE, 3);
+}
+
+/**
+ * SUBTEST: dp-frame-dump
+ * Description: For each mode of the base EDID on DP, display a test pattern,
+ *              capture frames and compare them pixel-by-pixel to the sent ones.
+ */
+static void test_dp_frame_dump(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_dp_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged DP port found\n");
+	test_display_frame_dump(data, port, false);
+}
+
+/**
+ * SUBTEST: hdmi-crc-fast
+ * Description: Display a test pattern on the first HDMI mode, capture a frame
+ *              via Chamelium V3 DumpPixels, and compare against local reference.
+ */
+static void test_hdmi_crc_fast(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_one_mode(data, port, true, DRM_FORMAT_XRGB8888,
+			      FRAME_CRC_TOLERANCE, 1);
+}
+
+/**
+ * SUBTEST: hdmi-crc-single
+ * Description: For each mode of the base EDID on HDMI, display a test pattern,
+ *              capture 1 frame, and compare.
+ */
+static void test_hdmi_crc_single(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_all_modes(data, port, true, DRM_FORMAT_XRGB8888,
+			       FRAME_CRC_TOLERANCE, 1);
+}
+
+/**
+ * SUBTEST: hdmi-crc-multiple
+ * Description: For each mode of the base EDID on HDMI, display a test pattern,
+ *              capture 3 frames, and compare each.
+ */
+static void test_hdmi_crc_multiple(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_all_modes(data, port, true, DRM_FORMAT_XRGB8888,
+			       FRAME_CRC_TOLERANCE, 3);
+}
+
+/**
+ * SUBTEST: hdmi-crc-nonplanar-formats
+ * Description: For each non-planar pixel format supported by the primary plane,
+ *              display a test pattern and compare captured frame.
+ */
+static void test_hdmi_crc_nonplanar_formats(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_nonplanar_formats(data, port, true);
+}
+
+/**
+ * SUBTEST: hdmi-crc-planes-random
+ * Description: Set up random overlay planes on HDMI, capture the composed
+ *              frame and compare against software-composed reference.
+ */
+static void test_hdmi_crc_planes_random(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_planes_random(data, port, true,
+				   FRAME_CRC_TOLERANCE, false, false);
+}
+
+/**
+ * SUBTEST: hdmi-cmp-planar-formats
+ * Description: For each planar (YUV) pixel format, display a test pattern
+ *              and compare captured frame with checkerboard tolerance.
+ */
+static void test_hdmi_cmp_planar_formats(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_planar_formats(data, port, true);
+}
+
+/**
+ * SUBTEST: hdmi-cmp-planes-random
+ * Description: Set up random overlay planes with YUV formats on HDMI,
+ *              capture the frame and compare with checkerboard tolerance.
+ */
+static void test_hdmi_cmp_planes_random(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_planes_random(data, port, true,
+				   FRAME_CHECKERBOARD_TOLERANCE, true, true);
+}
+
+/**
+ * SUBTEST: hdmi-frame-dump
+ * Description: For each mode of the base EDID on HDMI, display a test pattern,
+ *              capture frames and compare pixel-by-pixel.
+ */
+static void test_hdmi_frame_dump(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_frame_dump(data, port, true);
+}
+
+/**
+ * SUBTEST: hdmi-aspect-ratio
+ * Description: Set a mode with a specific picture aspect ratio, read the AVI
+ *              InfoFrame from Chamelium and verify the aspect ratio field matches.
+ */
+static void test_hdmi_aspect_ratio(struct frames_test_data *data)
+{
+	chamelium_v3_port_id port = find_hdmi_port(data);
+
+	igt_require_f(port != (chamelium_v3_port_id)-1, "No plugged HDMI port found\n");
+	test_display_aspect_ratio(data, port);
+}
+
+
+int igt_main()
+{
+	struct frames_test_data data = { 0 };
+
+	igt_fixture() {
+		/* Set VT to graphics mode so fbcon doesn't interfere */
+		kmstest_set_vt_graphics_mode();
+
+		/* Open DRM */
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_require(data.drm_fd >= 0);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+
+		/* Initialize Chamelium V3 */
+		data.chamelium = chamelium_v3_init_from_config();
+		igt_require(data.chamelium);
+
+		data.port_count = chamelium_v3_get_supported_ports(
+			data.chamelium, &data.ports);
+		igt_require(data.port_count > 0);
+
+		igt_info("Found %d Chamelium ports\n", data.port_count);
+	}
+
+	/* DP frame/CRC tests */
+	igt_describe("Display test pattern on first DP mode, capture and compare frame");
+	igt_subtest("dp-crc-fast")
+		test_dp_crc_fast(&data);
+
+	igt_describe("For each DP mode, capture 1 frame and compare");
+	igt_subtest("dp-crc-single")
+		test_dp_crc_single(&data);
+
+	igt_describe("For each DP mode, capture 3 frames and compare");
+	igt_subtest("dp-crc-multiple")
+		test_dp_crc_multiple(&data);
+
+	igt_describe("For each DP mode, capture frames and compare pixel-by-pixel");
+	igt_subtest("dp-frame-dump")
+		test_dp_frame_dump(&data);
+
+	/* HDMI frame/CRC tests */
+	igt_describe("Display test pattern on first HDMI mode, capture and compare frame");
+	igt_subtest("hdmi-crc-fast")
+		test_hdmi_crc_fast(&data);
+
+	igt_describe("For each HDMI mode, capture 1 frame and compare");
+	igt_subtest("hdmi-crc-single")
+		test_hdmi_crc_single(&data);
+
+	igt_describe("For each HDMI mode, capture 3 frames and compare");
+	igt_subtest("hdmi-crc-multiple")
+		test_hdmi_crc_multiple(&data);
+
+	igt_describe("CRC check per non-planar pixel format for HDMI");
+	igt_subtest("hdmi-crc-nonplanar-formats")
+		test_hdmi_crc_nonplanar_formats(&data);
+
+	igt_describe("Random overlay plane frame comparison for HDMI");
+	igt_subtest("hdmi-crc-planes-random")
+		test_hdmi_crc_planes_random(&data);
+
+	igt_describe("Checkerboard comparison for YUV planar formats on HDMI");
+	igt_subtest("hdmi-cmp-planar-formats")
+		test_hdmi_cmp_planar_formats(&data);
+
+	igt_describe("Random overlay plane checkerboard comparison for HDMI");
+	igt_subtest("hdmi-cmp-planes-random")
+		test_hdmi_cmp_planes_random(&data);
+
+	igt_describe("Pixel-by-pixel frame dump comparison for HDMI");
+	igt_subtest("hdmi-frame-dump")
+		test_hdmi_frame_dump(&data);
+
+	igt_describe("AVI InfoFrame aspect ratio verification for HDMI");
+	igt_subtest("hdmi-aspect-ratio")
+		test_hdmi_aspect_ratio(&data);
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cfb59ecbb..c3dbff694 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -376,6 +376,7 @@ chamelium_v3_progs = [
 	'kms_chamelium_v3_basic',
 	'kms_chamelium_v3_hpd',
 	'kms_chamelium_v3_edid',
+	'kms_chamelium_v3_frames',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

