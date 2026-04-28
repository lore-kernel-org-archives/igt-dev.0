Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AF2FF885A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Apr 2026 21:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C67210E031;
	Tue, 28 Apr 2026 21:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnUcGdvf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714B110E031
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Apr 2026 21:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777411318; x=1808947318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LoNZv+eMYRR6F3rouKjwWkwHNwN3JtwABEdnrlxzzC8=;
 b=AnUcGdvfOYRN5M0jU8HRYdKPO9Zg1AT8Zx5KkG3HtwusQyBvL/ZwoHzJ
 IMl+fM1o3JxsFjg7zBBYaz+QI7GUVOCzZH+YHoQCKJYpDsQEVlyR08g7Z
 qSkpQF77TEDisnilaiAeDMIn2bMFFqa2LSHvRVpEx54F1sLxfXP8XCY7l
 YoBZ9njcRtSWcYR2kQc6o4vcdX+fKeRyBRpRtj6UA/mrIsOIaqg8vzo7F
 3VpzaTIlTLqxDGt5LTQyM7B2GiXWWpVzOiRKI+rR1X+NcMukaYbHkKP+m
 n5ZHAGvGR4zbY+uSgxG7fUoMLdWYbrlmsQSHDlMTntyq4XdYsuKSuF49+ A==;
X-CSE-ConnectionGUID: iOH9ABLkQnOEIm0NsLQoVg==
X-CSE-MsgGUID: OzCy6XizRUqMyYeJ4b0DwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78526167"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="78526167"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 14:21:58 -0700
X-CSE-ConnectionGUID: SAMzGqu8TH2Xh16s3hRG3w==
X-CSE-MsgGUID: 22IQyKPvThunaTLDEiNRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238400774"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 14:21:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t,
 v4 1/5] lib/igt_hdr: Move HDR helpers from kms_hdr into shared library
Date: Wed, 29 Apr 2026 03:00:36 +0530
Message-Id: <20260428213040.2293921-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260428213040.2293921-1-swati2.sharma@intel.com>
References: <20260428213040.2293921-1-swati2.sharma@intel.com>
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
v3: -add doc comments to public functions (Kamil)
    -keep has_max_bpc, set_invalid_metadata in kms_hdr (Kamil)
    -make igt_hdr_calc_float static (Kamil)
    -remove igt_hdr_disable/enable, deferred to patch 3 (Kamil)
    -fix igt_hdr.c placement in meson.build (Kamil)
    -update copyright year to 2026 (Kamil)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 lib/igt_hdr.c   | 224 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_hdr.h   |  28 +++++
 lib/meson.build |   1 +
 tests/kms_hdr.c | 268 ++++++++----------------------------------------
 4 files changed, 297 insertions(+), 224 deletions(-)
 create mode 100644 lib/igt_hdr.c
 create mode 100644 lib/igt_hdr.h

diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
new file mode 100644
index 000000000..f7df2dfde
--- /dev/null
+++ b/lib/igt_hdr.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
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
+/**
+ * SECTION:igt_hdr
+ * @short_description: HDR metadata helpers
+ * @title: HDR
+ * @include: igt_hdr.h
+ *
+ * This library provides helpers for HDR (High Dynamic Range) metadata
+ * handling, including EDID parsing for HDR capability detection, HDR
+ * output metadata construction, and blob programming utilities.
+ */
+
+/* HDR EDID parsing. */
+#define CTA_EXTENSION_VERSION		0x03
+#define HDR_STATIC_METADATA_BLOCK	0x06
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
+/**
+ * igt_is_panel_hdr:
+ * @fd: DRM file descriptor
+ * @output: output to check
+ *
+ * Parses the EDID of the given output looking for an HDR Static Metadata
+ * Block in the CTA extension. A panel is considered HDR-capable when it
+ * advertises support for Traditional Gamma HDR or SMPTE ST 2084 EOTFs.
+ *
+ * Returns: true if the panel supports HDR, false otherwise.
+ */
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
+	drmModeFreePropertyBlob(edid_blob);
+
+	return ret;
+}
+
+/* Converts a double to 861-G spec FP format. */
+static uint16_t igt_hdr_calc_float(double val)
+{
+	return (uint16_t)(val * 50000.0);
+}
+
+/**
+ * igt_hdr_fill_st2084:
+ * @meta: HDR output metadata structure to fill
+ *
+ * Fills the given metadata structure with test values for SMPTE ST 2084
+ * (PQ) HDR output using Rec. 2020 primaries.
+ *
+ * Note: there isn't really a standard for what the metadata is supposed
+ * to do on the display side of things. The display is free to ignore it
+ * and clip the output, use it to help tonemap to the content range,
+ * or do anything they want, really.
+ */
+void igt_hdr_fill_st2084(struct hdr_output_metadata *meta)
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
+/**
+ * igt_hdr_fill_sdr:
+ * @meta: HDR output metadata structure to fill
+ *
+ * Fills the given metadata structure with test values for SDR output
+ * using Rec. 709 primaries and traditional gamma EOTF.
+ */
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
+/**
+ * igt_hdr_set_metadata:
+ * @output: output to set the metadata on
+ * @meta: HDR output metadata to program, or NULL to disable
+ *
+ * Programs the HDR_OUTPUT_METADATA connector property blob on the
+ * given output. Pass NULL to clear the metadata.
+ */
+void igt_hdr_set_metadata(igt_output_t *output,
+                          const struct hdr_output_metadata *meta)
+{
+	igt_output_replace_prop_blob(output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? sizeof(*meta) : 0);
+}
+
+/**
+ * igt_output_supports_hdr:
+ * @output: output to check
+ *
+ * Returns: true if the output supports the HDR output metadata property.
+ */
+bool igt_output_supports_hdr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+}
diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
new file mode 100644
index 000000000..09243f915
--- /dev/null
+++ b/lib/igt_hdr.h
@@ -0,0 +1,28 @@
+#ifndef IGT_HDR_H
+#define IGT_HDR_H
+
+#include "igt_edid.h"
+#include "igt_kms.h"
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
+void igt_hdr_fill_st2084(struct hdr_output_metadata *meta);
+void igt_hdr_fill_sdr(struct hdr_output_metadata *meta);
+
+void igt_hdr_set_metadata(igt_output_t *output,
+                          const struct hdr_output_metadata *meta);
+
+bool igt_output_supports_hdr(igt_output_t *output);
+
+#endif /* IGT_HDR_H */
diff --git a/lib/meson.build b/lib/meson.build
index 0e7efadf3..a82aa27dc 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -114,6 +114,7 @@ lib_sources = [
 	'igt_amd.c',
 	'igt_edid.c',
 	'igt_eld.c',
+	'igt_hdr.c',
 	'igt_infoframe.c',
 	'igt_color.c',
 	'igt_color_lut.c',
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index b215b0e6c..876c1c03a 100644
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
 /* HDR test formats: 10bpc + FP16 */
 static const uint32_t hdr_test_formats[] = {
 	DRM_FORMAT_XRGB2101010,
@@ -154,59 +139,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
 	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
 }
 
-/* Converts a double to 861-G spec FP format. */
-static uint16_t calc_hdr_float(double val)
-{
-	return (uint16_t)(val * 50000.0);
-}
-
-/* Fills some test values for ST2084 HDR output metadata.
- *
- * Note: there isn't really a standard for what the metadata is supposed
- * to do on the display side of things. The display is free to ignore it
- * and clip the output, use it to help tonemap to the content range,
- * or do anything they want, really.
- */
-static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
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
 static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 {
@@ -375,80 +307,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
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
 /* Sets the HDR output metadata prop with invalid size. */
 static int set_invalid_hdr_output_metadata(data_t *data,
 					   struct hdr_output_metadata const *meta,
@@ -484,7 +342,6 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 }
 
 static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
-			       igt_output_t *output,
 			       uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -500,30 +357,30 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 
 	draw_hdr_pattern(&afb);
 
-	fill_hdr_output_metadata_st2084(&hdr);
+	igt_hdr_fill_st2084(&hdr);
 
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
 	igt_assert_output_bpc_equal(crtc,
-				    output, 8);
+				    data->output, 8);
 
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
@@ -537,7 +394,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	}
 
 	igt_assert_output_bpc_equal(crtc,
-				    output, 10);
+				    data->output, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -545,23 +402,23 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
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
 	igt_assert_output_bpc_equal(crtc,
-				    output, 8);
+				    data->output, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 cleanup:
@@ -569,38 +426,7 @@ cleanup:
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
 static void test_static_swap(data_t *data, igt_crtc_t *crtc,
-			     igt_output_t *output,
 			     uint32_t format, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
@@ -622,26 +448,26 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_enable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_enabled(data->fd, output->name));
+		igt_force_dsc_enable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_enabled(data->fd, data->output->name));
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(crtc,
-				    output, 8);
+				    data->output, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
-		igt_force_dsc_disable(data->fd, output->name);
-		igt_assert(igt_is_force_dsc_disabled(data->fd, output->name));
+		igt_force_dsc_disable(data->fd, data->output->name);
+		igt_assert(igt_is_force_dsc_disabled(data->fd, data->output->name));
 	}
 
 	/* Enter HDR, a modeset is allowed here. */
