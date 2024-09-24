Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19141CF9C72
	for <igt-dev@archiver.kernel.org>; Tue, 24 Sep 2024 19:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E0710E745;
	Tue, 24 Sep 2024 19:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLXf8Bnv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED910E748
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Sep 2024 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727207895; x=1758743895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GueLj8hBcerlIXa12lAl86YhzAYAhcdPAIKyGi8603k=;
 b=kLXf8BnvBQtPwQe8WEHRGUGax/uuf2vvL9pBQ2UgCWFyfQnTIbOeiEhn
 uTnvPyYQoZtP7nRIVhIRm/tj3qfAS53L/l1FBfRoGvyAgZgQ/w5TYBj7P
 fOQYcZ2BQB6zACmfmVacuNTNpmZyMY83vqZXLqTMOv61Z5haheXAyP0qL
 EztUWR0heYP0AwnP8rls5mtUJ86p1rXdfVb99VXt7IyHZRQREuyLBlfMR
 9oq++phVHzVIj2yMWZYNU1qm3dGOYbMK9tD/B7Y6mw0wXchGoaK8txI8K
 Z526W/tDGNC9SR74J3FtdS3UmPDhpe+6+zudaezhqeBn4+Aalg/sF351J A==;
X-CSE-ConnectionGUID: kIjTISs7SHGr9o4ibyKx/g==
X-CSE-MsgGUID: CIDwWk/aQQqteurQjhOTXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="25741474"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="25741474"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 12:58:15 -0700
X-CSE-ConnectionGUID: 3zFgBIqVSJCghot685Jz2Q==
X-CSE-MsgGUID: jkTiLkyUSLGl5dmBJ7eheQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="102294053"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.174])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 12:58:13 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t,
 v3 2/2] tests/intel/xe_fault_injection: Add new test for fault
 injection
Date: Tue, 24 Sep 2024 21:54:58 +0200
Message-ID: <20240924195754.102650-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240924195754.102650-1-francois.dugast@intel.com>
References: <20240924195754.102650-1-francois.dugast@intel.com>
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

v2: Fix mismatch between test name and documentation

v3: Use promoted function for bind, rework structure

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 tests/intel/xe_fault_injection.c | 200 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 201 insertions(+)
 create mode 100644 tests/intel/xe_fault_injection.c

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
new file mode 100644
index 000000000..987056a43
--- /dev/null
+++ b/tests/intel/xe_fault_injection.c
@@ -0,0 +1,200 @@
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
+static void inject_fault_try_bind(int fd, char pci_slot[], char function_name[])
+{
+	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
+		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
+
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
+	igt_assert_eq(-errno, INJECT_ERRNO);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+}
+
+/**
+ * SUBTEST: function-fault-injection-during-probe
+ * Description: inject an error in each injectable function then reprobe driver
+ * Functionality: fault
+ */
+static void
+function_fault_injection_during_probe(int fd, char pci_slot[])
+{
+	FILE *file_injectable;
+	char line[MAX_LINE_SIZE];
+	char function_name[MAX_LINE_SIZE];
+	regex_t regex;
+	regmatch_t pmatch[2];
+
+	igt_assert_eq(regcomp(&regex, REGEX_XE_FUNCTIONS, REG_EXTENDED), 0);
+
+	file_injectable = fopen(PATH_FUNCTIONS_INJECTABLE, "r");
+	igt_assert(file_injectable);
+
+	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
+
+	/*
+	 * Iterate over each error injectable function of the xe module
+	 */
+	while ((fgets(line, MAX_LINE_SIZE, file_injectable)) != NULL) {
+		if (regexec(&regex, line, 2, pmatch, 0) == 0) {
+			strcpy(function_name, line);
+			function_name[pmatch[1].rm_eo - 1] = '\0';
+			inject_fault_try_bind(fd, pci_slot, function_name);
+		}
+	}
+
+	fclose(file_injectable);
+	regfree(&regex);
+}
+
+igt_main
+{
+	int fd;
+	char pci_slot[MAX_LINE_SIZE];
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_device_get_pci_slot_name(fd, pci_slot);
+		igt_require(function_error_injection_enabled());
+		setup_injection_fault();
+	}
+
+	igt_subtest("function-fault-injection-during-probe") {
+		function_fault_injection_during_probe(fd, pci_slot);
+	}
+
+	igt_fixture {
+		drm_close_driver(fd);
+		cleanup_injection_fault();
+		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e5d8852f3..118a7afb9 100644
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

