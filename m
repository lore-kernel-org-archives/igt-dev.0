Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915810D14A2
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:42:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563910E67A;
	Mon, 30 Mar 2026 11:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhSxt98y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F4610E660
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870956; x=1806406956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nd+wr6O9+BmkfcVb7wmbiRTrRYBXdTu99LmzpcsOfOw=;
 b=EhSxt98y9Ph6ik65PSLTkr0gfostzaYdX2bcBlZgcMF3aNxLH+PrFy7W
 ZDi6t4GloFubP39m0psuR89ULMvuzkDWowoCCoJp79vEG1unMaCDwVeqo
 YJin93CT/nTmwo3xFU/luGMvzPmlnD6KoipGif5AxMyksrKQ6Qjlo7VNR
 +m569bcWoGVh9gam2TrZT1ElpKRLcEQKZDXQZdt01FtOt8yFoxHCtm8hZ
 nB5V67fuRXpTAGTeVRzSI0VSCKHStj8Suy5yO0apynQ70l4TCd5EHFvjM
 M2gfymA9PMYluFBXmPsziCovxQCLVVKk8Y4U0fG9eKSCXQJt90HhptUR6 w==;
X-CSE-ConnectionGUID: Fz4yd9jlTJucs1m4851RLg==
X-CSE-MsgGUID: SP/IEIcBSASwIrZo09l7ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572009"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:36 -0700
X-CSE-ConnectionGUID: +1WvaKlNRWWNXB7KrAiRbQ==
X-CSE-MsgGUID: d0seAwvGSBagudxl+0duqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080366"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:36 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 3/5] tests/kms_colorop_helper: Add CSC_FF colorop
 support
Date: Mon, 30 Mar 2026 17:20:55 +0530
Message-Id: <20260330115057.963395-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260330115057.963395-1-swati2.sharma@intel.com>
References: <20260330115057.963395-1-swati2.sharma@intel.com>
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

Add KMS_COLOROP_CSC_FF type and helpers for configuring fixed-function
CSC colorops. The CSC_FF block selects from predefined hardware modes
via the CSC_FF_TYPE enum property rather than programmable coefficients.

Supported CSC_FF modes:
  - YUV601 to RGB601
  - YUV709 to RGB709
  - YUV2020 to RGB2020
  - RGB709 to RGB2020

Extends can_use_colorop(), set_colorop(), and reset_colorop() to
handle the new CSC_FF type, and adds the CSC_FF enum name table.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_colorop_helper.c | 19 +++++++++++++++++++
 tests/kms_colorop_helper.h | 19 ++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index aaee4e567..5424645ef 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -200,6 +200,13 @@ kms_colorop_t kms_colorop_3dlut_17_12_rgb = {
 	.transform = &igt_color_3dlut_17_12_rgb,
 };
 
+const char * const kms_colorop_csc_ff_names[KMS_COLOROP_CSC_FF_NUM_ENUMS] = {
+	[KMS_COLOROP_CSC_FF_YUV601_RGB601] = "YUV601 to RGB601",
+	[KMS_COLOROP_CSC_FF_YUV709_RGB709] = "YUV709 to RGB709",
+	[KMS_COLOROP_CSC_FF_YUV2020_RGB2020] = "YUV2020 to RGB2020",
+	[KMS_COLOROP_CSC_FF_RGB709_RGB2020] = "RGB709 to RGB2020",
+};
+
 static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
 {
 	switch (desired->type) {
@@ -218,6 +225,13 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_MULTIPLIER);
 	case KMS_COLOROP_LUT3D:
 		return (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_3D_LUT);
+	case KMS_COLOROP_CSC_FF:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_CSC_FF &&
+		    igt_colorop_has_prop(colorop, IGT_COLOROP_CSC_FF_TYPE) &&
+		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CSC_FF_TYPE,
+					    kms_colorop_csc_ff_names[desired->csc_ff_info.csc_ff]))
+			return true;
+		return false;
 	default:
 		return false;
 	}
@@ -362,6 +376,10 @@ static void set_colorop(igt_display_t *display, kms_colorop_t *colorop)
 
 		configure_3dlut(display, colorop, lut_size);
 		break;
+	case KMS_COLOROP_CSC_FF:
+		igt_colorop_set_prop_enum(colorop->colorop, IGT_COLOROP_CSC_FF_TYPE,
+					  kms_colorop_csc_ff_names[colorop->csc_ff_info.csc_ff]);
+		break;
 	default:
 		igt_fail(IGT_EXIT_FAILURE);
 	}
@@ -416,6 +434,7 @@ static void reset_colorop(kms_colorop_t *colorop)
 		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
 		break;
 	case KMS_COLOROP_ENUMERATED_LUT1D:
+	case KMS_COLOROP_CSC_FF:
 	default:
 		return;
 	}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index a081fa02d..92e598ba6 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -22,7 +22,8 @@ typedef enum kms_colorop_type {
 	KMS_COLOROP_CUSTOM_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
-	KMS_COLOROP_LUT3D
+	KMS_COLOROP_LUT3D,
+	KMS_COLOROP_CSC_FF,
 } kms_colorop_type_t;
 
 typedef enum kms_colorop_lut1d_tf {
@@ -50,6 +51,18 @@ typedef struct kms_colorop_lut3d_info {
 	enum drm_colorop_lut3d_interpolation_type interpolation;
 } kms_colorop_lut3d_info_t;
 
+typedef enum kms_colorop_csc_ff {
+	KMS_COLOROP_CSC_FF_YUV601_RGB601,
+	KMS_COLOROP_CSC_FF_YUV709_RGB709,
+	KMS_COLOROP_CSC_FF_YUV2020_RGB2020,
+	KMS_COLOROP_CSC_FF_RGB709_RGB2020,
+	KMS_COLOROP_CSC_FF_NUM_ENUMS
+} kms_colorop_csc_ff_t;
+
+typedef struct kms_colorop_csc_ff_info {
+	kms_colorop_csc_ff_t csc_ff;
+} kms_colorop_csc_ff_info_t;
+
 typedef struct kms_colorop {
 	kms_colorop_type_t type;
 
@@ -61,6 +74,8 @@ typedef struct kms_colorop {
 		double multiplier;
 	};
 
+	kms_colorop_csc_ff_info_t csc_ff_info;
+
 	kms_colorop_lut3d_info_t lut3d_info;
 
 	const char *name;
@@ -95,6 +110,8 @@ extern kms_colorop_t kms_colorop_multiply_125;
 extern kms_colorop_t kms_colorop_multiply_inv_125;
 extern kms_colorop_t kms_colorop_3dlut_17_12_rgb;
 
+extern const char * const kms_colorop_csc_ff_names[KMS_COLOROP_CSC_FF_NUM_ENUMS];
+
 igt_colorop_t *get_color_pipeline(igt_display_t *display,
 			          igt_plane_t *plane,
 				  kms_colorop_t *colorops[]);
-- 
2.25.1

