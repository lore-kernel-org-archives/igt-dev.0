Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DCBD59F6E
	for <igt-dev@archiver.kernel.org>; Wed,  6 Nov 2024 20:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA89010E176;
	Wed,  6 Nov 2024 20:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhHFYWCi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A9C10E176
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Nov 2024 20:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730923365; x=1762459365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8yqKyrpLVEMgWRIlRKoaWGtU+lNSkkujLkS1w6OjIhg=;
 b=IhHFYWCi4J4/4khpgQbXQ6HPztrByaPx/FL0VYEH5rVKjOFFW9KN9xbz
 oSs+vvImYlXiWHp2JvLaomAh42IEoya6fKONkVRXXjjSk/NQdR3hSf33d
 oOSpdHqvet7BGIHliaNXvHIUetf2XsrkDHdv4d1yflb2aqOtdvdqdXzok
 G4+HHvaNSZfYp7j5z7zGd92WGWVrBuLEw0u51kJCYg+SlUp0DbyTbI+zQ
 Q7nI54XyKsdQyiqSd7JJPMTYzAiaTVP4xY2PpY4TnADRcqpR7aM2JaCwY
 uMmiWsuHjuJ6MLfI8fEVOVaR3/Y4rLMWa1fSbE0QL5f6fZWN4zV9m9MXF Q==;
X-CSE-ConnectionGUID: /OPZlwCRTP6nQPGgcOfCQw==
X-CSE-MsgGUID: /QH6Q/VfTIC2aYS/cHzfhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30510724"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30510724"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 12:02:45 -0800
X-CSE-ConnectionGUID: p7g/ih6+Rou+3ciTmQ/QHg==
X-CSE-MsgGUID: 8NSivgBZQC6kE6C7umBqMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84696789"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 12:02:44 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_fault_injection: Ignore expected errors
Date: Wed,  6 Nov 2024 20:02:44 +0000
Message-ID: <20241106200244.119564-1-jonathan.cavitt@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index d1c8b25307..5bdc3d09e6 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -30,6 +30,27 @@ enum injection_list_action {
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
+	igt_emit_ignore_dmesg_regex("probe with driver xe failed with error -12");
+
+	/*
+	 * If GuC module fault is injected, GuC is expected to fail,
+	 * so also ignore GuC init failures in igt_runner.
+	 */
+	if (function_is_part_of_guc(function_name))
+		igt_emit_ignore_dmesg_regex("GT0: GuC init failed with -ENOMEM"
+					    "|GT0: Failed to initialize uC (-ENOMEM)");
+}
+
 /*
  * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
  */
@@ -175,6 +196,7 @@ igt_main
 			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
 				strcpy(function_name, line);
 				function_name[pmatch[1].rm_eo - 1] = '\0';
+				ignore_faults_in_dmesg(function_name);
 				igt_dynamic_f("function-%s", function_name)
 					inject_fault_try_bind(fd, pci_slot, function_name);
 			}
-- 
2.43.0

