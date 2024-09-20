Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0F6C7883E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 13:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC1110E0D9;
	Fri, 20 Sep 2024 13:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNqPL0tx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A785610E0D9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 13:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726838369; x=1758374369;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E4HnT0kAwwQb5gNrE2LCR3vIE3Q845ufMwVrO2abkw0=;
 b=dNqPL0tx4slMde6dfYUZ4CIVotwmxLcETcmoSfm4u8XsuE6f1lZE2YvX
 x8WZuaSYHnW4m9PZqOuI8lmoVRsTLrKQ/ZEX6sgKUJSoCTSXLP9LUA0g+
 ZYf4I+YuNTK/0UUrzGGZbJc+ownPGYCsFfO4KaRkgm5xefyZEOkjk58fh
 tGMftjtUrNqPNb71DHxiFXAxKx0MseIVmAUCNMH7O/zIWBJKIVq/xuxZR
 R5qt5kZq/N5rr3L22m5mxSAwyyPasaJt5IHvQWyR0+zhQcVlwzEh04aH4
 sDkVPmInA3rA8FyOzj6iTBBvZf5RxMGM8NCkjK64VhUk0tNEyupkv/RTU w==;
X-CSE-ConnectionGUID: 99zJ9oarRWuaOhLmDbbH1Q==
X-CSE-MsgGUID: d5nnLQ2cToSIsN+CbvZXcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29738938"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29738938"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:19:28 -0700
X-CSE-ConnectionGUID: 4NsP9E1QQviYCQK1eNlpeA==
X-CSE-MsgGUID: Plj3xHLLTQiv87/cg1ABzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70299148"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.174])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:19:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Add new test for fault
 injection
Date: Fri, 20 Sep 2024 15:19:13 +0200
Message-ID: <20240920131913.3368381-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the kernel fault injection infrastructure to test error handling
of xe at probe time.

