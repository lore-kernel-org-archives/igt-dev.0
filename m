Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A810E07F
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 10:32:38 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:31:46 +0200
Message-ID: <20230908103218.1089792-5-mauro.chehab@linux.intel.com>
In-Reply-To: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
References: <20230908103218.1089792-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 04/11] tests: Intel Xe: drop Run type
 field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tomasz.mistat@intel.com, jari.tahvanainen@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Currently, the information for BAT or FULL run should be on both
places, testlists and test source but that makes harder to
maintain. In practice, only the testlists are updated for
intel-ci.

Drop the explicit field data from the source files,
relying on intel-ci testlists and main blacklist.

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_ccs.c               |  1 -
 tests/intel/xe_compute.c           |  1 -
 tests/intel/xe_create.c            |  2 --
 tests/intel/xe_debugfs.c           |  1 -
 tests/intel/xe_dma_buf_sync.c      |  4 ----
 tests/intel/xe_evict.c             | 10 ----------
 tests/intel/xe_exec_balancer.c     | 11 -----------
 tests/intel/xe_exec_basic.c        |  6 ------
 tests/intel/xe_exec_compute_mode.c |  4 ----
 tests/intel/xe_exec_fault_mode.c   |  8 --------
 tests/intel/xe_exec_reset.c        | 23 -----------------------
 tests/intel/xe_exec_store.c        |  2 --
 tests/intel/xe_exec_threads.c      |  2 --
 tests/intel/xe_exercise_blt.c      |  1 -
 tests/intel/xe_gpgpu_fill.c        |  1 -
 tests/intel/xe_guc_pc.c            |  9 ---------
 tests/intel/xe_huc_copy.c          |  1 -
 tests/intel/xe_intel_bb.c          | 13 -------------
 tests/intel/xe_live_ktest.c        |  1 -
 tests/intel/xe_media_fill.c        |  1 -
 tests/intel/xe_mmap.c              |  1 -
 tests/intel/xe_mmio.c              |  1 -
 tests/intel/xe_module_load.c       |  6 ------
 tests/intel/xe_noexec_ping_pong.c  |  1 -
 tests/intel/xe_pm.c                |  2 --
 tests/intel/xe_pm_residency.c      |  4 ----
 tests/intel/xe_prime_self_import.c |  8 --------
 tests/intel/xe_query.c             |  1 -
 tests/intel/xe_spin_batch.c        |  4 ----
 tests/intel/xe_sysfs_defaults.c    |  1 -
 tests/intel/xe_sysfs_scheduler.c   |  1 -
 tests/intel/xe_sysfs_tile.c        |  1 -
 tests/intel/xe_uevent.c            |  1 -
 tests/intel/xe_vm.c                | 22 ----------------------
 tests/intel/xe_waitfence.c         |  1 -
 35 files changed, 157 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index e9e13ab5c77f..20bbc4448cd8 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -23,7 +23,6 @@
  * Functionality: flat_ccs
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: block-copy-compressed
  * Description: Check block-copy flatccs compressed blit
diff --git a/tests/intel/xe_compute.c b/tests/intel/xe_compute.c
index 2cf536701a58..41db9ff2f17c 100644
--- a/tests/intel/xe_compute.c
+++ b/tests/intel/xe_compute.c
@@ -8,7 +8,6 @@
  * Category: Hardware building block
  * Sub-category: compute
  * Test category: functionality test
- * Run type: BAT
  */
 
 #include <string.h>
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 3e4bc1e3ae35..8d845e5c86be 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -7,7 +7,6 @@
  * TEST: Check bo create ioctl
  * Category: Software building block
  * Sub-category: uapi
- * Run type: BAT
  */
 
 #include <string.h>