-	fill_hdr_output_metadata_st2084(&hdr);
-	set_hdr_output_metadata(data, &hdr);
+	igt_hdr_fill_st2084(&hdr);
+	igt_hdr_set_metadata(data->output, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(crtc,
-				    output, 10);
+				    data->output, 10);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
@@ -652,21 +478,21 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
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
@@ -675,30 +501,30 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 
 	/* Exit SDR and enter 8bpc, cleanup. */
-	set_hdr_output_metadata(data, NULL);
+	igt_hdr_set_metadata(data->output, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	igt_assert_output_bpc_equal(crtc,
-				    output, 8);
+				    data->output, 8);
 
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
 
-	fill_hdr_output_metadata_st2084(&hdr);
+	igt_hdr_fill_st2084(&hdr);
 
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
 	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
@@ -708,12 +534,6 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
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
@@ -729,20 +549,20 @@ static void test_hdr(data_t *data, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output) || !has_hdr(output)) {
+		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
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
@@ -772,8 +592,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 					     crtc);
 
 				/* Signal HDR requirement via metadata */
-				fill_hdr_output_metadata_st2084(&hdr);
-				set_hdr_output_metadata(data, &hdr);
+				igt_hdr_fill_st2084(&hdr);
+				igt_hdr_set_metadata(data->output, &hdr);
 				if (igt_display_try_commit2(display, display->is_atomic ?
 							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
 					igt_info("%s: Couldn't set HDR metadata\n",
@@ -796,7 +616,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 				else
 					flags &= ~TEST_NEEDS_DSC;
 
-				set_hdr_output_metadata(data, NULL);
+				igt_hdr_set_metadata(data->output, NULL);
 				igt_display_commit2(display, display->is_atomic ?
 						    COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -811,13 +631,13 @@ static void test_hdr(data_t *data, uint32_t flags)
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
 								   crtc,
-								   output, hdr_test_formats[i], flags);
+								   hdr_test_formats[i], flags);
 					if (flags & TEST_SWAP)
 						test_static_swap(data,
 								 crtc,
-								 output, hdr_test_formats[i], flags);
+								 hdr_test_formats[i], flags);
 					if (flags & TEST_INVALID_METADATA_SIZES)
-						test_invalid_metadata_sizes(data, output);
+						test_invalid_metadata_sizes(data);
 				}
 			}
 
-- 
2.25.1

