Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89FC10E6C7
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 15:44:23 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 16:43:34 +0100
Message-Id: <20230609154336.516503-5-matthew.auld@intel.com>
In-Reply-To: <20230609154336.516503-1-matthew.auld@intel.com>
References: <20230609154336.516503-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/6] tests/xe: handle small-bar systems
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Convert all the existing tests that require CPU access.

v2:
  - Split out the lib changes
  - Prefer SZ_256M and SZ_1G in xe_evict
  - Simplify and fix the bo_flags handling in test_exec

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 tests/xe/xe_dma_buf_sync.c      |  3 ++-
 tests/xe/xe_evict.c             | 35 +++++++++++++++++++++------------
 tests/xe/xe_exec_balancer.c     |  6 +++---
 tests/xe/xe_exec_basic.c        | 17 ++++++++--------
 tests/xe/xe_exec_compute_mode.c |  4 ++--
 tests/xe/xe_exec_fault_mode.c   | 12 +++++++----
 tests/xe/xe_exec_reset.c        | 13 +++++++-----
 tests/xe/xe_exec_threads.c      |  9 ++++++---
 tests/xe/xe_guc_pc.c            |  3 ++-
 tests/xe/xe_mmap.c              |  4 ++--
 tests/xe/xe_pm.c                |  3 ++-
 tests/xe/xe_prime_self_import.c |  8 ++++----
 tests/xe/xe_vm.c                | 23 +++++++++++++++-------
 13 files changed, 85 insertions(+), 55 deletions(-)

diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 1d7ffc60f..05f2bc643 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -123,7 +123,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create(fd[0], hwe0->gt_id, 0, bo_size);
+		bo[i] = xe_bo_create_flags(fd[0], 0, bo_size,
+					   visible_vram_if_possible(fd[0], hwe0->gt_id));
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
 
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 7fef4efc5..5f99a11cd 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -98,15 +98,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
                                 i < n_execs / 8 ? 0 : vm;
 
 			if (flags & MULTI_VM) {
-				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, 0,
-							    bo_size);
+				__bo = bo[i] = xe_bo_create_flags(fd, 0,
+								  bo_size,
+								  visible_vram_memory(fd, eci->gt_id));
 			} else if (flags & THREADED) {
-				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, vm,
-							    bo_size);
+				__bo = bo[i] = xe_bo_create_flags(fd, vm,
+								  bo_size,
+								  visible_vram_memory(fd, eci->gt_id));
 			} else {
 				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
 								  bo_size,
-								  vram_memory(fd, eci->gt_id) |
+								  visible_vram_memory(fd, eci->gt_id) |
 								  system_memory(fd));
 			}
 		} else {
@@ -281,16 +283,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
                                 i < n_execs / 8 ? 0 : vm;
 
 			if (flags & MULTI_VM) {
-				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
-							    0, bo_size);
+				__bo = bo[i] = xe_bo_create_flags(fd, 0,
+								  bo_size,
+								  visible_vram_memory(fd, eci->gt_id));
 			} else if (flags & THREADED) {
-				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
-							    vm, bo_size);
+				__bo = bo[i] = xe_bo_create_flags(fd, vm,
+								  bo_size,
+								  visible_vram_memory(fd, eci->gt_id));
 			} else {
 				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
 								  bo_size,
-								  vram_memory(fd, eci->gt_id) |
-								  system_memory(fd));
+								  visible_vram_memory(fd, eci->gt_id));
 			}
 		} else {
 			__bo = bo[i % (n_execs / 2)];
@@ -453,9 +456,15 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
 		pthread_join(threads_data[i].thread, NULL);
 }
 
