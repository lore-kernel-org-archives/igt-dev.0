Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7591B104950F
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 09:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 261AD10E3B1;
	Wed, 11 Mar 2026 09:12:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmOfaecW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1969610E3B3
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 09:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773220362; x=1804756362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KDH1PeqUvi+qReQjn5fgVWyR0a1OAvyNqtxVOHUytYg=;
 b=hmOfaecWKjOY7xpHd+zFfY5ZVi4aKzcWOg/PsnN7U8TCr6ENm4Ktq239
 07GRSVwDOrXze5HOHIzBrk31ci2W+GY9RyjsX3uxTGzHl8TL44pdoXjzl
 RKe/MnZAtf18Wgt7jmE9lEeonHQM7l3bhRAosYhjL2TVhRQXAXPfiyTnd
 nqITSXyQIecE/ynFXZ4/mdH4AUZvZ21cAl2GtVZjVcmKJv4SC01CGugVm
 YC1t5+iWF0hNviR6X4M9KHxcYFM5NGyqHQPVB9Ct22bFJlVym9yHiLk/2
 KfUTNzszAU/WC1cc0E5fP5sH+txL31c3CAn22bsyttk3x/Vv/Psrvi/JO A==;
X-CSE-ConnectionGUID: yUN5CEfaQhGHjn6+T/oioA==
X-CSE-MsgGUID: n+0bg+IfQBOBUBCI7md1Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="96897749"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="96897749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:12:42 -0700
X-CSE-ConnectionGUID: 7LO9SDo7Sc6G8x5Z35ivRw==
X-CSE-MsgGUID: DvpLs3fQRDqmbmEJckappQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="220351012"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 02:12:41 -0700
From: Varun Gupta <varun.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: priyanka.dandamudi@intel.com,
	varun.gupta@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_prefetch_fault: Add SVM and
 hit-under-miss validation
Date: Wed, 11 Mar 2026 14:42:30 +0530
Message-ID: <20260311091230.28360-1-varun.gupta@intel.com>
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

Add a second batch to validate hit-under-miss behavior: placing the BB
at PREFETCH_ADDR ensures the page is already mapped when the shader
prefetch runs, so the prefetch fault counter should not increment.

Add SVM mode (prefetch-fault-svm subtest) that creates the VM with
CPU_ADDR_MIRROR and uses mmap() at PREFETCH_ADDR to make the page
GPU-accessible before the hit-under-miss batch.

Other changes:
  - Extract PREFETCH_ADDR and USER_FENCE_VALUE into defines
  - Update stat name to 'invalid_prefetch_pagefault_count'
  - Add missing cleanup (intel_buf_destroy, xe_exec_queue_destroy,
    xe_vm_destroy)

Signed-off-by: Varun Gupta <varun.gupta@intel.com>
---
 tests/intel/xe_prefetch_fault.c | 108 ++++++++++++++++++++++++--------
 1 file changed, 83 insertions(+), 25 deletions(-)

diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
index 4a143374a..fb0afb0a8 100644
--- a/tests/intel/xe_prefetch_fault.c
+++ b/tests/intel/xe_prefetch_fault.c
@@ -25,6 +25,8 @@
 #define WALKER_Y_DIM	1
 #define PAGE_SIZE 4096
 #define COLOR_C4 0xC4C4C4C4
+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+#define PREFETCH_ADDR	0x1f000000
 
 struct dim_t {
 	uint32_t x;
@@ -118,7 +120,7 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
 	static struct gpgpu_shader *shader;
 
 	shader = gpgpu_shader_create(fd);
-	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, 0x1f000000));
+	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
 	gpgpu_shader__eot(shader);
 
 	return shader;
@@ -126,63 +128,108 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
 
 /**
  * SUBTEST: prefetch-fault
- * Description: Validate L1/L2 cache prefetch fault.
+ * Description: Validate prefetch fault and hit-under-miss behavior
+ * Run type: FULL
+ *
+ * SUBTEST: prefetch-fault-svm
+ * Description: Validate prefetch fault and hit-under-miss behavior in SVM mode
  * Run type: FULL
  */
