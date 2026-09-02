Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975CC624D0
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 03:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C1A10EFBE;
	Wed,  2 Sep 2026 03:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsMwtiTf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6FE10EFC2
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 03:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788319997; x=1819855997;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wuq7bGH4lPG662lXS3IEU5Qp5228dbWxAY2F5qUsUuo=;
 b=fsMwtiTftODNswM7Jn99Fifbjmvpr68DlvkSF7+QB5KVvlEujgU1LfX5
 +NolajZQB/FhZJH82LCZl2rd/yX/ojZx+kxx2Cw7F7I3peiDoxU+kJ/Pu
 N5mt6WaO0VhUaoSD30Tfx7h94Dc/2/0GPH6ZW3z+Kl7xODwe3qSZ2WJtS
 YVoh2xh4T95HAXxXoQsEgLuWj7NhY+Gso1zln/vXJj3HjSrrs5t1wKa5E
 Q7Lm8AMt8QMpDLCnHTEAgqS+UoKDum5od0oOVFD98EfA01hHpiFafjA/O
 +LVxAwJuP6EYtcUWsVU1Z6Yj5saPvrjz5wt2GOFiEul7elMe3+PPWrP5q Q==;
X-CSE-ConnectionGUID: Z7f4PvIPTb2DEGyw4R5u4A==
X-CSE-MsgGUID: pIfnLtebQTyP8WRi8wh5iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="87704783"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="87704783"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 20:33:17 -0700
X-CSE-ConnectionGUID: 1WDReV33QQa1CQ5eR7WlJg==
X-CSE-MsgGUID: woDaZaGKSJmroEVgL79AMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="307508265"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa001.jf.intel.com with ESMTP; 01 Sep 2026 20:33:17 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: add GT reset fault injection
 stress coverage
Date: Wed,  2 Sep 2026 03:33:15 +0000
Message-ID: <20260902033315.248095-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

Inject a GT reset failure via the KMD fail_gt_reset debugfs hook, verify
the device wedges as expected, tolerate the resulting -ECANCELED errors in
the submitting threads, then recover by rebind and confirm the driver is
usable again.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_reset.c | 124 ++++++++++++++++++++++++++++++++++--
 1 file changed, 119 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 6eda71c32..f0071cc67 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -15,6 +15,8 @@
 #include <fcntl.h>
 
 #include "igt.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -140,6 +142,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define DESTROY_VM_CTX_STRESS		(0x1 << 20)
 #define MIXED_ENGINE_STRESS		(0x1 << 21)
 #define PM_TRANSITION_STRESS		(0x1 << 22)
+#define FAULT_INJECT_STRESS		(0x1 << 23)
 
 /**
  * SUBTEST: %s-cat-error
@@ -760,7 +763,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t pressure_bos[PRESSURE_COUNT];
 	uint32_t *data;
 	int pressure_count;
-	int i = 0;
+	int i = 0, exec_ret;
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, t->gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -794,8 +797,25 @@ static void submit_jobs(struct gt_thread_data *t)
 			continue;
 		}
 
-		xe_exec(fd, &exec);
-		xe_exec_queue_destroy(fd, exec.exec_queue_id);
+		/*
+		 * Once an injected GT reset failure wedges the device, exec and
+		 * queue teardown return -ECANCELED. That is the expected outcome
+		 * for the fault-injection stress
+		 */
+		if (t->flags & FAULT_INJECT_STRESS) {
+			struct drm_xe_exec_queue_destroy destroy = {
+				.exec_queue_id = exec.exec_queue_id,
+		};
+
+		exec_ret = __xe_exec(fd, &exec);
+		igt_assert_f(exec_ret == 0 || exec_ret == -ECANCELED,
+			     "exec returned unexpected error %d (expected 0 or -ECANCELED)\n",
+			     exec_ret);
+		igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy);
+		} else {
+			xe_exec(fd, &exec);
+			xe_exec_queue_destroy(fd, exec.exec_queue_id);
+		}
 		(*t->num_submit)++;
 
 		if ((t->flags & MEM_PRESSURE_STRESS) && !(i % 128)) {
@@ -829,8 +849,20 @@ static void submit_jobs(struct gt_thread_data *t)
 		pressure_bo_destroy(fd, pressure_bos, PRESSURE_COUNT);
 
 	munmap(data, bo_size);
-	gem_close(fd, bo);
-	xe_vm_destroy(fd, vm);
+	/*
+	 * On a device wedged by injected GT reset failures, BO close and VM
+	 * destroy also return -ECANCELED.
+	 */
+	if (t->flags & FAULT_INJECT_STRESS) {
+		struct drm_gem_close close_bo = { .handle = bo };
+		struct drm_xe_vm_destroy vm_destroy = { .vm_id = vm };
+
+		igt_ioctl(fd, DRM_IOCTL_GEM_CLOSE, &close_bo);
+		igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &vm_destroy);
+	} else {
+		gem_close(fd, bo);
+		xe_vm_destroy(fd, vm);
+	}
 }
 
 static void *gt_reset_thread(void *data)
