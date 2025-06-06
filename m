Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CA4C61DB8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Jun 2025 18:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EB710EBD7;
	Fri,  6 Jun 2025 18:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PF4YZNht";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123B010EB28
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Jun 2025 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749234928; x=1780770928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oTasKrHIU814dSEr02VGRDsxaLSR0QOrYvHogCuoT7k=;
 b=PF4YZNhtr9miOzhFwJ2U3fJKiTBUzod3DrJvH8Vc7Cz/0JrbLW9KZagW
 J3GfKQ/st1aH5docxupPhkVBtTMVEtQRen98Q9FBuk87g72C6c0DUDTAR
 yNKUglkr1DlPT89VSYkKmR4iRgPyGvAVyOsDXNNTcvrKDZY16AW77kt4I
 VJPzXtNhmpJ8H+3BzPQGqaVlnL/ZPwBSEVKEJ7Fm2UTpY/U2SS3obJgTN
 DgKIMXlh0nBSXzSla0CHQBiXQr4QmQJ3ony/kOp8o3+pAP3hPLZatmCOt
 RVZ3qZsRYQ7Bv9C/6D95mV1/okwThVwsriK+VvJsyoH4UDM1E5qOWhgQh g==;
X-CSE-ConnectionGUID: rvl+5R5cTbiLcE+OGGwGgA==
X-CSE-MsgGUID: CZJvN0+zQLmyluajC/6F/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="76787105"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="76787105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:35:23 -0700
X-CSE-ConnectionGUID: MZqQRL39S+2roa0ly3yn1g==
X-CSE-MsgGUID: vRB47mrjREuSSR6+vnD7ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150769715"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.99])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 11:35:19 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v4 2/2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Date: Fri,  6 Jun 2025 18:35:19 +0000
Message-ID: <20250606183519.78736-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606183519.78736-1-jonathan.cavitt@intel.com>
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
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

v5:
- Pass preexisting pci name instead of attempting to regenerate it on
  each run of ignore_dmesg_errors_from_dut (Daniele)

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
 tests/intel/xe_fault_injection.c | 60 ++++++++++++++------------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 7a14ad1729..3166d95f55 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -64,28 +64,17 @@ static int fail_function_open(void)
 	return debugfs_fail_function_dir_fd;
 }
 
-static bool function_is_part_of_guc(const char function_name[])
+static void ignore_dmesg_errors_from_dut(const char pci_slot[])
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
+	char regex[1024];
+
+	/* Only block dmesg reports that target the pci slot of the given fd */
+	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
 
 	igt_emit_ignore_dmesg_regex(regex);
 }
@@ -234,7 +223,7 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 
@@ -291,7 +280,8 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
  */
 static void
 exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
-		const char function_name[], unsigned int flags)
+		       const char pci_slot[], const char function_name[],
+		       unsigned int flags)
 {
 	uint32_t exec_queue_id;
 	uint32_t vm = xe_vm_create(fd, flags, 0);
@@ -299,7 +289,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
 	xe_exec_queue_destroy(fd, exec_queue_id);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
@@ -330,11 +320,12 @@ simple_vm_create(int fd, unsigned int flags)
  * @xe_vm_create_scratch:	xe_vm_create_scratch
  */
 static void
-vm_create_fail(int fd, const char function_name[], unsigned int flags)
+vm_create_fail(int fd, const char pci_slot[],
+	       const char function_name[], unsigned int flags)
 {
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_create(fd, flags) != 0);
@@ -391,13 +382,13 @@ simple_vm_bind(int fd, uint32_t vm)
  * @xe_sync_entry_parse:		xe_sync_entry_parse
  */
 static void
-vm_bind_fail(int fd, const char function_name[])
+vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
 {
 	uint32_t vm = xe_vm_create(fd, 0, 0);
 
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert(simple_vm_bind(fd, vm) != 0);
@@ -415,7 +406,8 @@ vm_bind_fail(int fd, const char function_name[])
  * @xe_oa_alloc_regs:		xe_oa_alloc_regs
  */
 static void
-oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
+oa_add_config_fail(int fd, int sysfs, int devid,
+		   const char pci_slot[], const char function_name[])
 {
 	char path[512];
 	uint64_t config_id;
@@ -445,7 +437,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
 	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 
-	ignore_faults_in_dmesg(function_name);
+	ignore_dmesg_errors_from_dut(pci_slot);
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
@@ -564,27 +556,29 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
 		igt_subtest_f("vm-create-fail-%s", s->name)
-			vm_create_fail(fd, s->name, s->flags);
+			vm_create_fail(fd, pci_slot, s->name, s->flags);
 
 	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
 		igt_subtest_f("vm-bind-fail-%s", s->name)
-			vm_bind_fail(fd, s->name);
+			vm_bind_fail(fd, pci_slot, s->name);
 
 	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
 		igt_subtest_f("exec-queue-create-fail-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				if (hwe->engine_class != DRM_XE_ENGINE_CLASS_VM_BIND)
-					exec_queue_create_fail(fd, hwe, s->name, s->flags);
+					exec_queue_create_fail(fd, hwe, pci_slot,
+							       s->name, s->flags);
 
 	for (const struct section *s = exec_queue_create_vmbind_fail_functions; s->name; s++)
 		igt_subtest_f("exec-queue-create-fail-%s", s->name)
 			xe_for_each_engine(fd, hwe)
 				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
-					exec_queue_create_fail(fd, hwe, s->name, s->flags);
+					exec_queue_create_fail(fd, hwe, pci_slot,
+							       s->name, s->flags);
 
 	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
 		igt_subtest_f("oa-add-config-fail-%s", s->name)
-			oa_add_config_fail(fd, sysfs, devid, s->name);
+			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
 
 	igt_fixture {
 		igt_kmod_unbind("xe", pci_slot);
-- 
2.43.0

