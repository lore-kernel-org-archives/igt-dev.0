Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0588FF886F
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 04:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C0D10E2C4;
	Tue, 28 Apr 2026 04:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XOynuqJN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE3310E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 04:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777351660; x=1808887660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EU6eomlnGp9A7mA0E1LtWEFy+L0MFD7Dy3+dupyj4aI=;
 b=XOynuqJN0O+v1Trs9hyE3SmQktM8C5pA1hwfQpFjUb4ybTGeJ1vV7QYZ
 WYCBpImNVQjr47FgLK5VIoKIbl7OKzTPQSiNaFwwV/JDBo1o1rgFGgK6A
 OQrbWePmmVk+jomvC/MPncAv8VXK+rWCMYpz8w+wmm3jCaEhSHoCsrz/B
 q1oqbWBQMY50x2lMgBg/xPFC7Uag/BRQwpLgEImzSXqkYwTD4oab3RBSC
 Dzs7fyDgQra1BPFyFjSf61E/rV6huHGrw82gBrn94aM9xuI9hu8yA3nDM
 8vTMgGJ10AXNvIT5ZGnEjiidbN7Z3lR8KDdcGdni5GmmNHb76RBLoXHjy A==;
X-CSE-ConnectionGUID: pkl92CgaR1+imvSzqYKzQA==
X-CSE-MsgGUID: G1N14W5wSwK2M/nl1N6nJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78167871"
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="78167871"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:40 -0700
X-CSE-ConnectionGUID: V/kXy+QkQam6aRWl2u8itA==
X-CSE-MsgGUID: IHpQ7jFNSm6yv46K/SeMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,203,1770624000"; d="scan'208";a="233706812"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 21:47:39 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v1 24/25] tests/chamelium/v3: Add color verification
 tests for Chamelium v3
Date: Tue, 28 Apr 2026 10:16:33 +0530
Message-ID: <20260428044644.257001-25-mohammed.bilal@intel.com>
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

This commit adds color testing capabilities for Chamelium v3 including
color depth verification, gamma testing, and color space validation.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/chamelium/v3/kms_chamelium_v3_color.c | 1058 +++++++++++++++++++
 tests/meson.build                           |    1 +
 2 files changed, 1059 insertions(+)
 create mode 100644 tests/chamelium/v3/kms_chamelium_v3_color.c

