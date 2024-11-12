Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A272D3ABFB
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4AA310E5EE;
	Tue, 12 Nov 2024 13:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0IbwdKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8C410E5EE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418254; x=1762954254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EDkuYpMhL93RXEd/2k5o4r6YdULTbQ4+BtaU6uMTMcA=;
 b=m0IbwdKewgIcDVxpQRq8j4oBoPOsGKlhFob6qIpR0Yig5IL1Y64IiNjy
 HhCNJUfoB8jrzYrrWotvIr0d67ocUOcnZqaUa8mcUa8H0epV+D1drqMU0
 e1RJgmbC5h6Acg01AdELDWewVcDfkywssfCFuBI1J2krW7/ExShmDlGqU
 0V6bSaE3QE+SsiF/0PTKArJ7nYsn7V/WUescDreqS4IotIvYg/Wa5ahtU
 Y4oL3PSMSRuWgOiuamUQchJwVcZ8pLSXGNHIpf2XASDtmYcNI0kq72t5i
 TJmp2ewbhr8EHPA8x4B5eBHw+i5rkVhmv36UlCL5x6X2yazyFL/hAqK1i g==;
X-CSE-ConnectionGUID: VsQgLd83QOyUVstupk3rew==
X-CSE-MsgGUID: bnsavtCjSz+7qFAYBs2Ypg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34118280"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34118280"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:54 -0800
X-CSE-ConnectionGUID: IBgnX4PsQ0yAW6i7whdCkw==
X-CSE-MsgGUID: atvI4eH6QyqESSPQKziMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92237882"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:52 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t,
 v3 5/5] tests/intel/xe_fault_injection: Inject errors during vm bind
 IOCTL
Date: Tue, 12 Nov 2024 14:29:54 +0100
Message-ID: <20241112133034.1919573-6-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112133034.1919573-1-francois.dugast@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
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

v2: Order function names alphabetically (Rodrigo Vivi)
    Add xe_pt_update_ops_{prepare,run} (Matthew Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_fault_injection.c | 76 +++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index d321446b5..1b2904174 100644
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
@@ -189,6 +192,65 @@ vm_create_fail(int fd, const char function_name[], unsigned int flags)
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
+ * @vm_bind_ioctl_ops_create:		vm_bind_ioctl_ops_create
+ * @vm_bind_ioctl_ops_execute:		vm_bind_ioctl_ops_execute
+ * @xe_pt_update_ops_prepare:		xe_pt_update_ops_prepare
+ * @xe_pt_update_ops_run:		xe_pt_update_ops_run
+ * @xe_vma_ops_alloc:			xe_vma_ops_alloc
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
@@ -218,6 +280,14 @@ igt_main
 		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
 		{ }
 	};
+	const struct section vm_bind_fail_functions[] = {
+		{ "vm_bind_ioctl_ops_create" },
+		{ "vm_bind_ioctl_ops_execute" },
+		{ "xe_pt_update_ops_prepare" },
+		{ "xe_pt_update_ops_run" },
+		{ "xe_vma_ops_alloc" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
@@ -230,6 +300,10 @@ igt_main
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

