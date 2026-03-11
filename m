Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CD3FD064B
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 07:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F3310E388;
	Wed, 11 Mar 2026 07:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OjwV3Hhu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D021310E35D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 07:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214476; x=1804750476;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uUZvqLXElANQMtA5s1Q3SifSbqlkKIBj1YtGTTKddro=;
 b=OjwV3HhuMMWqU/0BtpU7ZwvetcTNpoZPzRm+UoZNOkEfTbhfaVaO7eSn
 /poclmGUCbBUJRWVEWPXEJcPNMohZcxPIjhB/PBAaNSVhV1D2nt0J8sGm
 JAJJZrPYeuRyz3Xl3082cSzC/nRw/+s24n/45WBPMgl+K9qzFwCVjw4Xi
 p6fNf0duCYa9rQSqGE5VqcIbZ39wgHuDPh6Pt/53KoS3yJS/M1J9YjHvr
 OKGT1wJU+rcY2lRenvt7rSgq8hTzTD6/CkQHq0Idtj5ximSZxak75SIJt
 VlzYZbgat02FZSuu9ynY7fBl7WBNXKEm6fGrNgvaDU39E3cAs3mgLWZrb A==;
X-CSE-ConnectionGUID: tOorZLq2S46u8lTyHnH1EA==
X-CSE-MsgGUID: eS80Ou4xSvG4zjNSXmP08A==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85362031"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85362031"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:34:36 -0700
X-CSE-ConnectionGUID: ekOa7Q7oT5icc0b1BT9pyw==
X-CSE-MsgGUID: AwBduVwfQW++158D893PnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224547835"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 00:34:35 -0700
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com, shekhar.chauhan@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 2/3] lib: Add NVL-P support
Date: Wed, 11 Mar 2026 13:04:29 +0530
Message-ID: <20260311073430.17421-3-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311073430.17421-1-himanshu.girotra@intel.com>
References: <20260311073430.17421-1-himanshu.girotra@intel.com>
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
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
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

