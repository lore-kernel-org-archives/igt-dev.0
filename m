Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223C310E08C
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 09:47:47 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 876FE580D9D
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 02:47:44 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qASWz-00GFos-2s
 for igt-dev@lists.freedesktop.org; Sat, 17 Jun 2023 11:47:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jun 2023 11:47:39 +0200
Message-Id: <20230617094739.3874020-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
References: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/xe: remove an useless TODO message
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

When I originally wrote the test descriptions, I tought it
was a good idea to add a warn message to warn about
run type == FULL.

The documentation logic and tools improved a lot since them and
listing those are really easy nowadays. So, remove the
TODOs with:

	TODO: change ``'Run type' == FULL`` to a better category

in order to cleanup the documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_dma_buf_sync.c      |  2 --
 tests/xe/xe_evict.c             |  1 -
 tests/xe/xe_exec_balancer.c     |  7 -------
 tests/xe/xe_exec_basic.c        |  4 ----
 tests/xe/xe_exec_compute_mode.c |  3 ---
 tests/xe/xe_exec_fault_mode.c   |  8 --------
 tests/xe/xe_exec_reset.c        | 19 -------------------
 tests/xe/xe_exec_threads.c      |  1 -
 tests/xe/xe_gpgpu_fill.c        |  1 -
 tests/xe/xe_guc_pc.c            |  6 ------
 tests/xe/xe_intel_bb.c          | 10 ----------
 tests/xe/xe_noexec_ping_pong.c  |  1 -
 tests/xe/xe_pm.c                |  1 -
 tests/xe/xe_prime_self_import.c |  4 ----
 tests/xe/xe_spin_batch.c        |  4 ----
 tests/xe/xe_vm.c                | 17 -----------------
 16 files changed, 89 deletions(-)

diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index 1d7ffc60f945..71184c969b78 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -81,12 +81,10 @@ static bool sync_file_busy(int sync_file)
  * SUBTEST: export-dma-buf-many
  * Description: Test exporting many sync files from a dma-buf
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: export-dma-buf-many-read-sync
  * Description: Test export many prime BO as sync file and verify business
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index 7fef4efc5d43..2c39d4390823 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -462,7 +462,6 @@ static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
  * SUBTEST: evict-%s
  * Description:  %arg[1] evict test.
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index 2018c8104161..83a7b77ba560 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -31,7 +31,6 @@
  * 	Run a test to check if virtual engines can be running on all instances
  *	of a class simultaneously
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void test_all_active(int fd, int gt, int class)
 {
@@ -139,17 +138,14 @@ static void test_all_active(int fd, int gt, int class)
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-engines-%s
  * Description: Run %arg[1] test on many engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] test twice
@@ -362,7 +358,6 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
  * Description: Run compute mode virtual engine arg[1] test only once
  *
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: twice-cm-%s
  * Description: Run compute mode virtual engine arg[1] test twice
