Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A714D5D687
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 20:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17610E8C8;
	Thu,  7 Nov 2024 20:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nmjf3A2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB3C10E8C8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 20:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731009601; x=1762545601;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e/l6OX3zUROv9xXG06IR+JgvwdCr2juimWDXpu/tL5Y=;
 b=nmjf3A2m3UJ9P+NapFBT/TKoLSG8BAOxsg62MRj/HIzOeRxUT1LRAq72
 u4qmXtMv+x1heTFgq25FJGHWSvggHPVn53bn7/f3bGwjZLvnO6B31ZxQJ
 zayQcRwkZO2UvJyMJ5W/ITy8c0A/uiGI/gFoL9Z7ahidE00xvV06x7Uxh
 LGJFz168urGbhiyGItbT2FBppLfh1+vGGvT/HTU52baJEoxJpfZdX5FNw
 voGNqORvunHvs2Jrkq8fE2ksFlXt8p6ppgy3uNWmLJmph3Z3rtGhjSP7s
 4m45RkZVWNR0Z1IsdHvjm4beBeuznA6vdys1Os72eFCD70PEgb2dL9QoA A==;
X-CSE-ConnectionGUID: yORz5soETq69m6a/AOxzrA==
X-CSE-MsgGUID: oNi9SQEJRuyV+z+ZbWg8vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30833161"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30833161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:00:00 -0800
X-CSE-ConnectionGUID: shyjwVBsQySc+N89yrDPHQ==
X-CSE-MsgGUID: Yrc4qv1ERym7QJ+i/l0fZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85623304"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 12:00:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH v2] tests/intel/xe_fault_injection: Ignore expected errors
Date: Thu,  7 Nov 2024 19:59:59 +0000
Message-ID: <20241107195959.98509-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

The following errors can be observed when running the xe_fault_injection
subtests:

[drm] *ERROR* GT0: GuC init failed with -ENOMEM
[drm] *ERROR* GT0: Failed to initialize uC (-ENOMEM)
probe with driver xe failed with error -12

Add these messages to the dmesg ignore regex to the applicable tests
(specifically, all tests for the last error, and all tests that target
GuC subsystems for the first two errors).

v2:
- Fix and merge regex (Kamil)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index d1c8b25307..8b181808ed 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -30,6 +30,30 @@ enum injection_list_action {
 	INJECTION_LIST_REMOVE,
 };
 
+static bool function_is_part_of_guc(char function_name[])
+{
+	return strstr(function_name, "_guc_") != NULL ||
+	       strstr(function_name, "_uc_") != NULL ||
+	       strstr(function_name, "_wopcm_") != NULL;
+}
+
+static void ignore_faults_in_dmesg(char function_name[])
+{
+	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
+	char regex[1024] = "probe with driver xe failed with error -12";
+
+	/*
+	 * If GuC module fault is injected, GuC is expected to fail,
+	 * so also ignore GuC init failures in igt_runner.
+	 */
+	if (function_is_part_of_guc(function_name)) {
+		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
+	}
+
+	igt_emit_ignore_dmesg_regex(regex);
+}
+
 /*
  * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
  */
@@ -175,6 +199,7 @@ igt_main
 			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
 				strcpy(function_name, line);
 				function_name[pmatch[1].rm_eo - 1] = '\0';
+				ignore_faults_in_dmesg(function_name);
 				igt_dynamic_f("function-%s", function_name)
 					inject_fault_try_bind(fd, pci_slot, function_name);
 			}
-- 
2.43.0

