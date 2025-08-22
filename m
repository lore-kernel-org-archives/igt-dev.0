Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57721CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 20:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D97E10EBB2;
	Fri, 22 Aug 2025 20:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oD7wDYM3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B697710EBB5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 20:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755896230; x=1787432230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EhMZiwEkaLhSC9jZGs/DHx/SGYHUgdk703G4GmwoBRs=;
 b=oD7wDYM3/Mxw2gZXhMj4sMZfWjqOew3vZFcseKhOZVb3N3K8B7OsZHlu
 nrqZah+H0bJzY6ao5etwcBAwR2plFHOMuswYf0hLtNDB6rFsvrvVZBQrX
 q0vb8k9ZyVGfmQHtR0kA/bTytBf65uayL3ZOMrLL5Ogblj2QWkGJXSn8Z
 rdUq/YyjW1+RUK2uEEfd2yhZMIn28Ele0H2ETRlSz3+BiqCRAVPyUGS4O
 uzOPItxtmxk+NYScgYbc6SCk7v2FZpBSXoFJiKH8KWceUv14DHzqORtAk
 lL4ZZ2o5dMc5izQAbx0mOIy+o9+zcWd0VayBnfIBIOk9K7ISrY1ootZwX Q==;
X-CSE-ConnectionGUID: qJKProXxSGGOFoTIsuGcKQ==
X-CSE-MsgGUID: /kUcXAObSdyWtZoc28PCdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58306989"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58306989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:09 -0700
X-CSE-ConnectionGUID: 2NkQ+RP8Sge312YH8bC7Bw==
X-CSE-MsgGUID: liYkqMmgTsCgvcWvVE94gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172989857"
Received: from dut4086lnl.fm.intel.com ([10.105.10.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:08 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 1/4] lib/xe: Add fault injection helper functions
Date: Fri, 22 Aug 2025 20:57:07 +0000
Message-ID: <20250822205706.167042-7-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822205706.167042-6-jonathan.cavitt@intel.com>
References: <20250822205706.167042-6-jonathan.cavitt@intel.com>
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

Move several functions from the xe_fault_injection test suite to their
own helper function.  Specifically, the following functions were
migrated over:

- fail_function_injection_enabled
- ignore_dmesg_errors_from_dut
- injection_list_add
- injection_list_append
- injection_list_remove
- injection_list_clear
- setup_injection_fault
- get_remaining_injection_count
- set_retval

Several functions were renamed during the migration process to unify the
namespace.  Additionally, a new function, injection_exit_handler, was
added, which performs the same functionality that the function call
'igt_install_exit_handler(cleanup_injection_fault);' performed before.

The declaration for struct fault_injection_params was also moved over,
as well as a default param setup.

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/meson.build                  |   1 +
 lib/xe/xe_fault_injection.c      | 169 +++++++++++++++++++++++
 lib/xe/xe_fault_injection.h      |  53 ++++++++
 tests/intel/xe_fault_injection.c | 221 +++----------------------------
 4 files changed, 239 insertions(+), 205 deletions(-)
 create mode 100644 lib/xe/xe_fault_injection.c
 create mode 100644 lib/xe/xe_fault_injection.h

diff --git a/lib/meson.build b/lib/meson.build
index f078dad4e5..21bc977e94 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -116,6 +116,7 @@ lib_sources = [
 	'igt_msm.c',
 	'igt_dsc.c',
 	'igt_hook.c',
+        'xe/xe_fault_injection.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_legacy.c',
diff --git a/lib/xe/xe_fault_injection.c b/lib/xe/xe_fault_injection.c
new file mode 100644
index 0000000000..74e9c384ae
--- /dev/null
+++ b/lib/xe/xe_fault_injection.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "xe/xe_fault_injection.h"
+#include "xe/xe_ioctl.h"
+
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
+/*
+ * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
+ */
+bool fail_function_injection_enabled(void)
+{
+	char *contents;
+	int dir;
+
+	dir = fail_function_open();
+	if (dir < 0)
+		return false;
+
+	contents = igt_sysfs_get(dir, "injectable");
+	if (!contents)
+		return false;
+
+	free(contents);
+
+	return true;
+}
+
+void injection_ignore_dmesg_errors_from_dut(const char pci_slot[])
+{
+	/*
+	 * Driver probe is expected to fail in all cases.
+	 * Additionally, error-level reports are expected,
+	 * so ignore these in igt_runner.
+	 */
+	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
+	char regex[1024];
+
+	/* Only block dmesg reports that target the pci slot of the given fd */
+	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
+
+	igt_emit_ignore_dmesg_regex(regex);
+}
+
+void injection_list_add(const char function_name[])
+{
+	int dir;
+
+	dir = fail_function_open();
+
+	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
+
+	close(dir);
+}
+
+void injection_list_append(const char function_name[])
+{
+	int dir, fd, ret;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
+	igt_assert_lte(0, fd);
+	ret = write(fd, function_name, strlen(function_name));
+	igt_assert_lte(0, ret);
+
+	close(fd);
+	close(dir);
+}
+
+void injection_list_remove(const char function_name[])
+{
+	int dir;
+
+	dir = fail_function_open();
+
+	igt_assert_lte(0, dir);
+	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
+
+	close(dir);
+}
+
+void injection_list_clear(void)
+{
+	/* If nothing specified (‘’) injection list is cleared */
+	return injection_list_add("");
+}
+
+/*
+ * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
+ */
+void injection_setup_fault(const struct fault_injection_params *fault_params)
+{
+	int dir;
+
+	if (!fault_params)
+		fault_params = &default_fault_params;
+
+	igt_assert(fault_params->probability >= 0);
+	igt_assert(fault_params->probability <= 100);
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
+		  fault_params->probability, fault_params->interval,
+		  fault_params->times, fault_params->space);
+
+	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
+	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
+	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
+	igt_sysfs_set_s32(dir, "times", fault_params->times);
+	igt_sysfs_set_u32(dir, "space", fault_params->space);
+	igt_sysfs_set_u32(dir, "verbose", 1);
+
+	close(dir);
+}
+
+int injection_get_remaining_count(void)
+{
+	int dir, val;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	val = igt_sysfs_get_s32(dir, "times");
+
+	close(dir);
+	return val;
+}
+
+void injection_set_retval(const char function_name[], long long retval)
+{
+	char path[96];
+	int dir;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	sprintf(path, "%s/retval", function_name);
+	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
+
+	close(dir);
+}
diff --git a/lib/xe/xe_fault_injection.h b/lib/xe/xe_fault_injection.h
new file mode 100644
index 0000000000..83b36d5087
--- /dev/null
+++ b/lib/xe/xe_fault_injection.h
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+struct fault_injection_params {
+	/* @probability: Likelihood of failure injection, in percent. */
+	uint32_t probability;
+	/* @interval: Specifies the interval between failures */
+	uint32_t interval;
+	/* @times: Specifies how many times failures may happen at most */
+	int32_t times;
+	/*
+	 * @space: Specifies how many times fault injection is suppressed before
+	 * first injection
+	 */
+	uint32_t space;
+};
+
+/*
+ * Default fault injection parameters which injects fault on first call to the
+ * configured fail_function.
+ */
+static const struct fault_injection_params default_fault_params = {
+	.probability = 100,
+	.interval = 0,
+	.times = -1,
+	.space = 0
+};
+
+bool fail_function_injection_enabled(void);
+
+void injection_ignore_dmesg_errors_from_dut(const char pci_slot[]);
+
+void injection_list_add(const char function_name[]);
+void injection_list_append(const char function_name[]);
+void injection_list_remove(const char function_name[]);
+void injection_list_clear(void);
+
+void injection_setup_fault(const struct fault_injection_params *fault_params);
+
+int injection_get_remaining_count(void);
+void injection_set_retval(const char function_name[], long long retval);
+
+static void cleanup_injection_fault(int sig)
+{
+	injection_list_clear();
+}
+
+static inline void injection_exit_handler(void)
+{
+	igt_install_exit_handler(cleanup_injection_fault);
+}
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 04de2bfd54..8fe4f1953a 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -20,6 +20,7 @@
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_pat.h"
+#include "xe/xe_fault_injection.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_oa.h"
 #include "xe/xe_query.h"
@@ -31,203 +32,13 @@
 #define MAX_INJECTIONS_PER_ITER	100
 
 int32_t inject_iters_raw;
-struct fault_injection_params {
-	/* @probability: Likelihood of failure injection, in percent. */
-	uint32_t probability;
-	/* @interval: Specifies the interval between failures */
-	uint32_t interval;
-	/* @times: Specifies how many times failures may happen at most */
-	int32_t times;
-	/*
-	 * @space: Specifies how many times fault injection is suppressed before
-	 * first injection
-	 */
-	uint32_t space;
-};
-
-static int fail_function_open(void)
-{
-	int debugfs_fail_function_dir_fd;
-	const char *debugfs_root;
-	char path[96];
-
-	debugfs_root = igt_debugfs_mount();
-	igt_assert(debugfs_root);
-
-	sprintf(path, "%s/fail_function", debugfs_root);
-
-	if (access(path, F_OK))
-		return -1;
-
-	debugfs_fail_function_dir_fd = open(path, O_RDONLY);
-	igt_debug_on_f(debugfs_fail_function_dir_fd < 0, "path: %s\n", path);
-
-	return debugfs_fail_function_dir_fd;
-}
-
-static void ignore_dmesg_errors_from_dut(const char pci_slot[])
-{
-	/*
-	 * Driver probe is expected to fail in all cases.
-	 * Additionally, error-level reports are expected,
-	 * so ignore these in igt_runner.
-	 */
-	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
-	char regex[1024];
-
-	/* Only block dmesg reports that target the pci slot of the given fd */
-	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
-
-	igt_emit_ignore_dmesg_regex(regex);
-}
-
-/*
- * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
- */
-static bool fail_function_injection_enabled(void)
-{
-	char *contents;
-	int dir;
-
-	dir = fail_function_open();
-	if (dir < 0)
-		return false;
-
-	contents = igt_sysfs_get(dir, "injectable");
-	if (contents == NULL)
-		return false;
-
-	free(contents);
-
-	return true;
-}
-
-static void injection_list_add(const char function_name[])
-{
-	int dir;
-
-	dir = fail_function_open();
-
-	igt_assert_lte(0, dir);
-	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "%s", function_name));
-
-	close(dir);
-}
-
-static void injection_list_append(const char function_name[])
-{
-	int dir, fd, ret;
-
-	dir = fail_function_open();
-	igt_assert_lte(0, dir);
-
-	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
-	igt_assert_lte(0, fd);
-	ret = write(fd, function_name, strlen(function_name));
-	igt_assert_lte(0, ret);
-
-	close(fd);
-	close(dir);
-}
-
-static void injection_list_remove(const char function_name[])
-{
-	int dir;
-
-	dir = fail_function_open();
-
-	igt_assert_lte(0, dir);
-	igt_assert_lte(0, igt_sysfs_printf(dir, "inject", "!%s", function_name));
-
-	close(dir);
-}
-
-static void injection_list_clear(void)
-{
-	/* If nothing specified (‘’) injection list is cleared */
-	return injection_list_add("");
-}
-
-/*
- * Default fault injection parameters which injects fault on first call to the
- * configured fail_function.
- */
-static const struct fault_injection_params default_fault_params = {
-	.probability = 100,
-	.interval = 0,
-	.times = -1,
-	.space = 0
-};
-
-/*
- * See https://docs.kernel.org/fault-injection/fault-injection.html#application-examples
- */
-static void setup_injection_fault(const struct fault_injection_params *fault_params)
-{
-	int dir;
-
-	if (!fault_params)
-		fault_params = &default_fault_params;
-
-	igt_assert(fault_params->probability >= 0);
-	igt_assert(fault_params->probability <= 100);
-
-
-	dir = fail_function_open();
-	igt_assert_lte(0, dir);
-
-	igt_debug("probability = %d, interval = %d, times = %d, space = %u\n",
-			fault_params->probability, fault_params->interval,
-			fault_params->times, fault_params->space);
-
-	igt_assert_lte(0, igt_sysfs_printf(dir, "task-filter", "N"));
-	igt_sysfs_set_u32(dir, "probability", fault_params->probability);
-	igt_sysfs_set_u32(dir, "interval", fault_params->interval);
-	igt_sysfs_set_s32(dir, "times", fault_params->times);
-	igt_sysfs_set_u32(dir, "space", fault_params->space);
-	igt_sysfs_set_u32(dir, "verbose", 1);
-
-	close(dir);
-}
-
-static void cleanup_injection_fault(int sig)
-{
-	injection_list_clear();
-}
-
-static int get_remaining_injection_count(void)
-{
-	int dir, val;
-
-	dir = fail_function_open();
-	igt_assert_lte(0, dir);
-
-	val = igt_sysfs_get_s32(dir, "times");
-
-	close(dir);
-	return val;
-}
-
-static void set_retval(const char function_name[], long long retval)
-{
-	char path[96];
-	int dir;
-
-	dir = fail_function_open();
-	igt_assert_lte(0, dir);
-
-	sprintf(path, "%s/retval", function_name);
-	igt_assert_lte(0, igt_sysfs_printf(dir, path, "%#016llx", retval));
-
-	close(dir);
-}
 
 static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
 {
 	if (strstr(function_name, "send_recv")) {
 		if (enable) {
 			injection_list_append("xe_is_injection_active");
-			set_retval("xe_is_injection_active", INJECT_ERRNO);
+			injection_set_retval("xe_is_injection_active", INJECT_ERRNO);
 		} else {
 			injection_list_remove("xe_is_injection_active");
 		}
@@ -266,9 +77,9 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
-	ignore_dmesg_errors_from_dut(pci_slot);
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
-	set_retval(function_name, INJECT_ERRNO);
+	injection_set_retval(function_name, INJECT_ERRNO);
 	ignore_fail_dump_in_dmesg(function_name, true);
 
 	igt_kmod_bind("xe", pci_slot);
@@ -307,7 +118,7 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
-		setup_injection_fault(fault_params);
+		injection_setup_fault(fault_params);
 		inject_fault_probe(fd, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 
@@ -315,7 +126,7 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 		 * if no injection occurred we've tested all the injection
 		 * points for this function and can therefore stop iterating.
 		 */
-		if (get_remaining_injection_count() == MAX_INJECTIONS_PER_ITER)
+		if (injection_get_remaining_count() == MAX_INJECTIONS_PER_ITER)
 			break;
 	}
 
@@ -351,9 +162,9 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
-	ignore_dmesg_errors_from_dut(pci_slot);
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
-	set_retval(function_name, INJECT_ERRNO);
+	injection_set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
 	injection_list_remove(function_name);
 
@@ -387,9 +198,9 @@ vm_create_fail(int fd, const char pci_slot[],
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
-	ignore_dmesg_errors_from_dut(pci_slot);
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
-	set_retval(function_name, INJECT_ERRNO);
+	injection_set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
 	injection_list_remove(function_name);
 
@@ -450,9 +261,9 @@ vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
-	ignore_dmesg_errors_from_dut(pci_slot);
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
-	set_retval(function_name, INJECT_ERRNO);
+	injection_set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
 	injection_list_remove(function_name);
 
@@ -499,9 +310,9 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-	ignore_dmesg_errors_from_dut(pci_slot);
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
-	set_retval(function_name, INJECT_ERRNO);
+	injection_set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
 	injection_list_remove(function_name);
 
@@ -611,8 +422,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		devid = intel_get_drm_devid(fd);
 		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
-		setup_injection_fault(&default_fault_params);
-		igt_install_exit_handler(cleanup_injection_fault);
+		injection_setup_fault(&default_fault_params);
+		injection_exit_handler();
 		is_vf_device = intel_is_vf_device(fd);
 	}
 
-- 
2.43.0