Add the following test:
    * "function-fault-injection"

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_fault_injection.c | 229 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 230 insertions(+)
 create mode 100644 tests/intel/xe_fault_injection.c

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
new file mode 100644
index 000000000..86fb6029d
--- /dev/null
+++ b/tests/intel/xe_fault_injection.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: Check fault injection
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: driver
+ * Test category: fault injection
+ */
+
+#include <regex.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#define MAX_LINE_SIZE			1024
+#define PATH_FUNCTIONS_INJECTABLE	"/sys/kernel/debug/fail_function/injectable"
+#define PATH_FUNCTIONS_INJECT		"/sys/kernel/debug/fail_function/inject"
+#define PATH_FUNCTIONS_RETVAL		"/sys/kernel/debug/fail_function/%s/retval"
+#define REGEX_XE_FUNCTIONS		"^(.+)\\[xe\\]"
+#define INJECT_ERRNO			-ENOMEM
+
+enum sysfs_action {
+	SYSFS_BIND,
+	SYSFS_UNBIND,
+};
+
+enum injection_list_action {
+	INJECTION_LIST_ADD,
+	INJECTION_LIST_REMOVE,
+};
+
+/*
+ * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
+ */
+static bool function_error_injection_enabled(void)
+{
+	FILE *file = fopen(PATH_FUNCTIONS_INJECTABLE, "rw");
+
+	if (file) {
+		fclose(file);
+		return true;
+	}
+
+	return false;
+}
+
+static int sysfs_do(enum sysfs_action action, const char pci_slot[])
+{
+	int sysfs;
+	int ret;
+
+	sysfs = open("/sys/bus/pci/drivers/xe", O_DIRECTORY);
+	igt_assert(sysfs);
+
+	switch(action) {
+	case SYSFS_BIND:
+		ret = igt_sysfs_set(sysfs, "bind", pci_slot);
+		break;
+	case SYSFS_UNBIND:
+		ret = igt_sysfs_set(sysfs, "unbind", pci_slot);
+		break;
+	default:
+		igt_assert(!"missing");
+	}
+
+	close(sysfs);
+
+	return ret;
+}
+
+static void injection_list_do(enum injection_list_action action, char function_name[])
+{
+	FILE *file_inject;
+
+	file_inject = fopen(PATH_FUNCTIONS_INJECT, "w");
+	igt_assert(file_inject);
+
+	switch(action) {
+	case INJECTION_LIST_ADD:
+		fprintf(file_inject, "%s", function_name);
+		break;
+	case INJECTION_LIST_REMOVE:
+		fprintf(file_inject, "!%s", function_name);
+		break;
+	default:
+		igt_assert(!"missing");
+	}
+
+	fclose(file_inject);
+}
+
+/*
+ * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
+ */
+static void setup_injection_fault(void)
+{
+	FILE *file;
+
+	file = fopen("/sys/kernel/debug/fail_function/task-filter", "w");
+	igt_assert(file);
+	fprintf(file, "N");
+	fclose(file);
+
+	file = fopen("/sys/kernel/debug/fail_function/probability", "w");
+	igt_assert(file);
+	fprintf(file, "100");
+	fclose(file);
+
+	file = fopen("/sys/kernel/debug/fail_function/interval", "w");
+	igt_assert(file);
+	fprintf(file, "0");
+	fclose(file);
+
+	file = fopen("/sys/kernel/debug/fail_function/times", "w");
+	igt_assert(file);
+	fprintf(file, "-1");
+	fclose(file);
+
+	file = fopen("/sys/kernel/debug/fail_function/space", "w");
+	igt_assert(file);
+	fprintf(file, "0");
+	fclose(file);
+
+	file = fopen("/sys/kernel/debug/fail_function/verbose", "w");
+	igt_assert(file);
+	fprintf(file, "1");
+	fclose(file);
+}
+
+static void cleanup_injection_fault(void)
+{
+	FILE *file;
+
+	file = fopen(PATH_FUNCTIONS_INJECT, "w");
+	igt_assert(file);
+	fprintf(file, "\n");
+	fclose(file);
+}
+
+static void set_retval(char function_name[], long long retval)
+{
+	FILE *file_retval;
+	char file_path[MAX_LINE_SIZE];
+
+	sprintf(file_path, PATH_FUNCTIONS_RETVAL, function_name);
+
+	file_retval = fopen(file_path, "w");
+	igt_assert(file_retval);
+
+	fprintf(file_retval, "%#016llx", retval);
+	fclose(file_retval);
+}
+
+static void inject_fault_try_bind(char pci_slot[], char function_name[])
+{
+	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
+		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
+
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	sysfs_do(SYSFS_BIND, pci_slot);
+	igt_assert_eq(-errno, INJECT_ERRNO);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+}
+
+/**
+ * SUBTEST: function-fault-injection-during-probe
+ * Description: inject an error in each injectable function then reprobe driver
+ */
+static void
+function_fault_injection_during_probe(void)
+{
+	FILE *file_injectable;
+	char line[MAX_LINE_SIZE];
+	char function_name[MAX_LINE_SIZE];
+	regex_t regex;
+	regmatch_t pmatch[2];
+	char pci_slot[MAX_LINE_SIZE];
+	int fd;
+
+	fd = drm_open_driver(DRIVER_XE);
+	igt_device_get_pci_slot_name(fd, pci_slot);
+	drm_close_driver(fd);
+
+	igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
+
+	file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
+	igt_assert(file_injectable);
+
+	sysfs_do(SYSFS_UNBIND, pci_slot);
+
+	/*
+	 * Iterate over each error injectable function of the xe module
+	 */
+	while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
+		if (regexec(&regex, line, 2, pmatch, 0) == 0) {
+			strcpy(function_name, line);
+			function_name[pmatch[1].rm_eo - 1] = '\0';
+			inject_fault_try_bind(pci_slot, function_name);
+		}
+	}
+
+	fclose(file_injectable);
+	regfree(&regex);
+}
+
+igt_main
+{
+	igt_fixture {
+		igt_require(function_error_injection_enabled());
+		setup_injection_fault();
+	}
+
+	igt_subtest("function-fault-injection") {
+		function_fault_injection_during_probe();
+	}
+
+	igt_fixture {
+		cleanup_injection_fault();
+		igt_xe_driver_unload();
+		igt_xe_driver_load(NULL);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 00556c9d6..cf0d4486e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -293,6 +293,7 @@ intel_xe_progs = [
 	'xe_exec_store',
 	'xe_exec_threads',
 	'xe_exercise_blt',
+	'xe_fault_injection',
 	'xe_gpgpu_fill',
 	'xe_gt_freq',
 	'xe_huc_copy',
-- 
2.43.0

