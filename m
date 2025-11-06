Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD478CCFA1A
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 15:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525DB10E938;
	Thu,  6 Nov 2025 15:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7NbKDO2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3DB10E938
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762443270; x=1793979270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qc8xc6/BesdjBZXapBDLzoUkLjftOfZptYZYqzXDE0s=;
 b=n7NbKDO2+qXNhdpz2QE/jHQ9fi1xSZRW9EtQ9SuZksiFceOM13cFtn7t
 p8zY/n1AO7Re+5Fd+cvcrDcTRilMDaiTs0Nh8lBxuVwTTn2Wh0/ncepvS
 remWnqIkVIdeYij/Z1ZXKlmsol/J3o09JkCpJwZL1HHQqvWEMa3aAvcgy
 QQSld7+a9GuNSyIN1juUxK1f0DNV+J22cjCn9gKyUFa4NBYkDq6VS6v5A
 DLAFQqiYMMlr7jrDfHkpWEpok/7/Z1KdVIoquYdUITtOairb+ZmzJws/e
 iStzlWeqyEy76ZDAXlYxNj+OWhMfqbAT+HQhATijA8z9SrIOuu4oBzgKz A==;
X-CSE-ConnectionGUID: 93CSjrI4Q66qSQ9B4Dg6Qg==
X-CSE-MsgGUID: YKDE1ebJSpekzFYk7crMYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64677559"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64677559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:30 -0800
X-CSE-ConnectionGUID: WUF+8xnrThyBV0+0knF0gw==
X-CSE-MsgGUID: CAHeqx44Q5uZS4q6wIZF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191883176"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 07:34:28 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, balasubramani.vivekanandan@intel.com,
 kamil.konieczny@linux.intel.com, shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
Date: Thu,  6 Nov 2025 21:04:17 +0530
Message-ID: <20251106153419.1741989-2-shekhar.chauhan@intel.com>
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

Add NVL-S device info.

v2: Fix indentation/spacing for PantherLake and Novalake in
lib/intel_chipset.h (Kamil)

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_chipset.h     |  4 +++-
 lib/intel_device_info.c | 12 ++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2f6bf788a..70ea78464 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -93,6 +93,7 @@ struct intel_device_info {
 	bool is_lunarlake : 1;
 	bool is_battlemage : 1;
 	bool is_pantherlake : 1;
+	bool is_novalake: 1;
 
 	const struct intel_cmds_info *cmds_info;
 	const char *codename;
@@ -209,7 +210,8 @@ void intel_check_pch(void);
 #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
-#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
+#define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
+#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a853f9ab4..fe452d50f 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -539,6 +539,16 @@ static const struct intel_device_info intel_pantherlake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
+static const struct intel_device_info intel_novalake_info = {
+	.graphics_ver = 30,
+	.graphics_rel = 04,
+	.display_ver = 35,
+	.has_4tile = true,
+	.is_novalake = true,
+	.codename = "novalake",
+	.cmds_info = &xe2_cmds_info,
+};
+
 #define INTEL_PCI_ID_INIT(_id, _info) { \
 	.vendor_id = 0x8086, .device_id = (_id), \
 	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
@@ -657,6 +667,8 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
 
+	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
+
 	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
 };
 
-- 
2.51.1

