Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2FC5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC7410E021;
	Tue,  3 Jun 2025 16:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L05rfvUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF45710E091
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748967490; x=1780503490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aUZ8WFIKaaeu24GhNM2C9NxCGbh08Txrq3kanvGpPDc=;
 b=L05rfvUWrtWzxy36hdyOZspDfPrK1L+ReK6JQc3l77efec0sQ1+Xli6l
 ugk+vMT5yPl1M/X4kEV3sEkMS6UFu327GqKPegHhjeJcJng4hg7fSMh/g
 HH5/hVioBb/6MIKbQJXEL4hc76vlLpX+SbOBlDrMe9DqVEFStxUYo/rNm
 5MMmmESv5aEgMaEtLr59l+OKZPL2exbB+MXVFjjUObvxvCoozt0AwE7+E
 xonMKr1hrYoIHcZZ239pd/dINwEdulyerHsqL11mXjNhhGSMk9Zuv8xgL
 Sua4EIXnI814YKSpgduNwwnzFvteCZSTOaF+tTeTvZ8nQwQukvvNDKAwI w==;
X-CSE-ConnectionGUID: zvmW/c0DQBa8nk8CfbIi/Q==
X-CSE-MsgGUID: /+lv8g5XTb2mVRW1fu4jcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="38647966"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="38647966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:18:09 -0700
X-CSE-ConnectionGUID: Hzyh1qWeR6qUG6s6lUut0A==
X-CSE-MsgGUID: giSbJQgRTS6xPWoUMlIUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149681136"
Received: from dut4028ptlh.fm.intel.com ([10.105.10.130])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:18:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
Subject: [PATCH] tests/intel/xe_fault_injection: Ignore *ERROR* dmesg reports
Date: Tue,  3 Jun 2025 16:18:04 +0000
Message-ID: <20250603161804.283350-1-jonathan.cavitt@intel.com>
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

Fixes: 5dcf915415ee ("tests/intel/xe_fault_injection: Ignore expected errors")
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

---
 tests/intel/xe_fault_injection.c | 39 ++++++++++++--------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 9fe6bfe351..a4a08af5f7 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -64,28 +64,19 @@ static int fail_function_open(void)
 	return debugfs_fail_function_dir_fd;
 }
 
-static bool function_is_part_of_guc(const char function_name[])
+static void ignore_faults_in_dmesg(int fd)
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
+	char store[1024] = "probe with driver xe failed with error|\\*ERROR\\*";
+	char pci_slot[NAME_MAX];
+	char regex[1024];
+
+	/* All dmesg reports should only target the pci slot of the given fd */
+	igt_device_get_pci_slot_name(fd, pci_slot);
+	snprintf(regex, 1024, "%s:.*(%s)", pci_slot, store);
 
 	igt_emit_ignore_dmesg_regex(regex);
 }
@@ -234,7 +225,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_faults_in_dmesg(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 
@@ -299,7 +290,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_faults_in_dmesg(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
@@ -334,7 +325,7 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_faults_in_dmesg(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
@@ -397,7 +388,7 @@ vm_bind_fail(int fd, const char function_name[])
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_faults_in_dmesg(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
@@ -445,7 +436,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_faults_in_dmesg(fd);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
-- 
2.43.0

