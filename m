Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A88CE8D65
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC97B10EAD9;
	Fri, 14 Nov 2025 17:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3OwmD0s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353D010EAE8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140970; x=1794676970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD/Ze6V5woRBGLGQI6S8fbLQXfMA7s1BxRvHMFdwYEg=;
 b=m3OwmD0shbMSM/2DFr7qD767oPk81rBmYHaNTOqfsh7qpC44A/xnOrfA
 iBGRxFNozSoUSERDI3NFuPm+trcZCGEqvw/SJfLdZzpG+eiOQ00zQA0F7
 lPk0pivn1W68eqEz20PS3m3FD5t4dWG/7g1lyv6VGfHTOcJqoHvfJZ938
 6G/yMOohi7cibbEcI10ExH3CKwWCcJMkiPmrVQz0ZUDUvXBKwRw2L2uZL
 ifuUp0pmHOLnGVVw2RiV5ZaJvVgZ9qms5ozenRcRZKfHmo+22Zyouj1+c
 6jPisU76CibDlPZFM8HADxE001V1XdwwbirA8lZP+ra4QQtbzdSWU+ktl g==;
X-CSE-ConnectionGUID: k/wqVKMoQyqVmFDOZH5Sew==
X-CSE-MsgGUID: 331r0bBWQmuOKmmmPGVpEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871455"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871455"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:50 -0800
X-CSE-ConnectionGUID: oUApHSmFTc6bFwOEWY21wA==
X-CSE-MsgGUID: 6RjMLge8RpmiTjfdcp0qvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981558"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:48 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 14/23] drm-uapi: Add Color LUT range attributes
Date: Fri, 14 Nov 2025 22:58:59 +0530
Message-Id: <20251114172908.1027816-15-swati2.sharma@intel.com>
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

Introduce drm_color_lut_range struct and related DRM_COLOROP_1D_LUT_MULTSEG_*
flags to describe multi-segment 1D LUT capabilities.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 696b76d3f..1298274d9 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -1105,6 +1105,70 @@ struct hdr_output_metadata {
 				  DRM_MODE_PAGE_FLIP_ASYNC | \
 				  DRM_MODE_PAGE_FLIP_TARGET)
 
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
+ *
+ * linearly interpolate between the points
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE BIT(0)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST
+ *
+ * the last value of the previous range is the
+ * first value of the current range.
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_REUSE_LAST BIT(1)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING
+ *
+ * the curve must be non-decreasing
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING BIT(2)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE
+ *
+ *  the curve is reflected across origin for negative inputs
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE BIT(3)
+
+/**
+ * DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL
+ *
+ * the same curve (red) is used for blue and green channels as well
+ */
+#define DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL BIT(4)
+
+/**
+ * struct drm_color_lut_range
+ *
+ * structure to advertise capability of a color hardware
+ * block that accepts LUT values.  It can represent LUTs with
+ * varied number of entries and distributions
+ * (Multi segmented, Logarithmic etc).
+ */
+
+struct drm_color_lut_range {
+	/* DRM_COLOROP_1D_LUT_MULTSEG_* */
+	__u32 flags;
+	/* number of points on the curve in the segment */
+	__u16 count;
+	/* input start/end values of the segment */
+	__s32 start, end;
+	/* normalization factor. Represents 1.0 in terms of smallest step size */
+	__u32 norm_factor;
+
+	/* precision of HW LUT*/
+	struct {
+		/* Integer precision */
+		__u16 intp;
+		/* Fractional precision */
+		__u16 fracp;
+	} precision;
+};
+
 /*
  * Request a page flip on the specified crtc.
  *
-- 
2.25.1

