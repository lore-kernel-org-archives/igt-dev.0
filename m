Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298FBFCC9B1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 05:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D4410E31E;
	Wed, 11 Mar 2026 05:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="St78Onzw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8937010E31B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 05:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773208204; x=1804744204;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MkcT0fUZFFtajcviXIAM3Q6/KgbGczBnMCAsfJecdYA=;
 b=St78OnzwueFVvWVpmKdZJSRJ3PXQ4vlkvzYb8Wa/bRrAN/6v6jGSRKC4
 Gi2L4A58Gfn0+KgjFI+ENm/D679Bs/Uy5faI/oYgc15d8QgVHhUInmtYT
 39qq7wZ1rR3QnCPqQuzXfWI225nIloxjL6yivqqHDKLI9r0/YEimaIjf4
 eU6X2a1cYQmv/oNKMIxtUvcGdjkA7gav/Xqi836qy7dnIzAArUMmP3rzy
 PMWPq9BdpF+DpyWOv/P8u8SS1wzx3lye794Jy3ViUUNTcs5bKrxHgWkHN
 DO3EbeQWHI5z05MIRL1pJwMcVk9+xcqt6bvg6vkAV4ypvE43m2kqg+ICA w==;
X-CSE-ConnectionGUID: jaR1TCBzQAWi/4yu7tBDwA==
X-CSE-MsgGUID: 9ZS9dVTgRUm9q1rmRtAqdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96881958"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="96881958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 22:50:04 -0700
X-CSE-ConnectionGUID: rKFKyp7LROyC/h2pfvzyDw==
X-CSE-MsgGUID: l70c7LuoRv6ypm2syvXnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219483639"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 22:50:03 -0700
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] lib: Add NVL-P support
Date: Wed, 11 Mar 2026 11:19:57 +0530
Message-ID: <20260311054958.9770-3-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311054958.9770-1-himanshu.girotra@intel.com>
References: <20260311054958.9770-1-himanshu.girotra@intel.com>
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Add NVL-P device info.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index cc2225110..5df7349df 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -94,6 +94,7 @@ struct intel_device_info {
 	bool is_battlemage : 1;
 	bool is_pantherlake : 1;
 	bool is_novalake_s: 1;
+	bool is_novalake_p : 1;
 	bool is_crescentisland: 1;
 
 	const struct intel_cmds_info *cmds_info;
@@ -213,6 +214,7 @@ void intel_check_pch(void);
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
 #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
+#define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
 #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 89fa6788f..b44b24223 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -551,6 +551,18 @@ static const struct intel_device_info intel_novalake_s_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_novalake_p_info = {
+	.graphics_ver = 35,
+	.graphics_rel = 10,
+	.display_ver = 35,
+	.has_4tile = true,
+	.has_oam = true,
+	.has_flatccs = true,
+	.is_novalake_p = true,
+	.codename = "novalake_p",
+	.cmds_info = &xe2_cmds_info,
+};
+
 static const struct intel_device_info intel_crescentisland_info = {
 	.graphics_ver = 35,
 	.graphics_rel = 11,
@@ -681,6 +693,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
 
+	INTEL_NVLP_IDS(INTEL_PCI_ID_INIT, &intel_novalake_p_info),
+
 	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
 
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
-- 
2.50.1

