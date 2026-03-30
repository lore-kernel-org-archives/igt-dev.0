Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7D010D14A6
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 11:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FB510E678;
	Mon, 30 Mar 2026 11:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+4MWaSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F7910E660
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774870955; x=1806406955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gTynosYhPTjkxP6GQ0y4jyHsWkzZerFLOnGLTppWcQ=;
 b=E+4MWaSerTA73AzLKyuGzUne1yPgfT/v+taj4axDmPMwXPe2ICewrP29
 xI6iqlat2CvzKtOL6E+y9d0MToz7FcEo2h/0bXgkRxij+dRPVycLTwgJO
 rgUXqdUQW5BpE26j2msP4fHqVexw2gEJJ4QxnUADYg9AsxqTaOiFLwIbu
 VlAme6T2vUgxKSbDt4wRtcKv0MWyQt4jhESKJkBZFpBIb1KIYkcodrAL+
 /YV8O2reX+9BjrBzH3eWAHlRTTjqVp0kjmtWGy93n58pz6jSt4tVLYvvk
 reDRgzj8FV75wTiecWGBV667oCBJ+yljlLUWS5xXwEcYU6gPRutJm1V+9 w==;
X-CSE-ConnectionGUID: 5XP6ZwJ2SlOq7D9fWhYxmg==
X-CSE-MsgGUID: XplcE3hBQCGYpDOckVcOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75572008"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="75572008"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 04:42:35 -0700
X-CSE-ConnectionGUID: EZ6lf3LzQUmpSnL2+SCfPg==
X-CSE-MsgGUID: 4nPV0IO2Q8SeQ0TcRPE+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="230080363"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:42:34 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC PATCH i-g-t 2/5] lib/igt_kms: Add CSC_FF_TYPE colorop property
Date: Mon, 30 Mar 2026 17:20:54 +0530
Message-Id: <20260330115057.963395-3-swati2.sharma@intel.com>
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

Add IGT_COLOROP_CSC_FF_TYPE to the colorop property enumeration and
register the "CSC_FF_TYPE" property name string. This enables IGT
to discover and configure the CSC_FF_TYPE enum property on CSC
fixed-function colorops exposed by the driver.

Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8c42909fc..92970d983 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -716,6 +716,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_LUT3D_INTERPOLATION] = "LUT3D_INTERPOLATION",
 	[IGT_COLOROP_NEXT] = "NEXT",
+	[IGT_COLOROP_CSC_FF_TYPE] = "CSC_FF_TYPE",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index b3def1e73..467a25d7d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -359,6 +359,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_LUT3D_INTERPOLATION,
 	IGT_COLOROP_NEXT,
+	IGT_COLOROP_CSC_FF_TYPE,
 	IGT_NUM_COLOROP_PROPS
 };
 
-- 
2.25.1

