Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF0AC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:36:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530E010E02E;
	Tue,  3 Jun 2025 19:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ls3lDYoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AE710E02E
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979402; x=1780515402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yhThhv+pH8q/k/OgDpkgppNZ1d5zkILINMKZOWAXsDQ=;
 b=Ls3lDYoA40BHfHjIb08XAVT9TA2Z6RKkJ8vK5IqZut/Cy0gYrnMyCONi
 88zYmIfN7YpyNHo2N96KxMyjR53doXGvqYSDLhuL40EgjoLQZXEDUotol
 rqQZk4rTlAzGEm34pGUtQfYVUO0XHR2GLanBGMUHJ1yDUoUU9dQCyVNhZ
 CE2W3FYUWC88YbqOKFQEeGdwicO1pHuk2yUVc6epbfmYhuGsSpzNcdplC
 g5T9mMj/abg0BWMtdh9rCHV6PRwJr24UVDF4omSxnaPpoqbGfDOS0d0Zr
 hzi71eUJgIDJ1ldYfO9p+l4ovfsmk86tAn/XoNcixv4aoubEN9bMbQuf5 w==;
X-CSE-ConnectionGUID: mqBULkpITtCyvQGGq66iSw==
X-CSE-MsgGUID: mcHuQYIEQcONkvAu5Rxy8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53663617"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="53663617"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:36:41 -0700
X-CSE-ConnectionGUID: jrUmNrgDQH6ve9BXTjRGZA==
X-CSE-MsgGUID: 9DupoYyHRbKXxSEL7xN2Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="149846553"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4028PTLH.fm.intel.com) ([10.105.10.130])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:36:40 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
Subject: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors while
 injecting fault
Date: Tue,  3 Jun 2025 19:36:39 +0000
Message-ID: <20250603193640.630957-1-jonathan.cavitt@intel.com>
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
 lib/igt_core.c                   | 27 ++++++++++++++++++++++++
 lib/igt_core.h                   |  1 +
 tests/intel/xe_fault_injection.c | 36 +++++---------------------------
 3 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b06cdfd894..e666660ff3 100644
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

