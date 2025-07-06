Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85330C83F0A
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF28010E3CE;
	Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fTMu3SjQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682AE10E3CE
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831700; x=1783367700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uk/JgmRgUg6yNoiusBrSoxsI9Z+VDM4+l8Qox87o2QI=;
 b=fTMu3SjQzsKObsT0X+IgjCktIGt5lrnkDWbDqNWOlncG7p2cBI6tOI+r
 LMszkMRSqftKK1sNgvug/LqzI9RI4OB/Qf6/FKJ+zf7ijYOGKcMtF8Kxm
 Zk12aS5DTwoTivAiesXX01dFWhu6n5uBtDQ6GJiax1hMtMn4fejnQX1mh
 OxlUXfaE5a7/1eadghcFaZxn84FIW7MgWS0vWRU9cDDs1cbRRSGuwljIP
 DrlLZUv9kNocC9Rpa4+PE/z1QpNmSrToGkiKMGxduUoicc2YWGQTJ1s/K
 r21q48enYzgg1t1ULJ9ujqC/BInDn27+feJQLi0r3xilitOPZEmIaYi00 g==;
X-CSE-ConnectionGUID: QzGOPivrQQiQYId/lhyvuQ==
X-CSE-MsgGUID: D+6v0VTaS9CL1kyd035NXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983013"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983013"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:55:00 -0700
X-CSE-ConnectionGUID: xa4Kh/SkToWmLX8lXIfklQ==
X-CSE-MsgGUID: RkGKWSedRJmuy5HmB65njg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064781"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:58 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/9] lib/colorops: Add support for 1D LUT multi-segmented
Date: Mon,  7 Jul 2025 01:31:22 +0530
Message-Id: <20250706200125.35741-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
References: <20250706200125.35741-1-swati2.sharma@intel.com>
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

Add helpers to support 1D LUT multi-segmented.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_color_helper.c | 100 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  29 ++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index ded61ccad..c5f2dcc20 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,8 @@
 
 #include "kms_color_helper.h"
 
+#define MIN(a, b)	((a) < (b) ? (a) : (b))
+
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	bool ret = true;
@@ -403,6 +405,10 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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
@@ -514,6 +520,9 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		lut_size = igt_colorop_get_prop(display, colorop->colorop, IGT_COLOROP_SIZE);
 		igt_colorop_set_custom_1dlut(display, colorop->colorop, colorop->lut1d, lut_size * sizeof(struct drm_color_lut));
 		break;
+	case KMS_COLOROP_MULTSEG_LUT1D:
+		igt_colorop_set_multseg_1dlut(display, colorop->colorop, colorop->multseg_lut1d_info);
+		break;
 	case KMS_COLOROP_MULTIPLIER:
 		mult = colorop->multiplier * (mult << 32);	/* convert double to fixed number */
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, mult);
@@ -592,3 +601,94 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 {
 	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA, lut3d, lut_size);
 }
+
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
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 11abe7e46..29efb7e7b 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -122,10 +122,23 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
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
 /* Test version definitions */
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_MULTSEG_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
@@ -140,6 +153,18 @@ typedef struct kms_colorop_lut3d_info {
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
 
@@ -147,6 +172,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		igt_3dlut_t *lut3d;
+		kms_colorop_multseg_lut1d_info_t multseg_lut1d_info;
 		const igt_matrix_3x4_t *matrix_3x4;
 		double multiplier;
 	};
@@ -179,6 +205,9 @@ void igt_colorop_set_3dlut(igt_display_t *display,
 			   igt_colorop_t *colorop,
 			   const igt_3dlut_norm_t *lut3d,
 			   const size_t lut_size);
+void igt_colorop_set_multseg_1dlut(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_multseg_lut1d_info_t custom_lut1d_info);
 
 #define set_color_pipeline_bypass(plane)  igt_plane_set_prop_enum((plane), IGT_PLANE_COLOR_PIPELINE, "Bypass")
 
-- 
2.25.1

