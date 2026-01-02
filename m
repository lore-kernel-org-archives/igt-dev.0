Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEDDFA3727
	for <igt-dev@archiver.kernel.org>; Fri,  2 Jan 2026 09:46:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAAF10E0E7;
	Fri,  2 Jan 2026 09:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VE5OzThq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091E10E0E7
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jan 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767347193; x=1798883193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dXAv1PcteA/mgESEeKUcNHt6HUtXmHX6Phx4dYyiDyk=;
 b=VE5OzThqtIX8k271bsEspKB9U8vNC/LOb1NdjfYRJUjiBkUcDm9Ajgua
 PCuIECM0cV6fl7SyRZZR1uMPdSxhGkQOqCuCLFzsTrT5c7Kdr5Lx6VWqE
 W7vKCABRJylf+uropBZvnjsbP9+kcw72R2T7SK1msppsT3yRpGW2o0zmW
 VgJU7K93G3lGOYZ/qtAaQeCC1sLxph0Mlcgy3SzRDJGNUVUe9LuLgh3se
 IpPWYsVnpbZP2Q7zhVAWTGOIsttY4WUmzkUGb14HWBTF7zipPR5Ntci5O
 QP1d0ny3M1PxoZE6azglZdhqY2jjrDs8wXUyD59ZfjgouWMNCxdd2zR6t w==;
X-CSE-ConnectionGUID: 1PboL/4kQ9ybMpl+BO3v6Q==
X-CSE-MsgGUID: ImKmrdrsRUuhpE7Vud9IgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94313805"
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="94313805"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 01:46:33 -0800
X-CSE-ConnectionGUID: fLchV1BqSAWJgMVocDCVRg==
X-CSE-MsgGUID: /HwFfsEwTQuKZqEqS/S87g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,196,1763452800"; d="scan'208";a="202746892"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 01:46:31 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [v2 1/4] lib/igt_hdr: Move HDR helpers from kms_hdr into shared
 library
Date: Fri,  2 Jan 2026 15:24:48 +0530
Message-Id: <20260102095451.42401-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260102095451.42401-1-swati2.sharma@intel.com>
References: <20260102095451.42401-1-swati2.sharma@intel.com>
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

Introduce lib/igt_hdr.{c,h} containing metadata fill helpers, EOTF enums,
ST2084 construction, and blob programming utilities. This allows
kms_hdr and upcoming tests (e.g., HDR support in kms_frontbuffer_tracking)
to share common HDR code.

v2: -place igt headers in alphabetical order (Kamil)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_hdr.c   | 201 ++++++++++++++++++++++++++++++++
 lib/igt_hdr.h   |  33 ++++++
 lib/meson.build |   1 +
 tests/kms_hdr.c | 298 ++++++++----------------------------------------
 4 files changed, 285 insertions(+), 248 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
