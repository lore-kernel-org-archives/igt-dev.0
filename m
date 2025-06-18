Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF17C7115D
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833C810E817;
	Wed, 18 Jun 2025 12:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWkiAy1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3E10E827
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250619; x=1781786619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Izm4e3EtgJPeMamBmaD4/v57LaLejXVE0fSVVe4wRKc=;
 b=GWkiAy1bA4WKZGEfVkZPWucPIrZCRRhI3pOnxmWYwNY71WbCedf4P0mh
 y6tPJhUG5BvlCj1Yf8btFBFbsSUjOzioLVw4gGEYkK7WbDt5QBIJiM0MK
 BcHffw74+l2OwchJUwoJLG/zZl7HwXlel/GqA5M59Q8Ofnn3GE+ai1fRn
 mj1MFnqTRxJL5TShl+UEPn5yymOzmGhn7fgmo5nTdthQttcKIbphj33Qu
 uzIc4HTFGXGi1W4SJNghRKmrCltO5SIhaDtTXAdfLwpNvAcOiCRnNDhZT
 GK7Ecan/tsxPYSNNWyS4h70qV3bVY5lHNvbwDmaw7wFKrncj9MhcBzzsg g==;
X-CSE-ConnectionGUID: uvBGfG2JTLSuKeg39Zpswg==
X-CSE-MsgGUID: dQ/epgKwTgKry+bLXSYHcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690552"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690552"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:36 -0700
X-CSE-ConnectionGUID: 0W7QvCVGT3GchrN5cxGNdw==
X-CSE-MsgGUID: hSdSc07VS+mo34+8DV+fwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150266171"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:29 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 7/9] lib/colorops: Add support for Custom 1D LUT
Date: Wed, 18 Jun 2025 18:18:47 +0530
Message-Id: <20250618124849.1587767-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618124849.1587767-1-swati2.sharma@intel.com>
References: <20250618124849.1587767-1-swati2.sharma@intel.com>
MIME-Version: 1.0
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add helpers to support custom 1D LUT.

v2:
 - Rebase
v3:
 - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c            |   1 +
 lib/igt_kms.h            |   1 +
 tests/kms_color_helper.c | 100 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  31 +++++++++++-
 4 files changed, 132 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c99bba74b..daba319ed 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
+	[IGT_COLOROP_HW_CAPS] = "HW_CAPS",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_COLOR_DEPTH] = "COLOR_DEPTH",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0d0592106..d63099a65 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
+	IGT_COLOROP_HW_CAPS,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_COLOR_DEPTH,
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 5ca663d3d..374362b98 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,8 @@
 
 #include "kms_color_helper.h"
 
+#define MIN(a, b)	((a) < (b) ? (a) : (b))
+
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	bool ret = true;
@@ -405,6 +407,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT)
 			return true;
 		return false;
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT_MULTSEG)
+			return true;
+		return false;
 	case KMS_COLOROP_MULTIPLIER:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
@@ -519,6 +525,9 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
 		break;
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		igt_colorop_set_multseg_1dlut(display, colorop->colorop, colorop->multseg_lut1d_info);
+		break;
 	case KMS_COLOROP_MULTIPLIER:
 		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
@@ -558,6 +567,97 @@ void set_color_pipeline(igt_display_t *display,
 	}
 }
 
