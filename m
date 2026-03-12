Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C31067058
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 16:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E9E10EA5E;
	Thu, 12 Mar 2026 16:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExMdjR/L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E20D10EA5E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 16:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773331416; x=1804867416;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uUZvqLXElANQMtA5s1Q3SifSbqlkKIBj1YtGTTKddro=;
 b=ExMdjR/L0eHHrLwwje2KNuOLUJNwcwFaCgaPi5kfRfMCbFdTN4mVUymc
 mz9XhRxGEr02X39nKmQlILJIZnHZMIor2P2IRMC/4j044iuW9qTG4sP9N
 BB9ThTu+1iM7Jt4qz+OV4qcJif8Gr7WQ/OK0wq3x5NYv2wHSt7ikqyk66
 XvZIB8SgwbVUA/Bv+KR2pgO4zYouYsRZY5UtRZXYMWKPJfjMXHuLCbjyX
 dMly3JIkk6mT4wL9nNkV0XF/fkEP2B/hfqZ5zeH5jZK/D0HvZaOxYJAeu
 hbCvu+NVOznr3WX2RIOiwngDycVWrXc3gmhLFFVYfDuq443yyCvVXXDyW Q==;
X-CSE-ConnectionGUID: 6Hs7lUSoRCuA1J08rZfQng==
X-CSE-MsgGUID: rMlSw9AFR4K6KhLwr9U3kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77037687"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77037687"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:03:36 -0700
X-CSE-ConnectionGUID: CluKOzcNTgOZR9gwVk/E2Q==
X-CSE-MsgGUID: eJN9R3qmS/q9aFRJ2wviWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225839048"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 09:03:35 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 aditya.chauhan@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 2/4] lib: Add NVL-P support
Date: Thu, 12 Mar 2026 21:33:26 +0530
Message-ID: <20260312160328.9462-3-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312160328.9462-1-himanshu.girotra@intel.com>
References: <20260312160328.9462-1-himanshu.girotra@intel.com>
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

