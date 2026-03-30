Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AF910D14A2
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011B10E5FE;
	Mon, 30 Mar 2026 11:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R7vFVXL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B394110E660
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870953; x=1806406953;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nqgUSBciP9nmSsuxw2/wClCzTZlmO79nuCjEIcnrJ8Q=;
 b=R7vFVXL/ZScT5NGPeYMBTAydRY3UN22zEsuQ38naZnJBJ2WEY6RUBISN
 UordgYS+taUkpaC55WnnYqScDh3yYEeANt/blnaE8v4VFSUllO2DiVT1e
 tRnvpKJXm9L28i5TQoX0fNcxh8hSnFfZHy2h/QTZGzcRYSQz1mM+LqczH
 CFUfjkeV0kr2onaVyFFuAlEBGo+BNspG8Bu6w2raqSQ+eeyXYKPxttzVR
 3dGguLmYlx9BdAbTBAP/TPjbHG5Wq2PdxBHW4e9noxY3tr34ysux1XCKq
 azA14vgsVTT0rjFpechUt1dl/LaQ9jTC/pUkb5fI6mOvAzqElo9GHXDqA w==;
X-CSE-ConnectionGUID: Pp/7XIwZSQCB1SxJANSKIQ==
X-CSE-MsgGUID: oF3wuranTGO6qgm5jXgsTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572006"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572006"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:33 -0700
X-CSE-ConnectionGUID: 64Cb8qI7SCSwyrARKGyv6Q==
X-CSE-MsgGUID: GFRwWLndQh+5n6Xly+a+2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080357"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:33 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 1/5] include/drm-uapi: Add DRM_COLOROP_CSC_FF
 definition
Date: Mon, 30 Mar 2026 17:20:53 +0530
Message-Id: <20260330115057.963395-2-swati2.sharma@intel.com>
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

Add DRM_COLOROP_CSC_FF to the colorop type enumeration. This colorop
type represents a fixed-function Color Space Conversion block where the
coefficients are not programmable but selected from predefined hardware
modes via the CSC_FF_TYPE enum property.

Aligns with kernel commit introducing the CSC Fixed-Function colorop
type for Intel display hardware.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 include/drm-uapi/drm_mode.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859..610513f3c 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,18 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF:
+	 *
+	 * enum string "CSC Fixed-Function"
+	 *
+	 * A fixed-function Color Space Conversion block where the coefficients
+	 * are not programmable but selected from predefined hardware modes via
+	 * the CSC_FF_TYPE enum property. The driver advertises the supported
+	 * CSC modes through this property.
+	 */
+	DRM_COLOROP_CSC_FF,
 };
 
 /**
-- 
2.25.1

