Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7974FF3C27D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 10:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1721F10E6AA;
	Tue, 10 Mar 2026 10:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="euGXbIrM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E13D10E6AA
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 10:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773137618; x=1804673618;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b2OS4SlCvvOIZq8bBg37EoLGR+GxHpNEgbsQQZll5rk=;
 b=euGXbIrMYUUd8HxPrSubwk5VWr9MVr8NiVHa5QAM3994m+WSQNfJdQlW
 0AhFhfrTan0kRBVMqYedF7vmNjJZXNqNOTxKGBSVhea26rfQz8PRJTjSr
 CuLKEGN3kq7n2XV54bDmA3sYHGgn+xnxSPaowsQASCs/ZqIAkcDGTds/G
 99UC13VMx9lg21tSOI1v2Liq1khwHUEXAnAesKUGvs6RX/NJDq/EChrBf
 5IK+k0evpcDsph/Atf0ExODKsGpkaiqkOEujqchKcMThZqylQsIEfKDiT
 kbr/BUOP8X/hsdLeOxvktr5+jaFf8DKXwSw5j2poyKoiWL4DMZOinldZq Q==;
X-CSE-ConnectionGUID: 5AS29ho6S1iAHOJ75JxSOQ==
X-CSE-MsgGUID: TwQC3MGLT06xi3R7t9mk4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="76787742"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="76787742"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 03:13:38 -0700
X-CSE-ConnectionGUID: zL8gfTy2QYO82URAW0GmVQ==
X-CSE-MsgGUID: 62TcjBfIScSv23yDV0gEjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="216864210"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2026 03:13:36 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 shekhar.chauhan@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib: Add NVL-P (Novalake-P) device IDs
Date: Tue, 10 Mar 2026 15:43:35 +0530
Message-ID: <20260310101335.8995-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

Add NVL-P device info and PCI IDs, syncing pciids.h with kernel
commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition").

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 14 ++++++++++++++
 lib/pciids.h            | 12 ++++++++++++
 3 files changed, 28 insertions(+)

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
diff --git a/lib/pciids.h b/lib/pciids.h
index 6e53fb4cd..d4a09ca12 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -893,6 +893,18 @@
 	MACRO__(0xD744, ## __VA_ARGS__), \
 	MACRO__(0xD745, ## __VA_ARGS__)
 
+/* NVL-P */
+#define INTEL_NVLP_IDS(MACRO__, ...) \
+	MACRO__(0xD750, ## __VA_ARGS__), \
+	MACRO__(0xD751, ## __VA_ARGS__), \
+	MACRO__(0xD752, ## __VA_ARGS__), \
+	MACRO__(0xD753, ## __VA_ARGS__), \
+	MACRO__(0xD754, ## __VA_ARGS__), \
+	MACRO__(0xD755, ## __VA_ARGS__), \
+	MACRO__(0xD756, ## __VA_ARGS__), \
+	MACRO__(0xD757, ## __VA_ARGS__), \
+	MACRO__(0xD75F, ## __VA_ARGS__)
+
 /* CRI */
 #define INTEL_CRI_IDS(MACRO__, ...) \
 	MACRO__(0x674C, ## __VA_ARGS__)
-- 
2.50.1

