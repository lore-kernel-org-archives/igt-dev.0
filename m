Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CC8F8D76E
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 19:19:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241D510E16B;
	Thu, 16 Apr 2026 19:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nGUegUzj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19D410E16B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776367127; x=1807903127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvXJfmcPVoHYDr7G/9yaVWeyal/+PUPEMhjcL6Zljuk=;
 b=nGUegUzjCSrWmHUwdvEXpsX+UjYEkEMnAwfvrvSpz1ar7NBppG1Z40SB
 rBCm03gaeArdwLLNyVlqByGzAud1J4Y/xQdVIdcvt/oV2vcsY9jOR1ahn
 243uob21Gj0Hi/pc+ssefsP0q/mfCa6wuVx+hMVI9bO1kBzEGijhZorSd
 snIEeCNCGXkfy7yd9uYWYUq1XjWY8Mp/mOVh4dSavVBgPQE8PQ3w85Ub6
 TXOdy2d6RfvNtyYXSOXeU5WRbYn2nNrXNykSn7gTSZSlWOojuz0JlyXKQ
 yixoSSrqE/ayRfuTirFUsEjEAdBg6Q2qsdR/mF4Bh1dwoUDkFPoGlw3Gp Q==;
X-CSE-ConnectionGUID: vn1mj/+GQSGaXgHdHs5cSA==
X-CSE-MsgGUID: YeuFrkr4SGWe2P70kndA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="81260626"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81260626"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 12:18:25 -0700
X-CSE-ConnectionGUID: uIi9P7jESmWpjpgwBuJBrQ==
X-CSE-MsgGUID: pxFDtoubTk+hF0hfuD++uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="229818023"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:18:24 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH,
 v2 3/5] tests/kms_colorop_helper: Add FIXED_MATRIX colorop support
Date: Fri, 17 Apr 2026 00:56:58 +0530
Message-Id: <20260416192700.1579042-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260416192700.1579042-1-swati2.sharma@intel.com>
References: <20260416192700.1579042-1-swati2.sharma@intel.com>
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

Add KMS_COLOROP_FIXED_MATRIX type and helpers for configuring
fixed-matrix colorops. The FIXED_MATRIX block selects from predefined
hardware modes via the FIXED_MATRIX_TYPE enum property rather than
programmable coefficients.

Supported FIXED_MATRIX modes:
  - YCbCr 601 Full to RGB
  - YCbCr 709 Full to RGB
  - YCbCr 2020 Full to RGB NC
  - YCbCr limited to full
  - RGB709 to RGB2020

Extends can_use_colorop(), set_colorop(), and reset_colorop() to
handle the new FIXED_MATRIX type, and adds the FIXED_MATRIX enum
name table.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 20 ++++++++++++++++++++
 tests/kms_colorop_helper.h | 20 +++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..ca1cc4b7b 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,14 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB] = "YCbCr 601 Full to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB] = "YCbCr 709 Full to RGB",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR2020_FULL_RGB_NC] = "YCbCr 2020 Full to RGB NC",
+	[KMS_COLOROP_FIXED_MATRIX_YCBCR_LIMITED_FULL] = "YCbCr limited to full",
+	[KMS_COLOROP_FIXED_MATRIX_RGB709_RGB2020] = "RGB709 to RGB2020",
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +226,13 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_FIXED_MATRIX:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_FIXED_MATRIX &&
+		    igt_colorop_has_prop(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE) &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					    kms_colorop_fixed_matrix_names[desired->fixed_matrix_info.fixed_matrix]))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +377,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_FIXED_MATRIX:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix]);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
@@ -416,6 +435,7 @@ static void reset_colorop(kms_colorop_t *colorop)
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
 		break;
 	case KMS_COLOROP_ENUMERATED_LUT1D:
+	case KMS_COLOROP_FIXED_MATRIX:
 	default:
 		return;
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02d..790fd2396 100644
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
@@ -50,6 +51,19 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_fixed_matrix {
+	KMS_COLOROP_FIXED_MATRIX_YCBCR601_FULL_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR709_FULL_RGB,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR2020_FULL_RGB_NC,
+	KMS_COLOROP_FIXED_MATRIX_YCBCR_LIMITED_FULL,
+	KMS_COLOROP_FIXED_MATRIX_RGB709_RGB2020,
+	KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS
+} kms_colorop_fixed_matrix_t;
+
+typedef struct kms_colorop_fixed_matrix_info {
+	kms_colorop_fixed_matrix_t fixed_matrix;
+} kms_colorop_fixed_matrix_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -61,6 +75,8 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
+
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
@@ -95,6 +111,8 @@ extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
 
+extern const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS];
+
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
 				  kms_colorop_t *colorops[]);
-- 
2.25.1

