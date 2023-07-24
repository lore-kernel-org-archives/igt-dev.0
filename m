Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B610E329
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 14:16:40 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 24 Jul 2023 15:16:00 +0100
Message-ID: <20230724141602.47733-5-matthew.auld@intel.com>
In-Reply-To: <20230724141602.47733-1-matthew.auld@intel.com>
References: <20230724141602.47733-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 4/6] tests/xe: handle small-bar systems
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
v3:
  - Small fix in xe_evict conversion (missing system_memory(fd))
v4 (José):
  - Add a few more missing annotations.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
---
 tests/xe/xe_dma_buf_sync.c      |  3 ++-
 tests/xe/xe_evict.c             | 34 +++++++++++++++++++++------------
 tests/xe/xe_exec_balancer.c     |  6 +++---
 tests/xe/xe_exec_basic.c        | 17 ++++++++---------
 tests/xe/xe_exec_compute_mode.c |  4 ++--
 tests/xe/xe_exec_fault_mode.c   | 12 ++++++++----
 tests/xe/xe_exec_reset.c        | 13 ++++++++-----
 tests/xe/xe_exec_store.c        |  6 ++++--
 tests/xe/xe_exec_threads.c      |  9 ++++++---
 tests/xe/xe_guc_pc.c            |  3 ++-
 tests/xe/xe_mmap.c              | 13 ++++++++-----
 tests/xe/xe_pm.c                |  3 ++-
 tests/xe/xe_prime_self_import.c | 23 +++++++++++++---------
 tests/xe/xe_vm.c                | 23 +++++++++++++++-------
 14 files changed, 105 insertions(+), 64 deletions(-)

diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index c08f8ac18..4e76d85ab 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -120,7 +120,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
 			xe_get_default_alignment(fd[0]));
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create(fd[0], hwe0->gt_id, 0, bo_size);
+		bo[i] = xe_bo_create_flags(fd[0], 0, bo_size,
+					   visible_vram_if_possible(fd[0], hwe0->gt_id));
 		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
 		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
 
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 1a70f1b45..c44cb80dc 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -97,15 +97,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -278,15 +280,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
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
+								  visible_vram_memory(fd, eci->gt_id) |
 								  system_memory(fd));
 			}
 		} else {
@@ -449,9 +453,15 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
 		pthread_join(threads_data[i].thread, NULL);
 }
 
+#define SZ_256M 0x10000000
+#define SZ_1G   0x40000000
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
@@ -664,7 +674,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(fd));
-		vram_size = xe_vram_size(fd, 0);
+		vram_size = xe_visible_vram_size(fd, 0);
 		igt_assert(vram_size);
 
 		xe_for_each_hw_engine(fd, hwe)
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 8df6ceba8..0b00d93de 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -69,7 +69,7 @@ static void test_all_active(int fd, int gt, int class)
 	bo_size = sizeof(*data) * num_placements;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, gt, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < num_placements; i++) {
@@ -225,7 +225,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
 		}
 		memset(data, 0, bo_size);
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 
@@ -447,7 +447,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 5624d31aa..bf3863d48 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -135,15 +135,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
index 27b538414..ee9756c21 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -150,8 +150,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
index bf7230c5a..7dcbb3c45 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -153,9 +153,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -382,8 +384,10 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
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
index 6ca1cd769..dfbaa6035 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -50,7 +50,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	spin = xe_bo_map(fd, bo, bo_size);
 
 	engine = xe_engine_create(fd, vm, eci, 0);
@@ -187,7 +188,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, gt, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
@@ -379,7 +380,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
@@ -550,7 +552,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 	memset(data, 0, bo_size);
 
@@ -682,7 +685,7 @@ static void submit_jobs(struct gt_thread_data *t)
 	uint32_t bo;
 	uint32_t *data;
 
-	bo = xe_bo_create(fd, 0, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	data = xe_bo_map(fd, bo, bo_size);
 	data[0] = MI_BATCH_BUFFER_END;
 
diff --git a/tests/xe/xe_exec_store.c b/tests/xe/xe_exec_store.c
index 9640b1567..ab1bde36e 100644
--- a/tests/xe/xe_exec_store.c
+++ b/tests/xe/xe_exec_store.c
@@ -82,7 +82,8 @@ static void store(int fd)
 			xe_get_default_alignment(fd));
 
 	hw_engine = xe_hw_engine(fd, 1);
-	bo = xe_bo_create(fd, hw_engine->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, hw_engine->gt_id));
 
 	xe_vm_bind_async(fd, vm, hw_engine->gt_id, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
@@ -138,7 +139,8 @@ static void store_all(int fd, int gt, int class)
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, 0, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, 0));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	xe_for_each_hw_engine(fd, hwe) {
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 414d8ee9a..396398984 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -106,7 +106,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, gt, vm, bo_size);
+		bo = xe_bo_create_flags(fd, vm, bo_size,
+					visible_vram_if_possible(fd, gt));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -306,7 +307,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			igt_assert(data);
 		}
 	} else {
-		bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
+		bo = xe_bo_create_flags(fd, 0, bo_size,
+					visible_vram_if_possible(fd, eci->gt_id));
 		data = xe_bo_map(fd, bo, bo_size);
 	}
 	memset(data, 0, bo_size);
@@ -516,7 +518,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
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
index cb52a7520..8cdd8ba74 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -65,7 +65,8 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
index 798facca9..b268158ab 100644
--- a/tests/xe/xe_mmap.c
+++ b/tests/xe/xe_mmap.c
@@ -63,7 +63,8 @@ static void test_bad_flags(int fd)
 {
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create(fd, 0, 0, size),
+		.handle = xe_bo_create_flags(fd, 0, size,
+					     visible_vram_if_possible(fd, 0)),
 		.flags = -1u,
 	};
 
