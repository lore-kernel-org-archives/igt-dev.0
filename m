Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF0BC5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 16:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13C3610E759;
	Wed,  4 Jun 2025 16:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1KwviS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7533810E759
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 16:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749053965; x=1780589965;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZJZ1zUNNF6v0oSMlFFM9dSL0pDayA3P6uE57t1wtqTw=;
 b=X1KwviS+u+9ct/CUj8oSipOMVw4iVOJ6FMQBhcIgaVl5wiFTrwADL0yR
 uAAYRonDUEvv2dRYMHnIWIgVmpH4rfnkwzkm1hg38iI7uaBT2BVrf3O/O
 6655hPOJbUStKuPdMsSYUzJfhzsDIZpddHkW/tgS2n7o2FIVimcj0AgJu
 4eTw1HPp7YNE5ghYRXvRmkjWYNkmGtHiyDOJY7vl6L0dERIO+Igc2oVIV
 mZngAtcLUNafg5WiNI7A98tR6InMm6Io+nt4KVZM8vZiln7/cHVcsetVk
 74enIMMVGKrC1lSXVkOpw/Ox+R/qTXbqi3gaytK0hMnzfbH1UO1bDSWm4 w==;
X-CSE-ConnectionGUID: wMVbT0h7S9Sd+yTuNxsTPA==
X-CSE-MsgGUID: XvlnR49eRxOsW+hOQAS9gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="73679994"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="73679994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:19:24 -0700
X-CSE-ConnectionGUID: 2+Op8/RRR/uT6ZtJ0uaqkA==
X-CSE-MsgGUID: 4qiE+bntQ6y7VeWunKNL1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="149067953"
Received: from live-gta-imageloader.fm.intel.com (HELO
 DUT4041PTLH.fm.intel.com) ([10.105.10.101])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 09:19:23 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 satyanarayana.k.v.p@intel.com, michal.wajdeczko@intel.com,
 daniele.ceraolospurio@intel.com, lucas.demarchi@intel.com,
 francois.dugast@intel.com, rodrigo.vivi@intel.com,
 john.c.harrison@intel.com, kamil.konieczny@linux.intel.com
Subject: [PATCH v3] tests/intel/xe_fault_injection: Ignore all errors while
 injecting fault
Date: Wed,  4 Jun 2025 16:19:23 +0000
Message-ID: <20250604161923.38226-1-jonathan.cavitt@intel.com>
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

v4:
- Return ignore_faults_in_dmesg to tests/intel/xe_fault_injection.c, but
  keep it renamed to ignore_dmesg_errors_from_dut (Kamil)

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c                   |  1 +
 tests/intel/xe_fault_injection.c | 39 ++++++++++++--------------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index b06cdfd894..ad70718b4a 100644
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
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9fe6bfe351..14aaeebf5e 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -64,28 +64,19 @@ static int fail_function_open(void)
 	return debugfs_fail_function_dir_fd;
 }
 
-static bool function_is_part_of_guc(const char function_name[])
+static void ignore_dmesg_errors_from_dut(int fd)
 {
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
 	/*
-	 * If GuC module fault is injected, GuC is expected to fail,
-	 * so also ignore GuC init failures in igt_runner.
+	 * Driver probe is expected to fail in all cases, so ignore in igt_runner.
+	 * Additionally, all error-level reports are expected, so ignore those as well.
 	 */
-	if (function_is_part_of_guc(function_name)) {
-		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
-	}
+	static const char *store = "probe with driver xe failed with error|\\*ERROR\\*";
+	char pci_slot[NAME_MAX];
+	char regex[1024];
+
+	/* Only block dmesg reports that target the pci slot of the given fd */
+	igt_device_get_pci_slot_name(fd, pci_slot);
+	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
 
 	igt_emit_ignore_dmesg_regex(regex);
 }
@@ -234,7 +225,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 
@@ -299,7 +290,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
@@ -334,7 +325,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
@@ -397,7 +388,7 @@ vm_bind_fail(int fd, const char function_name[])
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
@@ -445,7 +436,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
-- 
2.43.0

