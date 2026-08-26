Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700BC61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 18:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3767310EB88;
	Wed, 26 Aug 2026 18:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjL+8Txz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 675FA10EB88
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787769033; x=1819305033;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRUlLVwcNsRCRADynALj8XKChtyCo2z8fICJ7mPa/aA=;
 b=OjL+8Txz85k2C7DiSBZWKFcnLoEVclHnA3SPvZy7cJF3KynmvSRl5vvM
 uRmfWp9Ca5wJTAgugzAdFWSVxcCouJSIS/5MPlNwSC+HRXl4fjRXeuext
 XCEnYMFPnHl9u1n/YjN5mBXbIR3/WiYtPx+HwqCegAEZhwSiF4vNXikVC
 Y1dJQVcNFtb+fPF90hvLajLu/+ttH/Hh5dBFWmrJ/awmY1hYQLODtk6vM
 mACLMUOuo7fQbWhjLhLbZtTKUyEw/+1rBqr9bYeaSMSPwq0lMglPhoirL
 6g18GS+gNAjr/gnV0K/+OO7JoKePQ2vgB4f7arDmNnUplUSnluC0BnPxc A==;
X-CSE-ConnectionGUID: clSm4qnNSFWY+7QsB4xtRg==
X-CSE-MsgGUID: ZpSpqQaBTfGJyjiXmBlA5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88314766"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88314766"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 11:30:33 -0700
X-CSE-ConnectionGUID: T3Cdyc6ATI+kl/JeigEgOQ==
X-CSE-MsgGUID: JlrutsK2Rsmhw1Fth2tj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="271159654"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:30:31 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v4 1/7] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX definition
Date: Thu, 27 Aug 2026 00:09:26 +0530
Message-Id: <20260826183932.351933-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260826183932.351933-1-swati2.sharma@intel.com>
References: <20260826183932.351933-1-swati2.sharma@intel.com>
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
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
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