@@ -81,7 +82,8 @@ static void test_bad_extensions(int fd)
 	uint64_t size = xe_get_default_alignment(fd);
 	struct xe_user_extension ext;
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create(fd, 0, 0, size),
+		.handle = xe_bo_create_flags(fd, 0, size,
+					     visible_vram_if_possible(fd, 0)),
 	};
 
 	mmo.extensions = to_user_pointer(&ext);
@@ -100,7 +102,8 @@ static void test_bad_object(int fd)
 {
 	uint64_t size = xe_get_default_alignment(fd);
 	struct drm_xe_gem_mmap_offset mmo = {
-		.handle = xe_bo_create(fd, 0, 0, size),
+		.handle = xe_bo_create_flags(fd, 0, size,
+					     visible_vram_if_possible(fd, 0)),
 	};
 
 	mmo.handle = 0xdeadbeef;
@@ -118,10 +121,10 @@ igt_main
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
index a7f73c4e6..559eccdeb 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -254,7 +254,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
 	if (check_rpm && runtime_usage_available(device.pci_xe))
 		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
 
-	bo = xe_bo_create(device.fd_xe, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(device.fd_xe, vm, bo_size,
+				visible_vram_if_possible(device.fd_xe, eci->gt_id));
 	data = xe_bo_map(device.fd_xe, bo, bo_size);
 
 	for (i = 0; i < n_engines; i++) {
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index 0fd79f704..bfa0d5e34 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -107,7 +107,7 @@ static void test_with_fd_dup(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
 	gem_close(fd1, handle);
@@ -141,8 +141,8 @@ static void test_with_two_bos(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle1 = xe_bo_create(fd1, 0, 0, BO_SIZE);
-	handle2 = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle1 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
+	handle2 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
 	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -178,7 +178,8 @@ static void test_with_one_bo_two_files(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle_orig = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle_orig = xe_bo_create_flags(fd1, 0, BO_SIZE,
+					 visible_vram_if_possible(fd1, 0));
 	dma_buf_fd1 = prime_handle_to_fd(fd1, handle_orig);
 
 	flink_name = gem_flink(fd1, handle_orig);
@@ -211,7 +212,7 @@ static void test_with_one_bo(void)
 	fd1 = drm_open_driver(DRIVER_XE);
 	fd2 = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
 
 	dma_buf_fd = prime_handle_to_fd(fd1, handle);
 	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
@@ -298,7 +299,8 @@ static void *thread_fn_reimport_vs_close(void *p)
 
 	fds[0] = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fds[0], 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fds[0], 0, BO_SIZE,
+				    visible_vram_if_possible(fds[0], 0));
 
 	fds[1] = prime_handle_to_fd(fds[0], handle);
 	pthread_barrier_init(&g_barrier, NULL, num_threads);
@@ -340,7 +342,8 @@ static void *thread_fn_export_vs_close(void *p)
 
 	igt_until_timeout(g_time_out) {
 		/* We want to race gem close against prime export on handle one.*/
-		handle = xe_bo_create(fd, 0, 0, 4096);
+		handle = xe_bo_create_flags(fd, 0, 4096,
+					    visible_vram_if_possible(fd, 0));
 		if (handle != 1)
 			gem_close(fd, handle);
 
@@ -438,7 +441,8 @@ static void test_llseek_size(void)
 	for (i = 0; i < 10; i++) {
 		int bufsz = xe_get_default_alignment(fd) << i;
 
-		handle = xe_bo_create(fd, 0, 0, bufsz);
+		handle = xe_bo_create_flags(fd, 0, bufsz,
+					    visible_vram_if_possible(fd, 0));
 		dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 		gem_close(fd, handle);
@@ -467,7 +471,8 @@ static void test_llseek_bad(void)
 
 	fd = drm_open_driver(DRIVER_XE);
 
-	handle = xe_bo_create(fd, 0, 0, BO_SIZE);
+	handle = xe_bo_create_flags(fd, 0, BO_SIZE,
+				    visible_vram_if_possible(fd, 0));
 	dma_buf_fd = prime_handle_to_fd(fd, handle);
 
 	gem_close(fd, handle);
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 315cb7009..5703538cc 100644
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
@@ -116,7 +117,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
 		vms = malloc(sizeof(*vms) * n_addrs);
 		igt_assert(vms);
 	}
-	bo = xe_bo_create(fd, 0, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
 	map = xe_bo_map(fd, bo, bo_size);
 	memset(map, 0, bo_size);
 
@@ -554,7 +555,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
 			xe_get_default_alignment(fd));
 
 	for (i = 0; i < n_bo; ++i) {
-		bo[i] = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
+					   visible_vram_if_possible(fd, eci->gt_id));
 		data[i] = xe_bo_map(fd, bo[i], bo_size);
 	}
 
@@ -731,7 +733,8 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci,
 	bo_size = sizeof(*data) * N_ENGINES;
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < N_ENGINES; i++) {
@@ -911,7 +914,8 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
 			xe_get_default_alignment(fd));
 
-	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
+	bo = xe_bo_create_flags(fd, vm, bo_size,
+				visible_vram_if_possible(fd, eci->gt_id));
 	data = xe_bo_map(fd, bo, bo_size);
 
 	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
@@ -1103,7 +1107,11 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
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
 
@@ -1394,7 +1402,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
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
2.41.0
