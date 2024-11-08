Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7DD5C0F5
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC28710EA00;
	Fri,  8 Nov 2024 16:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc+IGOJ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695610E9FF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081642; x=1762617642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fN6M/Qh7BaiGVsFd7zLERCulN4+P9PWWG9BvvegKxXE=;
 b=Nc+IGOJ8Rwa4nyNyL5YeHxScqdaJAho4eJiRb2QN2p7GuV7lwpfbnoP7
 sJKg3s+PfjD56pQqZ25RqTIXvL9OC1S4Y8ON/X2Cd+ITDlh5Jr1EFlYXU
 szgXjBUKHje5i/RyuyB72z/YlPahXxYmp91RXzbqpVhs29CqFmaTNJISj
 glQdbTCJBL/8buNtE8dDHGL3t5MFMBU+iX9UU8KFsx0fwrmdpCGCTbFMb
 vySXllmTtDNWLIDo5qx9ayE7ynHzXiPitfQlPE+P1/nDqNkltsVA2e0IM
 ie3+X/R8XT9pqhSBWL6xICQ3PENw/3lVI+2nBMsIbQ1ZDUoYhVAA5g1wu Q==;
X-CSE-ConnectionGUID: sWzIbuDHR3OZ2xU7/xsbMA==
X-CSE-MsgGUID: cBwoIatuRn+tsfld3wFVAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738405"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738405"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:41 -0800
X-CSE-ConnectionGUID: 9Q31D8/2QKqwiCr72X6u5A==
X-CSE-MsgGUID: mJykAvBbS7u9y5mjQNf2Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86423041"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:40 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel/xe_fault_injection: Inject errors
 during vm bind IOCTL
Date: Fri,  8 Nov 2024 16:59:33 +0100
Message-ID: <20241108160021.1202234-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108160021.1202234-1-francois.dugast@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
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

Use the fault injection infrastructure to make targeted internal KMD
functions fail when executing xe_vm_bind_ioctl() so that more
code paths are tested, such as error handling and unwinding.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 72 +++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index eb80f6af8..43d3a2da0 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -17,10 +17,13 @@
 #include "igt_device.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "lib/igt_syncobj.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
-#define INJECT_ERRNO			-ENOMEM
+#define INJECT_ERRNO	-ENOMEM
+#define BO_ADDR		0x1a0000
+#define BO_SIZE		(1024*1024)
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -189,6 +192,63 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
 	igt_assert_eq(simple_vm_create(fd, flags), 0);
 }
 
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
+		.bind.addr = BO_ADDR,
+		.bind.op = DRM_XE_VM_BIND_OP_MAP_USERPTR,
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
+ * Description: inject an error in function %arg[1] used in vm bind IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_vma_ops_alloc:			xe_vma_ops_alloc
+ * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
+ * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
+ */
+static void
+vm_bind_fail(int fd, const char function_name[])
+{
+	uint32_t vm = xe_vm_create(fd, 0, 0);
+
+	igt_assert_eq(simple_vm_bind(fd, vm), 0);
+
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert(simple_vm_bind(fd, vm) != 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_eq(simple_vm_bind(fd, vm), 0);
+}
+
 igt_main
 {
 	int fd;
@@ -218,6 +278,12 @@ igt_main
 		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
 		{ }
 	};
+	const struct section vm_bind_fail_functions[] = {
+		{ "xe_vma_ops_alloc" },
+		{ "vm_bind_ioctl_ops_create" },
+		{ "vm_bind_ioctl_ops_execute" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
@@ -230,6 +296,10 @@ igt_main
 		igt_subtest_f("vm-create-fail-%s", s->name)
 			vm_create_fail(fd, s->name, s->flags);
 
+	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
+		igt_subtest_f("vm-bind-fail-%s", s->name)
+			vm_bind_fail(fd, s->name);
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
-- 
2.43.0

