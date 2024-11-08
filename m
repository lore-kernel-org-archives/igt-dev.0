Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD65D5C0F4
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABE710E9F8;
	Fri,  8 Nov 2024 16:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZFI5Xbmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DE610E9EB
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081637; x=1762617637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CLuwRzaUBNZEhKI5oZ/MCrBATV1YvE1/LubCUlCUhKM=;
 b=ZFI5Xbmcx4bmnvcxXefalJw6l1TYpr07t62m55Q9zX8Eoih9uXvfiHit
 g0BXHqAbOacxoTqdV5dLPUM5XtLIttJhj++JxtzT8O6WZ9kWpPU5UYf0C
 pGL8nhLfSKkHQVCUih6dljpZ4Z8S5Z3MD81M0Uaww3y0FTelqfus8BUZj
 1gNq6dknl601J/kwfeZwIRESrZmrP4htd4/M2xR2JFypMdlt0qtpMObB4
 qFfOoLb5OdcM6nhX+YUq21i1peOEw2behGbJdUzADgK6O/E0ZDpmMemNM
 shWi70Bb/DIG3R3ZRh5cT9esENkKHkxzP1iLRT9+HDaiLKRZepI4C1rF3 w==;
X-CSE-ConnectionGUID: HBhd6Q/CR8avrYJeZYD8BQ==
X-CSE-MsgGUID: gKfQTu7WSVG4I2Q26e6fhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738373"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:36 -0800
X-CSE-ConnectionGUID: zce53x63R5+H96Wz4dUJ+w==
X-CSE-MsgGUID: q0zQipbMSkuQUffUpJBC0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86422995"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:34 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] tests/intel/xe_fault_injection: Use a static list
 of functions
Date: Fri,  8 Nov 2024 16:59:29 +0100
Message-ID: <20241108160021.1202234-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108160021.1202234-1-francois.dugast@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
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

