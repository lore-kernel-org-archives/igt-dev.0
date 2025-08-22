Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E0ACA0EED
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 20:57:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6734A10EBBA;
	Fri, 22 Aug 2025 20:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l4APHPek";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FE010EBB2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755896230; x=1787432230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WhOS69jKUGaVJ0sDtALyAVzSg1qGtKpvnY8a+0Zesng=;
 b=l4APHPekwJqEhFH9mGz8/zUd5vHAjtRmIF9SN6nfDKzpztAxUDvrGVNz
 Mjz4jCAylENg/VG4WzfRqVv9/Dkb6QijH5bckYNvNGDDsPqmtbfQutNUH
 CDu5z1HlV/C3TYhhzvg6OSBKBqEeNhkn/Y2esoEPNNfULU2fS8hgW56ID
 nWRDKaVrXx00Wi9T/swibbRgyYWSPk9OZCNO5ffB3r/MQe1PYXSxN/UGd
 R1T3kpE5fQ6QiG664AGfcuW6g65G/TzF3y8hk1epwGxsdscX6rw5eoi1Y
 W/hb4V1/z8EWENh0O3IZM90quhuV2+tYXUUmMg0t34SWH3HZjK9/qTTfo w==;
X-CSE-ConnectionGUID: a3Wd1ITURLOHNNpfJDkxGg==
X-CSE-MsgGUID: 31S1zGjvTt+5E5tHt1Ptbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58306993"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58306993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:10 -0700
X-CSE-ConnectionGUID: /S9NSzIKQHOr+Yfd45sL/Q==
X-CSE-MsgGUID: nYp4MnAaSz+i4yEWywt3cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="172989866"
Received: from dut4086lnl.fm.intel.com ([10.105.10.28])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 13:57:09 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH 4/4] tests/intel/xe_vm: Move vm fault tests from
 xe_fault_injection to xe_vm
Date: Fri, 22 Aug 2025 20:57:10 +0000
Message-ID: <20250822205706.167042-10-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250822205706.167042-6-jonathan.cavitt@intel.com>
References: <20250822205706.167042-6-jonathan.cavitt@intel.com>
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

Move the fault injection tests that exercise the xe vm ioctl from the
xe_fault_injection test suite to the xe_vm test suite.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_fault_injection.c | 121 ---------------------------
 tests/intel/xe_vm.c              | 138 +++++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+), 121 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 92b09cbb90..06b7bcab3d 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -172,104 +172,6 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
 	xe_exec_queue_destroy(fd, exec_queue_id);
 }
 
