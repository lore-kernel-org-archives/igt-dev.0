Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651FEF34C5C
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 14:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E72310E4AD;
	Mon, 13 Apr 2026 14:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFV2j7nf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C14C10E095
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776091041; x=1807627041;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wO5EnE7UBkINGxLM8MQJ5hnJPsbmgeEUwcRPumsG5Fk=;
 b=CFV2j7nfvdmFKe5xobPHLc5nbrl0vbHhILfBNrPR2jb+Sy6c5m92pvg3
 HfFOaP+NzC7ESLVYiCrHqhPOeZPhJDcCeKW6EXXtqbBjyfVlQPJfkEjep
 s+CDh3qbLmKyQsPlCWZzrVS7Tb/eEViuRwQviDjxRkiOpymqWPRMBy6hb
 w/HXhhSS6zk5N/vzEYwSqHpIq0u5QvNGxUF6c2SVaLPb8OdOFgG7ANNPd
 xrSAGjY4wxZCH/9Gq5SxKBI+NJxxKW6PZTH1oAus+ImZjJPrwlKl1n8jU
 uFw5mvAhNLZa7CqOzIPxlM0rQ4TjIRfTAhC6KNTzzH9i3mw91bE+rok++ A==;
X-CSE-ConnectionGUID: HoCeajI/Ru6JdUESjA2rTw==
X-CSE-MsgGUID: 5461OP9cTZiPE9BDUpIwkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="76936379"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="76936379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 07:37:20 -0700
X-CSE-ConnectionGUID: SpGbrL73T9aroO361Q5Jpg==
X-CSE-MsgGUID: GEdbXiubTQOM18k4+hzGIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234214428"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by orviesa004.jf.intel.com with ESMTP; 13 Apr 2026 07:37:19 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_wedged: Add subtest to validate device
 behaviour
Date: Mon, 13 Apr 2026 14:37:17 +0000
Message-ID: <20260413143717.5323-1-nishit.sharma@intel.com>
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

This test:
- Forces the device into "wedged-at-any-timeout" mode via debugfs.
- Submits a hang job and waits for the hang to be detected.
- Verifies that all subsequent ioctls return -ECANCELED,
  indicating the device is wedged.
- Reloads the driver and checks that normal operation is
  restored on all engines.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_wedged.c | 94 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index e1ac629ca..fe6468cc6 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -193,6 +193,51 @@ simple_hang(int fd, struct drm_xe_sync *sync)
 	} while (err && errno == ENOMEM);
 }
 
+static void
+submit_job(int fd, uint32_t vm, uint32_t exec_queue, void *userptr,
+	   size_t size, uint32_t syncobj)
+{
+	uint64_t addr = 0x1a0000;
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	uint32_t bo = 0;
+	uint32_t *batch;
+	size_t bo_size = 4096;
+	uint64_t batch_addr = addr;
+	int b = 0;
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	batch = xe_bo_map(fd, bo, bo_size);
+
+	batch[b++] = MI_BATCH_BUFFER_START;
+	batch[b++] = MI_PRT_BATCH_BUFFER_START;
+	batch[b++] = batch_addr;
+	batch[b++] = batch_addr >> 32;
+	batch[b++] = MI_BATCH_BUFFER_END;
+	igt_assert(b <= (bo_size / sizeof(uint32_t)));
+
+	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(userptr),
+				 addr + 0x10000, size, NULL, 0);
+
+	xe_vm_bind_async(fd, vm, 0, bo, 0, batch_addr, bo_size, NULL, 0);
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = batch_addr;
+
+	syncobj_reset(fd, &syncobj, 1);
+	xe_exec(fd, &exec);
+}
+
 /**
  * SUBTEST: basic-wedged
  * Description: Force Xe device wedged after injecting a failure in GT reset
@@ -209,6 +254,10 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: basic-wedged-read
  * Description: Read wedged_mode debugfs
  */
+/**
+ * SUBTEST: userptr-wedge-fence-signal
+ * Description: Submits a long-running job using a userptr buffer, force-wedges the device
+ */
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -310,6 +359,51 @@ int igt_main()
 		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
 	}
 
+	igt_subtest("userptr-wedge-fence-signal") {
+		struct drm_xe_engine_class_instance inst = {
+			.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+
+		size_t size;
+		void *userptr;
+		uint32_t vm, exec_queue, syncobj;
+		int ret;
+
+		size = 128 * 1024 * 1024;
+		igt_require(igt_debugfs_exists(fd, "fail_gt_reset/probability",
+					       O_RDWR));
+		igt_debugfs_write(fd, "fail_gt_reset/verbose", "1");
+
+		igt_assert_eq(simple_ioctl(fd), 0);
+		ignore_wedged_in_dmesg();
+
+		userptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+		igt_assert(userptr != MAP_FAILED);
+
+		vm = xe_vm_create(fd, 0, 0);
+		exec_queue = xe_exec_queue_create(fd, vm, &inst, 0);
+		syncobj = syncobj_create(fd, 0);
+
+		submit_job(fd, vm, exec_queue, userptr, size, syncobj);
+
+		force_wedged(fd);
+		munmap(userptr, size);
+
+		ret = syncobj_wait_err(fd, &syncobj, 1, INT64_MAX, 0);
+		if (ret)
+			igt_assert_eq(ret, -ECANCELED);
+
+		drm_close_driver(fd);
+		igt_kmod_rebind("xe", pci_slot);
+		system("modprobe -r xe && modprobe xe");
+		fd = drm_open_driver(DRIVER_XE);
+
+		igt_assert_eq(simple_ioctl(fd), 0);
+		xe_for_each_engine(fd, hwe)
+			simple_exec(fd, hwe);
+	}
+
 	igt_fixture() {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.43.0

