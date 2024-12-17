Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157ABE7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 13:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8032610E966;
	Tue, 17 Dec 2024 13:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSSQMPDb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DB410E966
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 13:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734440824; x=1765976824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C3H38TwvxR+rlnm5xpqmddSHEr//KfgDiBML37Bvrkk=;
 b=bSSQMPDbDThKRXobN9aiwItuRPHsJ8w4lXiJqhy+kBhoroQdwtNl9w2+
 iKCMtRt0rQEizUynbRf+tx9QRt+9zZlIIGm2wV6l7G/LgDAcvWdnmvLVp
 94+7nQhflR8E+9XpsvgsHiI4Pxf6+7E0s98SMSB73Z3LXRmobuEKPZn43
 pc1NRexh3dxCR6K8o6aPoO2trl4jSsD3fbUnx9uTxl0f+4o/d6a4ZACL9
 GkQkUexEqxVBlhWedlRQf2N4tUA0p8mMT3v6dtFXiK48gs6Haducqa2mP
 NGeLtFiRbzsp1iWYvJbfS5CAa/7spOW4RLupp2zFcenvnwIl8HK0Iq7wr g==;
X-CSE-ConnectionGUID: H4o31AzPT6SXblqP/yul7A==
X-CSE-MsgGUID: 64cDfRUrRV21vIJvmcmdbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="57346807"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="57346807"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:07:04 -0800
X-CSE-ConnectionGUID: 8WVUzRhzQi+ieMALlxvG0Q==
X-CSE-MsgGUID: 2tVp8KW4SCeKhUehVtPGbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="128340631"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa002.jf.intel.com with ESMTP; 17 Dec 2024 05:07:03 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/intel/xe_vm: Check negative cases for
 vm_create/destroy ioctl
Date: Tue, 17 Dec 2024 18:34:29 +0530
Message-Id: <20241217130429.673208-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Negative test to check vm_create/destroy ioctl returns expected error when
invalid flags, extensions, reserved, pad, vm_id  param is used.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm.c | 136 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d51a75aec..b10269191 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2247,6 +2247,107 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * TEST: Negative test for vm create/destroy ioctl
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: vm create
+ * Test category: negative test
+ */
+
+/**
+ * SUBTEST: invalid-flag-%s
+ * Description:  function %arg[1] used in vm create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_vm_create_fault:  xe_vm_create_fault
+ * @xe_vm_create_scratch_fault: xe_vm_create_scrach_fault
+ * @xe_vm_create_scratch_fault_lr:    xe_vm_create_scrach_fault_lr
+ */
+
+static void invalid_flag(int fd, __u32 flags)
+{
+	struct drm_xe_vm_create create = {
+		.flags = flags,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+}
+
+/**
+ * SUBTEST: invalid-extensions
+ * Description: Check query with invalid extensions returns expected error code
+ *
+ * SUBTEST: vm-create-invalid-reserved
+ * Description: Send query with invalid reserved value for vm_create ioctl
+ */
+
+static void invalid_extensions(int fd)
+{
+	struct drm_xe_vm_create create = {
+		.extensions = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+}
+
+static void vm_create_invalid_reserved(int fd)
+{
+	struct drm_xe_vm_create create = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+
+	create.reserved[0] = 0;
+	create.reserved[1] = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+}
+
+/**
+ * SUBTEST: vm-destroy-invalid-reserved
+ * Description: Send query with invalid reserved value for vm_destroy ioctl
+ *
+ * SUBTEST: invalid-pad
+ * Description: Check query with invalid pad returns expected error code
+ *
+ * SUBTEST: invalid-vm-id
+ * Description: Check query with invalid vm_id returns expected error code
+ */
+
+static void vm_destroy_invalid_reserved(int fd)
+{
+	struct drm_xe_vm_destroy destroy = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);
+
+	destroy.reserved[0] = 0;
+	destroy.reserved[1] = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);
+}
+
+static void invalid_pad(int fd)
+{
+	struct drm_xe_vm_destroy destroy = {
+		.pad = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, EINVAL);
+}
+
+static void invalid_vm_id(int fd)
+{
+	struct drm_xe_vm_destroy destroy = {
+		.vm_id = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2344,6 +2445,21 @@ igt_main
 		{ NULL },
 	};
 
+        const struct vm_create_section {
+                const char *name;
+                __u32 flags;
+        } xe_vm_create_invalid_flags[] = {
+                { "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+                { "xe_vm_create_scratch_fault",
+                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+                { "xe_vm_create_scratch_fault_lr",
+                        ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
+                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
+                { }
+        };
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2603,6 +2719,26 @@ igt_main
 		}
 	}
 
+	for (const struct vm_create_section *s = xe_vm_create_invalid_flags; s->name; s++) {
+		igt_subtest_f("invalid-flag-%s", s->name)
+			invalid_flag(fd, s->flags);
+	}
+
+	igt_subtest("invalid-extensions")
+		invalid_extensions(fd);
+
+	igt_subtest("vm-create-invalid-reserved")
+		vm_create_invalid_reserved(fd);
+
+	igt_subtest("vm-destroy-invalid-reserved")
+		vm_destroy_invalid_reserved(fd);
+
+	igt_subtest("invalid-pad")
+		invalid_pad(fd);
+
+	igt_subtest("invalid-vm-id")
+		invalid_vm_id(fd);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