-static int
-simple_vm_create(int fd, unsigned int flags)
-{
-	struct drm_xe_vm_create create = {
-		.flags = flags,
-	};
-
-	return igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
-}
-
-/**
- * SUBTEST: vm-create-fail-%s
- * Description: inject an error in function %arg[1] used in vm create IOCTL to make it fail
- * Functionality: fault
- *
- * arg[1]:
- * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
- * @xe_pt_create:		xe_pt_create
- * @xe_vm_create_scratch:	xe_vm_create_scratch
- */
-static void
-vm_create_fail(int fd, const char pci_slot[],
-	       const char function_name[], unsigned int flags)
-{
-	igt_assert_eq(simple_vm_create(fd, flags), 0);
-
-	injection_ignore_dmesg_errors_from_dut(pci_slot);
-	injection_list_add(function_name);
-	injection_set_retval(function_name, INJECT_ERRNO);
-	igt_assert(simple_vm_create(fd, flags) != 0);
-	injection_list_remove(function_name);
-
-	igt_assert_eq(simple_vm_create(fd, flags), 0);
-}
-
-static int
-simple_vm_bind(int fd, uint32_t vm)
-{
-	struct {
-		uint32_t batch[16];
-		uint64_t pad;
-		uint32_t data;
-	} *data;
-	struct drm_xe_sync syncobj = {
-		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
-		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
-		.handle = syncobj_create(fd, 0),
-	};
-	struct drm_xe_vm_bind bind = {
-		.vm_id = vm,
-		.num_binds = 1,
-		.bind.obj = 0,
-		.bind.range = BO_SIZE,
-		.bind.addr = BO_ADDR,
-		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
-		.bind.pat_index = intel_get_pat_idx_wb(fd),
-		.bind.flags = 0,
-		.num_syncs = 1,
-		.syncs = (uintptr_t)&syncobj,
-		.exec_queue_id = 0,
-	};
-
-	data = aligned_alloc(xe_get_default_alignment(fd), BO_SIZE);
-	bind.bind.obj_offset = to_user_pointer(data);
-
-	return igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
-}
-
-/**
- * SUBTEST: vm-bind-fail-%s
- * Description: inject an error in function %arg[1] used in vm bind IOCTL
- *		to make it fail
- * Functionality: fault
- *
- * arg[1]:
- * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
- * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
- * @xe_pt_update_ops_prepare:		xe_pt_update_ops_prepare
- * @xe_pt_update_ops_run:		xe_pt_update_ops_run
- * @xe_vma_ops_alloc:			xe_vma_ops_alloc
- * @xe_sync_entry_parse:		xe_sync_entry_parse
- */
-static void
-vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
-{
-	uint32_t vm = xe_vm_create(fd, 0, 0);
-
-	igt_assert_eq(simple_vm_bind(fd, vm), 0);
-
-	injection_ignore_dmesg_errors_from_dut(pci_slot);
-	injection_list_add(function_name);
-	injection_set_retval(function_name, INJECT_ERRNO);
-	igt_assert(simple_vm_bind(fd, vm) != 0);
-	injection_list_remove(function_name);
-
-	igt_assert_eq(simple_vm_bind(fd, vm), 0);
-}
-
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	int in_param;
@@ -325,21 +227,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ "xe_wopcm_init", 0, true },
 		{ }
 	};
-	const struct section vm_create_fail_functions[] = {
-		{ "xe_exec_queue_create_bind", 0 },
-		{ "xe_pt_create", 0 },
-		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
-		{ }
-	};
-	const struct section vm_bind_fail_functions[] = {
-		{ "vm_bind_ioctl_ops_create" },
-		{ "vm_bind_ioctl_ops_execute" },
-		{ "xe_pt_update_ops_prepare" },
-		{ "xe_pt_update_ops_run" },
-		{ "xe_vma_ops_alloc" },
-		{ "xe_sync_entry_parse" },
-		{ }
-	};
 
 	const struct section exec_queue_create_fail_functions[] = {
 		{ "xe_exec_queue_create", 0 },
@@ -369,14 +256,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		is_vf_device = intel_is_vf_device(fd);
 	}
 
-	for (const struct section *s = vm_create_fail_functions; s->name; s++)
-		igt_subtest_f("vm-create-fail-%s", s->name)
-			vm_create_fail(fd, pci_slot, s->name, s->flags);
-
-	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
-		igt_subtest_f("vm-bind-fail-%s", s->name)
-			vm_bind_fail(fd, pci_slot, s->name);
-
 	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
 		igt_subtest_f("exec-queue-create-fail-%s", s->name)
 			xe_for_each_engine(fd, hwe)
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7271ee4123..18774268de 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -11,6 +11,7 @@
  */
 
 #include "igt.h"
+#include "igt_device.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -2462,10 +2463,109 @@ static void test_oom(int fd)
 	}
 }
 
