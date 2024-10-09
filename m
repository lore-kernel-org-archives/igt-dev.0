Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F876CEDD8F
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 12:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97210E701;
	Wed,  9 Oct 2024 12:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SS0EFBGm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798A610E6F0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728477135; x=1760013135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLuwRzaUBNZEhKI5oZ/MCrBATV1YvE1/LubCUlCUhKM=;
 b=SS0EFBGmQi00z1KHXz9fLzblwMya9P//tvw5n2Jicv/5VfOhq+5whQL9
 63l3niyC5vq0Q3uxJadR0lQyFPsSEiV6CnXhJYsphF//Ks025Mh7WkMe6
 YD64Msnn4fQy9u7LqK239KKQoqFjd/LP7S7w/Ok9qZ9PSc8ymMWTsd4+s
 rngN5HD2bThaJXMVS8q0yI3fyBM6xHBr9yKfOt1mFHCRBsGRZQoGEHqry
 Cx+9TL/45Z5Tu2SibaZP+5AoVsgIWLW2/kSCBBpo6LlQ1xVBAfN1Ux52M
 xgOk62qD75qEsUEP1jVnzrcPIPiCrnn96YkwpQJNEkgDPEsmDEsowVbwy g==;
X-CSE-ConnectionGUID: Jh/s+m9FSxuaaOdesdSKWQ==
X-CSE-MsgGUID: g8sWbm01Td65DEDjWYfwtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38336510"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="38336510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:15 -0700
X-CSE-ConnectionGUID: BaRvoCrRT8y7PYVDrWpFyA==
X-CSE-MsgGUID: xgH+JVt2TJyBHqhZB1OTUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; d="scan'208";a="75831911"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 fdugast-desk.intel.com) ([10.245.244.97])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 05:32:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Use a static list
 of functions
Date: Wed,  9 Oct 2024 14:28:47 +0200
Message-ID: <20241009123141.86800-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009123141.86800-1-francois.dugast@intel.com>
References: <20241009123141.86800-1-francois.dugast@intel.com>
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

Until now the list of error injectable functions was determined at
runtime by reading debugfs. This was convenient as a new function
added in KMD would automatically be tested in a separate test. This
worked well as long as all error injectable functions were meant to
only be tested during probe time, which is a specific scenario. As we
want to use error injection in other situations, we will not be able
to automatically determine if this is a case for probe time, so we
need to make it explicit.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 72 ++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index d1c8b2530..891b4d70b 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -11,8 +11,6 @@
  * Test category: fault injection
  */
 
-#include <regex.h>
-
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
@@ -22,7 +20,6 @@
 #define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
 #define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
 #define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
-#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
 #define INJECT_ERRNO			-ENOMEM
 
 enum injection_list_action {
@@ -45,7 +42,7 @@ static bool function_error_injection_enabled(void)
 	return false;
 }
 
-static void injection_list_do(enum injection_list_action action, char function_name[])
+static void injection_list_do(enum injection_list_action action, const char function_name[])
 {
 	FILE *file_inject;
 
@@ -114,7 +111,7 @@ static void cleanup_injection_fault(void)
 	fclose(file);
 }
 
-static void set_retval(char function_name[], long long retval)
+static void set_retval(const char function_name[], long long retval)
 {
 	FILE *file_retval;
 	char file_path[MAX_LINE_SIZE];
@@ -129,12 +126,27 @@ static void set_retval(char function_name[], long long retval)
 }
 
 /**
- * SUBTEST: inject-fault-probe
- * Description: inject an error in the injectable function then reprobe driver
+ * SUBTEST: inject-fault-probe-function-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
  * Functionality: fault
+ *
+ * arg[1]:
+ * @wait_for_lmem_ready:	wait_for_lmem_ready
+ * @xe_device_create:		xe_device_create
+ * @xe_ggtt_init_early:		xe_ggtt_init_early
+ * @xe_guc_ads_init:		xe_guc_ads_init
+ * @xe_guc_ct_init:		xe_guc_ct_init
+ * @xe_guc_log_init:		xe_guc_log_init
+ * @xe_pm_init_early:		xe_pm_init_early
+ * @xe_tile_init_early:		xe_tile_init_early
+ * @xe_uc_fw_init:		xe_uc_fw_init
+ * @xe_wa_init:			xe_wa_init
+ * @xe_wopcm_init:		xe_wopcm_init
+ * @xe_guc_relay_init:		xe_guc_relay_init
+ * @xe_sriov_init:		xe_sriov_init
  */
 static void
-inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
+inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
@@ -149,41 +161,39 @@ inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
 igt_main
 {
 	int fd;
-	FILE *file_injectable;
-	char line[MAX_LINE_SIZE];
-	char function_name[64];
 	char pci_slot[MAX_LINE_SIZE];
-	regex_t regex;
-	regmatch_t pmatch[2];
+	const struct section {
+		const char *name;
+	} probe_function_sections[] = {
+		{ "wait_for_lmem_ready" },
+		{ "xe_device_create" },
+		{ "xe_ggtt_init_early" },
+		{ "xe_guc_ads_init" },
+		{ "xe_guc_ct_init" },
+		{ "xe_guc_log_init" },
+		{ "xe_pm_init_early" },
+		{ "xe_tile_init_early" },
+		{ "xe_uc_fw_init" },
+		{ "xe_wa_init" },
+		{ "xe_wopcm_init" },
+		{ "xe_guc_relay_init" },
+		{ "xe_sriov_init" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(function_error_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
-		file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
-		igt_assert(file_injectable);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
-		igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
 	}
 
-	/*
-	 * Iterate over each error injectable function of the xe module
-	 */
-	igt_subtest_with_dynamic("inject-fault-probe") {
-		while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
-			if (regexec(&regex, line, 2, pmatch, 0) == 0) {
-				strcpy(function_name, line);
-				function_name[pmatch[1].rm_eo - 1] = '\0';
-				igt_dynamic_f("function-%s", function_name)
-					inject_fault_try_bind(fd, pci_slot, function_name);
-			}
-		}
-	}
+	for (const struct section *s = probe_function_sections; s->name; s++)
+		igt_subtest_f("inject-fault-probe-function-%s", s->name)
+			inject_fault_probe(fd, pci_slot, s->name);
 
 	igt_fixture {
-		regfree(&regex);
-		fclose(file_injectable);
 		cleanup_injection_fault();
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
-- 
2.43.0