@@ -127,7 +126,6 @@ static uint32_t __xe_exec_queue_create(int fd, uint32_t vm,
  * Functionality: exequeues creation time
  * Description: Check process ability of multiple exec_queues creation
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 1b80164502b6..88b51dbd4c8c 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -9,7 +9,6 @@
  * Sub-category: uapi
  * Functionality: debugfs
  * Test category: functionality test
- * Run type: BAT
  * Description: Validate debugfs entries
  */
 
diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
index 8c400c8fd4d9..f233e70c6714 100644
--- a/tests/intel/xe_dma_buf_sync.c
+++ b/tests/intel/xe_dma_buf_sync.c
@@ -72,22 +72,18 @@ static bool sync_file_busy(int sync_file)
  * SUBTEST: export-dma-buf-once
  * Description: Test exporting a sync file from a dma-buf
  * Functionality: export
- * Run type: BAT
  *
  * SUBTEST: export-dma-buf-once-read-sync
  * Description: Test export prime BO as sync file and verify business
  * Functionality: export
- * Run type: BAT
  *
  * SUBTEST: export-dma-buf-many
  * Description: Test exporting many sync files from a dma-buf
  * Functionality: export
- * Run type: FULL
  *
  * SUBTEST: export-dma-buf-many-read-sync
  * Description: Test export many prime BO as sync file and verify business
  * Functionality: export
- * Run type: FULL
  */
 
 static void
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 7a508fdd2a4e..5b64e56b455a 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -468,7 +468,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -483,7 +482,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -499,7 +497,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: compute machine
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -515,7 +512,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: compute machine
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -532,7 +528,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: mixted threads
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -552,7 +547,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: mixted threads
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -572,7 +566,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: compute mode threads
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  * @cm-threads-small:		compute mode threads small
@@ -587,7 +580,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: compute mode threads
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  * @cm-threads-large:		compute mode threads large
@@ -602,7 +594,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: threads
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -619,7 +610,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * Description:  %arg[1] evict test.
  * Feature: threads
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index f571f13d9620..3fb535988cc9 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -31,7 +31,6 @@
  * 	Run a test to check if virtual exec_queues can be running on all instances
  *	of a class simultaneously
  * Test category: functionality test
- * Run type: FULL
  */
 static void test_all_active(int fd, int gt, int class)
 {
@@ -139,27 +138,22 @@ static void test_all_active(int fd, int gt, int class)
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] test many times
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: many-execqueues-%s
  * Description: Run %arg[1] test on many exec_queues
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] test twice
  * Test category: functionality test
- * Run type: BAT
  *
  * SUBTEST: no-exec-%s
  * Description: Run no-exec %arg[1] test
  * Test category: functionality test
- * Run type: BAT
  *
  * arg[1]:
  *
@@ -364,28 +358,23 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Run compute mode virtual exec_queue arg[1] test only once
  * Test category: functionality test
  *
- * Run type: FULL
  *
  * SUBTEST: twice-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] test twice
  * Test category: functionality test
- * Run type: BAT
  *
  * SUBTEST: many-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] test many times
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: many-execqueues-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] test on many exec_queues
  * Test category: stress test
- * Run type: FULL
  *
  *
  * SUBTEST: no-exec-cm-%s
  * Description: Run compute mode virtual exec_queue arg[1] no-exec test
  * Test category: functionality test
- * Run type: BAT
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index d1d36e086a06..a4414e052353 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -33,32 +33,26 @@
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] test many times
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: many-execqueues-%s
  * Description: Run %arg[1] test on many exec_queues
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: many-execqueues-many-vm-%s
  * Description: Run %arg[1] test on many exec_queues and many VMs
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] test twice
  * Test category: functionality test
- * Run type: BAT
  *
  * SUBTEST: no-exec-%s
  * Description: Run no-exec %arg[1] test
  * Test category: functionality test
- * Run type: BAT
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 38c904ddd2b0..6d1084727019 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -34,17 +34,14 @@
  * SUBTEST: twice-%s
  * Description: Run %arg[1] compute machine test twice
  * Test category: functionality test
- * Run type: BAT
  *
  * SUBTEST: once-%s
  * Description: Run %arg[1] compute machine test only once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] compute machine test many times
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -68,7 +65,6 @@
  * SUBTEST: many-execqueues-%s
  * Description: Run %arg[1] compute machine test on many exec_queues
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index efd7ca2c2c8b..c5d6bdcd5df6 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -37,22 +37,18 @@
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] fault mode test twice
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] fault mode test many times
  * Test category: stress test
