Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CABC5B572
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 07:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8927210E0DF;
	Wed, 19 Aug 2026 07:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSxS7Ld5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C8F10E0DF
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 07:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787124982; x=1818660982;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bhlNpytv4VUMkKBnj7CMMVOhU+vaJOVeLsMsXdlM7MA=;
 b=KSxS7Ld5YDkfYK9itJTT1XoXdC6eFGzQruJ08YKAEntDWNELrz4IxgZD
 fqGZUSzxmPGJZFcAWvSC26MyUCOfeD3tb+6zHRg/bpfX5PLIypOFkTVlQ
 AXLDHk7k3TbO+2PoAOR3haiwAm0/+MyX7YOb7FSvWp4uBNKGFta9JkfD7
 JRYFvtC0xqbZ0oHjk6N4ryAzDRxMw9zFkHWVYASj/Hd+hJE7UHiOD8wug
 JVCFG6wR+0t6tVuMpX4eLRpPdIgwOCRCjSSzKmBAM7CFJzx/bd7GKWcWm
 v2LEi7baCMEsYYyMA1LlkPo8fHjBXyHeG27De6HpuVLbUpifDMRn4FnZb A==;
X-CSE-ConnectionGUID: zUpwpI/JSeSYmLMeuDYzpw==
X-CSE-MsgGUID: Ghdk5i8uS1aRbkpXfsck1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91439781"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="91439781"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 00:36:22 -0700
X-CSE-ConnectionGUID: kEyo8sM9TpGBIYEZVTFGSw==
X-CSE-MsgGUID: 4YMBduEiQjasViyUt15zHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="263730015"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa006.jf.intel.com with ESMTP; 19 Aug 2026 00:36:20 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: add GT reset fault injection
 stress coverage
Date: Wed, 19 Aug 2026 07:36:19 +0000
Message-ID: <20260819073619.15981-1-nishit.sharma@intel.com>
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
 tests/intel/xe_exec_reset.c | 107 ++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 6eda71c32..1796e4ec1 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -16,6 +16,8 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_device.h"
+#include "igt_kmod.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
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
@@ -850,6 +882,33 @@ static void *gt_reset_thread(void *data)
 	return NULL;
 }
 
+static void gt_reset_fault_injection(int fd, bool enable)
+{
+	igt_debugfs_write(fd, "fail_gt_reset/probability", enable ? "100" : "0");
+	igt_debugfs_write(fd, "fail_gt_reset/times", enable ? "2" : "1");
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
@@ -891,6 +950,9 @@ static void *gt_reset_thread(void *data)
  * Description: Test GT reset while long spinner workload is active
  * Test category: stress test
  *
+ * SUBTEST: gt-reset-fault-injection
+ * Description: Stress concurrent GT resets and job submissions with GT reset failures injected via debugfs
+ * Test category: fault injection
  */
 static void
 gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
@@ -907,6 +969,9 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	pthread_mutex_init(&mutex, 0);
 	pthread_cond_init(&cond, 0);
 
+	if (flags & FAULT_INJECT_STRESS)
+		gt_reset_fault_injection(fd, true);
+
 	for (i = 0; i < n_threads; ++i) {
 		threads[i].mutex = &mutex;
 		threads[i].cond = &cond;
@@ -940,6 +1005,9 @@ gt_reset(int fd, int gt, int n_threads, int n_sec, unsigned int flags)
 	igt_info("number of resets %d, submissions %d, submit fails %d vm_recreate %d\n",
 		 num_reset, num_submit, num_submit_fail, num_vm_recreate);
 
+	if (flags & FAULT_INJECT_STRESS)
+		gt_reset_fault_injection(fd, true);
+
 	igt_assert_neq(num_reset, 0);
 	igt_assert_neq(num_submit, 0);
 	free(threads);
@@ -1122,6 +1190,7 @@ int igt_main()
 	int gt;
 	int class;
 	int fd;
+	char pci_slot[NAME_MAX];
 
 	igt_fixture()
 		fd = drm_open_driver(DRIVER_XE);
@@ -1326,6 +1395,29 @@ int igt_main()
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
@@ -1455,6 +1547,9 @@ int igt_main()
 		}
 	}
 
-	igt_fixture()
+	igt_fixture() {
+		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR))
+			gt_reset_fault_injection(fd, false);
 		drm_close_driver(fd);
+	}
 }
-- 
2.43.0

