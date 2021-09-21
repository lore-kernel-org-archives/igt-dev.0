Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC26E8F4
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Sep 2021 04:10:50 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue, 21 Sep 2021 09:33:30 +0530
Message-Id: <20210921040330.909964-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915: use device_coherent mmap
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

Update mmap__wc with mmap__device_coherent, as it works
on discrete platforms, while still using an explicit WC mmap on
integrated platforms.
Below are the updated tests:
gem_exec_capture
gem_exec_nop
perf_pmu
prime_busy

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_capture.c | 4 ++--
 tests/i915/gem_exec_nop.c     | 7 ++++---
 tests/i915/perf_pmu.c         | 4 ++--
 tests/prime_busy.c            | 6 +++---
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index f2ea6cb0..19f3836e 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -107,7 +107,7 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[1].write_domain = I915_GEM_DOMAIN_RENDER;
 
-	seqno = gem_mmap__wc(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
+	seqno = gem_mmap__device_coherent(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
 	gem_set_domain(fd, obj[SCRATCH].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -278,7 +278,7 @@ static struct offset {
 		obj[count + 1].relocation_count = ARRAY_SIZE(reloc);
 	}
 
-	seqno = gem_mmap__wc(fd, obj[0].handle, 0, 4096, PROT_READ);
+	seqno = gem_mmap__device_coherent(fd, obj[0].handle, 0, 4096, PROT_READ);
 	gem_set_domain(fd, obj[0].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index c435335b..03adc9ee 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -132,7 +132,7 @@ static void poll_ring(int fd, const intel_ctx_t *ctx,
 	obj.relocation_count = ARRAY_SIZE(reloc);
 
 	r = memset(reloc, 0, sizeof(reloc));
-	batch = gem_mmap__wc(fd, obj.handle, 0, 4096, PROT_WRITE);
+	batch = gem_mmap__device_coherent(fd, obj.handle, 0, 4096, PROT_WRITE);
 
 	for (unsigned int start_offset = 0;
 	     start_offset <= 128;
@@ -257,7 +257,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 	obj[1].relocation_count = ARRAY_SIZE(reloc);
 
 	r = memset(reloc, 0, sizeof(reloc));
-	batch = gem_mmap__wc(fd, obj[1].handle, 0, 4096, PROT_WRITE);
+	batch = gem_mmap__device_coherent(fd, obj[1].handle, 0, 4096, PROT_WRITE);
 
 	for (unsigned int start_offset = 0;
 	     start_offset <= 128;
@@ -313,7 +313,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 	if (cached)
 		state = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_READ);
 	else
-		state = gem_mmap__wc(fd, obj[0].handle, 0, 4096, PROT_READ);
+		state = gem_mmap__device_coherent(fd, obj[0].handle, 0, 4096, PROT_READ);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
@@ -972,6 +972,7 @@ igt_main
 
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
+		gem_require_mmap_device_coherent(device);
 		gem_submission_print_method(device);
 		gem_scheduler_print_capability(device);
 
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 924f39d1..1214cda8 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -717,7 +717,7 @@ sema_wait(int gem_fd, const intel_ctx_t *ctx,
 	bb_offset = get_offset(ahnd, bb_handle, 4096, 0);
 	obj_offset = get_offset(ahnd, obj_handle, 4096, 0);
 
-	obj_ptr = gem_mmap__wc(gem_fd, obj_handle, 0, 4096, PROT_WRITE);
+	obj_ptr = gem_mmap__device_coherent(gem_fd, obj_handle, 0, 4096, PROT_WRITE);
 
 	batch[0] = MI_STORE_DWORD_IMM;
 	batch[1] = obj_offset + sizeof(*obj_ptr);
@@ -877,7 +877,7 @@ __sema_busy(int gem_fd, uint64_t ahnd, int pmu, const intel_ctx_t *ctx,
 
 	gem_quiescent_gpu(gem_fd);
 
-	map = gem_mmap__wc(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
+	map = gem_mmap__device_coherent(gem_fd, obj.handle, 0, 4096, PROT_WRITE);
 	gem_execbuf(gem_fd, &eb);
 	spin = igt_spin_new(gem_fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
diff --git a/tests/prime_busy.c b/tests/prime_busy.c
index e2684837..0cc011e5 100644
--- a/tests/prime_busy.c
+++ b/tests/prime_busy.c
@@ -83,7 +83,7 @@ static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 		pfd[BATCH].fd = prime_handle_to_fd(fd, obj[BATCH].handle);
 	}
 
-	batch = gem_mmap__wc(fd, obj[BATCH].handle, 0, size, PROT_WRITE);
+	batch = gem_mmap__device_coherent(fd, obj[BATCH].handle, 0, size, PROT_WRITE);
 	gem_set_domain(fd, obj[BATCH].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
@@ -175,7 +175,7 @@ static void busy(int fd, const intel_ctx_t *ctx, unsigned ring, unsigned flags)
 	igt_assert(!prime_busy(&pfd[SCRATCH], true));
 
 	munmap(batch, size);
-	batch = gem_mmap__wc(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
+	batch = gem_mmap__device_coherent(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
 	for (i = 0; i < 1024; i++)
 		igt_assert_eq_u32(batch[i], i);
 	munmap(batch, 4096);
@@ -237,7 +237,7 @@ igt_main
 		};
 
 		igt_fixture
-			gem_require_mmap_wc(fd);
+			gem_require_mmap_device_coherent(fd);
 
 		for (const struct mode *m = modes; m->name; m++) {
 			igt_subtest_with_dynamic(m->name)
-- 
2.25.1