- * Run type: FULL
  *
  * SUBTEST: many-execqueues-%s
  * Description: Run %arg[1] fault mode test on many exec_queues
  * Test category: stress test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -328,23 +324,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
  * SUBTEST: atomic-once
  * Description: Run atomic fault mode test only once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: atomic-once-wait
  * Description: Run atomic wait fault mode test once
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: atomic-many
  * Description: Run atomic fault mode test many times
  * Description: atomic many
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: atomic-many-wait
  * Description: Run atomic wait fault mode test many times
  * Test category: functionality test
- * Run type: FULL
  *
  */
 static void
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index a2d33baf13cf..f12af4d9217e 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -24,7 +24,6 @@
 /**
  * SUBTEST: spin
  * Description: test spin
- * Run type: FULL
  */
 static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 {
@@ -105,35 +104,27 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 /**
  * SUBTEST: %s-cancel
  * Description: Test %arg[1] cancel
- * Run type: FULL
  *
  * SUBTEST: %s-execqueue-reset
  * Description: Test %arg[1] exec_queue reset
- * Run type: FULL
  *
  * SUBTEST: %s-cat-error
  * Description: Test %arg[1] cat error
- * Run type: FULL
  *
  * SUBTEST: %s-gt-reset
  * Description: Test %arg[1] GT reset
- * Run type: FULL
  *
  * SUBTEST: virtual-close-fd-no-exec
  * Description: Test virtual close fd no-exec
- * Run type: BAT
  *
  * SUBTEST: parallel-close-fd-no-exec
  * Description: Test parallel close fd no-exec
- * Run type: FULL
  *
  * SUBTEST: %s-close-fd
  * Description: Test %arg[1] close fd
- * Run type: FULL
  *
  * SUBTEST: %s-close-execqueues-close-fd
  * Description: Test %arg[1] close exec_queues close fd
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -316,31 +307,24 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
 /**
  * SUBTEST: cancel
  * Description: Test cancel
- * Run type: FULL
  *
  * SUBTEST: execqueue-reset
  * Description: Test exec_queue reset
- * Run type: FULL
  *
  * SUBTEST: cat-error
  * Description: Test cat error
- * Run type: FULL
  *
  * SUBTEST: gt-reset
  * Description: Test GT reset
- * Run type: FULL
  *
  * SUBTEST: close-fd-no-exec
  * Description: Test close fd no-exec
- * Run type: BAT
  *
  * SUBTEST: close-fd
  * Description: Test close fd
- * Run type: FULL
  *
  * SUBTEST: close-execqueues-close-fd
  * Description: Test close exec_queues close fd
- * Run type: FULL
  */
 
 static void
@@ -489,27 +473,21 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
 /**
  * SUBTEST: cm-execqueue-reset
  * Description: Test compute mode exec_queue reset
- * Run type: FULL
  *
  * SUBTEST: cm-cat-error
  * Description: Test compute mode cat-error
- * Run type: FULL
  *
  * SUBTEST: cm-gt-reset
  * Description: Test compute mode GT reset
- * Run type: FULL
  *
  * SUBTEST: cm-close-fd-no-exec
  * Description: Test compute mode close fd no-exec
- * Run type: BAT
  *
  * SUBTEST: cm-close-fd
  * Description: Test compute mode close fd
- * Run type: FULL
  *
  * SUBTEST: cm-close-execqueues-close-fd
  * Description: Test compute mode close exec_queues close fd
- * Run type: FULL
  */
 
 static void
@@ -744,7 +722,6 @@ static void *gt_reset_thread(void *data)
  * SUBTEST: gt-reset-stress
  * Description: Stress GT reset
  * Test category: stress test
- * Run type: stress
  *
  */
 static void
diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
index bab5ea5bca49..14f7c9becdb2 100644
--- a/tests/intel/xe_exec_store.c
+++ b/tests/intel/xe_exec_store.c
@@ -51,7 +51,6 @@ static void store_dword_batch(struct data *data, uint64_t addr, int value)
 /**
  * SUBTEST: basic-store
  * Description: Basic test to verify store dword.
- * Run type: BAT
  */
 static void store(int fd)
 {
@@ -109,7 +108,6 @@ static void store(int fd)
 /**
  * SUBTEST: basic-all
  * Description: Test to verify store dword on all available engines.
- * Run type: BAT
  */
 static void store_all(int fd, int gt, int class)
 {
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index e64c1639a0e7..ae4da0568a80 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -790,7 +790,6 @@ static void *vm_async_ops_err_thread(void *data)
 /**
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
- * Run type: BAT
  *
  * arg[1]:
  *
@@ -810,7 +809,6 @@ static void *vm_async_ops_err_thread(void *data)
 /**
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
- * Run type: FULL
  * arg[1]:
  * @basic:
  *	basic
diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
index 2e2ec34dcfc3..ca85f5f1852c 100644
--- a/tests/intel/xe_exercise_blt.c
+++ b/tests/intel/xe_exercise_blt.c
@@ -18,7 +18,6 @@
  * Sub-category: Blitter
  * Functionality: flat_ccs
  * Description: Exercise blitter commands on Xe
- * Run type: FULL
  * Test category: functionality test
  *
  * SUBTEST: fast-copy
diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index 4da01ee8c48e..eee77d2520c1 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -80,7 +80,6 @@ static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
 /**
  * SUBTEST: basic
  * Description: run gpgpu fill
- * Run type: FULL
  */
 
 static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
diff --git a/tests/intel/xe_guc_pc.c b/tests/intel/xe_guc_pc.c
index 032816921f3d..a664f0cff5df 100644
--- a/tests/intel/xe_guc_pc.c
+++ b/tests/intel/xe_guc_pc.c
@@ -174,7 +174,6 @@ static uint32_t get_freq(int fd, int gt_id, const char *freq_name)
 /**
  * SUBTEST: freq_basic_api
  * Description: Test basic get and set frequency API
- * Run type: BAT
  */
 
 static void test_freq_basic_api(int fd, int gt_id)
@@ -213,11 +212,9 @@ static void test_freq_basic_api(int fd, int gt_id)
 /**
  * SUBTEST: freq_fixed_idle
  * Description: Test fixed frequency request with exec_queue in idle state
- * Run type: BAT
  *
  * SUBTEST: freq_fixed_exec
  * Description: Test fixed frequency request when exec_queue is doing some work
- * Run type: FULL
  */
 
 static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
@@ -279,11 +276,9 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 /**
  * SUBTEST: freq_range_idle
  * Description: Test range frequency request with exec_queue in idle state
- * Run type: BAT
  *
  * SUBTEST: freq_range_exec
  * Description: Test range frequency request when exec_queue is doing some work
- * Run type: FULL
  */
 
 static void test_freq_range(int fd, int gt_id, bool gt_idle)
@@ -314,7 +309,6 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 /**
  * SUBTEST: freq_low_max
  * Description: Test frequency request to minimal and maximum values
- * Run type: FULL
  */
 
 static void test_freq_low_max(int fd, int gt_id)
@@ -336,7 +330,6 @@ static void test_freq_low_max(int fd, int gt_id)
 /**
  * SUBTEST: freq_suspend
  * Description: Check frequency after returning from suspend
- * Run type: FULL
  */
 
 static void test_suspend(int fd, int gt_id)
@@ -358,11 +351,9 @@ static void test_suspend(int fd, int gt_id)
 /**
  * SUBTEST: freq_reset
  * Description: test frequency reset only once
- * Run type: FULL
  *
  * SUBTEST: freq_reset_multiple
  * Description: test frequency reset multiple times
- * Run type: FULL
  */
 
 static void test_reset(int fd, int gt_id, int cycles)
diff --git a/tests/intel/xe_huc_copy.c b/tests/intel/xe_huc_copy.c
index cbc30a8f67ab..c9891a72903a 100644
--- a/tests/intel/xe_huc_copy.c
+++ b/tests/intel/xe_huc_copy.c
@@ -98,7 +98,6 @@ gen12_create_batch_huc_copy(uint32_t *batch,
 
 /**
  * SUBTEST: huc_copy
- * Run type: BAT
  * Description:
  *	Loads the HuC copy firmware to copy the content of
  *	the source buffer to the destination buffer. *
diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
index daab3496d44f..0159a3164407 100644
--- a/tests/intel/xe_intel_bb.c
+++ b/tests/intel/xe_intel_bb.c
@@ -117,7 +117,6 @@ static void print_buf(struct intel_buf *buf, const char *name)
 /**
  * SUBTEST: reset-bb
  * Description: check bb reset
- * Run type: FULL
  */
 static void reset_bb(struct buf_ops *bops)
 {
@@ -132,7 +131,6 @@ static void reset_bb(struct buf_ops *bops)
 /**
  * SUBTEST: purge-bb
  * Description: check bb reset == full (purge)
- * Run type: FULL
  */
 static void purge_bb(struct buf_ops *bops)
 {
@@ -164,7 +162,6 @@ static void purge_bb(struct buf_ops *bops)
 /**
  * SUBTEST: simple-%s
  * Description: Run simple bb xe %arg[1] test
- * Run type: BAT
  *
  * arg[1]:
  *
@@ -213,7 +210,6 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
 /**
  * SUBTEST: bb-with-allocator
  * Description: check bb with passed allocator
- * Run type: FULL
  */
 static void bb_with_allocator(struct buf_ops *bops)
 {
@@ -245,7 +241,6 @@ static void bb_with_allocator(struct buf_ops *bops)
 /**
  * SUBTEST: lot-of-buffers
  * Description: check running bb with many buffers
- * Run type: FULL
  */
 #define NUM_BUFS 500
 static void lot_of_buffers(struct buf_ops *bops)
@@ -285,7 +280,6 @@ static void lot_of_buffers(struct buf_ops *bops)
 /**
  * SUBTEST: add-remove-objects
  * Description: check bb object manipulation (add + remove)
- * Run type: FULL
  */
 static void add_remove_objects(struct buf_ops *bops)
 {
@@ -328,7 +322,6 @@ static void add_remove_objects(struct buf_ops *bops)
 /**
  * SUBTEST: destroy-bb
  * Description: check bb destroy/create
- * Run type: FULL
  */
 static void destroy_bb(struct buf_ops *bops)
 {
@@ -387,7 +380,6 @@ static void destroy_bb(struct buf_ops *bops)
 /**
  * SUBTEST: create-in-region
  * Description: check size validation on available regions
- * Run type: FULL
  */
 static void create_in_region(struct buf_ops *bops, uint64_t region)
 {
@@ -435,7 +427,6 @@ static void __emit_blit(struct intel_bb *ibb,
 /**
  * SUBTEST: blit-%s
  * Description: Run blit on %arg[1] allocator
- * Run type: BAT
  *
  * arg[1]:
  *
@@ -761,7 +752,6 @@ static int __do_intel_bb_blit(struct buf_ops *bops, uint32_t tiling)
 /**
  * SUBTEST: intel-bb-blit-%s
  * Description: Run simple bb xe %arg[1] test
- * Run type: BAT
  *
  * arg[1]:
  *
@@ -786,7 +776,6 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
 /**
  * SUBTEST: offset-control
  * Description: check offset is kept on default simple allocator
- * Run type: FULL
  */
 static void offset_control(struct buf_ops *bops)
 {
@@ -870,7 +859,6 @@ static void offset_control(struct buf_ops *bops)
 /**
  * SUBTEST: delta-check
  * Description: check delta is honoured in intel-bb pipelines
- * Run type: FULL
  */
 #define DELTA_BUFFERS 3
 static void delta_check(struct buf_ops *bops)
@@ -935,7 +923,6 @@ static void delta_check(struct buf_ops *bops)
 /**
  * SUBTEST: render
  * Description: check intel-bb render pipeline
- * Run type: FULL
  */
 static int render(struct buf_ops *bops, uint32_t tiling,
 		  uint32_t width, uint32_t height)
diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index 779ff7efd402..fe7b2e69f49b 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -8,7 +8,6 @@
  * Sub-category: kunit
  * Functionality: kunit
  * Test category: functionality test
- * Run type: BAT, kunit
  *
  * SUBTEST: bo
  * Functionality: bo
diff --git a/tests/intel/xe_media_fill.c b/tests/intel/xe_media_fill.c
index 84c721ba7a1c..6b8494537038 100644
--- a/tests/intel/xe_media_fill.c
+++ b/tests/intel/xe_media_fill.c
@@ -34,7 +34,6 @@
  *              a very simple workload for the Media pipeline.
  * Feature: media
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: media-fill
  */
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 1b759207bf1d..7e7e43c00fc0 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -8,7 +8,6 @@
  * Category: Software building block
  * Sub-category: VMA
  * Functionality: mmap
- * Run type: BAT
  */
 
 #include "igt.h"
diff --git a/tests/intel/xe_mmio.c b/tests/intel/xe_mmio.c
index 4053faa5606f..9ac544770749 100644
--- a/tests/intel/xe_mmio.c
+++ b/tests/intel/xe_mmio.c
@@ -8,7 +8,6 @@
  * Category: Software building block
  * Sub-category: mmio
  * Functionality: mmap
- * Run type: BAT
  */
 
 #include "igt.h"
diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
index 75ee948a79d7..080e12ec88bc 100644
--- a/tests/intel/xe_module_load.c
+++ b/tests/intel/xe_module_load.c
@@ -100,27 +100,21 @@ static const char * const unwanted_drivers[] = {
 /**
  * SUBTEST: force-load
  * Description: Load the Xe driver passing ``force_probe=*`` parameter
- * Run type: BAT, boot
  *
  * SUBTEST: load
  * Description: Load the Xe driver
- * Run type: FULL
  *
  * SUBTEST: unload
  * Description: Unload the Xe driver
- * Run type: FULL
  *
  * SUBTEST: reload
  * Description: Reload the Xe driver
- * Run type: FULL
  *
  * SUBTEST: reload-no-display
  * Description: Reload the Xe driver passing ``enable_display=0`` parameter
- * Run type: FULL
  *
  * SUBTEST: many-reload
  * Description: Reload the Xe driver many times
- * Run type: FULL
  */
 igt_main
 {
diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index a238f9d34a76..3f486adf97fc 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -27,7 +27,6 @@
  *	This test creates compute vms, binds a couple of bos and an exec_queue each,
  *	thus redying it for execution.
  *
- * Run type: FULL
  */
  /*
   * More dailed test description:
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index d31049d193e5..fd28d5630df7 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -8,7 +8,6 @@
  * Category: Software building block
  * Sub-category: power management
  * Test category: functionality test
- * Run type: FULL
  */
 
 #include <limits.h>
@@ -370,7 +369,6 @@ NULL));
  * Description:
  *	Validate whether card is limited to d3hot while vram used
  *	is greater than vram_d3cold_threshold.
- * Run type: FULL
  */
 static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 {
diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index bf8230114208..6dc88ad0ae9b 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -43,22 +43,18 @@ enum test_type {
 /**
  * SUBTEST: gt-c6-on-idle
  * Description: Validate GT C6 state on idle
- * Run type: BAT
  *
  * SUBTEST: idle-residency
  * Description: basic residency test to validate idle residency
  *		measured over a time interval is within the tolerance
- * Run type: FULL
  *
  * SUBTEST: gt-c6-freeze
  * Description: Validate idle residency measured over suspend(s2idle)
  *              is greater than suspend time or within tolerance
- * Run type: FULL
  *
  * SUBTEST: toggle-gt-c6
  * Description: toggles GT C states by acquiring/releasing forcewake,
  *		also validates power consumed by GPU in GT C6 is lesser than that of GT C0.
- * Run type: FULL
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
diff --git a/tests/intel/xe_prime_self_import.c b/tests/intel/xe_prime_self_import.c
index bfa0d5e34122..994fd99f5bf5 100644
--- a/tests/intel/xe_prime_self_import.c
+++ b/tests/intel/xe_prime_self_import.c
@@ -93,7 +93,6 @@ check_bo(int fd1, uint32_t handle1, int fd2, uint32_t handle2)
 /**
  * SUBTEST: basic-with_fd_dup
  * Description: basic prime import/export with fd_dup
- * Run type: BAT
  */
 
 static void test_with_fd_dup(void)
@@ -127,7 +126,6 @@ static void test_with_fd_dup(void)
 /**
  * SUBTEST: basic-with_two_bos
  * Description: basic prime import/export with two BOs
- * Run type: FULL
  */
 
 static void test_with_two_bos(void)
@@ -166,7 +164,6 @@ static void test_with_two_bos(void)
 /**
  * SUBTEST: basic-with_one_bo_two_files
  * Description: basic prime import/export with one BO and two files
- * Run type: FULL
  */
 
 static void test_with_one_bo_two_files(void)
@@ -200,7 +197,6 @@ static void test_with_one_bo_two_files(void)
 /**
  * SUBTEST: basic-with_one_bo
  * Description: basic prime import/export with one BO
- * Run type: BAT
  */
 
 static void test_with_one_bo(void)
@@ -272,7 +268,6 @@ static void *thread_fn_reimport_vs_close(void *p)
 /**
  * SUBTEST: reimport-vs-gem_close-race
  * Description: Reimport versus gem_close race
- * Run type: FULL
  */
 
  static void test_reimport_close_race(void)
@@ -370,7 +365,6 @@ static void *thread_fn_export_vs_close(void *p)
 /**
  * SUBTEST: export-vs-gem_close-race
  * Description: Export versus gem_close race test
- * Run type: FULL
  */
 
 static void test_export_close_race(void)
@@ -425,7 +419,6 @@ static void test_export_close_race(void)
 /**
  * SUBTEST: basic-llseek-size
  * Description: basic BO llseek size test
- * Run type: FULL
  */
 
 static void test_llseek_size(void)
@@ -458,7 +451,6 @@ static void test_llseek_size(void)
 /**
  * SUBTEST: basic-llseek-bad
  * Description: basid bad BO llseek size test
- * Run type: FULL
  */
 
 static void test_llseek_bad(void)
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 8ec849130a29..b38913c9f5fc 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -8,7 +8,6 @@
  * Category: Software building block
  * Sub-category: uapi
  * Functionality: ioctl
- * Run type: BAT
  * Description: Acquire configuration data for xe device
  */
 
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 9bd3dc349f10..dd9d7366fcd2 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -17,7 +17,6 @@
 /**
  * SUBTEST: spin-basic
  * Description: Basic test to submit spin batch submissons on copy engine.
- * Run type: FULL
  */
 
 static void spin_basic(int fd)
@@ -35,7 +34,6 @@ static void spin_basic(int fd)
 /**
  * SUBTEST: spin-batch
  * Description: Create vm and engine of hwe class and run the spinner on it.
- * Run type: FULL
  */
 
 static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
@@ -61,7 +59,6 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
 /**
  * SUBTEST: spin-basic-all
  * Description: Basic test which validates the functionality of spinner on all hwe.
- * Run type: FULL
  */
 static void spin_basic_all(int fd)
 {
@@ -92,7 +89,6 @@ static void spin_basic_all(int fd)
 /**
  * SUBTEST: spin-all
  * Description: Spinner test to run on all the engines!
- * Run type: FULL
  */
 
 static void spin_all(int fd, int gt, int class)
diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index 0fc2918b621a..a1cbfb11d7dd 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -7,7 +7,6 @@
  * TEST: xe sysfs defaults
  * Category: Infrastructure
  * Functionality: sysman defaults
- * Run type: FULL
  * Sub-category: sysman
  * Test category: functionality test
  * SUBTEST: engine-defaults
diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 866b9d50ab68..e41fc4b6bb61 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -8,7 +8,6 @@
  * Category: Software building block
  * Sub-category: sysman
  * Functionality: scheduler control interface
- * Run type: FULL
  *
  * SUBTEST: %s-invalid
  * Description: Test to check if %s arg[1] schedule parameter rejects any unrepresentable intervals.
diff --git a/tests/intel/xe_sysfs_tile.c b/tests/intel/xe_sysfs_tile.c
index a7203e2b39e0..ba970cda831b 100644
--- a/tests/intel/xe_sysfs_tile.c
+++ b/tests/intel/xe_sysfs_tile.c
@@ -9,7 +9,6 @@
  * SUBTEST: physical_vram_size_bytes
  * Functionality: Vram
  * Sub-category: Total vram per tile
- * Run type: FULL
  * Test category: functionality test
  * Description:
  *             Read sysfs entry for physical_vram_size_bytes and compare with
diff --git a/tests/intel/xe_uevent.c b/tests/intel/xe_uevent.c
index b8a92b698c59..d30931714f0c 100644
--- a/tests/intel/xe_uevent.c
+++ b/tests/intel/xe_uevent.c
@@ -9,7 +9,6 @@
  * SUBTEST:fake_reset_uevent_listener
  * Functionality: uevent
  * Sub-category: GT reset failure uevent
- * Run type: FULL
  * Test category: functionality test
  * Description:
  *		Test creates uevent listener and causes fake reset failure for gt0
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 5453f10c47fe..5455348bb757 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -84,7 +84,6 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
  * Description: Test scratch page creation and write
  * Functionality: scratch page
  * Test category: functionality test
- * Run type: FULL
  */
 
 static void
@@ -207,7 +206,6 @@ uint64_t addrs_57b[] = {
  * Description: bind once on one BO
  * Functionality: bind BO
  * Test category: functionality test
- * Run type: FULL
  */
 
 static void
@@ -225,7 +223,6 @@ test_bind_once(int fd)
  * Description: bind many times on one BO
  * Functionality: bind BO
  * Test category: functionality test
- * Run type: FULL
  */
 
 static void
@@ -246,7 +243,6 @@ test_bind_one_bo_many_times(int fd)
  * Description: Test bind many times and many VM on one BO
  * Functionality: bind BO
  * Test category: functionality test
- * Run type: FULL
  */
 
 static void
@@ -265,7 +261,6 @@ test_bind_one_bo_many_times_many_vm(int fd)
  * Description: Test unbind all with %arg[1] VMAs
  * Functionality: unbind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1].values: 2, 8
  */
@@ -306,7 +301,6 @@ static void unbind_all(int fd, int n_vmas)
  *	and that it is correctly handled.
  * Functionality: userptr
  * Test category: negative test
- * Run type: FULL
  */
 static void userptr_invalid(int fd)
 {
@@ -343,13 +337,11 @@ struct vm_thread_data {
  * Description: Test VM async ops error
  * Functionality: VM
  * Test category: negative test
- * Run type: FULL
  *
  * SUBTEST: vm-async-ops-err-destroy
  * Description: Test VM async ops error destroy
  * Functionality: VM
  * Test category: negative test
- * Run type: FULL
  */
 
 static void *vm_async_ops_err_thread(void *data)
@@ -510,7 +502,6 @@ static void vm_async_ops_err(int fd, bool destroy)
  * SUBTEST: shared-%s-page
  * Description: Test shared arg[1] page
  * Test category: functionality test
- * Run type: BAT
  *
  * Functionality: %arg[1] page
  * arg[1].values: pte, pde, pde2, pde3
@@ -699,13 +690,11 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
  * Description: Test independent bind exec_queues
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: BAT
  *
  * SUBTEST: bind-execqueues-conflict
  * Description: Test conflict bind exec_queues
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: BAT
  */
 
 #define CONFLICT	(0x1 << 0)
@@ -875,25 +864,21 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
  * Description: Test bind array twice
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: bind-array-many
  * Description: Test bind array many times
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: bind-array-exec_queue-twice
  * Description: Test bind array exec_queue twice
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: FULL
  *
  * SUBTEST: bind-array-exec_queue-many
  * Description: Test bind array exec_queue many times
  * Functionality: bind exec_queues
  * Test category: functionality test
- * Run type: FULL
  */
 static void
 test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
@@ -1020,7 +1005,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: bind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -1039,7 +1023,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: userptr bind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -1059,7 +1042,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -1075,7 +1057,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -1328,7 +1309,6 @@ static void *hammer_thread(void *tdata)
  * @userptr-front:			userptr front
  * @userptr-inval-end:			userptr inval end
  * @userptr-inval-front:		userptr inval front
- * Run type: BAT
  */
 
 /**
@@ -1336,7 +1316,6 @@ static void *hammer_thread(void *tdata)
  * Description: Test munmap style unbind with %arg[1]
  * Functionality: unbind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
@@ -1650,7 +1629,6 @@ try_again_after_invalidate:
  * Description: Test mmap style unbind with %arg[1]
  * Functionality: bind
  * Test category: functionality test
- * Run type: FULL
  *
  * arg[1]:
  *
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 4f2df2a9d878..34005fbeba81 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -19,7 +19,6 @@
  * Sub-category: waitfence
  * Functionality: waitfence
  * Test category: functionality test
- * Run type: BAT
  * Description: Test waitfences functionality
  */
 
-- 
2.41.0
