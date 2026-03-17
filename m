Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDBBFEDA07
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 18:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56710E363;
	Tue, 17 Mar 2026 18:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSKmw3wT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8AF10E5DA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773773282; x=1805309282;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hutnlv6BVvfTrDSSqUHyq0mPgEeHPMCxf33KEySYPvY=;
 b=iSKmw3wTW/7ZyV35Glw2426kzm4gmrTpkyzLsN/HdIw26KfQDtrjjGNV
 W6Wzyo6oeGvptW9qwnYm6Lq3EfCyHIlb+a4ONc2m99HwEwj54lPLU/a/F
 wmEx9/vogsMT1gtUkljTEmeZwUdfMbFU0qDr6NND0SY5XG88Ol5AE5ZWM
 EPuSEz+Ryz4rIAJfar51aXflrmYRnJHb+dDb5KqhsUisT3HwCswCLxcJl
 rokwmqmVWCRYDiq5gs2PWwWNqxlv5ehMW2THuEQYEVY10JSqBaiTBpowJ
 ouiGqBgoB3jschN1usiblRc/zusf7q7OUidahUi3nQdcfyAJFAL2uvbsj Q==;
X-CSE-ConnectionGUID: XIiVg5GvTfKd/FSkj2VfLg==
X-CSE-MsgGUID: pvhFS2PnTIaHeejnu04ggg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92386810"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="92386810"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 11:48:02 -0700
X-CSE-ConnectionGUID: ZW8yD1RBSgmaC7UIIcGUOg==
X-CSE-MsgGUID: 7aWu4mw7QaObIfORUJGKtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="222411168"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.147])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 11:48:01 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/xe/xe_fault_injection: add split/skip bind
 coverage
Date: Tue, 17 Mar 2026 18:47:36 +0000
Message-ID: <20260317184735.67051-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.53.0
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

We were missing something for having to unwind a vector of binds where
there is splitting, as well as skipping.

Should explode with a dmesg WARN without the required kernel fix.

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_fault_injection.c | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..c69303ba6 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -478,6 +478,89 @@ vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 }
 
+static int
+simple_vm_bind_null(int fd, uint32_t vm)
+{
+	struct drm_xe_sync syncobj = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = 1,
+		.bind.range = SZ_2G,
+		.bind.addr = 0,
+		.bind.op = DRM_XE_VM_BIND_OP_MAP,
+		.bind.pat_index = intel_get_pat_idx_uc(fd),
+		.bind.flags = DRM_XE_VM_BIND_FLAG_NULL,
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&syncobj,
+	};
+
+        return igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+}
+
+static int
+vm_unmap_map_split_vector_null(int fd, uint32_t vm)
+{
+	struct drm_xe_sync syncobj = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+        struct drm_xe_vm_bind_op ops[] = {
+            {
+                .range = SZ_2G,
+                .addr = 0,
+                .op = DRM_XE_VM_BIND_OP_MAP,
+                .pat_index = intel_get_pat_idx_wb(fd),
+                .flags = DRM_XE_VM_BIND_FLAG_NULL,
+            },
+            {
+                .range = SZ_2M,
+                .addr = SZ_1G - SZ_2M,
+                .op = DRM_XE_VM_BIND_OP_UNMAP,
+            },
+        };
+        struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = sizeof(ops)/sizeof(struct drm_xe_vm_bind_op),
+		.vector_of_binds = (uintptr_t)&ops,
+		.num_syncs = 1,
+		.syncs = (uintptr_t)&syncobj,
+	};
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind);
+}
+/**
+ * SUBTEST: vm-bind-split-unwind-fail-%s
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
+vm_bind_split_unwind_fail(int fd, const char pci_slot[], const char function_name[])
+{
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+
+	igt_assert_eq(simple_vm_bind_null(fd, vm), 0);
+
+	/* See: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7602 */
+	injection_list_add(function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert(vm_unmap_map_split_vector_null(fd, vm) != 0);
+	injection_list_remove(function_name);
+}
+
 /**
  * SUBTEST: oa-add-config-fail-%s
  * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
@@ -644,6 +727,10 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, pci_slot, s->name);
 
+	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
+		igt_subtest_f("vm-bind-split-unwind-fail-%s", s->name)
+			vm_bind_split_unwind_fail(fd, pci_slot, s->name);
+
 	for (const struct section *s = exec_queue_create_fail_functions; s->name; s++)
 		igt_subtest_f("exec-queue-create-fail-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-- 
2.53.0