diff --git a/tests/chamelium/v3/kms_chamelium_v3_color.c b/tests/chamelium/v3/kms_chamelium_v3_color.c
new file mode 100644
index 000000000..1a41a0c10
--- /dev/null
+++ b/tests/chamelium/v3/kms_chamelium_v3_color.c
@@ -0,0 +1,1058 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ *
+ * Chamelium V3 Color / Color Management Tests
+ *
+ * Tests degamma, gamma, CTM (Color Transformation Matrix),
+ * and broadcast RGB range using Chamelium frame capture.
+ *
+ * Connector selection priority:
+ *   1. Prefer HDMI if connected (to avoid DP FSM issues)
+ *   2. Fall back to DP if no HDMI is available
+ */
+
+#include <math.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_kms.h"
+#include "chamelium/v3/igt_chamelium.h"
+
+/**
+ * TEST: kms chamelium v3 color
+ * Category: Display
+ * Description: Color management tests for Chamelium V3
+ * Driver requirement: i915, xe
+ * Mega feature: General Display Features
+ */
+
+IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium V3 to verify");
+
+#define HPD_WAIT_TIME_MS 3000
+
+/* Chamelium V3 port IDs */
+#define FPGA_DP1_PORT 4
+#define FPGA_DP2_PORT 5
+#define ITE_HDMI1_PORT 2
+#define ITE_HDMI2_PORT 3
+
+/* Color type for painting */
+typedef struct {
+	double r, g, b;
+} color_t;
+
+/* Gamma LUT type */
+typedef struct {
+	int size;
+	color_t coeffs[];
+} gamma_lut_t;
+
+struct color_test_data {
+	/* Chamelium V3 */
+	struct igt_chamelium_v3 *chamelium;
+	chamelium_v3_port_id *ports;
+	int port_count;
+	chamelium_v3_port_id selected_port;
+	bool hdmi_selected;
+
+	/* DRM display */
+	int drm_fd;
+	uint32_t devid;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+
+	/* Color properties */
+	uint32_t drm_format;
+	uint32_t color_depth;
+	uint64_t degamma_lut_size;
+	uint64_t gamma_lut_size;
+};
+
+/*
+ * Tolerance for analog frame comparison (analog tolerance).
+ * Analog signals have some noise, so we allow small differences.
+ */
+#define FRAME_TOLERANCE 10
+
+
+static gamma_lut_t *alloc_lut(int lut_size)
+{
+	gamma_lut_t *gamma;
+
+	igt_assert_lt(0, lut_size);
+	gamma = malloc(sizeof(*gamma) + lut_size * sizeof(gamma->coeffs[0]));
+	igt_assert(gamma);
+	gamma->size = lut_size;
+
+	return gamma;
+}
+
+static void free_lut(gamma_lut_t *gamma)
+{
+	free(gamma);
+}
+
+static void set_rgb(color_t *coeff, double value)
+{
+	coeff->r = coeff->g = coeff->b = value;
+}
+
+static gamma_lut_t *generate_table(int lut_size, double exp_val)
+{
+	gamma_lut_t *gamma = alloc_lut(lut_size);
+	int i;
+
+	set_rgb(&gamma->coeffs[0], 0.0);
+	for (i = 1; i < lut_size; i++)
+		set_rgb(&gamma->coeffs[i], pow(i * 1.0 / (lut_size - 1), exp_val));
+
+	return gamma;
+}
+
+static gamma_lut_t *generate_table_max(int lut_size)
+{
+	gamma_lut_t *gamma = alloc_lut(lut_size);
+	int i;
+
+	set_rgb(&gamma->coeffs[0], 0.0);
+	for (i = 1; i < lut_size; i++)
+		set_rgb(&gamma->coeffs[i], 1.0);
+
+	return gamma;
+}
+
+static struct drm_color_lut *coeffs_to_lut(struct color_test_data *data,
+					   const gamma_lut_t *gamma,
+					   uint32_t color_depth)
+{
+	struct drm_color_lut *lut;
+	int i, lut_size = gamma->size;
+	uint32_t max_value = (1 << 16) - 1;
+	uint32_t mask;
+
+	if (is_intel_device(data->drm_fd))
+		mask = ((1 << color_depth) - 1) << (16 - color_depth);
+	else
+		mask = max_value;
+
+	lut = malloc(sizeof(struct drm_color_lut) * lut_size);
+
+	for (i = 0; i < lut_size; i++) {
+		uint32_t r = gamma->coeffs[i].r * max_value;
+		uint32_t g = gamma->coeffs[i].g * max_value;
+		uint32_t b = gamma->coeffs[i].b * max_value;
+
+		r &= mask;
+		g &= mask;
+		b &= mask;
+
+		lut[i].red = r;
+		lut[i].green = g;
+		lut[i].blue = b;
+	}
+
+	return lut;
+}
+
+static void set_degamma(struct color_test_data *data, igt_crtc_t *pipe,
+			const gamma_lut_t *gamma)
+{
+	size_t size = sizeof(struct drm_color_lut) * gamma->size;
+	struct drm_color_lut *lut = coeffs_to_lut(data, gamma, data->color_depth);
+
+	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_DEGAMMA_LUT, lut, size);
+	free(lut);
+}
+
+static void set_gamma(struct color_test_data *data, igt_crtc_t *pipe,
+		      const gamma_lut_t *gamma)
+{
+	size_t size = sizeof(struct drm_color_lut) * gamma->size;
+	struct drm_color_lut *lut = coeffs_to_lut(data, gamma, data->color_depth);
+
+	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
+	free(lut);
+}
+
+static void set_ctm(igt_crtc_t *pipe, const double *coefficients)
+{
+	struct drm_color_ctm ctm;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctm.matrix); i++) {
+		if (coefficients[i] < 0) {
+			ctm.matrix[i] = (int64_t)(-coefficients[i] * ((int64_t)1L << 32));
+			ctm.matrix[i] |= 1ULL << 63;
+		} else {
+			ctm.matrix[i] = (int64_t)(coefficients[i] * ((int64_t)1L << 32));
+		}
+	}
+
+	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
+}
+
+static void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
+{
+	if (igt_crtc_has_prop(pipe, prop))
+		igt_crtc_replace_prop_blob(pipe, prop, NULL, 0);
+}
+
+#define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
+#define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
+#define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
+
+
+static void paint_gradient_rectangles(struct color_test_data *data,
+				      drmModeModeInfo *mode,
+				      const color_t *colors,
+				      struct igt_fb *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	int i, l = mode->hdisplay / 3;
+	int rows_remaining = mode->hdisplay % 3;
+
+	for (i = 0; i < 3; i++) {
+		igt_paint_color_gradient_range(cr, i * l, 0, l, mode->vdisplay,
+					       colors[i].r != 0 ? 0.2 : 0,
+					       colors[i].g != 0 ? 0.2 : 0,
+					       colors[i].b != 0 ? 0.2 : 0,
+					       colors[i].r, colors[i].g, colors[i].b);
+	}
+
+	if (rows_remaining > 0)
+		igt_paint_color_gradient_range(cr, i * l, 0, rows_remaining,
+					       mode->vdisplay,
+					       colors[i-1].r != 0 ? 0.2 : 0,
+					       colors[i-1].g != 0 ? 0.2 : 0,
+					       colors[i-1].b != 0 ? 0.2 : 0,
+					       colors[i-1].r, colors[i-1].g,
+					       colors[i-1].b);
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void paint_rectangles(struct color_test_data *data,
+			     drmModeModeInfo *mode,
+			     const color_t *colors,
+			     struct igt_fb *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
+	int i, l = mode->hdisplay / 3;
+	int rows_remaining = mode->hdisplay % 3;
+
+	for (i = 0; i < 3; i++) {
+		igt_paint_color(cr, i * l, 0, l, mode->vdisplay,
+				colors[i].r, colors[i].g, colors[i].b);
+	}
+
+	if (rows_remaining > 0)
+		igt_paint_color(cr, i * l, 0, rows_remaining, mode->vdisplay,
+				colors[i-1].r, colors[i-1].g, colors[i-1].b);
+
+	igt_put_cairo_ctx(cr);
+}
+
+
+/*
+ * Compare captured RGB frame against expected framebuffer.
+ * Returns true if frames match within tolerance.
+ */
+static bool compare_frame_to_fb(struct color_test_data *data,
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
+	int max_mismatches = total_pixels / 10;  /* Allow 10% mismatch for analog/edge effects */
+        int mid_x, mid_y, frame_idx, fb_idx;
+        uint8_t cap_r, cap_g, cap_b, fb_b, fb_g, fb_r;
+        int diff_r, diff_g, diff_b;
+
+        /* Get framebuffer data */
+        cr = igt_get_cairo_ctx(data->drm_fd, fb);
+        surface = cairo_get_target(cr);
+        cairo_surface_flush(surface);
+        fb_data = cairo_image_surface_get_data(surface);
+        stride = cairo_image_surface_get_stride(surface);
+
+        igt_info("Comparing frame %dx%d against framebuffer (stride=%d)...\n",
+                 frame->width, frame->height, stride);
+
+        /* Sample some middle pixels for debug */
+        mid_x = frame->width / 2;
+        mid_y = frame->height / 2;
+        frame_idx = (mid_y * frame->width + mid_x) * 3;
+        fb_idx = mid_y * stride + mid_x * 4;
+        igt_info("Sample at (%d,%d): captured RGB(%d,%d,%d), expected RGB(%d,%d,%d)\n",
+                 mid_x, mid_y,
+                 frame->data[frame_idx + 0], frame->data[frame_idx + 1], frame->data[frame_idx + 2],
+                 fb_data[fb_idx + 2], fb_data[fb_idx + 1], fb_data[fb_idx + 0]);
+
+        /* Compare pixel by pixel */
+        for (y = 0; y < frame->height && mismatches <= max_mismatches; y++) {
+                for (x = 0; x < frame->width && mismatches <= max_mismatches; x++) {
+                        /* Captured frame is RGB */
+                        frame_idx = (y * frame->width + x) * 3;
+                        cap_r = frame->data[frame_idx + 0];
+                        cap_g = frame->data[frame_idx + 1];
+                        cap_b = frame->data[frame_idx + 2];
+
+                        /* Framebuffer is XRGB8888 (BGRA in memory on little-endian) */
+                        fb_idx = y * stride + x * 4;
+                        fb_b = fb_data[fb_idx + 0];
+                        fb_g = fb_data[fb_idx + 1];
+                        fb_r = fb_data[fb_idx + 2];
+
+                        diff_r = abs((int)cap_r - (int)fb_r);
+                        diff_g = abs((int)cap_g - (int)fb_g);
+                        diff_b = abs((int)cap_b - (int)fb_b);
+
+                        if (diff_r > tolerance || diff_g > tolerance || diff_b > tolerance) {
+                                mismatches++;
+                                if (mismatches <= 10) {
+                                        igt_debug("Mismatch at (%d,%d): captured RGB(%d,%d,%d) vs expected RGB(%d,%d,%d)\n",
+                                                  x, y, cap_r, cap_g, cap_b, fb_r, fb_g, fb_b);
+                                }
+                        }
+                }
+        }
+
+        igt_put_cairo_ctx(cr);
+
+        igt_info("Frame comparison: %d mismatches out of %d pixels (%.2f%%)\n",
+                 mismatches, total_pixels, 100.0 * mismatches / total_pixels);
+
+        return mismatches <= max_mismatches;
+}
+
+
+/*
+ * Find the DRM output that corresponds to the Chamelium port.
+ * For HDMI port 2, look for HDMI-A-1 connector.
+ * For DP port 4, look for DP-1 connector.
+ */
+static bool find_output_for_port(struct color_test_data *data)
+{
+	igt_output_t *output;
+	const char *expected_type;
+	igt_crtc_t *crtc;
+
+	if (data->hdmi_selected)
+		expected_type = "HDMI";
+	else
+		expected_type = "DP";
+
+	igt_info("Looking for %s connector...\n", expected_type);
+
+	for_each_crtc(&data->display, crtc) {
+		for_each_valid_output_on_crtc(&data->display, crtc, output) {
+			uint32_t conn_type = output->config.connector->connector_type;
+			bool is_match = false;
+
+			if (data->hdmi_selected) {
+				is_match = (conn_type == DRM_MODE_CONNECTOR_HDMIA ||
+					    conn_type == DRM_MODE_CONNECTOR_HDMIB);
+			} else {
+				is_match = (conn_type == DRM_MODE_CONNECTOR_DisplayPort);
+			}
+
+			if (is_match) {
+				data->output = output;
+				igt_info("Found matching output: %s on pipe %s\n",
+					 output->name, kmstest_pipe_name(crtc->pipe));
+				return true;
+			}
+		}
+	}
+
+	igt_warn("No matching output found for %s port\n", expected_type);
+	return false;
+}
+
+static bool setup_display(struct color_test_data *data)
+{
+	igt_crtc_t *pipe_obj;
+	igt_crtc_t *crtc;
+
+	if (!find_output_for_port(data))
+		return false;
+
+	/* Find a valid pipe for this output and get primary plane */
+	for_each_crtc(&data->display, crtc) {
+		if (igt_crtc_connector_valid(crtc, data->output)) {
+			pipe_obj = crtc;
+			data->primary = igt_crtc_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
+			if (data->primary) {
+				igt_output_set_crtc(data->output, pipe_obj);
+				break;
+			}
+		}
+	}
+
+	if (!data->primary) {
+		igt_warn("Could not get primary plane for output\n");
+		return false;
+	}
+
+	pipe_obj = data->primary->crtc;
+	data->mode = igt_output_get_mode(data->output);
+
+	/* Get LUT sizes */
+	if (igt_crtc_has_prop(pipe_obj, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+		data->degamma_lut_size = igt_crtc_get_prop(pipe_obj, IGT_CRTC_DEGAMMA_LUT_SIZE);
+	} else {
+		data->degamma_lut_size = 256;  /* Default */
+	}
+
+	if (igt_crtc_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT_SIZE)) {
+		data->gamma_lut_size = igt_crtc_get_prop(pipe_obj, IGT_CRTC_GAMMA_LUT_SIZE);
+	} else {
+		data->gamma_lut_size = 256;  /* Default */
+	}
+
+	data->color_depth = 8;
+	data->drm_format = DRM_FORMAT_XRGB8888;
+
+	igt_info("Display setup: %s @ %dx%d, degamma_lut=%lu, gamma_lut=%lu\n",
+		 data->output->name, data->mode->hdisplay, data->mode->vdisplay,
+		 data->degamma_lut_size, data->gamma_lut_size);
+
+	return true;
+}
+
+/*
+ * Select the best port for color testing.
+ * Priority: HDMI > DP 
+ */
+static int select_color_test_port(struct color_test_data *data)
+{
+	int i;
+	int dp_port_idx = -1;
+	int hdmi_port_idx = -1;
+
+	igt_info("Selecting port for color tests (prefer HDMI over DP)...\n");
+
+	for (i = 0; i < data->port_count; i++) {
+		chamelium_v3_port_id port_id = data->ports[i];
+		char *port_name = chamelium_v3_get_port_name(data->chamelium, port_id);
+		bool is_plugged = chamelium_v3_is_plugged(data->chamelium, port_id);
+
+		igt_info("  Port %d (%s): %s\n", port_id, port_name,
+			 is_plugged ? "plugged" : "unplugged");
+
+		if (!is_plugged) {
+			free(port_name);
+			continue;
+		}
+
+		if (chamelium_v3_port_is_hdmi(data->chamelium, port_id)) {
+			if (hdmi_port_idx < 0) {
+				hdmi_port_idx = i;
+				igt_info("    -> Found HDMI port (preferred)\n");
+			}
+		} else if (chamelium_v3_port_is_dp(data->chamelium, port_id)) {
+			if (dp_port_idx < 0) {
+				dp_port_idx = i;
+				igt_info("    -> Found DP port (fallback)\n");
+			}
+		}
+
+		free(port_name);
+	}
+
+	if (hdmi_port_idx >= 0) {
+		data->selected_port = data->ports[hdmi_port_idx];
+		data->hdmi_selected = true;
+		igt_info("Selected HDMI port %d for color tests\n", data->selected_port);
+		return hdmi_port_idx;
+	}
+
+	if (dp_port_idx >= 0) {
+		data->selected_port = data->ports[dp_port_idx];
+		data->hdmi_selected = false;
+		igt_info("Selected DP port %d for color tests\n", data->selected_port);
+		return dp_port_idx;
+	}
+
+	igt_info("No suitable port found for color tests\n");
+	return -1;
+}
+
+
+/**
+ * SUBTEST: degamma
+ * Description: Verify degamma LUT with max transform using Chamelium frame capture.
+ */
+static void test_degamma(struct color_test_data *data)
+{
+	gamma_lut_t *degamma_full;
+	igt_crtc_t *pipe_obj;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_v3_frame *frame;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	bool result;
+
+	igt_require(setup_display(data));
+	pipe_obj = data->primary->crtc;
+	igt_require(igt_crtc_has_prop(pipe_obj, IGT_CRTC_DEGAMMA_LUT));
+
+	degamma_full = generate_table_max(data->degamma_lut_size);
+
+	/* Create framebuffers */
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb_modeset);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fbref);
+
+	/* Initial modeset with solid color for video signal stabilization */
+	{
+		cairo_t *cr_init = igt_get_cairo_ctx(data->drm_fd, &fb_modeset);
+		igt_paint_color(cr_init, 0, 0, data->mode->hdisplay, data->mode->vdisplay,
+				0.5, 0.5, 0.5);
+		igt_put_cairo_ctx(cr_init);
+	}
+	igt_plane_set_fb(data->primary, &fb_modeset);
+	disable_ctm(pipe_obj);
+	disable_gamma(pipe_obj);
+	disable_degamma(pipe_obj);
+	igt_display_commit(&data->display);
+
+	/* Wait for video signal to stabilize */
+	sleep(2);
+
+	/* Draw reference: solid colors (what gradient + max degamma should produce) */
+	paint_rectangles(data, data->mode, red_green_blue, &fbref);
+
+	/* Draw test: gradient with max degamma LUT */
+	paint_gradient_rectangles(data, data->mode, red_green_blue, &fb);
+	igt_plane_set_fb(data->primary, &fb);
+	set_degamma(data, pipe_obj, degamma_full);
+	igt_display_commit(&data->display);
+
+	/* Wait for display to stabilize after degamma change */
+	sleep(1);
+
+	/* Capture frame from Chamelium */
+	frame = chamelium_v3_capture_frame(data->chamelium, data->selected_port);
+	igt_assert(frame);
+
+	/* Compare captured frame against reference */
+	result = compare_frame_to_fb(data, frame, &fbref, FRAME_TOLERANCE);
+
+	/* Cleanup */
+	chamelium_v3_free_frame(frame);
+	disable_degamma(pipe_obj);
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fbref);
+	free_lut(degamma_full);
+
+	igt_assert(result);
+}
+
+/**
+ * SUBTEST: gamma
+ * Description: Verify gamma LUT with max transform using Chamelium frame capture.
+ */
+static void test_gamma(struct color_test_data *data)
+{
+	gamma_lut_t *gamma_full;
+	igt_crtc_t *pipe_obj;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_v3_frame *frame;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	bool result;
+
+	igt_require(setup_display(data));
+	pipe_obj = data->primary->crtc;
+	igt_require(igt_crtc_has_prop(pipe_obj, IGT_CRTC_GAMMA_LUT));
+
+	gamma_full = generate_table_max(data->gamma_lut_size);
+
+	/* Create framebuffers */
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb_modeset);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fbref);
+
+	/* Initial modeset with solid color for video signal stabilization */
+	{
+		cairo_t *cr_init = igt_get_cairo_ctx(data->drm_fd, &fb_modeset);
+		igt_paint_color(cr_init, 0, 0, data->mode->hdisplay, data->mode->vdisplay,
+				0.5, 0.5, 0.5);
+		igt_put_cairo_ctx(cr_init);
+	}
+	igt_plane_set_fb(data->primary, &fb_modeset);
+	disable_ctm(pipe_obj);
+	disable_degamma(pipe_obj);
+	igt_display_commit(&data->display);
+
+	/* Wait for video signal to stabilize */
+	sleep(2);
+
+	/* Draw reference: solid colors */
+	paint_rectangles(data, data->mode, red_green_blue, &fbref);
+
+	/* Draw test: gradient with max gamma LUT */
+	paint_gradient_rectangles(data, data->mode, red_green_blue, &fb);
+	igt_plane_set_fb(data->primary, &fb);
+	set_gamma(data, pipe_obj, gamma_full);
+	igt_display_commit(&data->display);
+
+	/* Wait for display to stabilize after gamma change */
+	sleep(1);
+
+	frame = chamelium_v3_capture_frame(data->chamelium, data->selected_port);
+	igt_assert(frame);
+
+	result = compare_frame_to_fb(data, frame, &fbref, FRAME_TOLERANCE);
+
+	chamelium_v3_free_frame(frame);
+	disable_gamma(pipe_obj);
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fbref);
+	free_lut(gamma_full);
+
+	igt_assert(result);
+}
+
+/*
+ * Generic CTM test helper
+ */
+static void test_pipe_ctm(struct color_test_data *data,
+			  color_t *before, color_t *after,
+			  const double *ctm_matrix)
+{
+	gamma_lut_t *degamma_linear, *gamma_linear;
+	igt_crtc_t *pipe_obj;
+	struct igt_fb fb_modeset, fb, fbref;
+	struct chamelium_v3_frame *frame;
+	bool result;
+
+	igt_require(setup_display(data));
+	pipe_obj = data->primary->crtc;
+	igt_require(igt_crtc_has_prop(pipe_obj, IGT_CRTC_CTM));
+
+	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+
+	/* Create framebuffers */
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb_modeset);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_create_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fbref);
+
+	/* Initial modeset with solid color for video signal stabilization */
+	{
+		cairo_t *cr_init = igt_get_cairo_ctx(data->drm_fd, &fb_modeset);
+		igt_paint_color(cr_init, 0, 0, data->mode->hdisplay, data->mode->vdisplay,
+				0.5, 0.5, 0.5);
+		igt_put_cairo_ctx(cr_init);
+	}
+	igt_plane_set_fb(data->primary, &fb_modeset);
+
+	if (memcmp(before, after, sizeof(color_t) * 3)) {
+		set_degamma(data, pipe_obj, degamma_linear);
+		set_gamma(data, pipe_obj, gamma_linear);
+	} else {
+		disable_degamma(pipe_obj);
+		disable_gamma(pipe_obj);
+	}
+	disable_ctm(pipe_obj);
+	igt_display_commit(&data->display);
+
+	/* Wait for video signal to stabilize */
+	sleep(2);
+
+	/* Draw reference: expected colors after CTM */
+	paint_rectangles(data, data->mode, after, &fbref);
+
+	/* Draw test: before colors with CTM applied */
+	paint_rectangles(data, data->mode, before, &fb);
+	igt_plane_set_fb(data->primary, &fb);
+	set_ctm(pipe_obj, ctm_matrix);
+	igt_display_commit(&data->display);
+
+	/* Wait for display to stabilize after CTM change */
+	sleep(1);
+
+	frame = chamelium_v3_capture_frame(data->chamelium, data->selected_port);
+	igt_assert(frame);
+
+	result = compare_frame_to_fb(data, frame, &fbref, FRAME_TOLERANCE);
+
+	chamelium_v3_free_frame(frame);
+	disable_degamma(pipe_obj);
+	disable_gamma(pipe_obj);
+	disable_ctm(pipe_obj);
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fbref);
+	free_lut(degamma_linear);
+	free_lut(gamma_linear);
+
+	igt_assert(result);
+}
+
+/**
+ * SUBTEST: ctm-red-to-blue
+ * Description: Verify CTM red-to-blue channel swap.
+ */
+static void test_ctm_red_to_blue(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 0.0, 0.0, 1.0 },  /* Red -> Blue */
+		{ 0.0, 1.0, 0.0 },  /* Green -> Green */
+		{ 0.0, 0.0, 1.0 }   /* Blue -> Blue */
+	};
+	double ctm[] = {
+		0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		1.0, 0.0, 1.0
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-green-to-red
+ * Description: Verify CTM green-to-red channel swap.
+ */
+static void test_ctm_green_to_red(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 1.0, 0.0, 0.0 },  /* Red -> Red */
+		{ 1.0, 0.0, 0.0 },  /* Green -> Red */
+		{ 0.0, 0.0, 1.0 }   /* Blue -> Blue */
+	};
+	double ctm[] = {
+		1.0, 1.0, 0.0,
+		0.0, 0.0, 0.0,
+		0.0, 0.0, 1.0
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-blue-to-red
+ * Description: Verify CTM blue-to-red channel swap.
+ */
+static void test_ctm_blue_to_red(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 1.0, 0.0, 0.0 },  /* Red -> Red */
+		{ 0.0, 1.0, 0.0 },  /* Green -> Green */
+		{ 1.0, 0.0, 0.0 }   /* Blue -> Red */
+	};
+	double ctm[] = {
+		1.0, 0.0, 1.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 0.0
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-max
+ * Description: Verify CTM with 100x scale (saturation to white).
+ */
+static void test_ctm_max(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 0.5, 0.0, 0.0 },
+		{ 0.0, 0.5, 0.0 },
+		{ 0.0, 0.0, 0.5 }
+	};
+	color_t after[] = {
+		{ 1.0, 0.0, 0.0 },  /* Saturates to max */
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	double ctm[] = {
+		100.0, 0.0, 0.0,
+		0.0, 100.0, 0.0,
+		0.0, 0.0, 100.0
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-negative
+ * Description: Verify CTM with negative scale (clamp to black).
+ */
+static void test_ctm_negative(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 0.0, 0.0, 0.0 },  /* Clamps to black */
+		{ 0.0, 0.0, 0.0 },
+		{ 0.0, 0.0, 0.0 }
+	};
+	double ctm[] = {
+		-1.0, 0.0, 0.0,
+		0.0, -1.0, 0.0,
+		0.0, 0.0, -1.0
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-0-25
+ * Description: Verify CTM with 0.25 scale factor.
+ */
+static void test_ctm_0_25(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 0.25, 0.0, 0.0 },
+		{ 0.0, 0.25, 0.0 },
+		{ 0.0, 0.0, 0.25 }
+	};
+	double ctm[] = {
+		0.25, 0.0, 0.0,
+		0.0, 0.25, 0.0,
+		0.0, 0.0, 0.25
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-0-50
+ * Description: Verify CTM with 0.50 scale factor.
+ */
+static void test_ctm_0_50(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 0.5, 0.0, 0.0 },
+		{ 0.0, 0.5, 0.0 },
+		{ 0.0, 0.0, 0.5 }
+	};
+	double ctm[] = {
+		0.5, 0.0, 0.0,
+		0.0, 0.5, 0.0,
+		0.0, 0.0, 0.5
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-0-75
+ * Description: Verify CTM with 0.75 scale factor.
+ */
+static void test_ctm_0_75(struct color_test_data *data)
+{
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ 0.75, 0.0, 0.0 },
+		{ 0.0, 0.75, 0.0 },
+		{ 0.0, 0.0, 0.75 }
+	};
+	double ctm[] = {
+		0.75, 0.0, 0.0,
+		0.0, 0.75, 0.0,
+		0.0, 0.0, 0.75
+	};
+
+	test_pipe_ctm(data, before, after, ctm);
+}
+
+/**
+ * SUBTEST: ctm-limited-range
+ * Description: Verify CTM with limited-range broadcast RGB.
+ */
+static void test_ctm_limited_range(struct color_test_data *data)
+{
+	/*
+	 * In limited range, the GPU maps full range [0-255] to [16-235]
+	 * on the wire. The Chamelium captures raw wire values, so:
+	 *   FB 255 (1.0) -> wire 235
+	 *   FB 0   (0.0) -> wire 16
+	 */
+	double limited_max = 235.0 / 255.0;
+	double limited_min = 16.0 / 255.0;
+	color_t before[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	color_t after[] = {
+		{ limited_max, limited_min, limited_min },
+		{ limited_min, limited_max, limited_min },
+		{ limited_min, limited_min, limited_max }
+	};
+	double ctm[] = {
+		1.0, 0.0, 0.0,
+		0.0, 1.0, 0.0,
+		0.0, 0.0, 1.0
+	};
+
+	igt_require(setup_display(data));
+	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
+
+	/* Set limited range */
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
+
+	test_pipe_ctm(data, before, after, ctm);
+
+	/* Reset to full range */
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
+}
+
+
+int igt_main()
+{
+	struct color_test_data data = { 0 };
+	int selected_port_idx;
+
+	igt_fixture() {
+		/* Setup Chamelium */
+		data.chamelium = chamelium_v3_init_from_config();
+		igt_require(data.chamelium);
+
+		data.port_count = chamelium_v3_get_supported_ports(data.chamelium, &data.ports);
+		igt_require(data.port_count > 0);
+
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_require(data.drm_fd >= 0);
+
+		data.devid = is_intel_device(data.drm_fd) ?
+			     intel_get_drm_devid(data.drm_fd) : 0;
+
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+
+		igt_info("Found %d Chamelium ports\n", data.port_count);
+
+		selected_port_idx = select_color_test_port(&data);
+		igt_require_f(selected_port_idx >= 0,
+			      "No connected port found for color tests\n");
+
+		igt_info("Using %s port %d for color tests\n",
+			 data.hdmi_selected ? "HDMI" : "DP", data.selected_port);
+	}
+
+	igt_describe("Degamma LUT max transform verification");
+	igt_subtest("degamma")
+		test_degamma(&data);
+
+	igt_describe("Gamma LUT max transform verification");
+	igt_subtest("gamma")
+		test_gamma(&data);
+
+	igt_describe("CTM red-to-blue channel swap verification");
+	igt_subtest("ctm-red-to-blue")
+		test_ctm_red_to_blue(&data);
+
+	igt_describe("CTM green-to-red channel swap verification");
+	igt_subtest("ctm-green-to-red")
+		test_ctm_green_to_red(&data);
+
+	igt_describe("CTM blue-to-red channel swap verification");
+	igt_subtest("ctm-blue-to-red")
+		test_ctm_blue_to_red(&data);
+
+	igt_describe("CTM 100x scale factor (saturation to white)");
+	igt_subtest("ctm-max")
+		test_ctm_max(&data);
+
+	igt_describe("CTM negative scale (clamp to black)");
+	igt_subtest("ctm-negative")
+		test_ctm_negative(&data);
+
+	igt_describe("CTM 0.25 scale factor");
+	igt_subtest("ctm-0-25")
+		test_ctm_0_25(&data);
+
+	igt_describe("CTM 0.50 scale factor");
+	igt_subtest("ctm-0-50")
+		test_ctm_0_50(&data);
+
+	igt_describe("CTM 0.75 scale factor");
+	igt_subtest("ctm-0-75")
+		test_ctm_0_75(&data);
+
+	igt_describe("CTM with limited-range broadcast RGB");
+	igt_subtest("ctm-limited-range")
+		test_ctm_limited_range(&data);
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+		free(data.ports);
+		chamelium_v3_uninit(data.chamelium);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index c3dbff694..1c7facccd 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -377,6 +377,7 @@ chamelium_v3_progs = [
 	'kms_chamelium_v3_hpd',
 	'kms_chamelium_v3_edid',
 	'kms_chamelium_v3_frames',
+	'kms_chamelium_v3_color',
 ]
 
 test_deps = [ igt_deps ]
-- 
2.48.1

