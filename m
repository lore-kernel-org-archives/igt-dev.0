Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479BECCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C667810E939;
	Thu,  6 Nov 2025 15:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AuMsnsvK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239D910E939
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762443272; x=1793979272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ckT0Z2Hclog2Hgjol96K8UkdJFqx/Odh72eDBc3jirI=;
 b=AuMsnsvKPpaXLjO/fSZqApaPU4J3AvUXSiAnVp5q/i9rwdAjpu/8x7kY
 S+2+mggxzqzKW+u69DKWJGQdezH31j7fKya4f2pG7Bv/cWUXpLt5Uw940
 Jjlfsssecjm1MGQT7EL+MMAHa3K5fgBO+aWJ1HQV200ebaHzciORP9g5l
 GJjs0LOiqmz/W0XEk9syJMISu9C0b6ck5R9fKHknNXmQpBOqotNr30xbW
 C/u9LEhqHIL74Y/WIkKMe6wFkMI1qiq+AU2No/oGsKhaboI1ROnFE8k5m
 n4769gVRFjZwLjbdlVeXlkj22ZWOzSfJWuScyEq2vj6XSBDAYDtplxdwR w==;
X-CSE-ConnectionGUID: xqHdnvsZTpKM1goB38t02w==
X-CSE-MsgGUID: S/xTvrSRS0OkSykQj4nYxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64677564"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64677564"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:32 -0800
X-CSE-ConnectionGUID: GX6MXPQqQTiLu6DdClM/qA==
X-CSE-MsgGUID: 030TcI2IRBOkHSlztfD9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191883190"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:30 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v2 2/3] lib: Add Crescent Island Support
Date: Thu,  6 Nov 2025 21:04:18 +0530
Message-ID: <20251106153419.1741989-3-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
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

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_chipset.h     |  2 ++
 lib/intel_device_info.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

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
index fe452d50f..bb36c6968 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -549,6 +549,14 @@ static const struct intel_device_info intel_novalake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_crescentisland_info = {
+	.graphics_ver = 35,
+	.graphics_rel = 11,
+	.display_ver = 0,
+	.codename = "crescentisland",
+	.cmds_info = &xe2_cmds_info,
+};
+
 #define INTEL_PCI_ID_INIT(_id, _info) { \
 	.vendor_id = 0x8086, .device_id = (_id), \
 	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
@@ -669,6 +677,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
 
+	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
+
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.51.1

