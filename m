Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1357CDB464
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 06:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C7E10E220;
	Fri, 14 Nov 2025 06:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9dVcmri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD7A10E220
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 06:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763101250; x=1794637250;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d8X5IQ2eExHZw+93Y9F/slxCG3+tSjCOyOudgbEBDx4=;
 b=E9dVcmriVoltH7iYiRcXbfhLUEdB5g0y5kXa+sI8wCGS9cDGyyD0Xl/C
 ABHnnv4CrisZPIyfPpYzab02QyB8Y3299BCTTjtlOKCcdeS8KDuFlIkfn
 AE5mdU69KfI7mC7fz97anCSZHjV7hFjb/JxHjFe3KkQltVpwvU403gokw
 TMXI7ZXJSTKxBvyMg6Kh/HwWJaZDwaQ+nLr6G8YEEmQHNhuOeNsoxB1DE
 dJ0dgES2mzK55PB7jzlJ1eUIqIryZCdlLf0nll6iom8cg/fxcpPkKe5D7
 91liTgJuBFoynNdunkXoAhUIRlA4aRhTfdcHrQ955M1BNqZOGw0lzTgzq g==;
X-CSE-ConnectionGUID: Z9b3Z7WCQbuhNSMRKD4azQ==
X-CSE-MsgGUID: GUtJoBJbTvCBQ+/Vow30mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75511345"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="75511345"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 22:20:49 -0800
X-CSE-ConnectionGUID: SWr2Tg2/S0ubtKZOGzkXbg==
X-CSE-MsgGUID: UGW91uDvQy2czkBHxq1oKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="213112548"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 22:20:48 -0800
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH] lib: Replace NVL with NVL-S
Date: Fri, 14 Nov 2025 11:50:42 +0530
Message-ID: <20251114062042.1853554-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.51.1
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

Fix NVL-S' definition, by replacing Novalake with Novalake-S.

Fixes: 480fa21b8 lib: Add NVL-S support
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 lib/intel_chipset.h     | 4 ++--
 lib/intel_device_info.c | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 7739f4a84..cc2225110 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -93,7 +93,7 @@ struct intel_device_info {
 	bool is_lunarlake : 1;
 	bool is_battlemage : 1;
 	bool is_pantherlake : 1;
-	bool is_novalake: 1;
+	bool is_novalake_s: 1;
 	bool is_crescentisland: 1;
 
 	const struct intel_cmds_info *cmds_info;
@@ -212,7 +212,7 @@ void intel_check_pch(void);
 #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
 #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
 #define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
-#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
+#define IS_NOVALAKE_S(devid)	(intel_get_device_info(devid)->is_novalake_s)
 #define IS_CRESCENTISLAND(devid)	(intel_get_device_info(devid)->is_crescentisland)
 
 #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index d33bf39d4..20147479a 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -539,14 +539,14 @@ static const struct intel_device_info intel_pantherlake_info = {
 	.cmds_info = &xe2_cmds_info,
 };
 
-static const struct intel_device_info intel_novalake_info = {
+static const struct intel_device_info intel_novalake_s_info = {
 	.graphics_ver = 30,
 	.graphics_rel = 04,
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
-	.is_novalake = true,
-	.codename = "novalake",
+	.is_novalake_s = true,
+	.codename = "novalake_s",
 	.cmds_info = &xe2_cmds_info,
 };
 
@@ -678,7 +678,7 @@ static const struct pci_id_match intel_device_match[] = {
 
 	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
 
-	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
+	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_s_info),
 
 	INTEL_CRI_IDS(INTEL_PCI_ID_INIT, &intel_crescentisland_info),
 
-- 
2.51.1

