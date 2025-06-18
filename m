Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032EDC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE40F10E19B;
	Wed, 18 Jun 2025 12:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C88B6XwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019DA10E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750250607; x=1781786607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNYf/opP3HOiqHxntRPVpEOSm+vo98nax6W9efqYXXk=;
 b=C88B6XwSaPjD6B+sxTlGjFGPBM8UiiGm7bwDPPccq4IJmaUERlruotel
 baAZCrVPS6Ujuj8sxv3IEUyz5WwHEgwI4EgUwa+QK9LkbGy04FNMxPghl
 /TJvOkOAvGpXo78jg8XJSU1lYD57QIqJXFufTpeZQJiXdd6glLWgUncW/
 Tjapl8HeyQhUNXvGJSQ2G/rNyF9oL6JGQH7JzTEWQ8/Rk1iw3eYSnicFY
 NpG90tQ1+dG4Z2PZvAzqg8AlO6Q3x0pUVVw6PUF4y/CNhi7s8uc/e2CKw
 0dgaghhSQ/+pWTy1uJlO7y5esVynEuiZSXG/tPWBPZRIkUzz338SyO84K A==;
X-CSE-ConnectionGUID: 944oDNcxTbCI3i2AGESKvg==
X-CSE-MsgGUID: lhZEclV2SKaU0ciadyBcmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51690538"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="51690538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:27 -0700
X-CSE-ConnectionGUID: +d6PFO6GTaeUpbbvuLAa3Q==
X-CSE-MsgGUID: 9iB6pfPGTQGSGyq8LlUOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; d="scan'208";a="150266081"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 05:43:25 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, chaitanya.kumar.borah@intel.com, uma.shankar@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/9] drm-uapi: Add 1D LUT multi-segmented color op
Date: Wed, 18 Jun 2025 18:18:45 +0530
Message-Id: <20250618124849.1587767-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618124849.1587767-1-swati2.sharma@intel.com>
References: <20250618124849.1587767-1-swati2.sharma@intel.com>
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
 include/drm-uapi/drm_mode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 0cf307333..07e9d4b4b 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -910,6 +910,16 @@ enum drm_colorop_type {
 	 */
 	DRM_COLOROP_1D_LUT,
 
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
+
 	/**
 	 * @DRM_COLOROP_CTM_3X4:
 	 *
-- 
2.25.1

