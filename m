Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC896C48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 06:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0F10E5A5;
	Wed, 14 Feb 2024 06:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4YgyaPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7FD10E203
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 06:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707893166; x=1739429166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WckOe84fU7R7nBgvsxVzUAGgG1DJC1WlqThWxInIaoQ=;
 b=W4YgyaPOMTBNn8vxd5wZXHfyWkr04WkaPr5XGAiK12ijpksWuo4p81N8
 2aKLjpHUH4SEtG7HKxVgU+gnPkFlxTejkCfLCCAi3RhWIpTAqRRP2+vrm
 8ghM2hZcbKACLLuvqrGVcgT2fN5zO1qxHuojaCX/xaY4rxAYMOu8KTCch
 RSjfJ2uZfDjjntdTTHCuoNiP5ysGqLRqKpcoPf4k+ZebJvXF01Ci7KpBK
 W56Hy9B0ftA6cbD0X7/9MwH/3hieS0nNKaPY73r5LuDiNIi/gM3xNQ25H
 7As/nEhMgJJhC4zhnvnnRGGjtnXvmrbD+vRSkyzpK/VSQ+++qe5nxUs1r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12645501"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="12645501"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3427670"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 22:46:05 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [RFC v4 17/22] drm-uapi: Add custom 1D LUT
Date: Wed, 14 Feb 2024 12:09:48 +0530
Message-ID: <20240214063953.1285495-18-bhanuprakash.modem@intel.com>
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 include/drm-uapi/drm_mode.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 476c1a7be..7def05fe8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -874,8 +874,37 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/*
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+	/*
+	 * Data is U32.32 fixed point format.
+	 */
+	__u64 red;
+	__u64 green;
+	__u64 blue;
+	__u64 reserved;
+};
+
+struct drm_color_lut_range {
+	/* DRM_MODE_LUT_* */
+	__u32 flags;
+	/* number of points on the curve */
+	__u16 count;
+	/* input/output bits per component */
+	__u8 input_bpc, output_bpc;
+	/* input start/end values */
+	__s32 start, end;
+	/* output min/max values */
+	__s32 min, max;
+};
+
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X3,
 	DRM_COLOROP_CTM_3X4,
 };
-- 
2.43.0