-
-static void test_prefetch(int fd, struct drm_xe_engine_class_instance *hwe)
+static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe, bool svm)
 {
-	/* faulty address 0x1f000000 should be beyond bb_offset+bb_size. */
 	const uint64_t bb_offset = 0x1b000000;
+	const uint64_t bb_offset2 = 0x1f000000;
 	const size_t bb_size = 4096;
-	struct dim_t w_dim;
+	static const char *stat = "invalid_prefetch_pagefault_count";
+	struct drm_xe_sync sync[1] = {
+		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		  .timeline_value = USER_FENCE_VALUE },
+	};
+	struct xe_device *xe = xe_device_get(fd);
+	struct dim_t w_dim = { .x = WALKER_X_DIM, .y = WALKER_Y_DIM };
 	struct gpgpu_shader *shader;
 	struct intel_bb *ibb;
 	struct intel_buf *buf;
-	uint32_t *ptr;
 	uint32_t exec_queue_id, vm;
+	uint64_t vm_sync = 0;
+	void *cpu_data = NULL;
 	int prefetch_pre, prefetch_pos;
-	static const char *stat = "prefetch_pagefault_count";
-
-	w_dim.x = WALKER_X_DIM;
-	w_dim.y = WALKER_Y_DIM;
+	uint32_t *ptr;
 
 	buf = create_buf(fd, w_dim.x, w_dim.y, COLOR_C4);
 
-	prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
-
-	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
-			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	/* Create VM based on mode */
+	if (svm) {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+		sync[0].addr = to_user_pointer(&vm_sync);
+		__xe_vm_bind_assert(fd, vm, 0, 0, 0, 0, 0x1ull << xe->va_bits,
+				    DRM_XE_VM_BIND_OP_MAP,
+				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+				    sync, 1, 0, 0);
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	} else {
+		vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+	}
 
 	exec_queue_id = xe_exec_queue_create(fd, vm, hwe, 0);
 
-	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm,
-				     bb_offset, bb_size);
+	prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+
+	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset, bb_size);
 	intel_bb_set_lr_mode(ibb, true);
 
 	shader = get_prefetch_shader(fd);
-
 	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
-
 	gpgpu_shader_destroy(shader);
+	intel_bb_sync(ibb);
+	intel_bb_destroy(ibb);
+
+	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
+	prefetch_pre = prefetch_pos;
+
+	if (svm) {
+		cpu_data = mmap((void *)PREFETCH_ADDR, PAGE_SIZE,
+				PROT_READ | PROT_WRITE,
+				MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED,
+				-1, 0);
+		igt_assert(cpu_data == (void *)PREFETCH_ADDR);
+		memset(cpu_data, 0xAB, PAGE_SIZE);
+		prefetch_pre = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+	}
+
+	/* Hit-under-miss: BB at PREFETCH_ADDR ensures page is mapped before prefetch */
+	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2, bb_size);
+	intel_bb_set_lr_mode(ibb, true);
 
+	shader = get_prefetch_shader(fd);
+	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
+	gpgpu_shader_destroy(shader);
 	intel_bb_sync(ibb);
 
-	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
+	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
+	igt_assert_eq(prefetch_pos, prefetch_pre);
 
+	/* Verify buffer contents */
+	ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
 	for (int j = 0; j < w_dim.y; j++)
 		for (int i = 0; i < w_dim.x; i++) {
 			igt_assert_f(ptr[j * w_dim.x + i] == COLOR_C4,
 				     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
 				     COLOR_C4, ptr[j * w_dim.x + i], i, j);
 		}
-	/* Validate prefetch count. */
-	prefetch_pos = xe_gt_stats_get_count(fd, hwe->gt_id, stat);
-	igt_assert_eq(prefetch_pos, prefetch_pre + w_dim.x * w_dim.y);
-
 	munmap(ptr, buf->size);
 
+	/* Cleanup */
+	if (svm && cpu_data)
+		munmap(cpu_data, PAGE_SIZE);
+
 	intel_bb_destroy(ibb);
+	intel_buf_destroy(buf);
+	xe_exec_queue_destroy(fd, exec_queue_id);
+	xe_vm_destroy(fd, vm);
 }
 
 int igt_main()
@@ -201,7 +248,18 @@ int igt_main()
 			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
 				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance)
-					test_prefetch(fd, hwe);
+					test_prefetch_fault(fd, hwe, false);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("prefetch-fault-svm") {
+		xe_for_each_engine(fd, hwe) {
+			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
+				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
+					      hwe->engine_instance)
+					test_prefetch_fault(fd, hwe, true);
 			}
 		}
 	}
-- 
2.43.0

