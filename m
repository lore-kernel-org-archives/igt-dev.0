Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9016E431
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 07:24:01 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 11 Oct 2021 12:45:55 +0530
Message-Id: <20211011071555.1069239-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915: use
 gem_require_mmap_device_coherent
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, matthew.auld@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Update gem_require_mmap_wc to gem_require_mmap_device_coherent
along with mmap__wc, as it works on discrete platforms, while
still using an explicit WC mmap on integrated platforms.
Below are the updated tests:
gem_exec_schedule
gem_exec_async
gem_busy
kms_busy

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_busy.c          | 4 ++--
 tests/i915/gem_exec_async.c    | 2 +-
 tests/i915/gem_exec_schedule.c | 4 ++--
 tests/i915/kms_busy.c          | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index b107734c..b4757736 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -479,7 +479,7 @@ igt_main
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
-				gem_require_mmap_wc(fd);
+				gem_require_mmap_device_coherent(fd);
 			}
 
 			test_each_engine_store("extended", fd, ctx, e) {
@@ -529,7 +529,7 @@ igt_main
 		igt_subtest_group {
 			igt_fixture {
 				igt_require(has_extended_busy_ioctl(fd));
-				gem_require_mmap_wc(fd);
+				gem_require_mmap_device_coherent(fd);
 			}
 
 			test_each_engine_store("hang-extended", fd, ctx, e) {
diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index ddebae13..d50fe45e 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -186,7 +186,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
-		gem_require_mmap_wc(fd);
+		gem_require_mmap_device_coherent(fd);
 		igt_require(has_async_execbuf(fd));
 
 		ctx = intel_ctx_create_all_physical(fd);
diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
index 1f6f71db..9478ed1a 100644
--- a/tests/i915/gem_exec_schedule.c
+++ b/tests/i915/gem_exec_schedule.c
@@ -1071,7 +1071,7 @@ static void semaphore_resolve(int i915, const intel_ctx_cfg_t *cfg,
 	inner = intel_ctx_create(i915, cfg);
 
 	semaphore = gem_create(i915, 4096);
-	sema = gem_mmap__wc(i915, semaphore, 0, 4096, PROT_WRITE);
+	sema = gem_mmap__device_coherent(i915, semaphore, 0, 4096, PROT_WRITE);
 
 	for_each_ctx_cfg_engine(i915, cfg, e) {
 		struct drm_i915_gem_exec_object2 obj[3];
@@ -3094,7 +3094,7 @@ igt_main
 		gem_scheduler_print_capability(fd);
 
 		igt_require_gem(fd);
-		gem_require_mmap_wc(fd);
+		gem_require_mmap_device_coherent(fd);
 		gem_require_contexts(fd);
 		ctx = intel_ctx_create_all_physical(fd);
 
diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 0afa1d36..99a07c2a 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -341,7 +341,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		enum pipe pipe;
 
 		igt_require_gem(fd);
-		gem_require_mmap_wc(fd);
+		gem_require_mmap_device_coherent(fd);
 		igt_require(gem_has_ring(fd, I915_EXEC_DEFAULT));
 
 		kmstest_set_vt_graphics_mode();
-- 
2.25.1
