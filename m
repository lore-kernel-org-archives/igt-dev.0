Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF08C53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C024810E6F4;
	Mon, 27 Jul 2026 18:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YrYA4TIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF7510E6D1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177992; x=1816713992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cj8IpYOIxlltkN8KtIPNmRBl0NluC8rxbmcn36gYnEA=;
 b=YrYA4TIh1qaOw+8j8MEAUJsIOL1MtSzcRwAiiSLEbt+H6JCICiFWAqL/
 8dcMIWfWg4kvy+LQyYjZpdH9QUWx119bq6JZ1U63D2Wtdp0EQO1yYYG7x
 S0EHsayNiC4aFf5u8UMFD4O/6C2VVxunb8z53HZunR34YdxjLvPy2LLQZ
 c8fa8Y+Pnn5xmj5ZVT3M8B2F7fo2nZiDca/BFb4UpXSBibVrcnCmNbKUh
 GBBppnq/wIcTAauTtgjHuawiNmBfkLxpRoEbGN+eQclYPMSI784YQUNNm
 eHudSX46RgJyjqRnXWc/n/BO690AVBn8Gb1YaqDUnE5SmJfaAA06D6BCU A==;
X-CSE-ConnectionGUID: 25R3tZutSqu228+N/qTx3Q==
X-CSE-MsgGUID: duPrllD7RjaUaRGDY3rpGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103296099"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="103296099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:46:32 -0700
X-CSE-ConnectionGUID: I91vTatrQe+re5BHICqSHg==
X-CSE-MsgGUID: G5xT+gN8SHmFJgPLWzOE6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="259545256"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 11:46:31 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/6] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
 definition
Date: Tue, 28 Jul 2026 00:25:26 +0530
Message-Id: <20260727185531.4046807-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260727185531.4046807-1-swati2.sharma@intel.com>
References: <20260727185531.4046807-1-swati2.sharma@intel.com>
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

Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration. This
colorop type represents a pre-defined matrix operation selected via
the FIXED_MATRIX_TYPE enum property. The driver advertises the
supported operations through this property.

Aligns with kernel commit introducing the Fixed Matrix colorop
type for Intel display hardware.

v2: -Naming changes (CSC_FF -> FIXED_MATRIX)

Assisted-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859..0924e38af 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,17 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_FIXED_MATRIX:
+	 *
+	 * enum string "Fixed Matrix"
+	 *
+	 * A Colorop block that performs a pre-defined matrix operation selected
+	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
+	 * operations through this property.
+	 */
+	DRM_COLOROP_FIXED_MATRIX,
 };
 
 /**
-- 
2.25.1