@@ -371,12 +366,10 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
  * SUBTEST: many-cm-%s
  * Description: Run compute mode virtual engine arg[1] test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-engines-cm-%s
  * Description: Run compute mode virtual engine arg[1] test on many engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  *
  * SUBTEST: no-exec-cm-%s
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 059e6ae89f6c..ae192f8e31f1 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -33,22 +33,18 @@
  * SUBTEST: once-%s
  * Description: Run %arg[1] test only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-engines-%s
  * Description: Run %arg[1] test on many engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-engines-many-vm-%s
  * Description: Run %arg[1] test on many engines and many VMs
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] test twice
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 6851939907d3..2d950fdc83ce 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -39,12 +39,10 @@
  * SUBTEST: once-%s
  * Description: Run %arg[1] compute machine test only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] compute machine test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -68,7 +66,6 @@
  * SUBTEST: many-engines-%s
  * Description: Run %arg[1] compute machine test on many engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category*
  *
  * arg[1]:
  *
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index a3ab172701f7..6d9e64868b7e 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -38,22 +38,18 @@
  * SUBTEST: once-%s
  * Description: Run %arg[1] fault mode test only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: twice-%s
  * Description: Run %arg[1] fault mode test twice
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-%s
  * Description: Run %arg[1] fault mode test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: many-engines-%s
  * Description: Run %arg[1] fault mode test on many engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -327,23 +323,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
  * SUBTEST: atomic-once
  * Description: Run atomic fault mode test only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: atomic-once-wait
  * Description: Run atomic wait fault mode test once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: atomic-many
  * Description: Run atomic fault mode test many times
  * Description: atomic many
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: atomic-many-wait
  * Description: Run atomic wait fault mode test many times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  */
 static void
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 0d72a3f20045..30b0548bfe19 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -25,7 +25,6 @@
  * SUBTEST: spin
  * Description: test spin
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
 {
@@ -106,22 +105,18 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: %s-cancel
  * Description: Test %arg[1] cancel
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: %s-engine-reset
  * Description: Test %arg[1] engine reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: %s-cat-error
  * Description: Test %arg[1] cat error
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: %s-gt-reset
  * Description: Test %arg[1] GT reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: virtual-close-fd-no-exec
  * Description: Test virtual close fd no-exec
@@ -130,17 +125,14 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
  * SUBTEST: parallel-close-fd-no-exec
  * Description: Test parallel close fd no-exec
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: %s-close-fd
  * Description: Test %arg[1] close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: %s-close-engines-close-fd
  * Description: Test %arg[1] close engines close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -327,22 +319,18 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
  * SUBTEST: cancel
  * Description: Test cancel
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: engine-reset
  * Description: Test engine reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: cat-error
  * Description: Test cat error
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: gt-reset
  * Description: Test GT reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: close-fd-no-exec
  * Description: Test close fd no-exec
@@ -351,12 +339,10 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
  * SUBTEST: close-fd
  * Description: Test close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: close-engines-close-fd
  * Description: Test close engines close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
@@ -508,17 +494,14 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
  * SUBTEST: cm-engine-reset
  * Description: Test compute mode engine reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: cm-cat-error
  * Description: Test compute mode cat-error
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: cm-gt-reset
  * Description: Test compute mode GT reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: cm-close-fd-no-exec
  * Description: Test compute mode close fd no-exec
@@ -527,12 +510,10 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
  * SUBTEST: cm-close-fd
  * Description: Test compute mode close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: cm-close-engines-close-fd
  * Description: Test compute mode close engines close fd
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 2e7779777d13..aac2450eecb3 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -816,7 +816,6 @@ static void *vm_async_ops_err_thread(void *data)
  * SUBTEST: threads-%s
  * Description: Run threads %arg[1] test with multi threads
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  * arg[1]:
  * @basic:
  *	basic
diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c
index 4e212a0a3efc..992fb92adeef 100644
--- a/tests/xe/xe_gpgpu_fill.c
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -81,7 +81,6 @@ static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
  * SUBTEST: basic
  * Description: run gpgpu fill
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 5c71ae147c4b..89d5ae9ef4ec 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -203,7 +203,6 @@ static void test_freq_basic_api(int sysfs, int gt_id)
  * SUBTEST: freq_fixed_exec
  * Description: Test fixed frequency request when engine is doing some work
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_freq_fixed(int sysfs, int gt_id)
@@ -252,7 +251,6 @@ static void test_freq_fixed(int sysfs, int gt_id)
  * SUBTEST: freq_range_exec
  * Description: Test range frequency request when engine is doing some work
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_freq_range(int sysfs, int gt_id)
@@ -278,7 +276,6 @@ static void test_freq_range(int sysfs, int gt_id)
  * SUBTEST: freq_low_max
  * Description: Test frequency request to minimal and maximum values
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_freq_low_max(int sysfs, int gt_id)
@@ -301,7 +298,6 @@ static void test_freq_low_max(int sysfs, int gt_id)
  * SUBTEST: freq_suspend
  * Description: Check frequency after returning from suspend
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_suspend(int sysfs, int gt_id)
@@ -324,12 +320,10 @@ static void test_suspend(int sysfs, int gt_id)
  * SUBTEST: freq_reset
  * Description: test frequency reset only once
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: freq_reset_multiple
  * Description: test frequency reset multiple times
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_reset(int fd, int sysfs, int gt_id, int cycles)
diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
index 29b5ececb88b..83fe29242675 100644
--- a/tests/xe/xe_intel_bb.c
+++ b/tests/xe/xe_intel_bb.c
@@ -118,7 +118,6 @@ static void print_buf(struct intel_buf *buf, const char *name)
  * SUBTEST: reset-bb
  * Description: check bb reset
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void reset_bb(struct buf_ops *bops)
 {
@@ -134,7 +133,6 @@ static void reset_bb(struct buf_ops *bops)
  * SUBTEST: purge-bb
  * Description: check bb reset == full (purge)
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void purge_bb(struct buf_ops *bops)
 {
@@ -216,7 +214,6 @@ static void simple_bb(struct buf_ops *bops, bool new_context)
  * SUBTEST: bb-with-allocator
  * Description: check bb with passed allocator
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void bb_with_allocator(struct buf_ops *bops)
 {
@@ -249,7 +246,6 @@ static void bb_with_allocator(struct buf_ops *bops)
  * SUBTEST: lot-of-buffers
  * Description: check running bb with many buffers
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 #define NUM_BUFS 500
 static void lot_of_buffers(struct buf_ops *bops)
@@ -290,7 +286,6 @@ static void lot_of_buffers(struct buf_ops *bops)
  * SUBTEST: add-remove-objects
  * Description: check bb object manipulation (add + remove)
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void add_remove_objects(struct buf_ops *bops)
 {
@@ -334,7 +329,6 @@ static void add_remove_objects(struct buf_ops *bops)
  * SUBTEST: destroy-bb
  * Description: check bb destroy/create
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void destroy_bb(struct buf_ops *bops)
 {
@@ -394,7 +388,6 @@ static void destroy_bb(struct buf_ops *bops)
  * SUBTEST: create-in-region
  * Description: check size validation on available regions
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void create_in_region(struct buf_ops *bops, uint64_t region)
 {
@@ -794,7 +787,6 @@ static void do_intel_bb_blit(struct buf_ops *bops, int loops, uint32_t tiling)
  * SUBTEST: offset-control
  * Description: check offset is kept on default simple allocator
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void offset_control(struct buf_ops *bops)
 {
@@ -879,7 +871,6 @@ static void offset_control(struct buf_ops *bops)
  * SUBTEST: delta-check
  * Description: check delta is honoured in intel-bb pipelines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 #define DELTA_BUFFERS 3
 static void delta_check(struct buf_ops *bops)
@@ -945,7 +936,6 @@ static void delta_check(struct buf_ops *bops)
  * SUBTEST: render
  * Description: check intel-bb render pipeline
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static int render(struct buf_ops *bops, uint32_t tiling,
 		  uint32_t width, uint32_t height)
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
index 547f8fcc6ec4..1d04d460814a 100644
--- a/tests/xe/xe_noexec_ping_pong.c
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -36,7 +36,6 @@
  *	The correct driver behaviour should be not to rebind anything unless
  *	there is worked queued on one of the VM's compute engines.
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
 {
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index 355626e32f9e..bba799bcbce3 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -9,7 +9,6 @@
  * Sub-category: power management
  * Test category: functionality test
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 #include <limits.h>
diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
index c2b292c15dbb..7a7e3d5edf4d 100644
--- a/tests/xe/xe_prime_self_import.c
+++ b/tests/xe/xe_prime_self_import.c
@@ -132,7 +132,6 @@ static void test_with_fd_dup(void)
  * SUBTEST: basic-with_two_bos
  * Description: basic prime import/export with two BOs
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_with_two_bos(void)
@@ -176,7 +175,6 @@ static void test_with_two_bos(void)
  * SUBTEST: basic-with_one_bo_two_files
  * Description: basic prime import/export with one BO and two files
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_with_one_bo_two_files(void)
@@ -447,7 +445,6 @@ static void test_export_close_race(void)
  * SUBTEST: basic-llseek-size
  * Description: basic BO llseek size test
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_llseek_size(void)
@@ -482,7 +479,6 @@ static void test_llseek_size(void)
  * SUBTEST: basic-llseek-bad
  * Description: basid bad BO llseek size test
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void test_llseek_bad(void)
diff --git a/tests/xe/xe_spin_batch.c b/tests/xe/xe_spin_batch.c
index 1638579c81db..bc13bddddf73 100644
--- a/tests/xe/xe_spin_batch.c
+++ b/tests/xe/xe_spin_batch.c
@@ -12,7 +12,6 @@
  * SUBTEST: spin-basic
  * Description: Basic test to submit spin batch submissons on copy engine.
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  */
 
@@ -34,7 +33,6 @@ static void spin_basic(int fd)
  * SUBTEST: spin-batch
  * Description: Create vm and engine of hwe class and run the spinner on it.
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  */
 
@@ -64,7 +62,6 @@ static void spin(int fd, struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: spin-basic-all
  * Description: Basic test which validates the functionality of spinner on all hwe.
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  */
 static void spin_basic_all(int fd)
@@ -98,7 +95,6 @@ static void spin_basic_all(int fd)
  * SUBTEST: spin-all
  * Description: Spinner test to run on all the engines!
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  */
 
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 819dbaab7aeb..479ded70f29b 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -84,7 +84,6 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
  * Description: Test scratch page creation and write
  * Functionality: scratch page
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
@@ -207,7 +206,6 @@ uint64_t addrs_57b[] = {
  * Description: bind once on one BO
  * Functionality: bind BO
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
@@ -225,7 +223,6 @@ test_bind_once(int fd)
  * Description: bind many times on one BO
  * Functionality: bind BO
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
@@ -246,7 +243,6 @@ test_bind_one_bo_many_times(int fd)
  * Description: Test bind many times and many VM on one BO
  * Functionality: bind BO
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void
@@ -265,7 +261,6 @@ test_bind_one_bo_many_times_many_vm(int fd)
  * Description: Test unbind all with %arg[1] VMAs
  * Functionality: unbind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1].values: 2, 8
  */
@@ -306,7 +301,6 @@ static void unbind_all(int fd, int n_vmas)
  *	and that it is correctly handled.
  * Functionality: userptr
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void userptr_invalid(int fd)
 {
@@ -343,13 +337,11 @@ struct vm_thread_data {
  * Description: Test VM async ops error
  * Functionality: VM
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: vm-async-ops-err-destroy
  * Description: Test VM async ops error destroy
  * Functionality: VM
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 
 static void *vm_async_ops_err_thread(void *data)
@@ -839,25 +831,21 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
  * Description: Test bind array twice
  * Functionality: bind engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-many
  * Description: Test bind array many times
  * Functionality: bind engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-engine-twice
  * Description: Test bind array engine twice
  * Functionality: bind engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * SUBTEST: bind-array-engine-many
  * Description: Test bind array engine many times
  * Functionality: bind engines
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  */
 static void
 test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
@@ -983,7 +971,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: bind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -1002,7 +989,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: userptr bind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -1022,7 +1008,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -1038,7 +1023,6 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test %arg[1] with %arg[2] bind size
  * Functionality: mixed bind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
@@ -1293,7 +1277,6 @@ static void *hammer_thread(void *tdata)
  * Description: Test munmap style unbind with %arg[1]
  * Functionality: unbind
  * Run type: FULL
- * TODO: change ``'Run type' == FULL`` to a better category
  *
  * arg[1]:
  *
-- 
2.40.1