+static int
+simple_vm_create(int fd, unsigned int flags)
+{
+	struct drm_xe_vm_create create = {
+		.flags = flags,
+	};
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+}
+
+/**
+ * SUBTEST: vm-create-fail-%s
+ * Description: inject an error in function %arg[1] used in vm create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
+ * @xe_pt_create:		xe_pt_create
+ * @xe_vm_create_scratch:	xe_vm_create_scratch
+ */
+static void
+vm_create_fail(int fd, const char pci_slot[],
+	       const char function_name[], unsigned int flags)
+{
+	igt_assert_eq(simple_vm_create(fd, flags), 0);
+
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
+	injection_list_add(function_name);
+	injection_set_retval(function_name, -ENOMEM);
+	igt_assert(simple_vm_create(fd, flags) != 0);
+	injection_list_remove(function_name);
+
+	igt_assert_eq(simple_vm_create(fd, flags), 0);
+}
+
+static int
+simple_vm_bind(int fd, uint32_t vm)
+{
+	struct {
+		uint32_t batch[16];
+		uint64_t pad;
+		uint32_t data;
+	} *data;
+	struct drm_xe_sync syncobj = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = 1,
+		.bind.obj = 0,
+		.bind.range = BO_SIZE,
+		.bind.addr = 0x1a0000,
+		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
+		.bind.pat_index = intel_get_pat_idx_wb(fd),
+		.bind.flags = 0,
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&syncobj,
+		.exec_queue_id = 0,
+	};
+
+	data = aligned_alloc(xe_get_default_alignment(fd), BO_SIZE);
+	bind.bind.obj_offset = to_user_pointer(data);
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+}
+
+/**
+ * SUBTEST: vm-bind-fail-%s
+ * Description: inject an error in function %arg[1] used in vm bind IOCTL
+ *		to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
+ * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
+ * @xe_pt_update_ops_prepare:		xe_pt_update_ops_prepare
+ * @xe_pt_update_ops_run:		xe_pt_update_ops_run
+ * @xe_vma_ops_alloc:			xe_vma_ops_alloc
+ * @xe_sync_entry_parse:		xe_sync_entry_parse
+ */
+static void
+vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
+{
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+
+	igt_assert_eq(simple_vm_bind(fd, vm), 0);
+
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
+	injection_list_add(function_name);
+	injection_set_retval(function_name, -ENOMEM);
+	igt_assert(simple_vm_bind(fd, vm) != 0);
+	injection_list_remove(function_name);
+
+	igt_assert_eq(simple_vm_bind(fd, vm), 0);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
 	uint64_t bind_size;
+	char pci_slot[NAME_MAX];
 	int fd;
 	const struct section {
 		const char *name;
@@ -2574,6 +2674,27 @@ igt_main
                 { }
         };
 
+	const struct fault_section {
+		const char *name;
+		unsigned int flags;
+		bool pf_only;
+	} vm_create_fail_functions[] = {
+		{ "xe_exec_queue_create_bind", 0 },
+		{ "xe_pt_create", 0 },
+		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
+		{ }
+	};
+
+	const struct fault_section vm_bind_fail_functions[] = {
+		{ "vm_bind_ioctl_ops_create" },
+		{ "vm_bind_ioctl_ops_execute" },
+		{ "xe_pt_update_ops_prepare" },
+		{ "xe_pt_update_ops_run" },
+		{ "xe_vma_ops_alloc" },
+		{ "xe_sync_entry_parse" },
+		{ }
+	};
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2866,6 +2987,23 @@ igt_main
 		test_oom(fd);
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(fail_function_injection_enabled());
+			injection_setup_fault(&default_fault_params);
+			injection_exit_handler();
+			igt_device_get_pci_slot_name(fd, pci_slot);
+		}
+
+		for (const struct fault_section *s = vm_create_fail_functions; s->name; s++)
+			igt_subtest_f("vm-create-fail-%s", s->name)
+				vm_create_fail(fd, pci_slot, s->name, s->flags);
+
+		for (const struct fault_section *s = vm_bind_fail_functions; s->name; s++)
+			igt_subtest_f("vm-bind-fail-%s", s->name)
+				vm_bind_fail(fd, pci_slot, s->name);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.0

