Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC869D5C0F4
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC8210E9FC;
	Fri,  8 Nov 2024 16:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KX+D5nkc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E297410E9FC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081639; x=1762617639;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GV1pJLm1g2Pf3dAvZs499tqM4ymd9/6zM6nGiadB0M0=;
 b=KX+D5nkcl8IyDtQdGN01nKgUPbTADdHwcWq6bKv+WIdeVPgKhYQrKCV/
 uuPSq0lDFAIFudtUhwhy3ZNwJV7opfDTZv7p2aqQLI7iXDj3B7lFHOVu2
 JhOf7B0WKG4EePjTXuIyEjKvHE/pIDty4cz7RcAHNL+LuJe3H5w9VkJIX
 L9KV1eQ+8Yq8dKtemPF7MZUj/XLxgduMuf1wibnPWNxropy2ScDQNpOcd
 BHg/XOJeRqfNUqHbNIhcFrbty+1H7sVL15dOJALUe0WtoPWKEyJP5+fuC
 DyLGsjQpyj2bRZq31zps/BF1lUfFmdp44Jot7TAZh5JVbvjqkTfX0Jee8 A==;
X-CSE-ConnectionGUID: bs8OE3vMSF+xajB+Sn6saQ==
X-CSE-MsgGUID: xVpSxl7bQQKy9S3DFf9QeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738388"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:39 -0800
X-CSE-ConnectionGUID: /6mCrS0fSVeqfM+Ya8N6DA==
X-CSE-MsgGUID: SLKsLE4PR0ewaypoFhRyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86423017"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:37 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/xe_fault_injection: Use igt_sysfs
 helpers
Date: Fri,  8 Nov 2024 16:59:31 +0100
Message-ID: <20241108160021.1202234-4-francois.dugast@intel.com>
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

Make use of existing helpers from igt_sysfs where possible. This
improves robustness and removes code duplication.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 127 +++++++++++++++----------------
 1 file changed, 61 insertions(+), 66 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 891b4d70b..87e567a54 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -11,15 +11,13 @@
  * Test category: fault injection
  */
 
+#include <limits.h>
+
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
 
-#define MAX_LINE_SIZE			1024
-#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
-#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
-#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
 #define INJECT_ERRNO			-ENOMEM
 
 enum injection_list_action {
@@ -27,40 +25,66 @@ enum injection_list_action {
 	INJECTION_LIST_REMOVE,
 };
 
+static int fail_function_open(void)
+{
+	int debugfs_fail_function_dir_fd;
+	const char *debugfs_root;
+	char path[96];
+
+	debugfs_root = igt_debugfs_mount();
+	igt_assert(debugfs_root);
+
+	sprintf(path, "%s/fail_function", debugfs_root);
+
+	if (access(path, F_OK))
+		return -1;
+
+	debugfs_fail_function_dir_fd = open(path, O_RDONLY);
+	igt_debug_on_f(debugfs_fail_function_dir_fd < 0, "path: %s\n", path);
+
+	return debugfs_fail_function_dir_fd;
+}
+
 /*
  * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
  */
-static bool function_error_injection_enabled(void)
+static bool fail_function_injection_enabled(void)
 {
-	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
+	char *contents;
+	int dir;
 
-	if (file) {
-		fclose(file);
-		return true;
-	}
+	dir = fail_function_open();
+	if (dir < 0)
+		return false;
+
+	contents = igt_sysfs_get(dir, "injectable");
+	if (contents == NULL)
+		return false;
+
+	free(contents);
 
-	return false;
+	return true;
 }
 
 static void injection_list_do(enum injection_list_action action, const char function_name[])
 {
-	FILE *file_inject;
+	int dir;
 
-	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
-	igt_assert(file_inject);
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
 
 	switch(action) {
 	case INJECTION_LIST_ADD:
-		fprintf(file_inject, "%s", function_name);
+		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
 		break;
 	case INJECTION_LIST_REMOVE:
-		fprintf(file_inject, "!%s", function_name);
+		igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
 		break;
 	default:
 		igt_assert(!"missing");
 	}
 
-	fclose(file_inject);
+	close(dir);
 }
 
 /*
@@ -68,61 +92,33 @@ static void injection_list_do(enum injection_list_action action, const char func
  */
 static void setup_injection_fault(void)
 {
-	FILE *file;
-
-	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
-	igt_assert(file);
-	fprintf(file, "N");
-	fclose(file);
-
-	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
-	igt_assert(file);
-	fprintf(file, "100");
-	fclose(file);
-
-	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
-	igt_assert(file);
-	fprintf(file, "0");
-	fclose(file);
-
-	file = fopen("/sys/kernel/debug/fail_function/times", "w");
-	igt_assert(file);
-	fprintf(file, "-1");
-	fclose(file);
-
-	file = fopen("/sys/kernel/debug/fail_function/space", "w");
-	igt_assert(file);
-	fprintf(file, "0");
-	fclose(file);
-
-	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
-	igt_assert(file);
-	fprintf(file, "1");
-	fclose(file);
-}
+	int dir;
 
-static void cleanup_injection_fault(void)
-{
-	FILE *file;
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
+	igt_sysfs_set_u32(dir, "probability", 100);
+	igt_sysfs_set_u32(dir, "interval", 0);
+	igt_sysfs_set_s32(dir, "times", -1);
+	igt_sysfs_set_u32(dir, "space", 0);
+	igt_sysfs_set_u32(dir, "verbose", 0);
 
-	file = fopen(PATH_FUNCTIONS_INJECT, "w");
-	igt_assert(file);
-	fprintf(file, "\n");
-	fclose(file);
+	close(dir);
 }
 
 static void set_retval(const char function_name[], long long retval)
 {
-	FILE *file_retval;
-	char file_path[MAX_LINE_SIZE];
+	char path[96];
+	int dir;
 
-	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
 
-	file_retval = fopen(file_path, "w");
-	igt_assert(file_retval);
+	sprintf(path, "%s/retval", function_name);
+	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
 
-	fprintf(file_retval, "%#016llx", retval);
-	fclose(file_retval);
+	close(dir);
 }
 
 /**
@@ -161,7 +157,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 igt_main
 {
 	int fd;
-	char pci_slot[MAX_LINE_SIZE];
+	char pci_slot[NAME_MAX];
 	const struct section {
 		const char *name;
 	} probe_function_sections[] = {
@@ -182,7 +178,7 @@ igt_main
 	};
 
 	igt_fixture {
-		igt_require(function_error_injection_enabled());
+		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
@@ -194,7 +190,6 @@ igt_main
 			inject_fault_probe(fd, pci_slot, s->name);
 
 	igt_fixture {
-		cleanup_injection_fault();
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
 	}
-- 
2.43.0

