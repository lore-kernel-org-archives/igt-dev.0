Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93F5C55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 11:58:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB2F10EA23;
	Thu,  6 Aug 2026 11:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FyubbV4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D07010EA23
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 11:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786017299; x=1817553299;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cizNgGCG3+Z4UMhigK2g+o5+qCiLVhi1+pkpMxciRZ8=;
 b=FyubbV4sQqhICq9qzQAA7WTZtg5znTNTMUaNIOXNGmF5Q496RmE5bLZ/
 dpydsYcViGlE5sV6jFC9BhRjixiv2qLjaXJ3U9LxhbCuLCF94BtDVem6U
 LD/PMj/5hCRDXKEPJgxpRwO0SflmtEH6EZyXHZlDjbJtwat2pKpin0NOu
 P7BT+3KL9Vxq6iHUp/+0iyOybS3soevBBHL035zMbjZ7jN3CXaJW/kZf3
 52y0oj08qwBpLC4RL2IrXgTto7eYZf68Y0roKS/6zVtl8YrU4JI7rKmJX
 UCGAQrZ7ocqxp5oMjy6P6qRbbdRG5/hYA1VPfCUh4vi+B+G4MVa2eCu/H A==;
X-CSE-ConnectionGUID: YihguvuNRA2N4vxqIwPxAQ==
X-CSE-MsgGUID: 7TQSapTPSLGAcaJvH2zmAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97204782"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="97204782"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 04:54:58 -0700
X-CSE-ConnectionGUID: WLtn16+bRjyUVFyyGbthsw==
X-CSE-MsgGUID: XW4nZIGUTkigzJtQuLhKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="261552848"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:54:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/6] tests/kms_colorop_helper: Add FIXED_MATRIX colorop
 support
Date: Thu,  6 Aug 2026 17:33:42 +0530
Message-Id: <20260806120345.19406-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260806120345.19406-1-swati2.sharma@intel.com>
References: <20260806120345.19406-1-swati2.sharma@intel.com>
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
  - YCbCr 601 Limited to RGB
  - YCbCr 709 Full to RGB
  - YCbCr 709 Limited to RGB
  - YCbCr 2020 NC Full to RGB
  - YCbCr 2020 NC Limited to RGB

Extends can_use_colorop(), set_colorop(), and reset_colorop() to
handle the new FIXED_MATRIX type, and adds the FIXED_MATRIX enum
name table.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)
v3: -Drop YCbCr limited to full and RGB709 to RGB2020 matrices
     until we have non-IGT userspace that shows their use
    -Add Limited to RGB variants matching KMD enums

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 21 +++++++++++++++++++++
 tests/kms_colorop_helper.h | 21 ++++++++++++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..f00f6240c 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,15 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
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
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +227,13 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
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
@@ -362,6 +378,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_FIXED_MATRIX:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_FIXED_MATRIX_TYPE,
+					  kms_colorop_fixed_matrix_names[colorop->fixed_matrix_info.fixed_matrix]);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
@@ -416,6 +436,7 @@ static void reset_colorop(kms_colorop_t *colorop)
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
 		break;
 	case KMS_COLOROP_ENUMERATED_LUT1D:
+	case KMS_COLOROP_FIXED_MATRIX:
 	default:
 		return;
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02d..08470f6b0 100644
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
@@ -50,6 +51,20 @@ typedef struct kms_colorop_lut3d_info {
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
+typedef struct kms_colorop_fixed_matrix_info {
+	kms_colorop_fixed_matrix_t fixed_matrix;
+} kms_colorop_fixed_matrix_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -61,6 +76,8 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_fixed_matrix_info_t fixed_matrix_info;
+
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
@@ -95,6 +112,8 @@ extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
 
+extern const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS];
+
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
 				  kms_colorop_t *colorops[]);
-- 
2.25.1

