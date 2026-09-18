Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE68C982D2
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 08:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C505210E86B;
	Fri, 18 Sep 2026 08:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c8VC4foy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A9210E95F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789719890; x=1821255890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIXcY7eYiwTlPYbUT1xeQ1pwifsrKsgJgdKXGoYykvs=;
 b=c8VC4foy1qW+gvsdu3+TboiJ6rvikXkm8XShEW2cSi6YnqsI5eeG+Sda
 zciY2JCh0T9AkCmVBBg/QYoGLhg8uXsuSh4i5NmXel9ltLAEQVr593FW+
 Gkb2MomaFwxfRHDAZ9qqlSeL1nXu1aIXqmLZYmxs0/oKbl6CYZ+Vx7F2b
 mZK+ylaRzK2JDerE3v53wFy+zsNRrEiL2EuNzQuGTZsxtYdRYDgwvGDRo
 47i4tz4mHmwlNh+AfzEV/UqE8EGogaVFKh99GGhb1nG4oaLzTcOFFQGFj
 025J59/S8EOoE4geHnvZNuUxFY/5Jg7lyems2cD96AhnRX+9VXJLStr9b Q==;
X-CSE-ConnectionGUID: bC0PdX/8Sa2zyx9EouNPbg==
X-CSE-MsgGUID: 2SMLJRkyQOeg8pRsHRnn8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100870708"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100870708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 01:24:50 -0700
X-CSE-ConnectionGUID: FmRvbXZaS72JoYasfCozAQ==
X-CSE-MsgGUID: bQNCOWrPSXqOUrc28rrITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270965426"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 01:24:48 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH i-g-t,
 v6 3/6] tests/kms_colorop_helper: Add Fixed Matrix enum names table
Date: Fri, 18 Sep 2026 14:03:47 +0530
Message-Id: <20260918083350.1021184-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260918083350.1021184-1-swati2.sharma@intel.com>
References: <20260918083350.1021184-1-swati2.sharma@intel.com>
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

Also, adds missing encoding/range to bt2020_limited instance and
fixes the enum string.

v2: s/fixed_matrix/fixed_matrix_type/ (Chaitanya)

Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Assisted-by: GitHub Copilot:Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_colorop_helper.c | 24 ++++++++++++++++++------
 tests/kms_colorop_helper.h | 14 +++++++++++++-
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index f58f629f5..5c0baeb12 100644
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
+		.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR709_LIMITED_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT709,
 		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
@@ -215,7 +224,7 @@ kms_colorop_t kms_colorop_bt709_limited_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 709 Full to RGB",
+		.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT709,
 		.range = IGT_COLOR_YCBCR_FULL_RANGE,
 	},
@@ -226,7 +235,7 @@ kms_colorop_t kms_colorop_bt709_full_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 601 Limited to RGB",
+		.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR601_LIMITED_RGB,
 		.encoding = IGT_COLOR_YCBCR_BT601,
 		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
@@ -237,7 +246,9 @@ kms_colorop_t kms_colorop_bt601_limited_ycbcr_to_rgb = {
 kms_colorop_t kms_colorop_bt2020_limited_ycbcr_to_rgb = {
 	.type = KMS_COLOROP_FIXED_MATRIX,
 	.fixed_matrix_info = {
-		.fixed_matrix_type_name = "YCbCr 2020 Limited to RGB NC",
+		.fixed_matrix_type = KMS_COLOROP_FIXED_MATRIX_YCBCR2020_NC_LIMITED_RGB,
+		.encoding = IGT_COLOR_YCBCR_BT2020,
+		.range = IGT_COLOR_YCBCR_LIMITED_RANGE,
 	},
 	.name = "YCbCr BT.2020 Limited Range to RGB",
 	.transform = NULL,
@@ -263,7 +274,8 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
 	case KMS_COLOROP_FIXED_MATRIX:
 		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
-		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE, desired->fixed_matrix_info.fixed_matrix_type_name))
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					      kms_colorop_fixed_matrix_names[desired->fixed_matrix_info.fixed_matrix_type]))
 			return true;
 		return false;
 	default:
@@ -412,7 +424,7 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 		break;
 	case KMS_COLOROP_FIXED_MATRIX:
 		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
-					  colorop->fixed_matrix_info.fixed_matrix_type_name);
+					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix_type]);
 		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 9a1477666..ea70d2e80 100644
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
+	kms_colorop_fixed_matrix_t fixed_matrix_type;
 	enum igt_color_encoding encoding;
 	enum igt_color_range range;
 } kms_colorop_fixed_matrix_info_t;
-- 
2.25.1

