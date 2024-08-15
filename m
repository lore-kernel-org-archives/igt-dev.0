Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E73C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 13:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB5F10E05A;
	Thu, 15 Aug 2024 13:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7Ufg1so";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5385510E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723727756; x=1755263756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zPnS2kA7qj+qcWdN2LnfIPNgrM1Bpx7YWl5rgAIKB4s=;
 b=k7Ufg1so2GMUOeEW31cn9JMxBJ+GPvrGmDvV3tPhMoGjIxZ2YRU3720Y
 3KxdBySPuEChMsPLXC3KBHkMglPOt/HqoWg0lIxWLKPorBv/P+RPWzHov
 G5toZ2lE0DT0g/95oUt/IBLbqQfLAtypW9N8S/Drz1QOm44EhtidxwOxp
 lFvsPuKKcrVRZGFMcXlAwzS1GTLNIVW6DmuHkoVDkEm0nynCSyQ7es25h
 eCylefnwwoG4Y5EydNfp/xAG39gC6+v07Yp3Ym/mfdBxEO4BB77N/voLV
 4/mGD2RCCtljoDHp+1kCooHLB/oVfP7DEDyAkYweGXiNNtXZF4zuamELn g==;
X-CSE-ConnectionGUID: ADmR8tNVSASGSvlp9DaGFQ==
X-CSE-MsgGUID: CcybTNdfTpalGP1SU4j1NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="25744517"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="25744517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 06:15:55 -0700
X-CSE-ConnectionGUID: s5y3zh07Spqp2Yjl0CyaSw==
X-CSE-MsgGUID: STgSpCgjSzeU6bpc/DM4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="58979222"
Received: from kbommu-desk.iind.intel.com ([10.145.169.159])
 by fmviesa006.fm.intel.com with ESMTP; 15 Aug 2024 06:15:49 -0700
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Unload/Reload the mei Modules Before
 Unloading/Reloading the i915/xe Driver
Date: Thu, 15 Aug 2024 18:34:23 +0530
Message-Id: <20240815130423.7686-1-krishnaiah.bommu@intel.com>
X-Mailer: git-send-email 2.25.1
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

To ensure stability and proper module management, this update introduces
changes to the handling of MEI modules when loading or unloading
the Intel i915 or Xe drivers.

Key Changes:
- Unload Order: The `mei_gsc_proxy` module is now unloaded before `mei_gsc`,
preventing potential failures during the unloading process.
- Platform-Specific Handling: On platforms where the MEI hardware is integrated
with the graphics device (e.g., DG2/BMG), the MEI modules depend on the i915/Xe driver.
Conversely, on newer platforms like CLS, where MEI hardware is separate,
this dependency does not exist. This update ensures that MEI modules are
unloaded/reloaded in the correct order based on platform-specific dependencies.

These changes address the need for a more robust handling of MEI modules across
different hardware platforms, ensuring that the i915/Xe driver can be
cleanly unloaded and reloaded without issues.

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 lib/igt_kmod.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 464c0dcf4..6ee2b7afe 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -480,9 +480,29 @@ igt_intel_driver_load(const char *opts, const char *driver)
 {
 	int ret;
 
+	const char *mei[] = {
+		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
+		"mei_pxp",
+		"mei_hdcp",
+		"mei_gsc_proxy",
+		"mei_gsc",
+		NULL,
+	};
+
 	if (opts)
 		igt_info("Reloading %s with %s\n\n", driver, opts);
 
+	for (const char **m = mei; *m; m++) {
+		if (igt_kmod_is_loaded(*m))
+			continue;
+
+		ret = igt_kmod_load(*m, NULL);
+		if (ret) {
+			igt_debug("Could not load %s\n", *m);
+			return ret;
+		}
+	}
+
 	ret = igt_kmod_load(driver, opts);
 	if (ret) {
 		igt_debug("Could not load %s\n", driver);
@@ -620,9 +640,14 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 	const char *aux[] = {
 		/* gen5: ips uses symbol_get() so only a soft module dependency */
 		"intel_ips",
+		NULL,
+	};
+
+	const char *mei[] = {
 		/* mei_gsc uses an i915 aux dev and the other mei mods depend on it */
 		"mei_pxp",
 		"mei_hdcp",
+		"mei_gsc_proxy",
 		"mei_gsc",
 		NULL,
 	};
@@ -647,6 +672,19 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		}
 	}
 
+	for (const char **m = mei; *m; m++) {
+		if (!igt_kmod_is_loaded(*m))
+			continue;
+
+		ret = igt_kmod_unload(*m);
+		if (ret) {
+			if (who)
+				*who = strdup_realloc(*who, *m);
+
+			return ret;
+		}
+	}
+
 	if (igt_kmod_is_loaded(driver)) {
 		ret = igt_kmod_unload(driver);
 		if (ret) {
-- 
2.25.1

