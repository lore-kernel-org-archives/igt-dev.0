Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6F9CE8D66
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA810EAE9;
	Fri, 14 Nov 2025 17:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XtdV9TxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E7010EAE6
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140975; x=1794676975;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFChT3dEBTHHPz1YUeAs8Isup6nxJVI8QoWKaTgXsAY=;
 b=XtdV9TxTOV5fIY9z18kk4Cz+Aa/wBQKeQDbsxO8kL48zMe4VPIqTG3j2
 kDb2rvb8ghVeGxCxeDi63OBtOXP7M1rFY0kJVGONUbG00taBRslDoMadW
 xmg47LQZGQWYVzLmMZyIXmAbyIBh4BqfMIaEueTjgzvqlLQ3llZrXOzjk
 rXEyYSnDB4A+F7xV9nFQe4uYhlD/SnMIL+Jfati7+oMxLhTqvW1p/nVK7
 VX2dDgIs8omN0Ew0KIqUWf2BXovlzC3VYCHQLhwEod6vVcSxuzXcZJjQE
 bbXQbS5Xi/qy44EtUyJD5hIaVuKAbcdQorPfbKgCeZ32Sxi2kPQCobs6c A==;
X-CSE-ConnectionGUID: Eul4a4Q7Rim3Iw1oo9/olg==
X-CSE-MsgGUID: cp/DFEM6QqKDlnA2OlIlbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871458"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871458"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:55 -0800
X-CSE-ConnectionGUID: YaB/8iH+Q0K7T3DB8aq/+w==
X-CSE-MsgGUID: R5v8IiC/T1CiHg+KkQSgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981612"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:54 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 17/23] lib/color: Add multisegment 1D LUT type and info structures
Date: Fri, 14 Nov 2025 22:59:02 +0530
Message-Id: <20251114172908.1027816-18-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114172908.1027816-1-swati2.sharma@intel.com>
References: <20251114172908.1027816-1-swati2.sharma@intel.com>
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

Introduce kms_colorop_multseg_lut1d_type and kms_colorop_multseg_lut1d_info_t
to represent multisegment 1D LUT types and their associated metadata.
These will be used for upcoming multisegment LUT colorop support.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_color.h          | 12 ++++++++++++
 tests/kms_color_helper.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.h b/lib/igt_color.h
index c88b9838c..42267ac1f 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -63,6 +63,18 @@ typedef struct igt_1dlut {
 	struct drm_color_lut32 lut[MAX_COLOR_LUT_ENTRIES];
 } igt_1dlut_t;
 
+typedef enum kms_colorop_multseg_lut1d_type {
+       KMS_COLOROP_MULTSEG_LUT1D_ZERO,
+       KMS_COLOROP_MULTSEG_LUT1D_LINEAR,
+       KMS_COLOROP_MULTSEG_LUT1D_MAX,
+} kms_colorop_multseg_lut1d_type_t;
+
+typedef struct kms_colorop_multseg_lut1d_info {
+	uint32_t lut_size;
+	kms_colorop_multseg_lut1d_type_t lut_type;
+	struct drm_color_lut32 *lut;
+} kms_colorop_multseg_lut1d_info_t;
+
 typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
 typedef int (*transform_fb)(igt_fb_t *in);
 typedef int (*transform_pixel)(igt_pixel_t *pixel);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 926d4e815..54d19513a 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -129,6 +129,7 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 typedef enum kms_colorop_type {
 	KMS_COLOROP_ENUMERATED_LUT1D,
 	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_MULTSEG_LUT1D,
 	KMS_COLOROP_CTM_3X4,
 	KMS_COLOROP_MULTIPLIER,
 	KMS_COLOROP_LUT3D
@@ -156,6 +157,7 @@ typedef struct kms_colorop {
 		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
 		igt_1dlut_t *lut1d;
 		const igt_3dlut_t *lut3d;
+		kms_colorop_multseg_lut1d_info_t multseg_lut1d_info;
 		const igt_matrix_3x4_t *matrix_3x4;
 		double multiplier;
 	};
-- 
2.25.1

