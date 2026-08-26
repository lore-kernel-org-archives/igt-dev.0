Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1F4C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:32:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409610EB88;
	Wed, 26 Aug 2026 18:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Et1YZ007";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5EE10EDA1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769038; x=1819305038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kar340oZQ7CtAXxXBVD22zhkXdgXAk4Rqq1T4sDAtO8=;
 b=Et1YZ0072ZL7x5mjH1G9vEnXOic1SmJuhI5mpVyhpsX/RqvQtSHTQqFz
 cJElBm2CU6dQE1DQ2n+LI85NsMvfhH1y8nS4wwCeR4+uU3J1WLJLtu6mY
 iHfW67EAu/9sEO7skgELKSjKyk54Y2IsQSSul21tiPYPPiLmj8zC8yJ35
 TYibbHlBu02aK4bV3DXdfaRPEIGsFMZ/9bJkodfTyfHq/OKyD6xO2cNLP
 cLQYLVFnd5ZxOtzS52EWa+S6YFfytMhVvS1e+hMilw3ooj5Nsl7GuoSl/
 3S4ulVQA0OmNuAzLF7KXX8HVxXJ0x/uAl/SCza2p0E1alG3t92z8ritOD g==;
X-CSE-ConnectionGUID: GfWiyKqNQuy0eqs6LoIlfw==
X-CSE-MsgGUID: lTZjYVGjQOmTvg1cdfoNJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314774"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314774"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:38 -0700
X-CSE-ConnectionGUID: M0mAY/hERd2WIjnQP5UexQ==
X-CSE-MsgGUID: jTbpe+yWQNqweoBMEoLPqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159676"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:36 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 4/7] tests/kms_colorop_helper: Add Fixed Matrix enum names table
Date: Thu, 27 Aug 2026 00:09:29 +0530
Message-Id: <20260826183932.351933-5-swati2.sharma@intel.com>
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

Add kms_colorop_fixed_matrix_t enum and kms_colorop_fixed_matrix_names[]
lookup table for FIXED_MATRIX type strings, replacing raw string
literals in colorop instances.

This follows the same pattern used by kms_colorop_lut1d_tf_names[] for
1D LUT transfer functions.

Also fixes IGT_COLOROP_FIXED_MATRIX -> IGT_COLOROP_FIXED_MATRIX_TYPE
property name in can_use_colorop() and set_colorop(), and adds missing
encoding/range to bt2020_limited instance.

Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 26 +++++++++++++++++++-------
 tests/kms_colorop_helper.h | 14 +++++++++++++-
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 3243d01d3..6275e3d4f 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -19,6 +19,15 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
 };
 
+const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB] = "YCbCr 601 Full to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB] = "YCbCr 601 Limited to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB] = "YCbCr 709 Full to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB] = "YCbCr 709 Limited to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB] = "YCbCr 2020 NC Full to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB] = "YCbCr 2020 NC Limited to RGB",
+};
+
 kms_colorop_t kms_colorop_srgb_eotf = {
 	.type = KMS_COLOROP_ENUMERATED_LUT1D,
 	.enumerated_lut1d_info = {
@@ -204,7 +213,7 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 709 Limited to RGB",
+		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT709,
 		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
@@ -215,7 +224,7 @@ kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT709,
 		.range = IGT_COLOR_YCBCR_FULL_RANGE,
 	},
@@ -226,7 +235,7 @@ kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
+		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT601,
 		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
@@ -237,7 +246,9 @@ kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
+		.fixed_matrix = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
+		.encoding = IGT_COLOR_YCBCR_BT2020,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
 	.name = "YCbCr BT.2020 Limited Range to RGB",
 	.transform = NULL,
@@ -263,7 +274,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
 	case KMS_COLOROP_FIXED_MATRIX:
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
-		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX, desired->fixed_matrix_info.fixed_matrix_type_name))
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					     kms_colorop_fixed_matrix_names[desired->fixed_matrix_info.fixed_matrix]))
 			return true;
 		return false;
 	default:
@@ -411,8 +423,8 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		configure_3dlut(display, colorop, lut_size);
 		break;
 	case KMS_COLOROP_FIXED_MATRIX:
-		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX,
-					  colorop->fixed_matrix_info.fixed_matrix_type_name);
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix]);
 		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 9a1477666..dd76e1991 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -51,8 +51,20 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_fixed_matrix {
+	KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_FULL_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
+	KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS
+} kms_colorop_fixed_matrix_t;
+
+extern const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS];
+
 typedef struct kms_colorop_fixed_matrix_info {
-	const char *fixed_matrix_type_name;
+	kms_colorop_fixed_matrix_t fixed_matrix;
 	enum igt_color_encoding encoding;
 	enum igt_color_range range;
 } kms_colorop_fixed_matrix_info_t;
-- 
2.25.1