@@ -850,6 +882,54 @@ static void *gt_reset_thread(void *data)
 	return NULL;
 }
 
+static int fault_inject_fd = -1;
+
+static void gt_reset_disable_fault_injection(int sig)
+{
+	if (fault_inject_fd < 0)
+		return;
+
+	igt_debugfs_write(fault_inject_fd, "fail_gt_reset/probability", "0");
+	igt_debugfs_write(fault_inject_fd, "fail_gt_reset/times", "1");
+	fault_inject_fd = -1;
+}
+
+static void gt_reset_enable_fault_injection(int fd)
+{
+	static bool exit_handler_installed;
+
+	fault_inject_fd = fd;
+
+	if (!exit_handler_installed) {
+		igt_install_exit_handler(gt_reset_disable_fault_injection);
+		exit_handler_installed = true;
+	}
+
+	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
+	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
+}
+
+static int try_vm_create(int fd)
+{
+	struct drm_xe_vm_create create = { 0 };
+	int err = 0;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create))
+		err = -errno;
+	else
+		xe_vm_destroy(fd, create.vm_id);
+
+	return err;
+}
+
+static void ignore_gt_reset_fault_dmesg(void)
+{
+	igt_emit_ignore_dmesg_regex("reset failed \\(-ECANCELED\\)"
+				    "|declared device .* as wedged"
+				    "|GPU HANG"
+				    "|Failed to reset");
+}
+
 /**
  * SUBTEST: gt-reset-stress
  * Description: Stress GT reset
@@ -891,6 +971,9 @@ static void *gt_reset_thread(void *data)
  * Description: Test GT reset while long spinner workload is active
  * Test category: stress test
  *
+ * SUBTEST: gt-reset-fault-injection
+ * Description: Stress concurrent GT resets and job submissions with GT reset failures injected via debugfs
+ * Test category: fault injection
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -907,6 +990,9 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	pthread_mutex_init(&mutex, 0);
 	pthread_cond_init(&cond, 0);
 
+	if (flags & FAULT_INJECT_STRESS)
+		gt_reset_enable_fault_injection(fd);
+
 	for (i = 0; i < n_threads; ++i) {
 		threads[i].mutex = &mutex;
 		threads[i].cond = &cond;
@@ -940,6 +1026,9 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	igt_info("number of resets %d, submissions %d, submit fails %d vm_recreate %d\n",
 		 num_reset, num_submit, num_submit_fail, num_vm_recreate);
 
+	if (flags & FAULT_INJECT_STRESS)
+		gt_reset_disable_fault_injection(0);
+
 	igt_assert_neq(num_reset, 0);
 	igt_assert_neq(num_submit, 0);
 	free(threads);
@@ -1122,6 +1211,7 @@ int igt_main()
 	int gt;
 	int class;
 	int fd;
+	char pci_slot[NAME_MAX];
 
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
@@ -1326,6 +1416,30 @@ int igt_main()
 			break;
 		}
 
+	igt_subtest("gt-reset-fault-injection") {
+		igt_require_f(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+						 O_RDWR),
+			      "GT reset fault injection not available; "
+			      "CONFIG_DRM_XE_KUNIT_TEST/fault-injection must be "
+			      "enabled in the KMD\n");
+
+		igt_device_get_pci_slot_name(fd, pci_slot);
+		ignore_gt_reset_fault_dmesg();
+
+		gt_reset(fd, 0, 8, 2, FAULT_INJECT_STRESS);
+
+		igt_assert_f(try_vm_create(fd) != 0,
+			     "Device did not wedge after injected GT reset failure\n");
+
+		gt_reset_disable_fault_injection(0);
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		fd = drm_open_driver(DRIVER_XE);
+
+		igt_assert_f(try_vm_create(fd) == 0,
+			     "Device not functional after rebind recovery\n");
+	}
+
 	igt_subtest("gt-mocs-reset")
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
-- 
2.43.0

