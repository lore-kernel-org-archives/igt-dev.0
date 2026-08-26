Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA2FC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4028210EB88;
	Wed, 26 Aug 2026 18:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCn5YTad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DD210EDB4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769036; x=1819305036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q+gF/FvBCm35j1TNbBUsez0WWP7iZoW6IZm5iGvVh+E=;
 b=BCn5YTadGmDD6pzDW+mBwrJLNI5tkzhF8IHpav3JC5uRM388TCh3NZEi
 c1QxSAVQtN4utIL9VhCTeK/1LQ3q8yrga6BevF/dvs1mY8hBv8L8N7PSa
 uDdSrAoKsjvdbBn3NYG1j11zRRcgLBxTr/SEr4QDeQKqdv8OMS5jzHxQh
 9lycXdWJ6OwM7RskBI2DxnODK4khkp3Q8N3e0jxDee8WhERYKLJX/escX
 OlfwxBSI4ywUqaWUCuS6Gac580vgjGvXq0+9B7hNENJ1nXb1G2T873CRn
 gkY6G2Va74EhgNU6mObOvg2nn3+WWMsUa6OoQAKMRwBsdpsKPqrXT/bJs w==;
X-CSE-ConnectionGUID: /Ldm6QK4R8m6vLyQN9iRVw==
X-CSE-MsgGUID: 1tRZFjRzS5uNm9meM8+chA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314771"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314771"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:36 -0700
X-CSE-ConnectionGUID: cUGICy/2S26rngkP+kucLw==
X-CSE-MsgGUID: HQvJ+JzCQuKlXKaFsbwaDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159670"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Harry Wentland <harry.wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t,
 v4 3/7] tests/kms_colorop_helper: Add Fixed Matrix colorop
 infrastructure
Date: Thu, 27 Aug 2026 00:09:28 +0530
Message-Id: <20260826183932.351933-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826183932.351933-1-swati2.sharma@intel.com>
References: <20260826183932.351933-1-swati2.sharma@intel.com>
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

From: Harry Wentland <harry.wentland@amd.com>

Add support for Fixed Matrix colorops:
- Add KMS_COLOROP_FIXED_MATRIX type to the test colorop type enum
- Add kms_colorop_fixed_matrix_info_t struct carrying the DRM enum string
  name plus encoding/range for software reference transforms
- Add can_use_colorop() handling: matches DRM_COLOROP_FIXED_MATRIX type and
  verifies the specific FIXED_MATRIX enum value is supported
- Add set_colorop() handling: sets FIXED_MATRIX via single enum property
- Define four FIXED_MATRIX colorop instances: BT.709 limited/full, BT.601
  limited, and BT.2020 limited

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop_helper.c | 52 ++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h | 14 +++++++++-
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..3243d01d3 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -4,6 +4,7 @@
  */
 
 #include "kms_colorop_helper.h"
+#include "igt_color_encoding.h"
 
 const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_SRGB_EOTF] = "sRGB EOTF",
@@ -200,6 +201,48 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "YCbCr BT.709 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT709,
+		.range = IGT_COLOR_YCBCR_FULL_RANGE,
+	},
+	.name = "YCbCr BT.709 Full Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
+		.encoding = IGT_COLOR_YCBCR_BT601,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
+	},
+	.name = "YCbCr BT.601 Limited Range to RGB",
+	.transform = NULL,
+};
+
+kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
+	.type = KMS_COLOROP_FIXED_MATRIX,
+	.fixed_matrix_info = {
+		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
+	},
+	.name = "YCbCr BT.2020 Limited Range to RGB",
+	.transform = NULL,
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +261,11 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_FIXED_MATRIX:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +410,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_FIXED_MATRIX:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
+					  colorop->fixed_matrix_info.fixed_matrix_type_name);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02d..9a1477666 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_FIXED_MATRIX,
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,8 +51,15 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef struct kms_colorop_fixed_matrix_info {
+	const char *fixed_matrix_type_name;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+} kms_colorop_fixed_matrix_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
+	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
 
 	union {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
@@ -94,6 +102,10 @@ extern kms_colorop_t kms_colorop_ctm_3x4_bt709_dec;
 extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
+extern kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb;
+extern kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb;
 
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
-- 
2.25.1

