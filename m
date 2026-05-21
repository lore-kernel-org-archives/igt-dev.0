Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F4CCD4F3D
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 14:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3B10E20C;
	Thu, 21 May 2026 14:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QeZIK7B3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4F10E20C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374115; x=1810910115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xEN0S5GQpKGPMdtgEVTZ8C1aQRUyb18HMKN4BbdF/aw=;
 b=QeZIK7B3ys882GUAOg3vHQp9qbBMXWJqa/mEMyFOsoTaEl4jatpSBpaJ
 k7fH/AfnKiTaC4hKE1Hu/KKG7QiMPiab3ASyUtrlUD9SNYimkWOz9oZgL
 ygIklalCVilWO+eD3dYupDPVT3uwF3mWKJR1bGJdMMcbHgqvxqY7gZf6q
 OQ5bsjWFJ2zImRqkf5sK4n2ivvAd29zlCH04LsoJxr8CkzZuXYv/DK2Ew
 un/aLA3rLPABFB/ZKbSETiDsQZDEUwOU8uTyX82Jvd+KmnHd103x4g7RY
 0/a2Te0FInnVqM69JkL0eIXqJRM59PipmJ57ijvWjT/eptLfCAxytYOzq A==;
X-CSE-ConnectionGUID: sm7OnqJETKiDKmo92Mx47g==
X-CSE-MsgGUID: G7ZqK9cDTMWL+yoKzaZLCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80147362"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80147362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:14 -0700
X-CSE-ConnectionGUID: 4WURkOGZR1WIdHXzjeWmhA==
X-CSE-MsgGUID: gyRUv7pkSDWfpcR+j2bYcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="278650443"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:35:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/xe_exec_fault_mode: Add fault-mode workload
 subtests with suspend variants
Date: Thu, 21 May 2026 16:34:39 +0200
Message-ID: <20260521143439.6927-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
References: <20260521143439.6927-1-thomas.hellstrom@linux.intel.com>
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

Add run_fault_workload() using SUSPEND_STATE_NONE as a sentinel for the
no-suspend case.  All variants are registered from a single table:

  fault-mode-workload         (no suspend, 30s stress)
  s2idle-fault-mode-workload  (SUSPEND_STATE_FREEZE)
  s3-fault-mode-workload      (SUSPEND_STATE_S3)
  s4-fault-mode-workload      (SUSPEND_STATE_DISK)

The suspend variants perform a full suspend/resume cycle while the
preemptible spinner is running on an LR+fault-mode VM, then assert the
workload resumes and can be cleanly stopped.

To support the new code, include xe/xe_spin.h and hoist USER_FENCE_VALUE
to file scope.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 123 ++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 3e92dfbd9..c0a067f04 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -21,9 +21,11 @@
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_spin.h"
 #include <string.h>
 
 #define MAX_N_EXEC_QUEUES	16
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 
 #define USERPTR		(0x1 << 0)
 #define REBIND		(0x1 << 1)
@@ -145,7 +147,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 	uint64_t sync_addr = 0x101a0000;
-#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
@@ -453,6 +454,109 @@ test_exec_main(int fd, int n_exec_queues, int n_execs, unsigned int flags)
 	}
 }
 
+#define SUSPEND_STATE_NONE ((enum igt_suspend_state)-1)
+
+/**
+ * SUBTEST: fault-mode-workload
+ * Description: Stress preemptible fault mode workload for 30s.
+ * Test category: functionality test
+ *
+ * SUBTEST: s2idle-fault-mode-workload
+ * Description: Suspend to idle (s2idle) with a preemptible fault mode workload running.
+ * Test category: functionality test
+ *
+ * SUBTEST: s3-fault-mode-workload
+ * Description: Suspend to RAM (s3) with a preemptible fault mode workload running.
+ * Test category: functionality test
+ *
+ * SUBTEST: s4-fault-mode-workload
+ * Description: Suspend to disk (s4) with a preemptible fault mode workload running.
+ * Test category: functionality test
+ */
+static void run_fault_workload(int fd, enum igt_suspend_state s_state)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 1,
+		.syncs = to_user_pointer(&sync),
+	};
+	struct xe_spin *spin;
+	struct drm_xe_engine *engine;
+	uint64_t vm_sync;
+	size_t bo_size;
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint64_t spin_addr;
+	uint64_t ahnd;
+	uint32_t bo;
+	uint32_t ts_1, ts_2;
+
+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	bo_size = xe_bb_size(fd, sizeof(*spin));
+	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
+	igt_assert(engine);
+
+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
+	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
+							ALLOC_STRATEGY_LOW_TO_HIGH);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, spin_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true,
+			  .preempt = true);
+	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
+	exec.exec_queue_id = exec_queue;
+	exec.address = spin_addr;
+	xe_exec(fd, &exec);
+	xe_spin_wait_started(spin);
+
+	if (s_state != SUSPEND_STATE_NONE) {
+		enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+					     SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+		igt_system_suspend_autoresume(s_state, test);
+	} else {
+		sleep(30);
+	}
+
+	/* Collect and check timestamps - workload should still be running */
+	ts_1 = spin->timestamp;
+	sleep(1);
+	ts_2 = spin->timestamp;
+	igt_assert_neq_u32(ts_1, ts_2);
+
+	xe_spin_end(spin);
+	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	/* Check timestamps to make sure spinner is stopped */
+	ts_1 = spin->timestamp;
+	sleep(1);
+	ts_2 = spin->timestamp;
+	igt_assert_eq_u32(ts_1, ts_2);
+
+	sync.addr = to_user_pointer(&vm_sync);
+	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+
+	xe_exec_queue_destroy(fd, exec_queue);
+	xe_vm_destroy(fd, vm);
+	put_ahnd(ahnd);
+}
+
 int igt_main()
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -589,6 +693,23 @@ int igt_main()
 		xe_for_each_engine(fd, hwe)
 			test_exec(fd, hwe, 1, 1, ENABLE_SCRATCH | INVALID_VA);
 
+	{
+		static const struct {
+			const char *name;
+			enum igt_suspend_state state;
+		} suspend_states[] = {
+			{ "",        SUSPEND_STATE_NONE },
+			{ "s2idle-", SUSPEND_STATE_FREEZE },
+			{ "s3-",     SUSPEND_STATE_S3 },
+			{ "s4-",     SUSPEND_STATE_DISK },
+			{ NULL },
+		};
+
+		for (const __typeof__(*suspend_states) *s = suspend_states; s->name; s++)
+			igt_subtest_f("%sfault-mode-workload", s->name)
+				run_fault_workload(fd, s->state);
+	}
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.54.0

