Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF07C4829A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8035C10E203;
	Wed, 14 Feb 2024 06:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fnEvw/qj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2940310E606
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893169; x=1739429169;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=drWUlM0EvYkzPaZDM9f8ps3HGaH5ME3UTBP1YXg+mHM=;
 b=fnEvw/qjEAh+hZJ7xKIvmCqpBCej8QiHlAldBLOlFXr3P6PokOeN+fbG
 oKyT9RXB7O63/ZdXjYV7ei9xbG1n7CiRbm+MzVKd69RUBaQZErSLGIDbv
 PLM1GQ3YN7AxPPQP6T++MDvrmWy/leEkhKq5qgjeQ10YmJusdaENyybyL
 vd02CwgjCxXApA88XnEV5eOElGSIhh1KV02u8etenQ/pAkztmYFVvGYaJ
 l9zv61qvt8BSzXEysAb+dxk23KNqFSdILfs661GY2Gg/yMOn7qnJa2Zss
 pqSmXjjlz5pd6MFzTuTALQeFm2MFcEZY9O++ctcH6NdOOZwYlFDcjIBS6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645508"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645508"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427680"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:08 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 19/22] lib/colorops: Add support for Custom 1D LUT
Date: Wed, 14 Feb 2024 12:09:50 +0530
Message-ID: <20240214063953.1285495-20-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
References: <20240214063953.1285495-1-bhanuprakash.modem@intel.com>
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

Add helpers to support custom 1D LUT.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c            |  1 +
 lib/igt_kms.h            |  1 +
 tests/kms_color_helper.c | 96 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h | 28 ++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 41c259608..9dc54d961 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -689,6 +689,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_HW_CAPS] = "HW_CAPS",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index cbdc325a2..51a79d7cb 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -352,6 +352,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_HW_CAPS,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 786f49141..e6aead743 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -24,6 +24,8 @@
 
 #include "kms_color_helper.h"
 
+#define MIN(a, b)	((a) < (b) ? (a) : (b))
+
 bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	bool ret = true;
@@ -399,6 +401,7 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 	case KMS_COLOROP_CTM_3X4:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CTM_3X4);
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_LUT);
 	case KMS_COLOROP_LUT3D:
 	default:
 		return false;
@@ -493,6 +496,8 @@ void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		igt_colorop_set_ctm_3x4(display, colorop->colorop, colorop->matrix_3x4);
 		break;
 	case KMS_COLOROP_CUSTOM_LUT1D:
+		igt_colorop_set_custom_lut_1d(display, colorop->colorop, colorop->custom_lut1d_info);
+		break;
 	case KMS_COLOROP_LUT3D:
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
@@ -528,6 +533,97 @@ void set_color_pipeline(igt_display_t *display,
 	}
 }
 
+void create_zero_lut(segment_data_t *info, struct drm_color_lut_ext *lut)
+{
+	int i;
+
+	for (i = 0; i < info->entries_count; i++)
+		lut[i].red = lut[i].green = lut[i].blue = 0;
+}
+
+void create_unity_lut(segment_data_t *info, struct drm_color_lut_ext *lut)
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
+void create_max_lut(segment_data_t *info, struct drm_color_lut_ext *lut)
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
+void igt_colorop_set_custom_lut_1d(igt_display_t *display,
+				   igt_colorop_t *colorop,
+				   const kms_colorop_custom_lut1d_info_t lut_info)
+{
+	/* set blob property */
+	for (int i = 0; i < lut_info.lut_size; i++)
+		igt_debug("Lut[%d]: 0x%llx 0x%llx 0x%llx\n",
+			 i, lut_info.lut[i].red, lut_info.lut[i].green, lut_info.lut[i].blue);
+
+	igt_colorop_replace_prop_blob(colorop, IGT_COLOROP_DATA,
+			lut_info.lut, sizeof(struct drm_color_lut_ext) * lut_info.lut_size);
+}
+
 void igt_colorop_set_ctm_3x3(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const struct drm_color_ctm *matrix)
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index e172b0318..9cb8cdc4c 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -122,6 +122,18 @@ void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
+typedef struct {
+	uint32_t segment_count;
+	struct drm_color_lut_range *segment_data;
+	uint32_t entries_count;
+} segment_data_t;
+
+void create_zero_lut(segment_data_t *info, struct drm_color_lut_ext *lut);
+void create_unity_lut(segment_data_t *info, struct drm_color_lut_ext *lut);
+void create_max_lut(segment_data_t *info, struct drm_color_lut_ext *lut);
+void clear_segment_data(segment_data_t *info);
+segment_data_t *get_segment_data(int drm_fd, uint64_t blob_id);
+
 /* Colorops Test version definitions */
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
@@ -142,11 +154,24 @@ typedef struct kms_colorop_enumerated_lut1d_info {
 	kms_colorop_lut1d_tf_t tf;
 } kms_colorop_enumerated_lut1d_info_t;
 
+typedef enum kms_colorop_custom_lut1d_tf {
+	KMS_COLOROP_CUSTOM_LUT1D_ZERO,
+	KMS_COLOROP_CUSTOM_LUT1D_LINEAR,
+	KMS_COLOROP_CUSTOM_LUT1D_MAX,
+} kms_colorop_custom_lut1d_tf_t;
+
+typedef struct kms_colorop_custom_lut1d_info {
+	uint32_t lut_size;
+	kms_colorop_custom_lut1d_tf_t lut_type;
+	struct drm_color_lut_ext *lut;
+} kms_colorop_custom_lut1d_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+		kms_colorop_custom_lut1d_info_t custom_lut1d_info;
 		const struct drm_color_ctm *matrix_3x3;
 		const igt_matrix_3x4_t *matrix_3x4;
 	};
@@ -166,6 +191,9 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 void set_colorop(igt_display_t *display, kms_colorop_t *colorop);
 void set_color_pipeline(igt_display_t *display, igt_plane_t *plane,
 			      kms_colorop_t *colorops[], igt_colorop_t *color_pipeline);
+void igt_colorop_set_custom_lut_1d(igt_display_t *display,
+			     igt_colorop_t *colorop,
+			     const kms_colorop_custom_lut1d_info_t custom_lut1d_info);
 void igt_colorop_set_ctm_3x3(igt_display_t *display,
 			     igt_colorop_t *colorop,
 			     const struct drm_color_ctm *matrix);
-- 
2.43.0

