Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9011C4452D
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 10:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D6F10E74B;
	Tue, 21 Jul 2026 10:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GD8Ob+l0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3243510E31E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784629906; x=1816165906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TixQQ2wRn74rephQUtQF57YZJHtkb91lqXwQAGMVHJM=;
 b=GD8Ob+l0yxJzI4l11Zs7CPmd1147ibklMuDsXdEdK9TDnnRrAu0VSs+J
 5QmQRQ2YAdIF5csYSj3ewRbNuOjBmyWJoQxCVpLgHQahfrRzkLr6dX/B4
 MzrjugpBq0SxM3LH3YaN3eWNlxO5LbK88rOP2bTCoztxVEEbqQFvt4LO6
 JUX8lsqZqmA2PqJo6T/5r8qMb9KzZBS+V9crju79VhjYJnKc+RQJPGqp+
 dFsfq29qMaef9gK/FEqki3JsSDPMpGUOJmO18Txp3eesZmnvlklNJsH6p
 R4V6EUrpSqOCc1KHkXnk2P0TXl9kEyCqSymd5XygIvE3lSh4K02oldigk Q==;
X-CSE-ConnectionGUID: ZIMSO/Q/TVeWH4J+GdX1Lg==
X-CSE-MsgGUID: CEuo45xXQpSmFcJp+4KHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85343770"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="85343770"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:31:45 -0700
X-CSE-ConnectionGUID: xyjQ+TrlQBmcPFy9xr2fpg==
X-CSE-MsgGUID: A14F+I8IRhKIYyytqv8pJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; d="scan'208";a="280996936"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.58])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 03:31:44 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Vijayakumar Nallamothu <vijayakumar.nallamothu@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/xe/xe_fault_injection: add split/skip bind
 coverage
Date: Tue, 21 Jul 2026 11:31:37 +0100
Message-ID: <20260721103137.1040620-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
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

Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7602
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/5443
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Vijayakumar Nallamothu <vijayakumar.nallamothu@intel.com>
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
2.55.0

