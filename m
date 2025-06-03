Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D33BC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4710E8C4;
	Tue,  3 Jun 2025 19:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GjplYReh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECC410E8C4
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979076; x=1780515076;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AYhPlsAvHhdX1AqTQ6vmvLrY0fwWNO5i3atTxfbY3eQ=;
 b=GjplYRehv7rLycbEMkKPpqZ5BM2C3bAgdfk4N1iKcwjkwdPIR5HKfcSx
 XcZ29u3YvSg1qxvl7JmDVgrD8aFV/delXofd9eaN8NE7vqwwv5Fh3WBxK
 5OOotisJSfiT0F4w9jlGXvMELzW9TbVtfvp9PWRh+S4ZEqjuaxzTNw43a
 99TAE1edrMlCk6GZldRitOeKpYJUL40O3kBn0DjRJm21K8UsvIOcIXwvH
 lETk9Ka54xyOB/XAdyAn7LjymCUoOpAFuQcx4ZCCLAhCho/xGV1w2dalu
 BrHwCxRZsMFhOyEdwbgh/8RzawgmYHxKP+6wXx1B08v1AVsAxvLr/bbkH Q==;
X-CSE-ConnectionGUID: 1vKhYDzaQ8eGHmD6Hdcs7Q==
X-CSE-MsgGUID: MjGT4Eg8SEG7eYjB1XdjOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53663154"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="53663154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:31:16 -0700
X-CSE-ConnectionGUID: ZpVPiLLvREWuyVU8mCOqZg==
X-CSE-MsgGUID: aslaEB/aTguQIo4So03brg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150003994"
Received: from dut4028ptlh.fm.intel.com ([10.105.10.130])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:31:16 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
Subject: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors while
 injecting fault
Date: Tue,  3 Jun 2025 19:31:10 +0000
Message-ID: <20250603193110.625056-1-jonathan.cavitt@intel.com>
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

From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Currently, numerous fault messages have been included in the dmesg
ignore list, and this list continues to expand.  Each time a new fault
injection point is introduced or a new feature is activated, additional
fault messages appear, making it cumbersome to manage the dmesg ignore
list.

However, we can safely assert that all dmesg reports that contain
*ERROR* in their message can be ignored, so add them to the dmesg ignore
list.  This unfortunately does not include the device probe error
itself, so that must be added separately.

While we're here, we should also assert that any errors we see are only
coming from the target PCI device.

v2:
- Only ignore error-level dmesg reports (or, at least, reports with
  *ERROR* in them), and device probe failues
- Add PCI data to regex (Michal)

v3: (Michal)
- Revert name change
- Add change log
- Remove fixes tag from commit
- Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
  move to lib/igt_core.c
- Minor code fixes

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 lib/igt_core.c                   | 47 +++++++++++++++++++++++++-------
 lib/igt_core.h                   |  1 +
 tests/intel/xe_fault_injection.c | 36 ++++--------------------
 3 files changed, 43 insertions(+), 41 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b06cdfd894..ecc7bafab9 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -76,6 +76,7 @@
 #include "igt_rc.h"
 #include "igt_list.h"
 #include "igt_map.h"
+#include "igt_device.h"
 #include "igt_device_scan.h"
 #include "igt_thread.h"
 #include "igt_vec.h"
@@ -642,8 +643,8 @@ static void _igt_log_buffer_dump(void)
  *
  * Provides a way to replay the internal igt log buffer for inspection.
  * @check: A user-specified handler that gets invoked for each line of
- *         the log buffer. The handler should return true to stop
- *         inspecting the rest of the buffer.
+ * the log buffer. The handler should return true to stop
+ * inspecting the rest of the buffer.
  * @data: passed as a user argument to the inspection function.
  */
 void igt_log_buffer_inspect(igt_buffer_log_handler_t check, void *data)
