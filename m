Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF73A106705A
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 16:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8235610EA60;
	Thu, 12 Mar 2026 16:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbB9WOUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0277C10EA5E
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773331419; x=1804867419;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4ji4UTvdS2lloz3GgpfoU1OoacjZkBRiYO+FNVWPLys=;
 b=AbB9WOUV+1ZEhEFpb0t8MWHGNnXuXW6R1PFYH1AEjYXeAEULXvPUSjZr
 7VzR8a+/doJugr1vbME8pA/sGfdY09YpCqEJDuPJ7T6FEHb3MhdD0TnZP
 Fr+G+2gz/noi9tgjhKXXo6/bDAMD+3qc1LMEa/TUwLxGZNtfKQzZ0owXO
 rnfI0uMWSSO1OurPeF+vXogYUSvHVlEallxvQ2gWTia5I+CWVIp8bar90
 a4jPwITa446eUKRLjc0J25vWDw9mF9xyz4tug2PXE2ITTKOutBPzVt9C6
 2WX50t9MTt/R1cNtvlkNU/fHC3aSjw7eOKM0mvz3+KB2tHATcSaaG0kQO w==;
X-CSE-ConnectionGUID: kfZdHQNJTSaGXKyUi32iaw==
X-CSE-MsgGUID: 76iKBAUwRxS0tssv1xgu8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77037688"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77037688"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:03:38 -0700
X-CSE-ConnectionGUID: kaNvYo56TTCg0v1fpcBd4g==
X-CSE-MsgGUID: jf/TypOQROCc0A1DYFELBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225839065"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 09:03:37 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 aditya.chauhan@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 3/4] lib: Add WildcatLake support
Date: Thu, 12 Mar 2026 21:33:27 +0530
Message-ID: <20260312160328.9462-4-himanshu.girotra@intel.com>
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

WildcatLake was previously consumed under INTEL_PTL_IDS but now
has dedicated PCI IDs following kernel commit 32620e176443
("drm/pcids: Split PTL pciids group to make wcl subplatform").

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 5df7349df..3fcc5b18d 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -93,6 +93,7 @@ struct intel_device_info {
 	bool is_lunarlake : 1;
 	bool is_battlemage : 1;
 	bool is_pantherlake : 1;
+	bool is_wildcatlake : 1;
 	bool is_novalake_s: 1;
 	bool is_novalake_p : 1;
 	bool is_crescentisland: 1;
@@ -213,6 +214,7 @@ void intel_check_pch(void);
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
+#define IS_WILDCATLAKE(devid)	(intel_get_device_info(devid)->is_wildcatlake)
 #define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
 #define IS_NOVALAKE_P(devid)	(intel_get_device_info(devid)->is_novalake_p)
 #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index b44b24223..da0b9f398 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -539,6 +539,18 @@ static const struct intel_device_info intel_pantherlake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_wildcatlake_info = {
+	.graphics_ver = 30,
+	.graphics_rel = 3,
+	.display_ver = 30,
+	.has_4tile = true,
+	.has_flatccs = true,
+	.has_oam = true,
+	.is_wildcatlake = true,
+	.codename = "wildcatlake",
+	.cmds_info = &xe2_cmds_info,
+};
+
 static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
 	.graphics_rel = 04,
@@ -690,6 +702,7 @@ static const struct pci_id_match intel_device_match[] = {
 	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
 
 	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
+	INTEL_WCL_IDS(INTEL_PCI_ID_INIT, &intel_wildcatlake_info),
 
 	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
 
-- 
2.50.1

