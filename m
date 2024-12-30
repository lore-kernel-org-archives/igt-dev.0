Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0727CE7718F
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 10:24:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B680B10E48D;
	Mon, 30 Dec 2024 10:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WgECAotq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01110E48D
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735554295; x=1767090295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AGELE86cmggAVJllWsaHK/AljMZ+MAXkZVvrwxgJDWQ=;
 b=WgECAotqVpOPUiVCLbxldyS6rdTn/DrnVWB3IfwVGb/qwF317zOKnhW5
 IcBBp5FXxA8OzcQjYf1z+FEbikyZTn4vXs7QIcMeGCPUVGU4++jXx71gC
 EWvlQAjzNMLHK9Q1AIfL11sTzb6bAa9KippKzc+33Auff4E0gCw7XrBGm
 ZO0dJcGWSXcQxTALIgw229SeaAEq9nCybWUl/TrznD1HgLZsRhSr1aBf/
 56VhUS3EC0Tmd8gJmjXG2QQXb9qySERVuogI1gLxFHHHjDlePgPl+saa8
 ogQduXTBR2lYWid/Yp3VNK6c9yX/7ROE6fVdqT6NIThpEj8mSH80gjvvb w==;
X-CSE-ConnectionGUID: Byvwb/0oRlez6KVP00fj/w==
X-CSE-MsgGUID: eQBL5hqyRN6MlhH2N3Tf8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36061710"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="36061710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 02:24:55 -0800
X-CSE-ConnectionGUID: gX8iOwhFSmyjzcBk6Cv/4A==
X-CSE-MsgGUID: gB6a6tlRT5morGLcy51tjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="100516619"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2024 02:24:53 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv
Date: Mon, 30 Dec 2024 16:10:08 +0530
Message-Id: <20241230104008.25403-3-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
References: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
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

Use the kernel fault injection infrastructure to test error handling
of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
so that more code paths are tested, such as error handling and unwinding.

Error can be injected using:
./xe_fault_injection --run-subtest guc-fail-xe_guc_ct_send_recv

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 tests/intel/xe_fault_injection.c | 59 ++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index ef3bbb7ec..fce8d2846 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -19,12 +19,14 @@
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_pat.h"
+#include "lib/igt_sriov_device.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
 #define BO_SIZE		(1024*1024)
+#define NUM_VFS		1
 
 enum injection_list_action {
 	INJECTION_LIST_ADD,
@@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 }
 
+static int sriov_enable_vfs(int fd, int num_vfs)
+{
+	int sysfs;
+	bool ret;
+
+	sysfs = igt_sysfs_open(fd);
+	igt_assert_fd(sysfs);
+
+	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
+	close(sysfs);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: guc-fail-%s
+ * Description: inject an error in function %arg[1] used when xe interacts with guc to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_guc_ct_send_recv:               xe_guc_ct_send_recv
+ */
+
+static void
+guc_fail(int fd, int num_vfs, const char function_name[])
+{
+	bool autoprobe_en = 0;
+
+	ignore_faults_in_dmesg(function_name);
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+
+	autoprobe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
+
+	if (autoprobe_en)
+		igt_sriov_disable_driver_autoprobe(fd);
+
+	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
+	 * Since error in this test is expected, we have written our own static function here.
+	 */
+	sriov_enable_vfs(fd, num_vfs);
+
+	igt_assert_eq(-errno, INJECT_ERRNO);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	if (autoprobe_en)
+		igt_sriov_enable_driver_autoprobe(fd);
+}
+
 igt_main
 {
 	int fd;
@@ -319,6 +370,10 @@ igt_main
 		{ "xe_vma_ops_alloc" },
 		{ }
 	};
+	const struct section guc_fail_functions[] = {
+		{ "xe_guc_ct_send_recv" },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
@@ -335,6 +390,10 @@ igt_main
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, s->name);
 
+	for (const struct section *s = guc_fail_functions; s->name; s++)
+		igt_subtest_f("guc-fail-%s", s->name)
+			guc_fail(fd, NUM_VFS, s->name);
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
-- 
2.35.3