@@ -1101,19 +1102,19 @@ static int common_init(int *argc, char **argv,
 	static struct option long_options[] = {
 		{"list-subtests",     no_argument,       NULL, OPT_LIST_SUBTESTS},
 		{"show-testlist",     no_argument,       NULL, OPT_SHOW_TESTLIST},
-		{"describe",          optional_argument, NULL, OPT_DESCRIBE_SUBTESTS},
+		{"describe",  optional_argument, NULL, OPT_DESCRIBE_SUBTESTS},
 		{"run-subtest",       required_argument, NULL, OPT_RUN_SUBTEST},
 		{"dynamic-subtest",   required_argument, NULL, OPT_RUN_DYNAMIC_SUBTEST},
 		{"help-description",  no_argument,       NULL, OPT_DESCRIPTION},
-		{"debug",             optional_argument, NULL, OPT_DEBUG},
+		{"debug",     optional_argument, NULL, OPT_DEBUG},
 		{"interactive-debug", optional_argument, NULL, OPT_INTERACTIVE_DEBUG},
 		{"skip-crc-compare",  no_argument,       NULL, OPT_SKIP_CRC},
 		{"trace-on-oops",     no_argument,       NULL, OPT_TRACE_OOPS},
-		{"hook",              required_argument, NULL, OPT_HOOK},
-		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
-		{"device",            required_argument, NULL, OPT_DEVICE},
-		{"version",           no_argument,       NULL, OPT_VERSION},
-		{"help",              no_argument,       NULL, OPT_HELP},
+		{"hook",      required_argument, NULL, OPT_HOOK},
+		{"help-hook", no_argument,       NULL, OPT_HELP_HOOK},
+		{"device",    required_argument, NULL, OPT_DEVICE},
+		{"version",   no_argument,       NULL, OPT_VERSION},
+		{"help",      no_argument,       NULL, OPT_HELP},
 		{0, 0, 0, 0}
 	};
 	char *short_opts;
@@ -3034,7 +3035,7 @@ static void fatal_sig_handler(int sig)
 
 		pthread_sigqueue(tid, sig, value);
 #endif
-        }
+}
 }
 
 /**
@@ -3581,6 +3582,32 @@ void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex)
 	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
 }
 
+/**
+ * igt_ignore_dmesg_errors_from_dut(int fd)
+ * @fd: The file directory
+ *
+ * Submits an igt_emit_ignore_dmesg_regex request targeting all error-level
+ * dmesg reports (or, at least, reports that contain the string *ERROR*),
+ * as well as any device probe errors, that are reported from the pci
+ * slot of the given file directory @fd
+ */
+void igt_ignore_dmesg_errors_from_dut(int fd)
+{
+	/*
+	 * Catch any dmesg reports that contain the substring "*ERROR*", as well as any
+	 * device probe errors.
+	 */
+	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
+	char pci_slot[NAME_MAX];
+	char regex[1024];
+
+	/* Only block dmesg reports that target the pci slot of the given fd */
+	igt_device_get_pci_slot_name(fd, pci_slot);
+	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
+
+	igt_emit_ignore_dmesg_regex(regex);
+}
+
 /**
  * @igt_measured_usleep: Helper to model accurate sleep time for tests
  * @usec: usec to sleep
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 2db579423c..f6affbaf57 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1599,6 +1599,7 @@ int igt_pci_system_reinit(void);
 void igt_pci_system_cleanup(void);
 
 void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
+void igt_ignore_dmesg_errors_from_dut(int fd);
 
 unsigned int igt_measured_usleep(unsigned int usec);
 #endif /* IGT_CORE_H */
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9fe6bfe351..594c1417a2 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -64,32 +64,6 @@ static int fail_function_open(void)
 	return debugfs_fail_function_dir_fd;
 }
 
-static bool function_is_part_of_guc(const char function_name[])
-{
-	return strstr(function_name, "_guc_") != NULL ||
-	       strstr(function_name, "_uc_") != NULL ||
-	       strstr(function_name, "_wopcm_") != NULL;
-}
-
-static void ignore_faults_in_dmesg(const char function_name[])
-{
-	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
-	char regex[1024] = "probe with driver xe failed with error -12";
-
-	/*
-	 * If GuC module fault is injected, GuC is expected to fail,
-	 * so also ignore GuC init failures in igt_runner.
-	 */
-	if (function_is_part_of_guc(function_name)) {
-		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
-	}
-
-	igt_emit_ignore_dmesg_regex(regex);
-}
-
 /*
  * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kernel.
  */
@@ -234,7 +208,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
-	ignore_faults_in_dmesg(function_name);
+	igt_ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 
@@ -299,7 +273,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
-	ignore_faults_in_dmesg(function_name);
+	igt_ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
@@ -334,7 +308,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	igt_ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
@@ -397,7 +371,7 @@ vm_bind_fail(int fd, const char function_name[])
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	igt_ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
@@ -445,7 +419,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	igt_ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
-- 
2.43.0