+#define SZ_256M	0x10000000
+#define SZ_1G	0x40000000
+
 static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
 {
-	return (ALIGN(vram_size, 0x40000000)  * mul) / div;
+	if (vram_size >= SZ_1G)
+		return (ALIGN(vram_size, SZ_1G)  * mul) / div;
+	else
+		return (ALIGN(vram_size, SZ_256M)  * mul) / div; /* small-bar */
 }
 
 /**
@@ -670,7 +679,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 		igt_require(xe_has_vram(fd));
-		vram_size = xe_vram_size(fd, 0);
+		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 
 		xe_for_each_hw_engine(fd, hwe)
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 2018c8104..f0b25b782 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -70,7 +70,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, gt, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
@@ -229,7 +229,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -454,7 +454,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 059e6ae89..64c0a5b5e 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -130,15 +130,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		if (flags & DEFER_ALLOC) {
-			bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
-						bo_size,
-						vram_if_possible(fd, eci->gt_id) |
-						XE_GEM_CREATE_FLAG_DEFER_BACKING);
-		} else {
-			bo = xe_bo_create(fd, eci->gt_id, n_vm == 1 ? vm[0] : 0,
-					  bo_size);
-		}
+		uint32_t bo_flags;
+
+		bo_flags = visible_vram_if_possible(fd, eci->gt_id);
+		if (flags & DEFER_ALLOC)
+			bo_flags |= XE_GEM_CREATE_FLAG_DEFER_BACKING;
+
+		bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
+					bo_size, bo_flags);
 		if (!(flags & DEFER_BIND))
 			data = xe_bo_map(fd, bo, bo_size);
 	}
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 685193990..4506046f6 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -152,8 +152,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, flags & VM_FOR_BO ? vm : 0,
-				  bo_size);
+		bo = xe_bo_create_flags(fd, flags & VM_FOR_BO ? vm : 0,
+					bo_size, visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index a3ab17270..742e955f8 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -157,9 +157,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	} else {
 		if (flags & PREFETCH)
 			bo = xe_bo_create_flags(fd, 0, bo_size,
-						all_memory_regions(fd));
+						all_memory_regions(fd) |
+						visible_vram_if_possible(fd, 0));
 		else
-			bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
+			bo = xe_bo_create_flags(fd, 0, bo_size,
+						visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -390,8 +392,10 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
 	addr_wait = addr + bo_size;
 
 	bo = xe_bo_create_flags(fd, vm, bo_size,
-				all_memory_regions(fd));
-	bo_wait = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+				all_memory_regions(fd) |
+				visible_vram_if_possible(fd, 0));
+	bo_wait = xe_bo_create_flags(fd, vm, bo_size,
+				     visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 	wait = xe_bo_map(fd, bo_wait, bo_size);
 	ptr = &data[0].data;
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 0d72a3f20..c002b7882 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -51,7 +51,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	engine = xe_engine_create(fd, vm, eci, 0);
@@ -197,7 +198,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, gt, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
@@ -398,7 +399,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
@@ -577,7 +579,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
 
@@ -710,7 +713,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create(fd, 0, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
 
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 2e7779777..033c5859c 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -107,7 +107,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size,
+					visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -310,7 +311,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
+		bo = xe_bo_create_flags(fd, 0, bo_size,
+					visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -522,7 +524,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size,
+					visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae147..e2d917d64 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -64,7 +64,8 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 420c7f86c..7bfe72e51 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -124,10 +124,10 @@ igt_main
 		test_mmap(fd, system_memory(fd));
 
 	igt_subtest("vram")
-		test_mmap(fd, vram_memory(fd, 0));
+		test_mmap(fd, visible_vram_memory(fd, 0));
 
 	igt_subtest("vram-system")
-		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd));
+		test_mmap(fd, visible_vram_memory(fd, 0) | system_memory(fd));
 
 	igt_subtest("bad-flags")
 		test_bad_flags(fd);
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 355626e32..e4df09240 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -255,7 +255,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	bo = xe_bo_create(device.fd_xe, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(device.fd_xe, vm, bo_size,
+				visible_vram_if_possible(device.fd_xe, eci->gt_id));
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index c2b292c15..2d5ae08ea 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -109,7 +109,7 @@ static void test_with_fd_dup(void)
 	fd2 = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd2);
 
-	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
 	gem_close(fd1, handle);
@@ -148,8 +148,8 @@ static void test_with_two_bos(void)
 	fd2 = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd2);
 
-	handle1 = xe_bo_create(fd1, 0, 0, BO_SIZE);
-	handle2 = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle1 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
+	handle2 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
 	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -227,7 +227,7 @@ static void test_with_one_bo(void)
 	fd2 = drm_open_driver(DRIVER_XE);
 	xe_device_get(fd2);
 
-	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
 	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 861822b48..2af07c379 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -52,7 +52,8 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
 	batch_size = (n_dwords * 4 + 1) * sizeof(uint32_t);
 	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
 			   xe_get_default_alignment(fd));
-	batch_bo = xe_bo_create(fd, 0, vm, batch_size);
+	batch_bo = xe_bo_create_flags(fd, vm, batch_size,
+				      visible_vram_if_possible(fd, 0));
 	batch_map = xe_bo_map(fd, batch_bo, batch_size);
 
 	for (i = 0; i < n_dwords; i++) {
@@ -117,7 +118,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		vms = malloc(sizeof(*vms) * n_addrs);
 		igt_assert(vms);
 	}
-	bo = xe_bo_create(fd, 0, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	map = xe_bo_map(fd, bo, bo_size);
 	memset(map, 0, bo_size);
 
@@ -562,7 +563,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 			xe_get_default_alignment(fd));
 
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
+					   visible_vram_if_possible(fd, eci->gt_id));
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
 
@@ -731,7 +733,8 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 	bo_size = sizeof(*data) * N_ENGINES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < N_ENGINES; i++) {
@@ -892,7 +895,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
@@ -1088,7 +1092,11 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
 		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
 		igt_assert(map);
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
+			    xe_visible_vram_size(fd, 0));
+
+		bo = xe_bo_create_flags(fd, vm, bo_size,
+					visible_vram_if_possible(fd, eci->gt_id));
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -1367,7 +1375,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
 			    MAP_ANONYMOUS, -1, 0);
 		igt_assert(map != MAP_FAILED);
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size,
+					visible_vram_if_possible(fd, eci->gt_id));
 		map = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(map, 0, bo_size);
-- 
2.40.1
