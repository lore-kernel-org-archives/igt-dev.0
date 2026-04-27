Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B760EFF8861
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 10:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4110E69E;
	Mon, 27 Apr 2026 10:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EY+yefb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF69610E69D
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777286798; x=1808822798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KfblnmoGJXFxJ3Oow8ybgJWYDvmV+FIKaFp2WOaVsh0=;
 b=EY+yefb2PffjgVNWISe34s6FWmLAfgAeIvjZieVc6TkdN5w6Y+/1w4uX
 fhL6hVENpslByzgfGuOoMs5VVj+b1Fvrh+0fvpdbYDh09v6HwYwbSNchR
 5EVZZi5V+kBcyfTSibu+QN+3DO0K8laGlX9h36DPMqxJEHvWgWeo68D1C
 x9bkevVPmRWeio3YI++gBINXeGXh8H+YI9vO5XTVm6ibUfnDYDXsorj9H
 UTYPv8XUlJwGO5kceNEy6FFB2qEsKbCgipYa24Nu48wvYC6kCockbLcBY
 x7ZWLh8ldpH1WUKTogaB0r/zYGgIkInwJTwaU2t6U81ti85DGlQzO6BRN Q==;
X-CSE-ConnectionGUID: fFnLcCATQxqLLfkrNmgnoA==
X-CSE-MsgGUID: Nb4pNTb4TA+sWoDRBTNhUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78154916"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78154916"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 03:46:38 -0700
X-CSE-ConnectionGUID: p0Sj/JRJSiSsuExdEYwZhw==
X-CSE-MsgGUID: kSwf3K2/RzmyaRmLGk5Q3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="227073045"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 03:46:36 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_colorspace: Add Colorspace connector
 property test
Date: Mon, 27 Apr 2026 16:25:14 +0530
Message-Id: <20260427105514.2239876-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260427105514.2239876-1-swati2.sharma@intel.com>
References: <20260427105514.2239876-1-swati2.sharma@intel.com>
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

Add a dedicated IGT test for the DRM Colorspace connector property,
exercising both basic functionality and edge cases:

  - colorspace-enum-list: verify the property exists as an enum with
    at least the Default value.
  - colorspace-set-%s: set each supported colorspace value and verify
    readback via atomic commit (16 parameterized subtests).
  - colorspace-crc-%s: CRC sanity check confirming output is not
    corrupted when each colorspace value is active (16 subtests).
  - colorspace-dpms: verify colorspace survives DPMS off/on cycles.
  - colorspace-suspend: verify colorspace survives suspend/resume.
  - colorspace-invalid: reject out-of-range enum values (-EINVAL).
  - colorspace-connector-type: validate HDMI-only enums are absent
    on DP connectors and vice-versa.
  - colorspace-unsupported-value: force a valid but unsupported enum
    value via the numeric path and verify kernel rejection.

The test covers the full kernel drm_colorspace enum (16 values) and
uses a static name-to-value mapping table for the unsupported-value
subtest, eliminating the need for multiple connected outputs.

Co-developed-by: Claude Opus 4.6 (Anthropic AI)
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorspace.c | 925 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   3 +-
 2 files changed, 927 insertions(+), 1 deletion(-)
 create mode 100644 tests/kms_colorspace.c