+void create_zero_lut(segment_data_t *info, struct drm_color_lut_32 *lut)
+{
+	int i;
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = 0;
+}
+
+void create_unity_lut(segment_data_t *info, struct drm_color_lut_32 *lut)
+{
+	uint32_t val, segment, entry, index = 0;
+	uint32_t max_val = 0xffffffff;
+
+	for (segment = 0; segment < info->segment_count; segment++) {
+		uint32_t entry_count = info->segment_data[segment].count;
+		uint32_t start = info->segment_data[segment].start;
+		uint32_t end = info->segment_data[segment].end;
+
+		for (entry = 1; entry <= entry_count; entry++) {
+			val = start + entry * ((end - start) * 1.0 / entry_count);
+			lut[index].red = lut[index].green = lut[index].blue =
+				(index == 0) ? 0 : MIN(val, max_val);
+
+			index++;
+		}
+	}
+}
+
+void create_max_lut(segment_data_t *info, struct drm_color_lut_32 *lut)
+{
+	int i;
+	uint32_t max_val = 0xffffffff;
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = (i == 0) ? 0 : max_val;
+}
+
+void clear_segment_data(segment_data_t *info)
+{
+	if (!info)
+		return;
+
+	free(info->segment_data);
+	free(info);
+}
+
+segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id)
+{
+	drmModePropertyBlobPtr blob;
+	struct drm_color_lut_range *lut_range = NULL;
+	segment_data_t *info = NULL;
+	uint32_t i;
+
+	blob = drmModeGetPropertyBlob(drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	info = malloc(sizeof(segment_data_t));
+	igt_assert(info);
+
+	lut_range = (struct drm_color_lut_range *) blob->data;
+	info->segment_count = blob->length / sizeof(lut_range[0]);
+	igt_assert(info->segment_count);
+
+	info->segment_data = malloc(sizeof(struct drm_color_lut_range) * info->segment_count);
+	igt_assert(info->segment_data);
+
+	info->entries_count = 0;
+	for (i = 0; i < info->segment_count; i++) {
+		info->entries_count += lut_range[i].count;
+		info->segment_data[i] = lut_range[i];
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+	return info;
+}
+
+void igt_colorop_set_multseg_1dlut(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_multseg_lut1d_info_t lut_info)
+{
+	/* set blob property */
+	for (int i = 0; i < lut_info.lut_size; i++)
+		igt_debug("Lut[%d]: 0x%08x 0x%08x 0x%08x\n",
+			 i, lut_info.lut[i].red, lut_info.lut[i].green, lut_info.lut[i].blue);
+
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA,
+			lut_info.lut, sizeof(struct drm_color_lut_32) * lut_info.lut_size);
+}
+
 void igt_colorop_set_ctm_3x3(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const struct drm_color_ctm *matrix)
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index fbfe58eb1..95a557fea 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -122,10 +122,23 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
-/* Test version definitions */
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+void create_zero_lut(segment_data_t *info, struct drm_color_lut_32 *lut);
+void create_unity_lut(segment_data_t *info, struct drm_color_lut_32 *lut);
+void create_max_lut(segment_data_t *info, struct drm_color_lut_32 *lut);
+void clear_segment_data(segment_data_t *info);
+segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id);
+
+/* Colorops Test version definitions */
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_MULTSEG_LUT1D,
 	KMS_COLOROP_CTM_3X3,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
@@ -141,6 +154,18 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_multseg_lut1d_tf {
+       KMS_COLOROP_MULTSEG_LUT1D_ZERO,
+       KMS_COLOROP_MULTSEG_LUT1D_LINEAR,
+       KMS_COLOROP_MULTSEG_LUT1D_MAX,
+} kms_colorop_multseg_lut1d_tf_t;
+
+typedef struct kms_colorop_multseg_lut1d_info {
+	uint32_t lut_size;
+	kms_colorop_multseg_lut1d_tf_t lut_type;
+	struct drm_color_lut_32 *lut;
+} kms_colorop_multseg_lut1d_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -148,6 +173,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		igt_3dlut_t *lut3d;
+		kms_colorop_multseg_lut1d_info_t multseg_lut1d_info;
 		const struct drm_color_ctm *matrix_3x3;
 		const igt_matrix_3x4_t *matrix_3x4;
 		double multiplier;
@@ -184,6 +210,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 			   igt_colorop_t *colorop,
 			   const igt_3dlut_norm_t *lut3d,
 			   const size_t lut_size);
+void igt_colorop_set_multseg_1dlut(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_multseg_lut1d_info_t custom_lut1d_info);
 
 #define set_color_pipeline_bypass(plane)  igt_plane_set_prop_enum((plane), IGT_PLANE_COLOR_PIPELINE, "Bypass")
 
-- 
2.25.1

