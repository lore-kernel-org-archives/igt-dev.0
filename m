Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1867C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 18:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B6B10EDD1;
	Wed, 24 Jan 2024 18:08:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DD910EF1B
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 18:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706119704; x=1737655704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GGDXByXX1pe2FocludAyir7a3SKIcCDEvZLTfx0G5bI=;
 b=RCTFMAmgQ5f/Cx1pyKh4dXjhfcAcia0nRiLoiT9DtMVFFwC55RgY48S1
 L+QS2F/Q/q5oisNEKzYR1Vl4TPJ2WjqTR0FyUcK7LwrprBWBl+tk3wZ0O
 b5hiDF69HLKr4xEjJZtt7ULL4UMZIzS3ZVXMA2SoCazxHWhcgR84cRXFa
 RlWVnMu3UqGoJ1RUlTqYc1jUpiP1RshWiiTABIjRF59HohP89cUbHiz2a
 1TLj+d0Hn03bhCO3qShBYW+CajHKBIQ+Ml2UqstFp7ZCGrpUWLXgXC+/h
 6aSkfZAxtK7E4QYanO+QuvMUXZpNLZBeGkdvmOEhnLEP0EAHLl30scJIL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400785228"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400785228"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909734600"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="909734600"
Received: from gmcfarla-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.165])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 10:08:22 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/5] tests/intel/xe: use xe_bb_size() helper
Date: Wed, 24 Jan 2024 18:07:13 +0000
Message-ID: <20240124180713.268843-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124180713.268843-1-matthew.auld@intel.com>
References: <20240124180713.268843-1-matthew.auld@intel.com>
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

No need to open code this anymore.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_dma_buf_sync.c      |  3 +--
 tests/intel/xe_drm_fdinfo.c        |  3 +--
 tests/intel/xe_exec_atomic.c       |  3 +--
 tests/intel/xe_exec_balancer.c     |  7 +++----
 tests/intel/xe_exec_basic.c        |  3 +--
 tests/intel/xe_exec_compute_mode.c |  5 ++---
 tests/intel/xe_exec_fault_mode.c   |  3 +--
 tests/intel/xe_exec_reset.c        | 12 ++++--------
 tests/intel/xe_exec_store.c        |  8 +++-----
 tests/intel/xe_exec_threads.c      |  9 +++------
 tests/intel/xe_pm.c                |  3 +--
 tests/intel/xe_spin_batch.c        |  5 ++---
 tests/intel/xe_vm.c                | 12 ++++--------
 13 files changed, 27 insertions(+), 49 deletions(-)

diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index eca3a5e95..b69283093 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -116,8 +116,7 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	}
 
 	bo_size = sizeof(*data[0]) * N_FD;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
-			xe_get_default_alignment(fd[0]));
+	bo_size = xe_bb_size(fd[0], bo_size);
 	for (i = 0; i < n_bo; ++i) {
 		bo[i] = xe_bo_create(fd[0], 0, bo_size,
 				     vram_if_possible(fd[0], hwe0->gt_id),
diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 36bb39a31..a582703c1 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,8 +73,7 @@ static void test_active(int fd, struct drm_xe_engine *engine)
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	xe_for_each_mem_region(fd, memreg, region) {
 		uint64_t pre_size;
diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index fecd377ef..7ee80816c 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -78,8 +78,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size, placement,
 			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 664e6da59..02edd389d 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -68,7 +68,7 @@ static void test_all_active(int fd, int gt, int class)
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * num_placements;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -210,7 +210,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
@@ -437,8 +437,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 8994859fa..e6f8db5b0 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -111,8 +111,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	for (i = 0; i < n_vm; ++i)
 		vm[i] = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	addr[0] = 0x1a0000;
 	sparse_addr[0] = 0x301a0000;
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 473b11ae9..7dad71509 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -118,8 +118,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
@@ -336,7 +335,7 @@ static void non_block(int fd, int expect)
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * DATA_COUNT;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	engine = xe_engine(fd, 1);
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index f19e939e3..dae0e8ac3 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -134,8 +134,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
 			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 978b4d279..a9206d7d2 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -47,8 +47,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*spin);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
@@ -179,8 +178,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, gt),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -368,8 +366,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
@@ -537,8 +534,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bed118688..55354e688 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -126,8 +126,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
@@ -201,7 +200,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t *batch_map;
 	size_t bo_size = 4096;
 
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 	vm = xe_vm_create(fd, 0, 0);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	exec_queues = xe_exec_queue_create(fd, vm, eci, 0);
@@ -291,8 +290,7 @@ static void persistent(int fd)
 	sync.handle = syncobj;
 
 	vm = xe_vm_create(fd, 0, 0);
-	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
-					xe_get_default_alignment(fd));
+	batch_size = xe_bb_size(fd, batch_size);
 
 	engine = xe_engine(fd, 1);
 	sd_batch = xe_bo_create(fd, vm, batch_size,
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 17ee57a49..1b2623045 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -90,8 +90,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 	igt_assert(num_placements > 1);
 
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 		if (flags & INVALIDATE) {
@@ -291,8 +290,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 		if (flags & INVALIDATE) {
@@ -496,8 +494,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (flags & USERPTR) {
 		if (flags & INVALIDATE) {
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 4afe37d93..fac19f2ec 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -294,8 +294,7 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 		igt_assert(out_of_d3(device, d_state));
 
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(device.fd_xe),
-			xe_get_default_alignment(device.fd_xe));
+	bo_size = xe_bb_size(device.fd_xe, bo_size);
 
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 3f3283829..c18306350 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -192,8 +192,7 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, hwe->gt_id),
@@ -278,7 +277,7 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
 	vm = xe_vm_create(fd, 0, 0);
 	exec_queue = xe_exec_queue_create(fd, vm, hwe, ext);
 	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
-	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, sizeof(*spin));
 	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
 	spin = xe_bo_map(fd, bo, bo_size);
 	spin_addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0,
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index ebc1ca68f..67276b220 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -50,8 +50,7 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	int i, b = 0;
 
 	batch_size = (n_dwords * 4 + 1) * sizeof(uint32_t);
-	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
-			   xe_get_default_alignment(fd));
+	batch_size = xe_bb_size(fd, batch_size);
 	batch_bo = xe_bo_create(fd, vm, batch_size,
 				vram_if_possible(fd, 0),
 				DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -418,8 +417,7 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(struct shared_pte_page_data);
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	if (addr_stride <= bo_size)
 		addr_stride = addr_stride + bo_size;
@@ -603,8 +601,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * N_EXEC_QUEUES;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
@@ -784,8 +781,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 
 	vm = xe_vm_create(fd, 0, 0);
 	bo_size = sizeof(*data) * n_execs;
-	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
-			xe_get_default_alignment(fd));
+	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
 			  vram_if_possible(fd, eci->gt_id),
-- 
2.43.0

