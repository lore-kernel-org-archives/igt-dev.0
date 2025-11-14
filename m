Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7958DCE8D64
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3170F10EAE3;
	Fri, 14 Nov 2025 17:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEEJVJr8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEAA10EAD9
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140972; x=1794676972;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQ+TgqeZ+hHPB1ftcCtk9YNt6+oD0LLNVcls7r5pPcU=;
 b=lEEJVJr8AsH4xuoqX5O9kpV9vm3U4p9AlFh2aa/cZjS8MrbCLPkxIoSy
 kpoUq4sXUZIeJQnHr+mUBawCOdrWTFGPXEF1zKh3u+XuJx8lhS5dyMoFH
 GgwQIYwS+6OO6JCJJJxFN2PFfWDAj+FXrqHBMVOwdVhvkyRTrNj2m97ZO
 HvJJ+cTjiZdQNvAGynSJBJ+7o4CxTes5k8NOXKYA40yvtdAzgOg291IM3
 twAtWRlkMb8gQE8vVO7PcdNWlY0+Pb4uqgZRHEwT0so5IlGWdLwmMN+5J
 QWlphMPcmCFm3FGlMYLTIhGaOki1Ov8joJsOX3aVKSBtUImVSb1p4wLRI A==;
X-CSE-ConnectionGUID: 7P1P8XhHRoWdG/3r1fXKQA==
X-CSE-MsgGUID: Za321FSgR4Wb7O/hncF6kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82871456"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="82871456"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:22:51 -0800
X-CSE-ConnectionGUID: deuRzicrS6mbTMUqZV1tsQ==
X-CSE-MsgGUID: I8njCBQLSHCWuyJOzV/Y2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="194981576"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 09:22:50 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,v4 15/23] drm-uapi: Add 1D LUT multi-segmented color op
Date: Fri, 14 Nov 2025 22:59:00 +0530
Message-Id: <20251114172908.1027816-16-swati2.sharma@intel.com>
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

Introduce DRM_COLOROP_1D_LUT_MULTSEG to represent 1D LUTs with multiple
non-uniform segments. The DATA property carries the LUT blob, and the
HW_CAPS property describes hardware capabilities.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 1298274d9..f0f16ee34 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -936,6 +936,16 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT_MULTSEG:
+	 *
+	 * A 1D LUT with multiple segments to cover the full color range with non-uniformly
+	 * distributed &drm_color_lut entries, packed into a blob via the DATA property.
+	 * The driver's expected LUT size and segmented capabilities are advertised via the
+	 * HW_CAPS property.
+	 */
+	DRM_COLOROP_1D_LUT_MULTSEG,
 };
 
 enum drm_colorop_interpolation_type {
-- 
2.25.1