new file mode 100644
index 000000000..85a6b5712
--- /dev/null
+++ b/lib/igt_hdr.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_edid.h"
+#include "igt_hdr.h"
+
+#include <fcntl.h>
+#include <termios.h>
+#include <unistd.h>
+
+/* HDR EDID parsing. */
+#define CTA_EXTENSION_VERSION		0x03
+#define HDR_STATIC_METADATA_BLOCK       0x06
+#define USE_EXTENDED_TAG		0x07
+
+static bool cta_block(const char *edid_ext)
+{
+	/*
+	 * Byte 1: 0x07 indicates Extended Tag
+	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
+	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
+	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
+	 *	             ET_1: Traditional Gamma - HDR Luminance Range
+	 *	             ET_2: SMPTE ST 2084
+	 *	             ET_3: Hybrid Log-Gamma (HLG)
+	 *	             ET_4 to ET_5: Reserved for future use
+	 */
+
+	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
+	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
+	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
+	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
+			return true;
+
+	return false;
+}
+
+/* Returns true if panel supports HDR. */
+bool igt_is_panel_hdr(int fd, igt_output_t *output)
+{
+	bool ok;
+	int i, j, offset;
+	uint64_t edid_blob_id;
+	drmModePropertyBlobRes *edid_blob;
+	const struct edid_ext *edid_ext;
+	const struct edid *edid;
+	const struct edid_cea *edid_cea;
+	const char *cea_data;
+	bool ret = false;
+
+	ok = kmstest_get_property(fd, output->id,
+			DRM_MODE_OBJECT_CONNECTOR, "EDID",
+			NULL, &edid_blob_id, NULL);
+
+	if (!ok || !edid_blob_id)
+		return ret;
+
+	edid_blob = drmModeGetPropertyBlob(fd, edid_blob_id);
+	igt_assert(edid_blob);
+
+	edid = (const struct edid *) edid_blob->data;
+	igt_assert(edid);
+
+	drmModeFreePropertyBlob(edid_blob);
+
+	for (i = 0; i < edid->extensions_len; i++) {
+		edid_ext = &edid->extensions[i];
+		edid_cea = &edid_ext->data.cea;
+
+		/* HDR not defined in CTA Extension Version < 3. */
+		if ((edid_ext->tag != EDID_EXT_CEA) ||
+		    (edid_cea->revision != CTA_EXTENSION_VERSION))
+				continue;
+		else {
+			offset = edid_cea->dtd_start;
+			cea_data = edid_cea->data;
+
+			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
+				ret = cta_block(cea_data + j);
+
+				if (ret)
+					break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+/* Converts a double to 861-G spec FP format. */
+uint16_t igt_hdr_calc_float(double val)
+{
+	return (uint16_t)(val * 50000.0);
+}
+
+/* Fills some test values for ST2048 HDR output metadata.
+ *
+ * Note: there isn't really a standard for what the metadata is supposed
+ * to do on the display side of things. The display is free to ignore it
+ * and clip the output, use it to help tonemap to the content range,
+ * or do anything they want, really.
+ */
+void igt_hdr_fill_st2048(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
+
+	/* Rec. 2020 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		igt_hdr_calc_float(0.708); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		igt_hdr_calc_float(0.292);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		igt_hdr_calc_float(0.170); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		igt_hdr_calc_float(0.797);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		igt_hdr_calc_float(0.131); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		igt_hdr_calc_float(0.046);
+	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance =
+		1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.min_display_mastering_luminance =
+		500;				   /* 0.05 nits */
+	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
+}
+
+/* Fills some test values for HDR metadata targeting SDR. */
+void igt_hdr_fill_sdr(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
+
+	/* Rec. 709 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		igt_hdr_calc_float(0.640); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		igt_hdr_calc_float(0.330);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		igt_hdr_calc_float(0.300); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		igt_hdr_calc_float(0.600);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		igt_hdr_calc_float(0.150); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		igt_hdr_calc_float(0.006);
+	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.max_fall = 0;
+	meta->hdmi_metadata_type1.max_cll = 0;
+}
+
+/* Sets the HDR output metadata prop. */
+void igt_hdr_set_metadata(igt_output_t *output,
+                          const struct hdr_output_metadata *meta)
+{
+	igt_output_replace_prop_blob(output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? sizeof(*meta) : 0);
+}
+
+/* Sets the HDR output metadata prop with invalid size. */
+int igt_hdr_set_invalid_metadata(igt_output_t *output,
+                                 const struct hdr_output_metadata *meta,
+				 size_t len)
+{
+	igt_output_replace_prop_blob(output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? len : 0);
+
+	return igt_display_try_commit_atomic(output->display,
+	                                     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+}
+
+/* Returns true if an output supports max bpc property. */
+bool igt_output_supports_max_bpc(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+}
+
+/* Returns true if an output supports HDR metadata property. */
+bool igt_output_supports_hdr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+}
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
new file mode 100644
index 000000000..e03fca59e
--- /dev/null
+++ b/lib/igt_hdr.h
@@ -0,0 +1,33 @@
+#ifndef IGT_HDR_H
+#define IGT_HDR_H
+
+#include "igt_kms.h"
+#include "igt_edid.h"
+
+enum hdmi_eotf {
+	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
+	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
+	HDMI_EOTF_SMPTE_ST2084,
+};
+
+/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
+enum hdmi_metadata_type {
+	HDMI_STATIC_METADATA_TYPE1 = 0,
+};
+
+bool igt_is_panel_hdr(int fd, igt_output_t *output);
+
+uint16_t igt_hdr_calc_float(double val);
+void igt_hdr_fill_st2048(struct hdr_output_metadata *meta);
+void igt_hdr_fill_sdr(struct hdr_output_metadata *meta);
+
+void igt_hdr_set_metadata(igt_output_t *output,
+                          const struct hdr_output_metadata *meta);
+int igt_hdr_set_invalid_metadata(igt_output_t *output,
+                                 const struct hdr_output_metadata *meta,
+				 size_t len);
+
+bool igt_output_supports_max_bpc(igt_output_t *output);
+bool igt_output_supports_hdr(igt_output_t *output);
+
+#endif /* IGT_HDR_H */
diff --git a/lib/meson.build b/lib/meson.build
index d0487fb3c..92ebb0c31 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -111,6 +111,7 @@ lib_sources = [
 	'igt_vc4.c',
 	'igt_vmwgfx.c',
 	'igt_psr.c',
+	'igt_hdr.c',
 	'igt_amd.c',
 	'igt_edid.c',
 	'igt_eld.c',
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 1df12aeab..c1ea7c8e5 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -33,6 +33,7 @@
 #include <termios.h>
 #include <unistd.h>
 #include "igt_edid.h"
+#include "igt_hdr.h"
 
 /**
  * SUBTEST: bpc-switch
@@ -70,24 +71,8 @@
 
 IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 
-/* HDR EDID parsing. */
-#define CTA_EXTENSION_VERSION		0x03
-#define HDR_STATIC_METADATA_BLOCK       0x06
-#define USE_EXTENDED_TAG		0x07
-
 #define BACKLIGHT_PATH "/sys/class/backlight"
 
-/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
-enum hdmi_metadata_type {
-	HDMI_STATIC_METADATA_TYPE1 = 0,
-};
-
-enum hdmi_eotf {
-	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
-	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
-	HDMI_EOTF_SMPTE_ST2084,
-};
-
 /* Test flags. */
 enum {
 	TEST_NONE = 1 << 0,
@@ -149,59 +134,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
 	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
 }
 
-/* Converts a double to 861-G spec FP format. */
-static uint16_t calc_hdr_float(double val)
-{
-	return (uint16_t)(val * 50000.0);
-}
-
-/* Fills some test values for ST2048 HDR output metadata.
- *
- * Note: there isn't really a standard for what the metadata is supposed
- * to do on the display side of things. The display is free to ignore it
- * and clip the output, use it to help tonemap to the content range,
- * or do anything they want, really.
- */
-static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
-{
-	memset(meta, 0, sizeof(*meta));
-
-	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
-	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
-
-	/* Rec. 2020 */
-	meta->hdmi_metadata_type1.display_primaries[0].x =
-		calc_hdr_float(0.708); /* Red */
-	meta->hdmi_metadata_type1.display_primaries[0].y =
-		calc_hdr_float(0.292);
-	meta->hdmi_metadata_type1.display_primaries[1].x =
-		calc_hdr_float(0.170); /* Green */
-	meta->hdmi_metadata_type1.display_primaries[1].y =
-		calc_hdr_float(0.797);
-	meta->hdmi_metadata_type1.display_primaries[2].x =
-		calc_hdr_float(0.131); /* Blue */
-	meta->hdmi_metadata_type1.display_primaries[2].y =
-		calc_hdr_float(0.046);
-	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
-	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
-
-	meta->hdmi_metadata_type1.max_display_mastering_luminance =
-		1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.min_display_mastering_luminance =
-		500;				   /* 0.05 nits */
-	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
-	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
-}
-
-/* Sets the HDR output metadata prop. */
-static void set_hdr_output_metadata(data_t *data,
-				    struct hdr_output_metadata const *meta)
-{
-	igt_output_replace_prop_blob(data->output,
-				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
-				     meta ? sizeof(*meta) : 0);
-}
-
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
@@ -300,13 +232,6 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->fd, &afb);
 }
 
-/* Returns true if an output supports max bpc property. */
-static bool has_max_bpc(igt_output_t *output)
-{
-	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
-	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
-}
-
 static void test_bpc_switch(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -317,7 +242,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
-		if (!has_max_bpc(output)) {
+		if (!igt_output_supports_max_bpc(output)) {
 			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
 				 igt_output_name(output));
 			continue;
@@ -361,92 +286,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	}
 }
 
-static bool cta_block(const char *edid_ext)
-{
-	/*
-	 * Byte 1: 0x07 indicates Extended Tag
-	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
-	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
-	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
-	 *	             ET_1: Traditional Gamma - HDR Luminance Range
-	 *	             ET_2: SMPTE ST 2084
-	 *	             ET_3: Hybrid Log-Gamma (HLG)
-	 *	             ET_4 to ET_5: Reserved for future use
-	 */
-
-	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
-	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
-	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
-	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
-			return true;
-
-	return false;
-}
-
-/* Returns true if panel supports HDR. */
-static bool is_panel_hdr(data_t *data, igt_output_t *output)
-{
-	bool ok;
-	int i, j, offset;
-	uint64_t edid_blob_id;
-	drmModePropertyBlobRes *edid_blob;
-	const struct edid_ext *edid_ext;
-	const struct edid *edid;
-	const struct edid_cea *edid_cea;
-	const char *cea_data;
-	bool ret = false;
-
-	ok = kmstest_get_property(data->fd, output->id,
-			DRM_MODE_OBJECT_CONNECTOR, "EDID",
-			NULL, &edid_blob_id, NULL);
-
-	if (!ok || !edid_blob_id)
-		return ret;
-
-	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
-	igt_assert(edid_blob);
-
-	edid = (const struct edid *) edid_blob->data;
-	igt_assert(edid);
-
-	drmModeFreePropertyBlob(edid_blob);
-
-	for (i = 0; i < edid->extensions_len; i++) {
-		edid_ext = &edid->extensions[i];
-		edid_cea = &edid_ext->data.cea;
-
-		/* HDR not defined in CTA Extension Version < 3. */
-		if ((edid_ext->tag != EDID_EXT_CEA) ||
-		    (edid_cea->revision != CTA_EXTENSION_VERSION))
-				continue;
-		else {
-			offset = edid_cea->dtd_start;
-			cea_data = edid_cea->data;
-
-			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
-				ret = cta_block(cea_data + j);
-
-				if (ret)
-					break;
-			}
-		}
-	}
-
-	return ret;
-}
-
-/* Sets the HDR output metadata prop with invalid size. */
-static int set_invalid_hdr_output_metadata(data_t *data,
-					   struct hdr_output_metadata const *meta,
-					   size_t length)
-{
-	igt_output_replace_prop_blob(data->output,
-				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
-				     meta ? length : 0);
-
-	return igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-}
-
 static void adjust_brightness(data_t *data, uint32_t flags)
 {
 	igt_backlight_context_t context;
@@ -470,7 +309,6 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 }
 
 static void test_static_toggle(data_t *data, enum pipe pipe,
-			       igt_output_t *output,
 			       uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -486,29 +324,29 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 
 	draw_hdr_pattern(&afb);
 
-	fill_hdr_output_metadata_st2048(&hdr);
+	igt_hdr_fill_st2048(&hdr);
 
 	/* Start with no metadata. */
 	igt_plane_set_fb(data->primary, &afb);
 	igt_plane_set_size(data->primary, data->w, data->h);
-	set_hdr_output_metadata(data, NULL);
+	igt_hdr_set_metadata(data->output, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_enable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+		igt_force_dsc_enable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
-	set_hdr_output_metadata(data, &hdr);
+	igt_hdr_set_metadata(data->output, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	if (flags & TEST_INVALID_HDR) {
@@ -521,7 +359,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 		adjust_brightness(data, flags);
 	}
 
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -529,22 +367,22 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 
 	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
-	set_hdr_output_metadata(data, NULL);
+	igt_hdr_set_metadata(data->output, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_enable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+		igt_force_dsc_enable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 cleanup:
@@ -552,37 +390,7 @@ cleanup:
 	igt_remove_fb(data->fd, &afb);
 }
 
-/* Fills some test values for HDR metadata targeting SDR. */
-static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
-{
-	memset(meta, 0, sizeof(*meta));
-
-	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
-	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
-
-	/* Rec. 709 */
-	meta->hdmi_metadata_type1.display_primaries[0].x =
-		calc_hdr_float(0.640); /* Red */
-	meta->hdmi_metadata_type1.display_primaries[0].y =
-		calc_hdr_float(0.330);
-	meta->hdmi_metadata_type1.display_primaries[1].x =
-		calc_hdr_float(0.300); /* Green */
-	meta->hdmi_metadata_type1.display_primaries[1].y =
-		calc_hdr_float(0.600);
-	meta->hdmi_metadata_type1.display_primaries[2].x =
-		calc_hdr_float(0.150); /* Blue */
-	meta->hdmi_metadata_type1.display_primaries[2].y =
-		calc_hdr_float(0.006);
-	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
-	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
-
-	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
-	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
-	meta->hdmi_metadata_type1.max_fall = 0;
-	meta->hdmi_metadata_type1.max_cll = 0;
-}
-
-static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+static void test_static_swap(data_t *data, enum pipe pipe, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
@@ -603,24 +411,24 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_enable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+		igt_force_dsc_enable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 	/* Enter HDR, a modeset is allowed here. */
-	fill_hdr_output_metadata_st2048(&hdr);
-	set_hdr_output_metadata(data, &hdr);
+	igt_hdr_fill_st2048(&hdr);
+	igt_hdr_set_metadata(data->output, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 10);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
@@ -631,21 +439,21 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	hdr.hdmi_metadata_type1.max_fall = 200;
 	hdr.hdmi_metadata_type1.max_cll = 100;
 
-	set_hdr_output_metadata(data, &hdr);
+	igt_hdr_set_metadata(data->output, &hdr);
 	if (is_amdgpu_device(data->fd))
 		igt_display_commit_atomic(display, 0, NULL);
 	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_enable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+		igt_force_dsc_enable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
 	/* Enter SDR via metadata, no modeset allowed for
 	 * amd driver, whereas a modeset is required for
 	 * intel driver. */
-	fill_hdr_output_metadata_sdr(&hdr);
-	set_hdr_output_metadata(data, &hdr);
+	igt_hdr_fill_sdr(&hdr);
+	igt_hdr_set_metadata(data->output, &hdr);
 	if (is_amdgpu_device(data->fd))
 		igt_display_commit_atomic(display, 0, NULL);
 	else
@@ -654,44 +462,38 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 
 	/* Exit SDR and enter 8bpc, cleanup. */
-	set_hdr_output_metadata(data, NULL);
+	igt_hdr_set_metadata(data->output, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, data->output->name, 8);
 
 	/* Verify that the CRC didn't change while cycling metadata. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
 }
 
-static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
+static void test_invalid_metadata_sizes(data_t *data)
 {
 	struct hdr_output_metadata hdr;
 	size_t metadata_size = sizeof(hdr);
 
-	fill_hdr_output_metadata_st2048(&hdr);
+	igt_hdr_fill_st2048(&hdr);
 
-	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
-	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
-	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size - 1), -EINVAL);
-	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size * 2), -EINVAL);
+	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, 1), -EINVAL);
+	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size + 1), -EINVAL);
+	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size - 1), -EINVAL);
+	igt_assert_eq(igt_hdr_set_invalid_metadata(data->output, &hdr, metadata_size * 2), -EINVAL);
 
 	test_fini(data);
 }
 
-/* Returns true if an output supports HDR metadata property. */
-static bool has_hdr(igt_output_t *output)
-{
-	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
-}
-
 static void test_hdr(data_t *data, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -707,20 +509,20 @@ static void test_hdr(data_t *data, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output) || !has_hdr(output)) {
+		if (!igt_output_supports_max_bpc(output) || !igt_output_supports_hdr(output)) {
 			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
 				 igt_output_name(output));
 			continue;
 		}
 
 		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
+		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
 			igt_info("%s: Can't run negative test on HDR panel.\n",
 				 igt_output_name(output));
 			continue;
 		}
 
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
+		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
 			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
 				 igt_output_name(output));
 			continue;
@@ -748,8 +550,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 			prepare_test(data, output, pipe);
 
 			/* Signal HDR requirement via metadata */
-			fill_hdr_output_metadata_st2048(&hdr);
-			set_hdr_output_metadata(data, &hdr);
+			igt_hdr_fill_st2048(&hdr);
+			igt_hdr_set_metadata(data->output, &hdr);
 			if (igt_display_try_commit2(display, display->is_atomic ?
 						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
 				igt_info("%s: Couldn't set HDR metadata\n",
@@ -772,7 +574,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			else
 				flags &= ~TEST_NEEDS_DSC;
 
-			set_hdr_output_metadata(data, NULL);
+			igt_hdr_set_metadata(data->output, NULL);
 			igt_display_commit2(display, display->is_atomic ?
 					    COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -784,11 +586,11 @@ static void test_hdr(data_t *data, uint32_t flags)
 				      kmstest_pipe_name(pipe), output->name) {
 				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
-					test_static_toggle(data, pipe, output, flags);
+					test_static_toggle(data, pipe, flags);
 				if (flags & TEST_SWAP)
-					test_static_swap(data, pipe, output, flags);
+					test_static_swap(data, pipe, flags);
 				if (flags & TEST_INVALID_METADATA_SIZES)
-					test_invalid_metadata_sizes(data, output);
+					test_invalid_metadata_sizes(data);
 			}
 
 			/* One pipe is enough */
-- 
2.25.1