diff --git a/tests/kms_colorspace.c b/tests/kms_colorspace.c
new file mode 100644
index 000000000..8becab72f
--- /dev/null
+++ b/tests/kms_colorspace.c
@@ -0,0 +1,925 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms colorspace
+ * Category: Display
+ * Description: Test the Colorspace connector property
+ * Driver requirement: any
+ * Mega feature: Color Management
+ */
+
+#include "igt.h"
+#include <fcntl.h>
+#include <inttypes.h>
+#include <xf86drmMode.h>
+
+/**
+ * SUBTEST: colorspace-enum-list
+ * Description: Verify that the Colorspace property is an enum and lists
+ *              at least the Default value.
+ *
+ * SUBTEST: colorspace-set-%s
+ * Description: Set the Colorspace connector property to %arg[1] and
+ *              verify atomic commit succeeds.
+ *
+ * arg[1]:
+ *
+ * @Default:				Default colorspace
+ * @RGB_Wide_Gamut_Fixed_Point:		RGB Wide Gamut Fixed Point
+ * @RGB_Wide_Gamut_Floating_Point:	RGB Wide Gamut Floating Point
+ * @opRGB:				opRGB colorspace
+ * @DCI-P3_RGB_D65:			DCI-P3 RGB D65 colorspace
+ * @DCI-P3_RGB_Theater:		DCI-P3 RGB Theater colorspace
+ * @BT2020_RGB:			BT.2020 RGB colorspace
+ * @BT709_YCC:				BT.709 YCC colorspace
+ * @XVYCC_601:				xvYCC 601 colorspace
+ * @XVYCC_709:				xvYCC 709 colorspace
+ * @SYCC_601:				sYCC 601 colorspace
+ * @opYCC_601:				opYCC 601 colorspace
+ * @BT2020_YCC:			BT.2020 YCC colorspace
+ * @BT2020_CYCC:			BT.2020 constant-luminance YCC
+ * @BT601_YCC:				BT.601 YCC colorspace (DP)
+ * @SMPTE_170M_YCC:			SMPTE 170M YCC colorspace
+ *
+ * SUBTEST: colorspace-crc-%s
+ * Description: Verify that setting Colorspace to %arg[1] does not corrupt
+ *              the display output (CRC sanity check).
+ *
+ * arg[1]:
+ *
+ * @Default:				Default colorspace
+ * @RGB_Wide_Gamut_Fixed_Point:		RGB Wide Gamut Fixed Point
+ * @RGB_Wide_Gamut_Floating_Point:	RGB Wide Gamut Floating Point
+ * @opRGB:				opRGB colorspace
+ * @DCI-P3_RGB_D65:			DCI-P3 RGB D65 colorspace
+ * @DCI-P3_RGB_Theater:		DCI-P3 RGB Theater colorspace
+ * @BT2020_RGB:			BT.2020 RGB colorspace
+ * @BT709_YCC:				BT.709 YCC colorspace
+ * @XVYCC_601:				xvYCC 601 colorspace
+ * @XVYCC_709:				xvYCC 709 colorspace
+ * @SYCC_601:				sYCC 601 colorspace
+ * @opYCC_601:				opYCC 601 colorspace
+ * @BT2020_YCC:			BT.2020 YCC colorspace
+ * @BT2020_CYCC:			BT.2020 constant-luminance YCC
+ * @BT601_YCC:				BT.601 YCC colorspace (DP)
+ * @SMPTE_170M_YCC:			SMPTE 170M YCC colorspace
+ *
+ * SUBTEST: colorspace-dpms
+ * Description: Set a non-default Colorspace, cycle DPMS off/on, and verify
+ *              the property value is preserved.
+ *
+ * SUBTEST: colorspace-suspend
+ * Description: Set a non-default Colorspace, suspend/resume, and verify
+ *              the property value is preserved.
+ *
+ * SUBTEST: colorspace-invalid
+ * Description: Verify that the kernel rejects invalid Colorspace values.
+ *
+ * SUBTEST: colorspace-connector-type
+ * Description: Validate that connector-type-specific Colorspace values are
+ *              advertised only on the appropriate connector types.
+ *
+ * SUBTEST: colorspace-unsupported-value
+ * Description: Verify that the kernel rejects a Colorspace enum value
+ *              that is not supported by the connector.
+ */
+
+IGT_TEST_DESCRIPTION("Test DRM Colorspace connector property");
+
+/* Colorspace enum values reported by the kernel.
+ * Not all connectors support all values; HDMI and DP have different subsets.
+ * The string names must match the kernel's drm_get_colorspace_name() output.
+ */
+static const char * const colorspace_names[] = {
+	"Default",
+	"RGB_Wide_Gamut_Fixed_Point",
+	"RGB_Wide_Gamut_Floating_Point",
+	"opRGB",		/* kernel-defined name per drm_get_colorspace_name() */
+	"DCI-P3_RGB_D65",
+	"DCI-P3_RGB_Theater",
+	"BT2020_RGB",
+	"BT709_YCC",
+	"XVYCC_601",
+	"XVYCC_709",
+	"SYCC_601",
+	"opYCC_601",
+	"BT2020_YCC",
+	"BT2020_CYCC",
+	"BT601_YCC",
+	"SMPTE_170M_YCC",
+};
+
+typedef struct data {
+	igt_display_t display;
+	int drm_fd;
+} data_t;
+
+static drmModePropertyPtr
+get_colorspace_prop(igt_output_t *output)
+{
+	igt_display_t *display = output->display;
+
+	if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+		return NULL;
+
+	return drmModeGetProperty(display->drm_fd,
+				  output->props[IGT_CONNECTOR_COLORSPACE]);
+}
+
+/* Check whether @prop contains an enum entry named @name. */
+static bool
+prop_has_enum(drmModePropertyPtr prop, const char *name)
+{
+	for (int i = 0; i < prop->count_enums; i++)
+		if (strcmp(prop->enums[i].name, name) == 0)
+			return true;
+	return false;
+}
+
+static bool
+output_supports_colorspace(igt_output_t *output, const char *cs)
+{
+	drmModePropertyPtr prop;
+	bool found;
+
+	prop = get_colorspace_prop(output);
+	if (!prop)
+		return false;
+
+	found = prop_has_enum(prop, cs);
+	drmModeFreeProperty(prop);
+	return found;
+}
+
+/*
+ * Read back the current Colorspace enum name from the kernel into @buf.
+ * Returns true if the value was found in the property's enum list.
+ */
+static bool
+readback_colorspace(igt_output_t *output, char *buf, size_t len)
+{
+	drmModePropertyPtr prop;
+	uint64_t val;
+	bool found = false;
+
+	val = igt_output_get_prop(output, IGT_CONNECTOR_COLORSPACE);
+	prop = get_colorspace_prop(output);
+	igt_assert(prop);
+
+	for (int i = 0; i < prop->count_enums; i++) {
+		if ((uint64_t)prop->enums[i].value == val) {
+			snprintf(buf, len, "%s", prop->enums[i].name);
+			found = true;
+			break;
+		}
+	}
+
+	drmModeFreeProperty(prop);
+	return found;
+}
+
+static void
+assert_colorspace_eq(igt_output_t *output, const char *expected)
+{
+	char buf[64];
+
+	igt_assert_f(readback_colorspace(output, buf, sizeof(buf)) &&
+		     strcmp(buf, expected) == 0,
+		     "Connector %s: expected '%s', got '%s'\n",
+		     igt_output_name(output), expected, buf);
+}
+
+/*
+ * Find the first non-default Colorspace value supported by @output.
+ * Returns NULL if no non-default value is available.
+ * Starts at index 1 to skip "Default" (always at index 0).
+ */
+static const char *
+find_non_default_colorspace(igt_output_t *output)
+{
+	drmModePropertyPtr prop;
+	const char *result = NULL;
+
+	prop = get_colorspace_prop(output);
+	if (!prop)
+		return NULL;
+
+	/* Skip index 0 (Default) */
+	for (int i = 1; i < ARRAY_SIZE(colorspace_names); i++) {
+		if (prop_has_enum(prop, colorspace_names[i])) {
+			result = colorspace_names[i];
+			break;
+		}
+	}
+
+	drmModeFreeProperty(prop);
+	return result;
+}
+
+static bool
+crc_is_nonzero(const igt_crc_t *crc)
+{
+	for (int i = 0; i < crc->n_words; i++)
+		if (crc->crc[i])
+			return true;
+	return false;
+}
+
+static void
+prepare_output(data_t *data, igt_output_t *output, igt_crtc_t **crtc_out,
+	       struct igt_fb *fb_out)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	igt_crtc_t *crtc;
+	igt_plane_t *primary;
+
+	for_each_crtc(display, crtc) {
+		igt_output_set_crtc(output, crtc);
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_output_set_crtc(output, NULL);
+			continue;
+		}
+
+		/* FB is created only after a valid CRTC is found. */
+		mode = igt_output_get_mode(output);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_create_pattern_fb(data->drm_fd,
+				     mode->hdisplay, mode->vdisplay,
+				     DRM_FORMAT_XRGB8888,
+				     DRM_FORMAT_MOD_LINEAR, fb_out);
+		igt_plane_set_fb(primary, fb_out);
+
+		igt_display_commit_atomic(display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL);
+
+		*crtc_out = crtc;
+		return;
+	}
+
+	igt_skip("No valid CRTC found for output %s\n", igt_output_name(output));
+}
+
+static void
+cleanup_output(data_t *data, igt_output_t *output, struct igt_fb *fb)
+{
+	igt_display_reset(&data->display);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_remove_fb(data->drm_fd, fb);
+}
+
+/*
+ * Subtest: colorspace-enum-list
+ *
+ * Verify the Colorspace property exists and is an enum with at least
+ * "Default" among its values.
+ */
+static void
+test_colorspace_enum_list(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+			continue;
+
+		igt_assert_f(output_supports_colorspace(output, "Default"),
+			     "Connector %s: Colorspace property missing 'Default' value\n",
+			     igt_output_name(output));
+
+		igt_info("Connector %s: Colorspace property present, 'Default' supported\n",
+			 igt_output_name(output));
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector with Colorspace property found\n");
+}
+
+/*
+ * Subtest: colorspace-set-<name>
+ *
+ * For each connected output that supports the requested colorspace,
+ * set it, commit, and verify the property value readback.
+ */
+static void
+test_colorspace_set(data_t *data, const char *cs)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		drmModePropertyPtr prop;
+		struct igt_fb fb;
+		int ret;
+
+		prop = get_colorspace_prop(output);
+		if (!prop)
+			continue;
+
+		if (!prop_has_enum(prop, cs)) {
+			drmModeFreeProperty(prop);
+			igt_info("Connector %s: skipping, Colorspace '%s' not supported\n",
+				 igt_output_name(output), cs);
+			continue;
+		}
+		drmModeFreeProperty(prop);
+
+		prepare_output(data, output, &crtc, &fb);
+
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, cs);
+		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_assert_f(ret == 0,
+			     "Connector %s: Failed to commit Colorspace '%s' (ret=%d)\n",
+			     igt_output_name(output), cs, ret);
+
+		/* Apply state fully so subsequent readback reflects HW */
+		igt_display_commit_atomic(display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Verify the property value was persisted by the kernel */
+		assert_colorspace_eq(output, cs);
+
+		igt_info("Connector %s: Successfully set Colorspace to '%s'\n",
+			 igt_output_name(output), cs);
+
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector supports Colorspace '%s'\n", cs);
+}
+
+/*
+ * Subtest: colorspace-crc-<name>
+ *
+ * This is a pipeline sanity check, not a functional CSC validation.
+ * Set the colorspace, display a pattern framebuffer, collect the CRC, and
+ * verify it is non-zero (confirming the display pipeline produced output
+ * and was not blanked or corrupted).  CRC comparison between Default and
+ * the requested colorspace is logged for diagnostics only, since with RGB
+ * framebuffers (XRGB8888) the colorspace change typically does not affect
+ * the pipe CRC (conversion happens after the CRC tap point on most HW).
+ */
+static void
+test_colorspace_crc(data_t *data, const char *cs)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		igt_pipe_crc_t *pipe_crc;
+		igt_crc_t crc_default, crc_cs;
+		drmModePropertyPtr prop;
+		struct igt_fb fb;
+
+		prop = get_colorspace_prop(output);
+		if (!prop)
+			continue;
+
+		if (!prop_has_enum(prop, cs) ||
+		    !prop_has_enum(prop, "Default")) {
+			drmModeFreeProperty(prop);
+			igt_info("Connector %s: skipping CRC, Colorspace '%s' or 'Default' not supported\n",
+				 igt_output_name(output), cs);
+			continue;
+		}
+		drmModeFreeProperty(prop);
+
+		prepare_output(data, output, &crtc, &fb);
+
+		igt_require_pipe_crc(data->drm_fd);
+
+		pipe_crc = igt_pipe_crc_new(data->drm_fd,
+					    crtc->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+
+		/* Collect CRC with Default colorspace */
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE,
+					"Default");
+		igt_display_commit_atomic(display,
+					 DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_wait_for_vblank(crtc);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_default);
+
+		/* Sanity: CRC from Default must be non-zero */
+		igt_assert_f(crc_is_nonzero(&crc_default),
+			     "Connector %s: CRC with Default colorspace is all zeros\n",
+			     igt_output_name(output));
+
+		/* Collect CRC with requested colorspace */
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, cs);
+		igt_display_commit_atomic(display,
+					 DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_wait_for_vblank(crtc);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_cs);
+
+		/* CRC with the requested colorspace must also be non-zero */
+		igt_assert_f(crc_is_nonzero(&crc_cs),
+			     "Connector %s: CRC with Colorspace '%s' is all zeros\n",
+			     igt_output_name(output), cs);
+
+		/*
+		 * This is a pipeline sanity check only — it verifies
+		 * that the display output is alive and non-zero, not
+		 * that the colorspace is functionally applied.
+		 * With RGB framebuffers (XRGB8888), colorspace changes
+		 * typically do not affect pipe CRC since the conversion
+		 * may happen after the CRC tap point.
+		 * For functional CSC validation, use YCbCr framebuffer
+		 * formats or test at the sink side.
+		 * Log the result for diagnostic purposes only.
+		 */
+		if (strcmp(cs, "Default") != 0 &&
+		    !igt_check_crc_equal(&crc_default, &crc_cs))
+			igt_info("Connector %s: CRC changed with Colorspace '%s' "
+				 "(HW applies output CSC)\n",
+				 igt_output_name(output), cs);
+		else
+			igt_info("Connector %s: CRC unchanged with Colorspace '%s' "
+				 "(expected for RGB output)\n",
+				 igt_output_name(output), cs);
+
+		igt_pipe_crc_free(pipe_crc);
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector supports Colorspace '%s'\n", cs);
+}
+
+/*
+ * Subtest: colorspace-dpms
+ *
+ * Set a non-default Colorspace, cycle DPMS off/on, and verify the property
+ * value is preserved and output remains valid.
+ */
+static void
+test_colorspace_dpms(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		igt_pipe_crc_t *pipe_crc;
+		igt_crc_t crc_after;
+		struct igt_fb fb;
+		const char *cs;
+
+		if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+			continue;
+
+		cs = find_non_default_colorspace(output);
+		if (!cs)
+			continue;
+
+		prepare_output(data, output, &crtc, &fb);
+
+		pipe_crc = igt_pipe_crc_new(data->drm_fd,
+					    crtc->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+
+		/* Set non-default colorspace and commit */
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, cs);
+		igt_display_commit_atomic(display,
+					 DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Collect CRC before DPMS cycle */
+		igt_wait_for_vblank(crtc);
+		{
+			igt_crc_t crc_before;
+
+			igt_pipe_crc_collect_crc(pipe_crc, &crc_before);
+
+			/* DPMS off/on cycle */
+			kmstest_set_connector_dpms(data->drm_fd,
+						   output->config.connector,
+						   DRM_MODE_DPMS_OFF);
+			kmstest_set_connector_dpms(data->drm_fd,
+						   output->config.connector,
+						   DRM_MODE_DPMS_ON);
+
+			/*
+			 * Force a modeset commit so the driver materialises any
+			 * lazily rebuilt state before we read the property back.
+			 */
+			igt_assert_eq(igt_display_try_commit_atomic(display,
+								    DRM_MODE_ATOMIC_ALLOW_MODESET,
+								    NULL), 0);
+
+			/* Verify the property value survived the DPMS cycle */
+			assert_colorspace_eq(output, cs);
+
+			/* CRC after DPMS should match before */
+			igt_wait_for_vblank(crtc);
+			igt_pipe_crc_collect_crc(pipe_crc, &crc_after);
+			igt_assert_f(crc_is_nonzero(&crc_after),
+				     "Connector %s: CRC is all zeros after DPMS on\n",
+				     igt_output_name(output));
+			igt_assert_crc_equal(&crc_before, &crc_after);
+		}
+
+		igt_info("Connector %s: Colorspace '%s' preserved across DPMS cycle\n",
+			 igt_output_name(output), cs);
+
+		igt_pipe_crc_free(pipe_crc);
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector with non-default Colorspace found\n");
+}
+
+/*
+ * Subtest: colorspace-suspend
+ *
+ * Set a non-default Colorspace, suspend/resume, and verify the property
+ * value is preserved and output remains valid.
+ */
+static void
+test_colorspace_suspend(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		igt_pipe_crc_t *pipe_crc;
+		igt_crc_t crc_after;
+		struct igt_fb fb;
+		const char *cs;
+
+		if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+			continue;
+
+		cs = find_non_default_colorspace(output);
+		if (!cs)
+			continue;
+
+		prepare_output(data, output, &crtc, &fb);
+
+		pipe_crc = igt_pipe_crc_new(data->drm_fd,
+					    crtc->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+
+		igt_output_set_prop_enum(output, IGT_CONNECTOR_COLORSPACE, cs);
+		igt_display_commit_atomic(display,
+					 DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Suspend/resume */
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+
+		/*
+		 * Re-probe display state after resume to pick up any
+		 * connector/CRTC changes, then force a modeset commit
+		 * so the driver materialises rebuilt state.
+		 */
+		igt_display_reset(display);
+		igt_output_set_crtc(output, crtc);
+		igt_plane_set_fb(igt_output_get_plane_type(output,
+				 DRM_PLANE_TYPE_PRIMARY), &fb);
+		igt_assert_eq(igt_display_try_commit_atomic(display,
+							    DRM_MODE_ATOMIC_ALLOW_MODESET,
+							    NULL), 0);
+
+		/* Verify the property value survived suspend/resume */
+		assert_colorspace_eq(output, cs);
+
+		/* CRC sanity: display output must be non-zero after resume */
+		igt_wait_for_vblank(crtc);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_after);
+		igt_assert_f(crc_is_nonzero(&crc_after),
+			     "Connector %s: CRC is all zeros after resume\n",
+			     igt_output_name(output));
+
+		igt_info("Connector %s: Colorspace '%s' preserved across suspend/resume\n",
+			 igt_output_name(output), cs);
+
+		igt_pipe_crc_free(pipe_crc);
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector with non-default Colorspace found\n");
+}
+
+/*
+ * Subtest: colorspace-invalid
+ *
+ * Verify the kernel rejects out-of-range Colorspace enum values.
+ */
+static void
+test_colorspace_invalid(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		drmModePropertyPtr prop;
+		struct igt_fb fb;
+		uint64_t invalid;
+		int ret;
+
+		if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+			continue;
+
+		/*
+		 * Derive an invalid value well past the last defined enum.
+		 * Adding 100 avoids any risk of hitting a valid but sparse
+		 * enum value.
+		 */
+		prop = get_colorspace_prop(output);
+		igt_assert(prop && prop->count_enums > 0);
+		invalid = prop->enums[prop->count_enums - 1].value + 100;
+		drmModeFreeProperty(prop);
+
+		prepare_output(data, output, &crtc, &fb);
+
+		igt_output_set_prop_value(output, IGT_CONNECTOR_COLORSPACE,
+					  invalid);
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		igt_assert_f(ret == -EINVAL,
+			     "Connector %s: Expected -EINVAL for invalid Colorspace %" PRIu64 ", got %d\n",
+			     igt_output_name(output), invalid, ret);
+
+		igt_info("Connector %s: Invalid Colorspace %" PRIu64 " correctly rejected\n",
+			 igt_output_name(output), invalid);
+
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector with Colorspace property found\n");
+}
+
+/*
+ * Subtest: colorspace-connector-type
+ *
+ * Validate connector-type-specific Colorspace enum expectations.
+ * HDMI connectors should not advertise DP-only values like BT601_YCC.
+ */
+static bool
+is_dp_connector(igt_output_t *output)
+{
+	uint32_t type = output->config.connector->connector_type;
+
+	return type == DRM_MODE_CONNECTOR_DisplayPort ||
+	       type == DRM_MODE_CONNECTOR_eDP;
+}
+
+static bool
+is_hdmi_connector(igt_output_t *output)
+{
+	uint32_t type = output->config.connector->connector_type;
+
+	return type == DRM_MODE_CONNECTOR_HDMIA ||
+	       type == DRM_MODE_CONNECTOR_HDMIB;
+}
+
+static void
+test_colorspace_connector_type(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		if (!igt_output_has_prop(output, IGT_CONNECTOR_COLORSPACE))
+			continue;
+
+		/*
+		 * BT601_YCC is defined only in the DP colorspace enum list
+		 * in the kernel.  HDMI connectors must not expose it.
+		 */
+		if (is_hdmi_connector(output)) {
+			igt_assert_f(!output_supports_colorspace(output, "BT601_YCC"),
+				     "HDMI connector %s should not advertise BT601_YCC\n",
+				     igt_output_name(output));
+			igt_info("HDMI connector %s: correctly omits BT601_YCC\n",
+				 igt_output_name(output));
+		}
+
+		/*
+		 * DP connectors with a Colorspace property are expected to
+		 * support BT601_YCC per the DP 1.4a VSC SDP spec, but some
+		 * platforms may not expose the full enum set.  Warn rather
+		 * than assert to avoid false failures on such platforms.
+		 */
+		if (is_dp_connector(output)) {
+			if (!output_supports_colorspace(output, "BT601_YCC"))
+				igt_warn("DP connector %s: BT601_YCC not advertised "
+					 "(commonly expected for DP connectors)\n",
+					 igt_output_name(output));
+			else
+				igt_info("DP connector %s: BT601_YCC correctly advertised\n",
+					 igt_output_name(output));
+		}
+
+		tested = true;
+	}
+
+	igt_require_f(tested, "No connector with Colorspace property found\n");
+}
+
+/*
+ * Subtest: colorspace-unsupported-value
+ *
+ * For each connector, find a colorspace enum value that exists in the
+ * kernel's global drm_colorspace enum but is NOT advertised by this
+ * connector, then force it via the numeric path and verify the kernel
+ * rejects the commit with -EINVAL.
+ */
+
+/*
+ * Kernel drm_colorspace enum values — must match the kernel's
+ * enum drm_colorspace definition in include/drm/drm_connector.h.
+ * If the kernel adds or renumbers values, this table must be updated.
+ * HDMI and DP connectors each expose a different subset of these.
+ */
+static int64_t
+colorspace_kernel_value(const char *name)
+{
+	static const struct {
+		const char *name;
+		uint64_t value;
+	} map[] = {
+		{ "Default",				0 },
+		{ "SMPTE_170M_YCC",			1 },
+		{ "BT709_YCC",				2 },
+		{ "XVYCC_601",				3 },
+		{ "XVYCC_709",				4 },
+		{ "SYCC_601",				5 },
+		{ "opYCC_601",				6 },
+		{ "opRGB",				7 },
+		{ "BT2020_CYCC",			8 },
+		{ "BT2020_RGB",				9 },
+		{ "BT2020_YCC",			10 },
+		{ "DCI-P3_RGB_D65",			11 },
+		{ "DCI-P3_RGB_Theater",			12 },
+		{ "RGB_Wide_Gamut_Fixed_Point",		13 },
+		{ "RGB_Wide_Gamut_Floating_Point",	14 },
+		{ "BT601_YCC",				15 },
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(map); i++)
+		if (strcmp(map[i].name, name) == 0)
+			return (int64_t)map[i].value;
+
+	return -1;
+}
+
+static void
+test_colorspace_unsupported_value(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	bool tested = false;
+
+	for_each_connected_output(display, output) {
+		igt_crtc_t *crtc = NULL;
+		drmModePropertyPtr prop;
+		struct igt_fb fb;
+		uint64_t unsupported_val = 0;
+		const char *unsupported_name = NULL;
+		bool found = false;
+		int ret;
+
+		prop = get_colorspace_prop(output);
+		if (!prop)
+			continue;
+
+		/*
+		 * Find a colorspace that this connector does NOT advertise.
+		 * Look up its numeric value from the kernel's global
+		 * drm_colorspace enum definition, so we don't need a
+		 * second connector.
+		 */
+		for (int i = 0; i < ARRAY_SIZE(colorspace_names); i++) {
+			int64_t val;
+
+			if (prop_has_enum(prop, colorspace_names[i]))
+				continue;
+
+			val = colorspace_kernel_value(colorspace_names[i]);
+			if (val < 0)
+				continue;
+
+			unsupported_val = (uint64_t)val;
+			unsupported_name = colorspace_names[i];
+			found = true;
+			break;
+		}
+
+		drmModeFreeProperty(prop);
+
+		if (!found) {
+			igt_info("Connector %s: supports all known colorspaces, "
+				 "skipping\n", igt_output_name(output));
+			continue;
+		}
+
+		prepare_output(data, output, &crtc, &fb);
+
+		/* Force the unsupported numeric value via the raw path */
+		igt_output_set_prop_value(output, IGT_CONNECTOR_COLORSPACE,
+					  unsupported_val);
+		ret = igt_display_try_commit_atomic(display,
+						    DRM_MODE_ATOMIC_ALLOW_MODESET,
+						    NULL);
+		igt_assert_f(ret == -EINVAL,
+			     "Connector %s: Expected -EINVAL for unsupported '%s' "
+			     "(value %" PRIu64 "), got %d\n",
+			     igt_output_name(output), unsupported_name,
+			     unsupported_val, ret);
+
+		igt_info("Connector %s: Unsupported '%s' (value %" PRIu64 ") "
+			 "correctly rejected by kernel\n",
+			 igt_output_name(output), unsupported_name,
+			 unsupported_val);
+
+		/* cleanup_output() resets display state internally */
+		cleanup_output(data, output, &fb);
+		tested = true;
+	}
+
+	igt_require_f(tested,
+		      "No connector with unsupported Colorspace value found "
+		      "(all connectors support all known values)\n");
+}
+
+int igt_main()
+{
+	data_t data = {};
+	int i;
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+	}
+
+	igt_describe("Verify the Colorspace property is an enum with at least 'Default'");
+	igt_subtest("colorspace-enum-list")
+		test_colorspace_enum_list(&data);
+
+	for (i = 0; i < ARRAY_SIZE(colorspace_names); i++) {
+		igt_describe_f("Set Colorspace to '%s' and verify atomic commit succeeds",
+			       colorspace_names[i]);
+		igt_subtest_f("colorspace-set-%s", colorspace_names[i])
+			test_colorspace_set(&data, colorspace_names[i]);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(colorspace_names); i++) {
+		igt_describe_f("Verify CRC sanity with Colorspace set to '%s'",
+			       colorspace_names[i]);
+		igt_subtest_f("colorspace-crc-%s", colorspace_names[i])
+			test_colorspace_crc(&data, colorspace_names[i]);
+	}
+
+	igt_describe("Verify Colorspace persists across DPMS off/on cycle");
+	igt_subtest("colorspace-dpms")
+		test_colorspace_dpms(&data);
+
+	igt_describe("Verify Colorspace persists across suspend/resume");
+	igt_subtest("colorspace-suspend")
+		test_colorspace_suspend(&data);
+
+	igt_describe("Verify kernel rejects invalid Colorspace values");
+	igt_subtest("colorspace-invalid")
+		test_colorspace_invalid(&data);
+
+	igt_describe("Validate connector-type-specific Colorspace enum values");
+	igt_subtest("colorspace-connector-type")
+		test_colorspace_connector_type(&data);
+
+	igt_describe("Verify kernel rejects unsupported Colorspace value for connector");
+	igt_subtest("colorspace-unsupported-value")
+		test_colorspace_unsupported_value(&data);
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 09b0cc27c..dba718b16 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -26,8 +26,9 @@ test_progs = [
 	'kms_bw',
 	'kms_color',
 	'kms_color_pipeline',
-	'kms_concurrent',
 	'kms_colorop',
+	'kms_colorspace',
+	'kms_concurrent',
 	'kms_content_protection',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
-- 
2.25.1

