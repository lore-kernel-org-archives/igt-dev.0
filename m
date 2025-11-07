Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5256CCFA05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 11:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCC410EAA7;
	Fri,  7 Nov 2025 11:51:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPOvR8m3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F9B10EAA7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 11:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762516261; x=1794052261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CHDSAT5JZ2UvpDimUIM6aTTCIIoY0P9UehnO+YoFATw=;
 b=mPOvR8m3ZTM7AYjjk4fxISGvvcX8Rb+EIPxYYOPItqtgG/wpi54zl4HQ
 IgCsVoAg2zMhJBHd8wJXcSkcDtdeKIR+wt1zIiv5UllewvCGubMlz4723
 R7JmDTtnLh6DsqoPzK3PLdcxs1NxO7sPy8io/HpJ/h08puMdStvacfNFD
 Dt4ybfweOFQTyiONMhfWFf5MpTwYJmFWI6q5tw5F1e1Z+HhjViGYEkzdq
 RAoNIAlCYDzOoPDbowK4iEw5l7zYykUeGJv8fJvYIO+PkYQmK0KB0vzIH
 HS7UzZKQFBk+Tfvh386EtsFlwqxsvG/yI0XSHkDhUGYf762BFdUzXr1br w==;
X-CSE-ConnectionGUID: PPPumoR7RVSXIvabLDzHvA==
X-CSE-MsgGUID: jmY/aeyYT2iKXz9qdaZbxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63872450"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="63872450"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:51:01 -0800
X-CSE-ConnectionGUID: Yv7qV0kPQ3eoHTGo1gmHgw==
X-CSE-MsgGUID: LYV7DbRGSr6HpDLul9lRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188181875"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:50:58 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v3 2/3] lib: Add Crescent Island Support
Date: Fri,  7 Nov 2025 17:20:39 +0530
Message-ID: <20251107115040.1756713-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
References: <20251107115040.1756713-1-shekhar.chauhan@intel.com>
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

From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Add device info for Crescent Island (CRI).

v2: Fix indentation/spacing for CrescentIsland in lib/intel_chipset.h
(Kamil)
v3: Add has_oam and is_crescentisland flags (Ashutosh)

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 70ea78464..7739f4a84 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -94,6 +94,7 @@ struct intel_device_info {
 	bool is_battlemage : 1;
 	bool is_pantherlake : 1;
 	bool is_novalake: 1;
+	bool is_crescentisland: 1;
 
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
@@ -212,6 +213,7 @@ void intel_check_pch(void);
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
 #define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
+#define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index fe452d50f..22f19bddf 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -549,6 +549,16 @@ static const struct intel_device_info intel_novalake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_crescentisland_info = {
+	.graphics_ver = 35,
+	.graphics_rel = 11,
+	.display_ver = 0,
+	.has_oam = true,
+	.is_crescentisland = true,
+	.codename = "crescentisland",
+	.cmds_info = &xe2_cmds_info,
+};
+
 #define INTEL_PCI_ID_INIT(_id, _info) { \
 	.vendor_id = 0x8086, .device_id = (_id), \
 	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
@@ -669,6 +679,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
 
+	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
+
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.51.1

