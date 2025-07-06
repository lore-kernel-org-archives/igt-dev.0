Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69728C83F03
	for <igt-dev@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1918B10E3CC;
	Sun,  6 Jul 2025 19:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXVewOcF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F59010E2ED
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Jul 2025 19:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751831698; x=1783367698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MgZClFY0fmU2ebFRfiN4J87lNV3wbZJkHfWIppsaVnE=;
 b=DXVewOcFJSScA/x4r3jbNdgzwL/gLs7zV46sW8WGw3hOWKGyec6GqA8w
 gcFpmiBdTAR5+r/eBBJ+3eb4BGuP6rdRJD0hydInA2O4xKfcmbLjmAQa3
 LZ0t7RHsiV5pk3X62K8kVZG30fKq33m1jDf8gUCwhr7Uk09ue4+1UjRYd
 FVeqz1S8+qveV+W67Lzz8Di9+UmnRdodkSaLC5asyXMotBygKYRTYDYQL
 SmD8g2ZAzrQ/6silZi0TkcMiWO1RNduNJLYWwViLZ2Y99NItJIo6DP0pu
 AiVzsFRFSrKbSBbqFmls/QEjrcr14sVLtU464wBLmGAilzoaEUrqHYYK6 w==;
X-CSE-ConnectionGUID: UtRaxpquRmyr2xeWfEDLWQ==
X-CSE-MsgGUID: dSFxEv+nQdmVqkIDHcKnkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53983012"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="53983012"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:58 -0700
X-CSE-ConnectionGUID: +oAwk7FXTqO2OsrH1AW4lA==
X-CSE-MsgGUID: YmcngB5YRmaSVRmYDKJHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; d="scan'208";a="159064777"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 12:54:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/9] lib/kms: Add support for COLOROP_HW_CAPS property
Date: Mon,  7 Jul 2025 01:31:21 +0530
Message-Id: <20250706200125.35741-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250706200125.35741-1-swati2.sharma@intel.com>
References: <20250706200125.35741-1-swati2.sharma@intel.com>
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
 lib/igt_kms.c | 1 +
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c99bba74b..daba319ed 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
 	[IGT_COLOROP_SIZE] = "SIZE",
+	[IGT_COLOROP_HW_CAPS] = "HW_CAPS",
 	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_MULTIPLIER] = "MULTIPLIER",
 	[IGT_COLOROP_COLOR_DEPTH] = "COLOR_DEPTH",
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0d0592106..d63099a65 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
 	IGT_COLOROP_SIZE,
+	IGT_COLOROP_HW_CAPS,
 	IGT_COLOROP_DATA,
 	IGT_COLOROP_MULTIPLIER,
 	IGT_COLOROP_COLOR_DEPTH,
-- 
2.25.1

