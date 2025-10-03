Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94900CCD182
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 12:19:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C96110E8EA;
	Fri,  3 Oct 2025 12:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aV09aR09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A4C10E3BF
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 12:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759493950; x=1791029950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ZH0l6XZdFRiTooR/R6Ux1so5ZOWwT1YnhBkH0xJQ/Q=;
 b=aV09aR09tG+i0dDUJhwIuxjNp599mpuDM3rriYSrvcp2YJRtloOYkuQZ
 Kj9tE/NIYbiL0mkOT199FrlFxgeQmShajwkt3h/RW+Wyz9lwbQJSoCB77
 UGmNNsQxQkOQkPmnES8WGPtHgE8wWp6mGCDc9uqWb0quQUoGxx2+O7jUW
 ptQ1LMRrzTlqFhWhCAzAXnhAATqXbNnJr/0CpoDzIuBTT6/J+IhlbNamj
 GySjFUr5E/69h2YbkrcOwEWkRhMj1d0ZUu3pl4TkNuLKHYVOfxKhI4oQT
 iUQcWy2MkOKXcPcjFGpJgBOz0A0fOb69/0Ur3OhJaZWFPP41a3dtDY8Cn A==;
X-CSE-ConnectionGUID: QlrukT4tRNClVelOp+h7xA==
X-CSE-MsgGUID: lFYvr+DGSLORz2641uzCeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84399225"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="84399225"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 05:19:10 -0700
X-CSE-ConnectionGUID: dTYMAd0dTh+FaRGkU+5qmQ==
X-CSE-MsgGUID: Szc4RvlATYa5Hohkxoe/Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="183300116"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 05:19:08 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/9] drm-uapi: Add Color lut range attributes
Date: Fri,  3 Oct 2025 17:55:43 +0530
Message-Id: <20251003122550.729242-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251003122550.729242-1-swati2.sharma@intel.com>
References: <20251003122550.729242-1-swati2.sharma@intel.com>
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

