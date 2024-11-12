Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2A6D41D4D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C52A10E5ED;
	Tue, 12 Nov 2024 13:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWgo1dh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2D10E5EE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418253; x=1762954253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/mrVwxg4kw1+sbgMkXoPigMKTF4RfqtkjtE00pCUHXA=;
 b=DWgo1dh/H2InaONy2QO5a0CLoDrFds+Co/IHMLBSEm6AmZ068DNTAZAC
 h1MAR4qvTKNBoe19p4xE/lcXwnY6kGMS3hoeAkpAbheqii0d96pCbiv70
 mmlkPmJ8PlCdhxQTqZ+X+178YIg4uPUit0NQvAVlti5iafuMgr9atbJoD
 FNcPyLxD7uYFcmmuRXTOC31r1dvrV/4kPLyVx4U6BY+h4fnoySORccsji
 VK0JhpuhIxGegNK4gJ0+uThf6HIWFyOtPVLwPtXQvhorktDAI9T1f5qCJ
 GXrkhoMtFwklkOSo26M07DcayXm4E2H22jiFgp5Hx+4DKX0BamGSSOV4Y Q==;
X-CSE-ConnectionGUID: UIJ1iblLQIyiOHKhCA/qCg==
X-CSE-MsgGUID: zbN20bO/Q9+vQhuK/rEM8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34118267"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34118267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:53 -0800
X-CSE-ConnectionGUID: cbzaTfWcQXenH3MTguDlpg==
X-CSE-MsgGUID: Id87IBeGSTqmRoiaGWzrOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92237859"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:48 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t,
 v3 3/5] tests/intel/xe_fault_injection: Use igt_sysfs helpers
Date: Tue, 12 Nov 2024 14:29:52 +0100
Message-ID: <20241112133034.1919573-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112133034.1919573-1-francois.dugast@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
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

v2: Keep verbose value to 1 (Rodrigo Vivi)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 127 +++++++++++++++----------------
 1 file changed, 61 insertions(+), 66 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index aca3f1ce9..f99cc48c6 100644
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
+	igt_sysfs_set_u32(dir, "verbose", 1);
 
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

