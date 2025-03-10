Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DEEC282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 21:03:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1AA210E2C1;
	Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YYIGjiX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D9810E4E0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741640625; x=1773176625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/m6kJjFzR4K90E7qr0yYbPCbIi/RGjVynBJ26ErYOmc=;
 b=YYIGjiX0DfvP0+dkpqw9ecTPeq/FtRrwGOK+5qqJcRRo9wYozVVDEglq
 jetK0Mvljs0t8dWI63udLVC9LCjq1DpM8/VP4UPNtQ+Vc2ABool9d4zkw
 a3YQ4c44qFBdz31bvWh9PMrdBPwR/jlprlLVByqi5Avy5KK75Ce8hgJId
 F6CIjWAw1nu6rqPVFD6dzdnVNmCEojgTtbdOUGlS1cwDFNb6JNRf5gU5n
 69L/3tudOkL6GkCidU3gV5c44G2HXyQdCcK0FGtaCHjQqQwRBeA1RNvw5
 UvojqK/GyB1kv88W6F+fjT/IgRoohyYpy48ZYzLKbsimdiS24luX1MtIp w==;
X-CSE-ConnectionGUID: imWFG7WBSaC00Y5h5F2qmg==
X-CSE-MsgGUID: dNyCpWJuQB+91mZN/TV87A==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60061548"
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="60061548"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
X-CSE-ConnectionGUID: YpwPt0D4QcSJ4ojmBVzC1Q==
X-CSE-MsgGUID: cEC1usWRTfORlTVNUVoBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,237,1736841600"; d="scan'208";a="120630408"
Received: from dut4432lnl.fm.intel.com ([10.105.10.85])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 14:03:45 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com
Subject: [PATCH 3/4] tests/intel/xe_vm: Add DRM_IOCTL_XE_VM_GET_FAULTS
 validation tests
Date: Mon, 10 Mar 2025 21:03:42 +0000
Message-ID: <20250310210343.204246-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310210343.204246-1-jonathan.cavitt@intel.com>
References: <20250310210343.204246-1-jonathan.cavitt@intel.com>
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

Add tests to xe_vm that exercise the new DRM_IOCTL_XE_VM_GET_FAULTS
ioctl.  Specifically, add input validation tests that exercise the
return values for improperly formatted ioctl structures.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_vm.c | 79 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index fdf74c1140..40928b441c 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2343,6 +2343,69 @@ static void invalid_vm_id(int fd)
 	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
 }
 
+/**
+ * SUBTEST: vm-get-faults-invalid-reserved
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid reserved returns expected error code
+ *
+ * SUBTEST: vm-get-faults-invalid-vm-id
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid vm_id returns expected error code
+ *
+ * SUBTEST: vm-get-faults-invalid-size
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid size returns expected error code
+ *
+ * SUBTEST: vm-get-faults-invalid-fault-count
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid fault_count returns expected error code
+ */
+static void get_faults_invalid_reserved(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_faults query = {
+		.reserved[0] = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query, EINVAL);
+}
+
+static void get_faults_invalid_vm_id(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_faults query = {
+		.vm_id = 0xdeadbeef,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query, ENOENT);
+}
+
+static void get_faults_invalid_size(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_faults query = {
+		.size = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query, EINVAL);
+}
+
+static void get_faults_invalid_fault_count(int fd, uint32_t vm)
+{
+	struct drm_xe_vm_get_faults query = {
+		.fault_count = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_GET_FAULTS, &query, EINVAL);
+}
+
+static void test_get_faults(int fd, void (*func)(int fd, uint32_t vm))
+{
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE ||
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	func(fd, vm);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy = NULL;
@@ -2455,6 +2518,17 @@ igt_main
                 { }
         };
 
+	const struct vm_get_faults {
+		const char *name;
+		void (*test)(int fd, uint32_t vm);
+	} xe_vm_get_faults_tests[] = {
+		{ "invalid-reserved", get_faults_invalid_reserved },
+		{ "invalid-vm-id", get_faults_invalid_vm_id },
+		{ "invalid-size", get_faults_invalid_size },
+		{ "invalid-fault-count", get_faults_invalid_fault_count },
+		{ }
+	};
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2734,6 +2808,11 @@ igt_main
 	igt_subtest("invalid-vm-id")
 		invalid_vm_id(fd);
 
+	for (const struct vm_get_faults *f = xe_vm_get_faults_tests; f->name; f++) {
+		igt_subtest_f("vm-get-faults-%s", f->name)
+			test_get_faults(fd, f->test);
+	}
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.43.0

