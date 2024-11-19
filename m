Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9011ED6C2B4
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 21:50:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2703B10E0CA;
	Tue, 19 Nov 2024 21:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJ8kqxlB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B62010E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2024 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732053029; x=1763589029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/EpxWu9A+vQwpXU0Ahr4pOmfTCAoJf3OHZuvu5IWUlo=;
 b=AJ8kqxlBhifXPjJWSmGsmN9nba19BhgK6C0QbN+D+Fb2QgaVwRhM9kWv
 8gymh7b34grgvPddmthXJDz5khy0PUYW6ZFCdfh5/qFRiIJ535H/xR2Yn
 c59V4XyOUsJlyP4sd2JFPiD69Ot6iAMpxgCDd7Ejg8naq1K7bfwyDMfVk
 059oVD7p+6bqrBi0RgZVBkj4qF98CVgIHmogAgqSL+Fa3wSkHwLdMN5oL
 dcp1n7HXPsz6TqOlULlTZJ+yfosYlvlTTyXIAnOEOissP7tyEX/Zhq4jX
 yjcufgWmctVvuarW3GvkZ0ELJe1c8MkJxamxkIvRu1zpPiPqVFbjg8bnd A==;
X-CSE-ConnectionGUID: 3FW89IADTq69oeWwUiNvjA==
X-CSE-MsgGUID: CYywrt5TTjOjUUB6xTj6/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35756664"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="35756664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:50:29 -0800
X-CSE-ConnectionGUID: eaPbefSdSkCBOQIbRK23vg==
X-CSE-MsgGUID: QIvgp5/KQCS+iLRHcF8/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94630025"
Received: from dut4411lnl.fm.intel.com ([10.105.10.34])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 13:50:28 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 francois.dugast@intel.com, lucas.demarchi@intel.com,
 matthew.brost@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH v3] tests/intel/xe_fault_injection: Ignore expected errors
Date: Tue, 19 Nov 2024 21:50:27 +0000
Message-ID: <20241119215027.109598-1-jonathan.cavitt@intel.com>
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

v3:
- Rebase change to be compatible with latest revision (Kamil)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 1b29041745..7d6c902761 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -50,6 +50,30 @@ static int fail_function_open(void)
 	return debugfs_fail_function_dir_fd;
 }
 
+static bool function_is_part_of_guc(const char function_name[])
+{
+	return strstr(function_name, "_guc_") != NULL ||
+	       strstr(function_name, "_uc_") != NULL ||
+	       strstr(function_name, "_wopcm_") != NULL;
+}
+
+static void ignore_faults_in_dmesg(const char function_name[])
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
@@ -152,6 +176,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
+	ignore_faults_in_dmesg(function_name);
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
@@ -184,6 +209,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
+	ignore_faults_in_dmesg(function_name);
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
@@ -243,6 +269,7 @@ vm_bind_fail(int fd, const char function_name[])
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
+	ignore_faults_in_dmesg(function_name);
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
-- 
2.43.0

