Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0163110E459
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 16:14:52 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so2105429pjb.1
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 09:14:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 May 2022 09:14:45 -0700
Message-Id: <20220526161445.1819128-3-robdclark@gmail.com>
In-Reply-To: <20220526161445.1819128-1-robdclark@gmail.com>
References: <20220526161445.1819128-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 2/2] igt: Promote/rename OS helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Promote intel_os.c helpers to igt_os.c, so that I can re-use them for
some additional msm tests.  Just big churny rename, no functional change.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/i915/intel_memory_region.c        |  2 +-
 lib/igt_aux.c                         |  2 +-
 lib/igt_aux.h                         | 18 +----
 lib/{intel_os.c => igt_os.c}          | 97 ++++++++++++++-------------
 lib/igt_os.h                          | 45 +++++++++++++
 lib/meson.build                       |  2 +-
 tests/dumb_buffer.c                   |  2 +-
 tests/eviction_common.c               | 16 ++---
 tests/i915/gem_busy.c                 |  2 +-
 tests/i915/gem_concurrent_all.c       |  8 +--
 tests/i915/gem_create.c               |  2 +-
 tests/i915/gem_ctx_create.c           |  4 +-
 tests/i915/gem_ctx_exec.c             |  2 +-
 tests/i915/gem_evict_alignment.c      |  4 +-
 tests/i915/gem_evict_everything.c     |  8 +--
 tests/i915/gem_exec_alignment.c       |  8 +--
 tests/i915/gem_exec_await.c           |  2 +-
 tests/i915/gem_exec_big.c             |  6 +-
 tests/i915/gem_exec_capture.c         |  8 +--
 tests/i915/gem_exec_gttfill.c         |  2 +-
 tests/i915/gem_exec_params.c          |  2 +-
 tests/i915/gem_exec_reloc.c           |  2 +-
 tests/i915/gem_linear_blits.c         |  2 +-
 tests/i915/gem_lmem_swapping.c        |  6 +-
 tests/i915/gem_mmap.c                 |  4 +-
 tests/i915/gem_mmap_gtt.c             |  6 +-
 tests/i915/gem_mmap_offset.c          |  2 +-
 tests/i915/gem_ppgtt.c                |  4 +-
 tests/i915/gem_pwrite.c               |  8 +--
 tests/i915/gem_render_linear_blits.c  | 10 +--
 tests/i915/gem_render_tiled_blits.c   | 10 +--
 tests/i915/gem_shrink.c               |  6 +-
 tests/i915/gem_softpin.c              |  4 +-
 tests/i915/gem_tiled_blits.c          |  2 +-
 tests/i915/gem_tiled_fence_blits.c    |  2 +-
 tests/i915/gem_tiled_pread_pwrite.c   |  2 +-
 tests/i915/gem_tiled_swapping.c       | 20 +++---
 tests/i915/gem_userptr_blits.c        | 20 +++---
 tests/i915/gen3_mixed_blits.c         |  2 +-
 tests/i915/gen3_render_linear_blits.c |  2 +-
 tests/i915/gen3_render_mixed_blits.c  |  2 +-
 tests/i915/gen3_render_tiledx_blits.c |  2 +-
 tests/i915/gen3_render_tiledy_blits.c |  2 +-
 tests/i915/gen7_exec_parse.c          |  2 +-
 tests/i915/gen9_exec_parse.c          |  6 +-
 tests/i915/i915_suspend.c             |  6 +-
 tests/i915/kms_big_fb.c               |  2 +-
 tests/prime_mmap_coherency.c          | 10 +--
 48 files changed, 212 insertions(+), 176 deletions(-)
 rename lib/{intel_os.c => igt_os.c} (85%)
 create mode 100644 lib/igt_os.h

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 6bf6aab1..8c5c2df8 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -955,7 +955,7 @@ struct gem_memory_region *__gem_get_memory_regions(int i915)
 		r->ci = info->regions[i].region;
 		r->size = info->regions[i].probed_size;
 		if (r->size == -1ull)
-			r->size = intel_get_avail_ram_mb() << 20;
+			r->size = igt_get_avail_ram_mb() << 20;
 
 		asprintf(&r->name, "%s%d",
 			 region_repr(&r->ci), r->ci.memory_instance);
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index 751c8a29..edbd8eb9 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -873,7 +873,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
 		    faccessat(power_dir, "pm_test", R_OK | W_OK, 0) == 0);
 
 	igt_skip_on_f(state == SUSPEND_STATE_DISK &&
-		      !intel_get_total_swap_mb(),
+		      !igt_get_total_swap_mb(),
 		      "Suspend to disk requires swap space.\n");
 
 	orig_test = get_suspend_test(power_dir);
diff --git a/lib/igt_aux.h b/lib/igt_aux.h
index ab1f9e1a..af663d2c 100644
--- a/lib/igt_aux.h
+++ b/lib/igt_aux.h
@@ -41,6 +41,7 @@
 #include <i915/gem_submission.h>
 
 #include "igt_core.h"
+#include "igt_os.h"
 
 /* signal interrupt helpers */
 #ifdef __linux__
@@ -216,23 +217,6 @@ void igt_drop_root(void);
 void igt_debug_wait_for_keypress(const char *var);
 void igt_debug_interactive_mode_check(const char *var, const char *expected);
 
-/* sysinfo cross-arch wrappers from intel_os.c */
-
-/* These are separate to allow easier testing when porting, see the comment at
- * the bottom of intel_os.c. */
-void intel_purge_vm_caches(int fd);
-uint64_t intel_get_avail_ram_mb(void);
-uint64_t intel_get_total_ram_mb(void);
-uint64_t intel_get_total_swap_mb(void);
-void *intel_get_total_pinnable_mem(size_t *pinned);
-
-int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
-			 uint64_t *out_required, uint64_t *out_total);
-void intel_require_memory(uint64_t count, uint64_t size, unsigned mode);
-void intel_require_files(uint64_t count);
-#define CHECK_RAM 0x1
-#define CHECK_SWAP 0x2
-
 #define __typecheck(x, y) \
         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
 
diff --git a/lib/intel_os.c b/lib/igt_os.c
similarity index 85%
rename from lib/intel_os.c
rename to lib/igt_os.c
index 2bb0c981..bdd5d933 100644
--- a/lib/intel_os.c
+++ b/lib/igt_os.c
@@ -47,20 +47,20 @@
 #endif
 #include <sys/resource.h>
 
-#include "intel_io.h"
 #include "drmtest.h"
 #include "igt_aux.h"
 #include "igt_debugfs.h"
+#include "igt_os.h"
 #include "igt_sysfs.h"
 
 /**
- * intel_get_total_ram_mb:
+ * igt_get_total_ram_mb:
  *
  * Returns:
  * The total amount of system RAM available in MB.
  */
 uint64_t
-intel_get_total_ram_mb(void)
+igt_get_total_ram_mb(void)
 {
 	uint64_t retval;
 
@@ -74,7 +74,7 @@ intel_get_total_ram_mb(void)
 	long pagesize, npages;
 
 	pagesize = sysconf(_SC_PAGESIZE);
-        npages = sysconf(_SC_PHYS_PAGES);
+	npages = sysconf(_SC_PHYS_PAGES);
 
 	retval = (uint64_t) pagesize * npages;
 #else
@@ -98,13 +98,13 @@ static uint64_t get_meminfo(const char *info, const char *tag)
 }
 
 /**
- * intel_get_avail_ram_mb:
+ * igt_get_avail_ram_mb:
  *
  * Returns:
  * The amount of unused system RAM available in MB.
  */
 uint64_t
-intel_get_avail_ram_mb(void)
+igt_get_avail_ram_mb(void)
 {
 	uint64_t retval;
 
@@ -112,8 +112,8 @@ intel_get_avail_ram_mb(void)
 	char *info;
 	int fd;
 
-	fd = drm_open_driver(DRIVER_INTEL);
-	intel_purge_vm_caches(fd);
+	fd = drm_open_driver(DRIVER_ANY);
+	igt_purge_vm_caches(fd);
 	close(fd);
 
 	fd = open("/proc", O_RDONLY);
@@ -145,7 +145,7 @@ intel_get_avail_ram_mb(void)
 	long pagesize, npages;
 
 	pagesize = sysconf(_SC_PAGESIZE);
-        npages = sysconf(_SC_AVPHYS_PAGES);
+	npages = sysconf(_SC_AVPHYS_PAGES);
 
 	retval = (uint64_t) pagesize * npages;
 #else
@@ -156,13 +156,13 @@ intel_get_avail_ram_mb(void)
 }
 
 /**
- * intel_get_total_swap_mb:
+ * igt_get_total_swap_mb:
  *
  * Returns:
  * The total amount of swap space available in MB.
  */
 uint64_t
-intel_get_total_swap_mb(void)
+igt_get_total_swap_mb(void)
 {
 	uint64_t retval;
 
@@ -180,31 +180,31 @@ intel_get_total_swap_mb(void)
 	int n, i;
 
 	if ((n = swapctl(SC_GETNSWP, NULL)) == -1) {
-	    igt_warn("swapctl: GETNSWP");
-	    return 0;
+		igt_warn("swapctl: GETNSWP");
+		return 0;
 	}
 	if (n == 0) {
-	    /* no error, but no swap devices either */
-	    return 0;
+		/* no error, but no swap devices either */
+		return 0;
 	}
 
 	swt = malloc(sizeof(struct swaptable) + (n * sizeof(swapent_t)));
 	buf = malloc(n * MAXPATHLEN);
 	if (!swt || !buf) {
-	    igt_warn("malloc");
+		igt_warn("malloc");
 	} else {
-	    swt->swt_n = n;
-	    for (i = 0 ; i < n; i++) {
-		swt->swt_ent[i].ste_path = buf + (i * MAXPATHLEN);
-	    }
-
-	    if ((n = swapctl(SC_LIST, swt)) == -1) {
-		igt_warn("swapctl: LIST");
-	    } else {
-		for (i = 0; i < swt->swt_n; i++) {
-		    totalpages += swt->swt_ent[i].ste_pages;
+		swt->swt_n = n;
+		for (i = 0 ; i < n; i++) {
+			swt->swt_ent[i].ste_path = buf + (i * MAXPATHLEN);
+		}
+
+		if ((n = swapctl(SC_LIST, swt)) == -1) {
+			igt_warn("swapctl: LIST");
+		} else {
+			for (i = 0; i < swt->swt_n; i++) {
+				totalpages += swt->swt_ent[i].ste_pages;
+			}
 		}
-	    }
 	}
 	free(swt);
 	free(buf);
@@ -219,7 +219,7 @@ intel_get_total_swap_mb(void)
 }
 
 /**
- * intel_get_total_pinnable_mem:
+ * igt_get_total_pinnable_mem:
  *
  * Compute the amount of memory that we're able to safely lock.
  * Note that in order to achieve this, we're attempting to repeatedly lock more
@@ -227,12 +227,12 @@ intel_get_total_swap_mb(void)
  *
  * Returns: Amount of memory that can be safely pinned, in bytes.
  */
-void *intel_get_total_pinnable_mem(size_t *total)
+void *igt_get_total_pinnable_mem(size_t *total)
 {
 	uint64_t *can_mlock, pin, avail;
 
-	pin = (intel_get_total_ram_mb() + 1) << 20;
-	avail = (intel_get_avail_ram_mb() + 1) << 20;
+	pin = (igt_get_total_ram_mb() + 1) << 20;
+	avail = (igt_get_avail_ram_mb() + 1) << 20;
 
 	can_mlock = mmap(NULL, pin, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_require(can_mlock != MAP_FAILED);
@@ -290,20 +290,20 @@ static unsigned max_open_files(void)
 }
 
 /**
- * intel_require_files:
+ * igt_require_files:
  * @count: number of files that will be created
  *
  * Does the system support enough file descriptors for the test?
  */
-void intel_require_files(uint64_t count)
+void igt_require_files(uint64_t count)
 {
 	igt_require_f(count < max_open_files(),
 		      "Estimated that we need %'llu files, but the process maximum is only %'llu\n",
 		      (long long)count, (long long)max_open_files());
 }
 
-int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
-			 uint64_t *out_required, uint64_t *out_total)
+int __igt_check_memory(uint64_t count, uint64_t size, unsigned mode,
+		       uint64_t *out_required, uint64_t *out_total)
 {
 /* rough estimate of how many bytes the kernel requires to track each object */
 #define KERNEL_BO_OVERHEAD 8192 /* 2k for an object, 2k for an inode, etc */
@@ -320,9 +320,9 @@ int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
 
 	total = 0;
 	if (mode & (CHECK_RAM | CHECK_SWAP))
-		total += intel_get_avail_ram_mb();
+		total += igt_get_avail_ram_mb();
 	if (mode & CHECK_SWAP)
-		total += intel_get_total_swap_mb();
+		total += igt_get_total_swap_mb();
 	total *= 1024 * 1024;
 
 	if (out_required)
@@ -338,7 +338,7 @@ int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
 }
 
 /**
- * intel_require_memory:
+ * igt_require_memory:
  * @count: number of surfaces that will be created
  * @size: the size in bytes of each surface
  * @mode: a bit field declaring whether the test will be run in RAM or in SWAP
@@ -360,13 +360,13 @@ int __intel_check_memory(uint64_t count, uint64_t size, unsigned mode,
  * assumption that any test that needs to check for memory requirements is a
  * thrashing test unsuitable for slow simulated systems.
  */
-void intel_require_memory(uint64_t count, uint64_t size, unsigned mode)
+void igt_require_memory(uint64_t count, uint64_t size, unsigned mode)
 {
 	uint64_t required, total;
 	bool sufficient_memory;
 
-	sufficient_memory = __intel_check_memory(count, size, mode,
-						 &required, &total);
+	sufficient_memory = __igt_check_memory(count, size, mode,
+					       &required, &total);
 	if (!sufficient_memory) {
 		int dir = open("/proc", O_RDONLY);
 		char *info;
@@ -398,7 +398,14 @@ void intel_require_memory(uint64_t count, uint64_t size, unsigned mode)
 		      (long long)vfs_file_max());
 }
 
-void intel_purge_vm_caches(int drm_fd)
+/**
+ * igt_purge_vm_caches:
+ * @drm_fd: the drm device fd
+ *
+ * Trigger the drm driver to shrink and drop idle buffers, and then
+ * trigger VM subsystem to drop caches.
+ */
+void igt_purge_vm_caches(int drm_fd)
 {
 	int fd;
 
@@ -434,7 +441,7 @@ void intel_purge_vm_caches(int drm_fd)
 /*
  * When testing a port to a new platform, create a standalone test binary
  * by running:
- * cc -o porttest intel_drm.c -I.. -DSTANDALONE_TEST `pkg-config --cflags libdrm`
+ * cc -o porttest igt_os.c -I.. -DSTANDALONE_TEST `pkg-config --cflags libdrm`
  * and then running the resulting porttest program.
  */
 #ifdef STANDALONE_TEST
@@ -442,8 +449,8 @@ void *mmio;
 
 int main(int argc, char **argv)
 {
-    igt_info("Total RAM:  %"PRIu64" Mb\n", intel_get_total_ram_mb());
-    igt_info("Total Swap: %"PRIu64" Mb\n", intel_get_total_swap_mb());
+    igt_info("Total RAM:  %"PRIu64" Mb\n", igt_get_total_ram_mb());
+    igt_info("Total Swap: %"PRIu64" Mb\n", igt_get_total_swap_mb());
 
     return 0;
 }
diff --git a/lib/igt_os.h b/lib/igt_os.h
new file mode 100644
index 00000000..79363b29
--- /dev/null
+++ b/lib/igt_os.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright © 2008 Intel Corporation
+ * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef IGT_OS_H
+#define IGT_OS_H
+
+
+/* These are separate to allow easier testing when porting, see the comment at
+ * the bottom of intel_os.c. */
+uint64_t igt_get_total_ram_mb(void);
+uint64_t igt_get_avail_ram_mb(void);
+uint64_t igt_get_total_swap_mb(void);
+void *igt_get_total_pinnable_mem(size_t *pinned);
+
+int __igt_check_memory(uint64_t count, uint64_t size, unsigned mode,
+		       uint64_t *out_required, uint64_t *out_total);
+void igt_require_memory(uint64_t count, uint64_t size, unsigned mode);
+void igt_require_files(uint64_t count);
+#define CHECK_RAM 0x1
+#define CHECK_SWAP 0x2
+
+void igt_purge_vm_caches(int drm_fd);
+
+#endif /* IGT_OS_H */
diff --git a/lib/meson.build b/lib/meson.build
index ccee7a59..793d399d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -24,6 +24,7 @@ lib_sources = [
 	'igt_halffloat.c',
 	'igt_io.c',
 	'igt_matrix.c',
+	'igt_os.c',
 	'igt_params.c',
 	'igt_perf.c',
 	'igt_primes.c',
@@ -49,7 +50,6 @@ lib_sources = [
 	'intel_chipset.c',
 	'intel_ctx.c',
 	'intel_device_info.c',
-	'intel_os.c',
 	'intel_mmio.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index cb8d2f51..2c6261bd 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -293,7 +293,7 @@ static uint64_t estimate_largest_dumb_buffer(int fd)
 		.height = 1, /* in rows */
 	};
 	const unsigned long max_rows =
-		intel_get_total_ram_mb() / 2; /* leave some spare */
+		igt_get_total_ram_mb() / 2; /* leave some spare */
 	volatile uint64_t largest = 0;
 	char * volatile ptr = NULL;
 
diff --git a/tests/eviction_common.c b/tests/eviction_common.c
index 8446c421..95af106c 100644
--- a/tests/eviction_common.c
+++ b/tests/eviction_common.c
@@ -72,7 +72,7 @@ static int minor_evictions(int fd, struct igt_eviction_test_ops *ops,
 
 	total_surfaces = gem_aperture_size(fd) / surface_size + 1;
 	igt_require(nr_surfaces < total_surfaces);
-	intel_require_memory(total_surfaces, surface_size, CHECK_RAM);
+	igt_require_memory(total_surfaces, surface_size, CHECK_RAM);
 
 	bo = malloc((nr_surfaces + total_surfaces)*sizeof(*bo));
 	igt_assert(bo);
@@ -107,7 +107,7 @@ static int major_evictions(int fd, struct igt_eviction_test_ops *ops,
 	uint32_t *bo;
 	int ret, loop;
 
-	intel_require_memory(nr_surfaces, surface_size, CHECK_RAM);
+	igt_require_memory(nr_surfaces, surface_size, CHECK_RAM);
 
 	bo = malloc(nr_surfaces*sizeof(*bo));
 	igt_assert(bo);
@@ -136,9 +136,9 @@ static void mlocked_evictions(int fd, struct igt_eviction_test_ops *ops,
 	size_t total;
 	void *mem;
 
-	intel_require_memory(surface_count, surface_size, CHECK_RAM);
+	igt_require_memory(surface_count, surface_size, CHECK_RAM);
 
-	mem = intel_get_total_pinnable_mem(&total);
+	mem = igt_get_total_pinnable_mem(&total);
 	igt_assert(mem != MAP_FAILED);
 	pin = *(uint64_t *)mem;
 	igt_assert(!munlock(mem, pin));
@@ -199,12 +199,12 @@ static int swapping_evictions(int fd, struct igt_eviction_test_ops *ops,
 	uint64_t i, n;
 	int pass, ret;
 
-	intel_require_memory(working_surfaces, surface_size, CHECK_RAM);
+	igt_require_memory(working_surfaces, surface_size, CHECK_RAM);
 
 	if (trash_surfaces < working_surfaces)
 		trash_surfaces = working_surfaces;
 
-	intel_require_memory(trash_surfaces, surface_size, CHECK_RAM | CHECK_SWAP);
+	igt_require_memory(trash_surfaces, surface_size, CHECK_RAM | CHECK_SWAP);
 
 	bo = malloc(trash_surfaces*sizeof(*bo));
 	igt_assert(bo);
@@ -239,7 +239,7 @@ static int forking_evictions(int fd, struct igt_eviction_test_ops *ops,
 	uint32_t *bo;
 	int pass, ret;
 
-	intel_require_memory(working_surfaces, surface_size, CHECK_RAM);
+	igt_require_memory(working_surfaces, surface_size, CHECK_RAM);
 
 	if (flags & FORKING_EVICTIONS_SWAPPING) {
 		bo_count = trash_surfaces;
@@ -250,7 +250,7 @@ static int forking_evictions(int fd, struct igt_eviction_test_ops *ops,
 		bo_count = working_surfaces;
 
 	igt_assert_lte(working_surfaces, bo_count);
-	intel_require_memory(bo_count, surface_size, CHECK_RAM | CHECK_SWAP);
+	igt_require_memory(bo_count, surface_size, CHECK_RAM | CHECK_SWAP);
 
 	bo = malloc(bo_count*sizeof(*bo));
 	igt_assert(bo);
diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index b8a61084..603691f2 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -253,7 +253,7 @@ static void close_race(int fd, const intel_ctx_t *ctx)
 	int i;
 
 	igt_require(ncpus > 1);
-	intel_require_memory(nhandles, 4096, CHECK_RAM);
+	igt_require_memory(nhandles, 4096, CHECK_RAM);
 
 	/*
 	 * One thread spawning work and randomly closing handles.
diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 2b1788e1..25b7daf8 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -375,7 +375,7 @@ static void create_dmabuf_require(const struct create *create, unsigned count)
 		close(args.fd);
 	}
 	igt_require(has_dmabuf);
-	intel_require_files(2*count);
+	igt_require_files(2*count);
 }
 
 struct dmabuf {
@@ -1765,7 +1765,7 @@ num_buffers(uint64_t max,
 	if (c->require)
 		c->require(c, n);
 
-	intel_require_memory(2*n, size, allow_mem);
+	igt_require_memory(2*n, size, allow_mem);
 
 	return n;
 }
@@ -1986,8 +1986,8 @@ igt_main
 				 c->name, s->name, "swap");
 			igt_subtest_group {
 				igt_fixture {
-					if (intel_get_avail_ram_mb() > gem_mappable_aperture_size(fd)/(1024*1024)) {
-						pin_sz = intel_get_avail_ram_mb() - gem_mappable_aperture_size(fd)/(1024*1024);
+					if (igt_get_avail_ram_mb() > gem_mappable_aperture_size(fd)/(1024*1024)) {
+						pin_sz = igt_get_avail_ram_mb() - gem_mappable_aperture_size(fd)/(1024*1024);
 
 						igt_debug("Pinning %lld MiB\n", (long long)pin_sz);
 						pin_sz *= 1024 * 1024;
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 31fd6526..b61c594b 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -224,7 +224,7 @@ static void always_clear(int i915, int timeout)
 	struct thread_clear arg = {
 		.i915 = i915,
 		.timeout = timeout,
-		.max = intel_get_avail_ram_mb() << (20 - 12), /* in pages */
+		.max = igt_get_avail_ram_mb() << (20 - 12), /* in pages */
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	unsigned long checked;
diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 814beb4a..39f070af 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -283,9 +283,9 @@ static unsigned context_size(int fd)
 
 static uint64_t total_avail_mem(unsigned mode)
 {
-	uint64_t total = intel_get_avail_ram_mb();
+	uint64_t total = igt_get_avail_ram_mb();
 	if (mode & CHECK_SWAP)
-		total += intel_get_total_swap_mb();
+		total += igt_get_total_swap_mb();
 	return total << 20;
 }
 
diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 1f3d1a44..3d94f01d 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -77,7 +77,7 @@ static void big_exec(int fd, uint32_t handle, int ring)
 	int i;
 
 	/* Make sure we only fill half of RAM with gem objects. */
-	igt_require(intel_get_total_ram_mb() * 1024 / 2 > num_buffers * 4);
+	igt_require(igt_get_total_ram_mb() * 1024 / 2 > num_buffers * 4);
 
 	gem_exec = calloc(num_buffers + 1, sizeof(*gem_exec));
 	igt_assert(gem_exec);
diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index 4a05f7cd..0b560ab0 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -135,7 +135,7 @@ static void minor_evictions(int fd, uint64_t size, uint64_t count)
 	uint64_t n, m, alignment;
 	int pass, fail;
 
-	intel_require_memory(2 * count, size, CHECK_RAM);
+	igt_require_memory(2 * count, size, CHECK_RAM);
 
 	bo = malloc(3*count*sizeof(*bo));
 	igt_assert(bo);
@@ -166,7 +166,7 @@ static void major_evictions(int fd, uint64_t size, uint64_t count)
 	int loop;
 	uint32_t *bo;
 
-	intel_require_memory(count, size, CHECK_RAM);
+	igt_require_memory(count, size, CHECK_RAM);
 
 	bo = malloc(count*sizeof(*bo));
 	igt_assert(bo);
diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
index 37343b53..120f8907 100644
--- a/tests/i915/gem_evict_everything.c
+++ b/tests/i915/gem_evict_everything.c
@@ -144,8 +144,8 @@ static void test_forking_evictions(int fd, uint64_t size, uint64_t count,
 {
 	uint64_t trash_count;
 
-	trash_count = intel_get_total_ram_mb() * 11 / 10;
-	intel_require_memory(trash_count, size, CHECK_RAM | CHECK_SWAP);
+	trash_count = igt_get_total_ram_mb() * 11 / 10;
+	igt_require_memory(trash_count, size, CHECK_RAM | CHECK_SWAP);
 
 	forking_evictions(fd, &fault_ops, size, count, trash_count, flags);
 }
@@ -159,8 +159,8 @@ static void test_swapping_evictions(int fd, uint64_t size, uint64_t count)
 {
 	int trash_count;
 
-	trash_count = intel_get_total_ram_mb() * 11 / 10;
-	intel_require_memory(trash_count, size, CHECK_RAM | CHECK_SWAP);
+	trash_count = igt_get_total_ram_mb() * 11 / 10;
+	igt_require_memory(trash_count, size, CHECK_RAM | CHECK_SWAP);
 
 	swapping_evictions(fd, &fault_ops, size, count, trash_count);
 }
diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index c88fc327..3e5f9d52 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -166,13 +166,13 @@ naughty_child(int i915, int link, uint32_t shared, unsigned int flags)
 	if (!gem_uses_full_ppgtt(i915))
 		gtt_size /= 2; /* We have to *share* our GTT! */
 
-	ram_size = min_t(uint64_t, intel_get_total_ram_mb(), 4096);
+	ram_size = min_t(uint64_t, igt_get_total_ram_mb(), 4096);
 	ram_size *= 1024 * 1024;
 
 	count = min(gtt_size, ram_size) / 16384;
 	if (count > file_max()) /* vfs cap */
 		count = file_max();
-	intel_require_memory(count, 4096, CHECK_RAM);
+	igt_require_memory(count, 4096, CHECK_RAM);
 
 	flags = 0;
 	if ((gtt_size - 1) >> 32)
@@ -376,13 +376,13 @@ setup_many(int i915, unsigned long *out)
 	if (!gem_uses_full_ppgtt(i915))
 		gtt_size /= 2; /* We have to *share* our GTT! */
 
-	ram_size = min_t(uint64_t, intel_get_total_ram_mb(), 4096);
+	ram_size = min_t(uint64_t, igt_get_total_ram_mb(), 4096);
 	ram_size *= 1024 * 1024;
 
 	count = min(gtt_size, ram_size) / 16384;
 	if (count > file_max()) /* vfs cap */
 		count = file_max();
-	intel_require_memory(count, 4096, CHECK_RAM);
+	igt_require_memory(count, 4096, CHECK_RAM);
 
 	obj = calloc(sizeof(*obj), count);
 	igt_assert(obj);
diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index fe176595..4935cf39 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -88,7 +88,7 @@ static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
 	exec = calloc(nengine, sizeof(*exec));
 	igt_assert(exec);
 
-	intel_require_memory(nengine*(2 + ring_size), 4096, CHECK_RAM);
+	igt_require_memory(nengine*(2 + ring_size), 4096, CHECK_RAM);
 	obj = calloc(nengine*ring_size + 1, sizeof(*obj));
 	igt_assert(obj);
 
diff --git a/tests/i915/gem_exec_big.c b/tests/i915/gem_exec_big.c
index 2f47de39..4619bda8 100644
--- a/tests/i915/gem_exec_big.c
+++ b/tests/i915/gem_exec_big.c
@@ -221,7 +221,7 @@ static void exhaustive(int fd)
 
 	max = 3 * gem_aperture_size(fd) / 4;
 	ggtt_max = 3 * gem_global_aperture_size(fd) / 4;
-	intel_require_memory(1, max, CHECK_RAM);
+	igt_require_memory(1, max, CHECK_RAM);
 
 	for (batch_size = 4096; batch_size <= max; ) {
 		uint32_t handle;
@@ -278,7 +278,7 @@ static void single(int i915)
 	uint32_t handle;
 	void *ptr;
 
-	batch_size = (intel_get_avail_ram_mb() / 2) << 20; /* XXX CI slack? */
+	batch_size = (igt_get_avail_ram_mb() / 2) << 20; /* XXX CI slack? */
 	limit = gem_aperture_size(i915) - (256 << 10); /* low pages reserved */
 	if (!gem_uses_full_ppgtt(i915))
 		limit = 3 * limit / 4;
@@ -289,7 +289,7 @@ static void single(int i915)
 		 batch_size >> 20,
 		 gem_uses_full_ppgtt(i915) ? "" : "shared ",
 		 gem_aperture_size(i915) >> 20);
-	intel_require_memory(1, batch_size, CHECK_RAM);
+	igt_require_memory(1, batch_size, CHECK_RAM);
 
 	handle = gem_create(i915, batch_size);
 	gem_write(i915, handle, 0, &bbe, sizeof(bbe));
diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 60f8df04..89534146 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -597,14 +597,14 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	find_first_available_engine(fd, ctx, e, saved_engine);
 
 	gtt = gem_aperture_size(fd) / size;
-	ram = (intel_get_avail_ram_mb() << 20) / size;
+	ram = (igt_get_avail_ram_mb() << 20) / size;
 	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
 		  gtt, ram);
 
 	count = min(gtt, ram) / 4;
 	igt_require(count > 1);
 
-	intel_require_memory(count, size, CHECK_RAM);
+	igt_require_memory(count, size, CHECK_RAM);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	offsets = __captureN(fd, dir, ahnd, ctx, e, size, count, flags, NULL);
@@ -646,7 +646,7 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	igt_require(gem_gpu_reset_type(fd) > 1);
 
 	gtt = gem_aperture_size(fd) / size;
-	ram = (intel_get_avail_ram_mb() << 20) / size;
+	ram = (igt_get_avail_ram_mb() << 20) / size;
 	igt_debug("Available objects in GTT:%"PRIu64", RAM:%"PRIu64"\n",
 		  gtt, ram);
 
@@ -654,7 +654,7 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	count = min(count, 256ul); /* Keep the duration within reason */
 	igt_require(count > 1);
 
-	intel_require_memory(count, size, CHECK_RAM);
+	igt_require_memory(count, size, CHECK_RAM);
 
 	saved_engine = configure_hangs(fd, e, ctx->id);
 
diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index ebe6d2d3..48957ceb 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -158,7 +158,7 @@ static void fillgtt(int fd, const intel_ctx_t *ctx, unsigned ring, int timeout)
 	count = size / BATCH_SIZE + 1;
 	igt_debug("Using %'d batches to fill %'llu aperture on %d engines\n",
 		  count, (long long)size, nengine);
-	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
+	igt_require_memory(count, BATCH_SIZE, CHECK_RAM);
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	igt_nsec_elapsed(&tv);
diff --git a/tests/i915/gem_exec_params.c b/tests/i915/gem_exec_params.c
index da36af74..618635ec 100644
--- a/tests/i915/gem_exec_params.c
+++ b/tests/i915/gem_exec_params.c
@@ -346,7 +346,7 @@ static void test_larger_than_life_batch(int fd)
 	 * checking to that subset of machines.
 	 */
 	igt_require(size < gem_aperture_size(fd));
-	intel_require_memory(2, size, CHECK_RAM); /* batch + shadow */
+	igt_require_memory(2, size, CHECK_RAM); /* batch + shadow */
 
 	exec.handle = batch_create_size(fd, size);
 
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 03d65dc6..1f5d13e4 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -134,7 +134,7 @@ static void from_mmap(int fd, uint64_t size, enum mode mode)
 	/* Worst case is that the kernel has to copy the entire incoming
 	 * reloc[], so double the memory requirements.
 	 */
-	intel_require_memory(2, size, CHECK_RAM);
+	igt_require_memory(2, size, CHECK_RAM);
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index 9f049863..1fd5b733 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -252,7 +252,7 @@ igt_main
 
 		count = 3 + count / (1024*1024);
 		igt_require(count > 1);
-		intel_require_memory(count, sizeof(linear), CHECK_RAM);
+		igt_require_memory(count, sizeof(linear), CHECK_RAM);
 
 		igt_debug("Using %'"PRIu64" 1MiB buffers\n", count);
 		count = (count + ncpus - 1) / ncpus;
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 5d93e9da..21c2bf72 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -476,7 +476,7 @@ static void fill_params(int i915, struct params *params,
 			bool do_oom_test)
 {
 	const int swap_mb = /* For lmem, swap is total of smem + swap. */
-		intel_get_total_ram_mb() + intel_get_total_swap_mb();
+		igt_get_total_ram_mb() + igt_get_total_swap_mb();
 	const unsigned int size = 1 << 20;
 	const int max_swap_pct = 75;
 	/*
@@ -631,8 +631,8 @@ static void test_smem_oom(int i915,
 			  const intel_ctx_t *ctx,
 			  struct drm_i915_memory_region_info *region)
 {
-	const uint64_t smem_size = intel_get_total_ram_mb() +
-		intel_get_total_swap_mb();
+	const uint64_t smem_size = igt_get_total_ram_mb() +
+		igt_get_total_swap_mb();
 	const unsigned int alloc = 256 * 1024 * 1024;
 	const unsigned int num_alloc = 1 + smem_size / (alloc >> 20);
 	struct igt_helper_process smem_proc = {};
diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 297ae3ad..61f862a8 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -66,13 +66,13 @@ test_huge_bo(int huge)
 		huge_object_size = gem_aperture_size(fd) + PAGE_SIZE;
 		break;
 	case 2:
-		huge_object_size = (intel_get_total_ram_mb() + 1) << 20;
+		huge_object_size = (igt_get_total_ram_mb() + 1) << 20;
 		check |= CHECK_SWAP;
 		break;
 	default:
 		return;
 	}
-	intel_require_memory(1, huge_object_size, check);
+	igt_require_memory(1, huge_object_size, check);
 
 	last_offset = huge_object_size - PAGE_SIZE;
 
diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
index 92bbb5d2..6db82229 100644
--- a/tests/i915/gem_mmap_gtt.c
+++ b/tests/i915/gem_mmap_gtt.c
@@ -946,7 +946,7 @@ test_huge_bo(int fd, int huge, int tiling)
 		size = gem_global_aperture_size(fd) + PAGE_SIZE;
 		break;
 	}
-	intel_require_memory(1, size, CHECK_RAM);
+	igt_require_memory(1, size, CHECK_RAM);
 
 	last_offset = size - PAGE_SIZE;
 
@@ -1033,11 +1033,11 @@ test_huge_copy(int fd, int huge, int tiling_a, int tiling_b, int ncpus)
 		huge_object_size = gem_global_aperture_size(fd) + PAGE_SIZE;
 		break;
 	default:
-		huge_object_size = (intel_get_total_ram_mb() << 19) + PAGE_SIZE;
+		huge_object_size = (igt_get_total_ram_mb() << 19) + PAGE_SIZE;
 		mode |= CHECK_SWAP;
 		break;
 	}
-	intel_require_memory(2*ncpus, huge_object_size, mode);
+	igt_require_memory(2*ncpus, huge_object_size, mode);
 
 	igt_fork(child, ncpus) {
 		uint64_t valid_size = huge_object_size;
diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index abb6ee4e..5e6b19eb 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -599,7 +599,7 @@ static void always_clear(int i915, int timeout)
 	struct thread_clear arg = {
 		.i915 = i915,
 		.timeout = timeout,
-		.max = intel_get_avail_ram_mb() << (20 - 12), /* in pages */
+		.max = igt_get_avail_ram_mb() << (20 - 12), /* in pages */
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	unsigned long checked;
diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 4c9691e3..0a06e9ec 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -284,7 +284,7 @@ igt_main
 		uint64_t mem_per_test;
 
 		mem_per_test = SIZE;
-		intel_require_memory(nchild + 1, mem_per_test, CHECK_RAM);
+		igt_require_memory(nchild + 1, mem_per_test, CHECK_RAM);
 
 		rcs = calloc(sizeof(*rcs), nchild);
 		igt_assert(rcs);
@@ -311,7 +311,7 @@ igt_main
 		igt_require(has_contexts());
 
 		mem_per_test = SIZE + mem_per_ctx;
-		intel_require_memory(1 + nchild, mem_per_test, CHECK_RAM);
+		igt_require_memory(1 + nchild, mem_per_test, CHECK_RAM);
 
 		rcs = calloc(sizeof(*rcs), nchild);
 		igt_assert(rcs);
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index e8e8c7ad..6e3f833c 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -139,7 +139,7 @@ static void test_big_cpu(int fd, int scale, unsigned flags)
 		size = gem_aperture_size(fd) + 4096;
 		break;
 	}
-	intel_require_memory(1, size, CHECK_RAM);
+	igt_require_memory(1, size, CHECK_RAM);
 
 	handle = gem_create(fd, size);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
@@ -201,7 +201,7 @@ static void test_big_gtt(int fd, int scale, unsigned flags)
 		size = gem_aperture_size(fd) + 4096;
 		break;
 	}
-	intel_require_memory(1, size, CHECK_RAM);
+	igt_require_memory(1, size, CHECK_RAM);
 
 	handle = gem_create(fd, size);
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -256,9 +256,9 @@ static void test_random(int fd)
 
 	gem_require_mmap_wc(fd);
 
-	size = min(intel_get_total_ram_mb() / 2,
+	size = min(igt_get_total_ram_mb() / 2,
 		    gem_mappable_aperture_size(fd) + 4096);
-	intel_require_memory(1, size, CHECK_RAM);
+	igt_require_memory(1, size, CHECK_RAM);
 
 	handle = gem_create(fd, size);
 	map = gem_mmap__wc(fd, handle, 0, size, PROT_WRITE);
diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
index 8e646127..d40593c6 100644
--- a/tests/i915/gem_render_linear_blits.c
+++ b/tests/i915/gem_render_linear_blits.c
@@ -176,7 +176,7 @@ igt_main
 
 	igt_subtest("aperture-thrash") {
 		count = 3 * gem_aperture_size(fd) / SIZE / 2;
-		intel_require_memory(count, SIZE, CHECK_RAM);
+		igt_require_memory(count, SIZE, CHECK_RAM);
 		run_test(fd, count);
 	}
 
@@ -184,17 +184,17 @@ igt_main
 		igt_fork_shrink_helper(fd);
 
 		count = 3 * gem_aperture_size(fd) / SIZE / 2;
-		intel_require_memory(count, SIZE, CHECK_RAM);
+		igt_require_memory(count, SIZE, CHECK_RAM);
 		run_test(fd, count);
 
 		igt_stop_shrink_helper();
 	}
 
 	igt_subtest("swap-thrash") {
-		uint64_t swap_mb = intel_get_total_swap_mb();
+		uint64_t swap_mb = igt_get_total_swap_mb();
 		igt_require(swap_mb > 0);
-		count = ((intel_get_avail_ram_mb() + (swap_mb / 2)) * 1024*1024) / SIZE;
-		intel_require_memory(count, SIZE, CHECK_RAM | CHECK_SWAP);
+		count = ((igt_get_avail_ram_mb() + (swap_mb / 2)) * 1024*1024) / SIZE;
+		igt_require_memory(count, SIZE, CHECK_RAM | CHECK_SWAP);
 		run_test(fd, count);
 	}
 }
diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index 187714d6..13c1f37a 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -211,7 +211,7 @@ igt_main
 
 	igt_subtest("aperture-thrash") {
 		count = 3 * gem_aperture_size(fd) / SIZE / 2;
-		intel_require_memory(count, SIZE, CHECK_RAM);
+		igt_require_memory(count, SIZE, CHECK_RAM);
 		run_test(fd, count);
 	}
 
@@ -219,17 +219,17 @@ igt_main
 		igt_fork_shrink_helper(fd);
 
 		count = 3 * gem_aperture_size(fd) / SIZE / 2;
-		intel_require_memory(count, SIZE, CHECK_RAM);
+		igt_require_memory(count, SIZE, CHECK_RAM);
 		run_test(fd, count);
 
 		igt_stop_shrink_helper();
 	}
 
 	igt_subtest("swap-thrash") {
-		uint64_t swap_mb = intel_get_total_swap_mb();
+		uint64_t swap_mb = igt_get_total_swap_mb();
 		igt_require(swap_mb > 0);
-		count = ((intel_get_avail_ram_mb() + (swap_mb / 2)) * 1024*1024) / SIZE;
-		intel_require_memory(count, SIZE, CHECK_RAM | CHECK_SWAP);
+		count = ((igt_get_avail_ram_mb() + (swap_mb / 2)) * 1024*1024) / SIZE;
+		igt_require_memory(count, SIZE, CHECK_RAM | CHECK_SWAP);
 		run_test(fd, count);
 	}
 }
diff --git a/tests/i915/gem_shrink.c b/tests/i915/gem_shrink.c
index 729ddd7e..49df35c2 100644
--- a/tests/i915/gem_shrink.c
+++ b/tests/i915/gem_shrink.c
@@ -436,7 +436,7 @@ igt_main
 
 	igt_fixture {
 		const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-		uint64_t mem_size = intel_get_total_ram_mb();
+		uint64_t mem_size = igt_get_total_ram_mb();
 		int fd;
 
 		fd = drm_open_driver(DRIVER_INTEL);
@@ -455,8 +455,8 @@ igt_main
 		igt_info("Using %d processes and %'"PRIu64"MiB per process\n",
 			 num_processes, alloc_size);
 
-		intel_require_memory(num_processes, alloc_size,
-				     CHECK_SWAP | CHECK_RAM);
+		igt_require_memory(num_processes, alloc_size,
+				   CHECK_SWAP | CHECK_RAM);
 
 		close(fd);
 	}
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 00912fd3..489d528f 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -993,7 +993,7 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 					 INTEL_ALLOCATOR_RELOC,
 					 ALLOC_STRATEGY_NONE, 0);
 
-	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
+	igt_require_memory(count, BATCH_SIZE, CHECK_RAM);
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	igt_nsec_elapsed(&tv);
@@ -1116,7 +1116,7 @@ static void evict_single_offset(int fd, const intel_ctx_t *ctx, int timeout)
 		  "%d engines (timeout: %d)\n", count, BATCH_SIZE >> 20,
 		  (long long)size >> 20, nengine, timeout);
 
-	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
+	igt_require_memory(count, BATCH_SIZE, CHECK_RAM);
 	intel_detect_and_clear_missed_interrupts(fd);
 
 	memset(&execbuf, 0, sizeof(execbuf));
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index c93d04d6..d6c91e6f 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -186,7 +186,7 @@ igt_main
 			count = MAX_32b;
 		count = 3 + count / (1024 * 1024);
 		igt_require(count > 1);
-		intel_require_memory(count, 1024 * 1024 , CHECK_RAM);
+		igt_require_memory(count, 1024 * 1024 , CHECK_RAM);
 
 		igt_debug("Using %'"PRIu64" 1MiB buffers\n", count);
 		count = (count + ncpus - 1) / ncpus;
diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index dc0ffc1e..0b69c0de 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -260,7 +260,7 @@ igt_main
 		end = count;
 		count = 3 + count / (1024 * 1024);
 		igt_require(count > 1);
-		intel_require_memory(count, 1024 * 1024 , CHECK_RAM);
+		igt_require_memory(count, 1024 * 1024 , CHECK_RAM);
 
 		igt_debug("Using %'"PRIu64" 1MiB buffers\n", count);
 		count = (count + ncpus - 1) / ncpus;
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index f77cd3bd..2d21dfb7 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -117,7 +117,7 @@ igt_simple_main
 	gem_require_pread_pwrite(fd);
 
 	count = gem_available_fences(fd) + 1;
-	intel_require_memory(2 * count, sizeof(linear), CHECK_RAM);
+	igt_require_memory(2 * count, sizeof(linear), CHECK_RAM);
 
 	for (int i = 0; i < count; i++) {
 		uint32_t handle, handle_target;
diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapping.c
index d66b6ca7..f4bdce73 100644
--- a/tests/i915/gem_tiled_swapping.c
+++ b/tests/i915/gem_tiled_swapping.c
@@ -177,27 +177,27 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 		gem_require_mappable_ggtt(fd);
 
-		intel_purge_vm_caches(fd);
+		igt_purge_vm_caches(fd);
 		check_memory_layout(fd);
 
 		/* lock RAM, leaving only 512MB available */
-		count = intel_get_total_ram_mb() - intel_get_avail_ram_mb();
+		count = igt_get_total_ram_mb() - igt_get_avail_ram_mb();
 		count = max(count + 64, AVAIL_RAM);
-		count = intel_get_total_ram_mb() - count;
+		count = igt_get_total_ram_mb() - count;
 		lock_size = max_t(long, 0, count);
 		igt_info("Mlocking %zdMiB of %ld/%ldMiB\n",
 			 lock_size,
-			 (long)intel_get_avail_ram_mb(),
-			 (long)intel_get_total_ram_mb());
+			 (long)igt_get_avail_ram_mb(),
+			 (long)igt_get_total_ram_mb());
 		igt_lock_mem(lock_size);
 
 		/* need slightly more than available memory */
-		count = intel_get_avail_ram_mb() + 128;
+		count = igt_get_avail_ram_mb() + 128;
 		igt_info("Using %lu 1MiB objects (available RAM: %ld/%ld, swap: %ld)\n",
 			 count,
-			 (long)intel_get_avail_ram_mb(),
-			 (long)intel_get_total_ram_mb(),
-			 (long)intel_get_total_swap_mb());
+			 (long)igt_get_avail_ram_mb(),
+			 (long)igt_get_total_ram_mb(),
+			 (long)igt_get_total_swap_mb());
 		bo_handles = calloc(count, sizeof(uint32_t));
 		igt_assert(bo_handles);
 
@@ -206,7 +206,7 @@ igt_main
 		threads = calloc(num_threads, sizeof(struct thread));
 		igt_assert(threads);
 
-		intel_require_memory(count, 1024*1024, CHECK_RAM | CHECK_SWAP);
+		igt_require_memory(count, 1024*1024, CHECK_RAM | CHECK_SWAP);
 
 		for (n = 0; n < count; n++) {
 			bo_handles[n] = create_bo(fd);
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index ec3f2755..1343b109 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1541,7 +1541,7 @@ static int test_coherency(int fd, int count)
 	int i, ret;
 
 	igt_info("Using 2x%d 1MiB buffers\n", count);
-	intel_require_memory(2*count, sizeof(linear), CHECK_RAM);
+	igt_require_memory(2*count, sizeof(linear), CHECK_RAM);
 
 	ret = posix_memalign((void **)&memory, PAGE_SIZE, count*sizeof(linear));
 	igt_assert(ret == 0 && memory);
@@ -1641,7 +1641,7 @@ static int can_swap(void)
 	else
 		as = 256 * 1024; /* Just a big number */
 
-	ram = intel_get_total_ram_mb();
+	ram = igt_get_total_ram_mb();
 
 	if ((as - 128) < (ram - 256))
 		return 0;
@@ -1688,7 +1688,7 @@ static void test_forking_evictions(int fd, int size, int count,
 
 	igt_require(forked_userptr(fd));
 
-	trash_count = intel_get_total_ram_mb() * 11 / 10;
+	trash_count = igt_get_total_ram_mb() * 11 / 10;
 	/* Use the fact test will spawn a number of child
 	 * processes meaning swapping will be triggered system
 	 * wide even if one process on it's own can't do it.
@@ -1716,7 +1716,7 @@ static void test_swapping_evictions(int fd, int size, int count)
 	igt_skip_on_f(!can_swap(),
 		"Not enough process address space for swapping tests.\n");
 
-	trash_count = intel_get_total_ram_mb() * 11 / 10;
+	trash_count = igt_get_total_ram_mb() * 11 / 10;
 
 	swapping_evictions(fd, &fault_ops, size, count, trash_count);
 	reset_handle_ptr();
@@ -1934,7 +1934,7 @@ static void test_stress_purge(int fd, int timeout)
 
 		gem_set_domain(fd, handle,
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
-		intel_purge_vm_caches(fd);
+		igt_purge_vm_caches(fd);
 
 		gem_close(fd, handle);
 	}
@@ -2341,11 +2341,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		if (count == 0)
 			count = 2 * aperture_size / (1024*1024) / 3;
 
-		total_ram = intel_get_total_ram_mb();
+		total_ram = igt_get_total_ram_mb();
 		igt_info("Total RAM is %'llu MiB\n", (long long)total_ram);
 
 		if (count > total_ram * 3 / 4) {
-			count = intel_get_total_ram_mb() * 3 / 4;
+			count = igt_get_total_ram_mb() * 3 / 4;
 			igt_info("Not enough RAM to run test, reducing buffer count.\n");
 		}
 	}
@@ -2463,7 +2463,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			size = sizeof(linear);
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
 			if (count > total_ram * 3 / 4)
-				count = intel_get_total_ram_mb() * 3 / 4;
+				count = igt_get_total_ram_mb() * 3 / 4;
 		}
 
 		igt_fork_signal_helper();
@@ -2494,7 +2494,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			size = sizeof(linear);
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
 			if (count > total_ram * 3 / 4)
-				count = intel_get_total_ram_mb() * 3 / 4;
+				count = igt_get_total_ram_mb() * 3 / 4;
 		}
 
 		igt_subtest("process-exit")
@@ -2589,7 +2589,7 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 			size = 1024 * 1024;
 			count = 2 * gem_aperture_size(fd) / (1024*1024) / 3;
 			if (count > total_ram * 3 / 4)
-				count = intel_get_total_ram_mb() * 3 / 4;
+				count = igt_get_total_ram_mb() * 3 / 4;
 		}
 
 		igt_fork_signal_helper();
diff --git a/tests/i915/gen3_mixed_blits.c b/tests/i915/gen3_mixed_blits.c
index 184effec..242b9985 100644
--- a/tests/i915/gen3_mixed_blits.c
+++ b/tests/i915/gen3_mixed_blits.c
@@ -456,7 +456,7 @@ igt_simple_main
 	igt_require_gem(fd);
 
 	count = 3 + gem_aperture_size(fd) / (1024 * 1024);
-	intel_require_memory(count, 1024*1024, CHECK_RAM);
+	igt_require_memory(count, 1024*1024, CHECK_RAM);
 
 	handle = malloc(sizeof(uint32_t)*count*3);
 	tiling = handle + count;
diff --git a/tests/i915/gen3_render_linear_blits.c b/tests/i915/gen3_render_linear_blits.c
index f01df69e..9c6b4c70 100644
--- a/tests/i915/gen3_render_linear_blits.c
+++ b/tests/i915/gen3_render_linear_blits.c
@@ -328,7 +328,7 @@ igt_simple_main
 	igt_require_gem(fd);
 
 	count = 3 + gem_aperture_size(fd) / (1024 * 1024);
-	intel_require_memory(count, 1024*1024, CHECK_RAM);
+	igt_require_memory(count, 1024*1024, CHECK_RAM);
 
 	handle = malloc(sizeof(uint32_t)*count*2);
 	start_val = handle + count;
diff --git a/tests/i915/gen3_render_mixed_blits.c b/tests/i915/gen3_render_mixed_blits.c
index 9ebb93be..1393055f 100644
--- a/tests/i915/gen3_render_mixed_blits.c
+++ b/tests/i915/gen3_render_mixed_blits.c
@@ -349,7 +349,7 @@ igt_simple_main
 	igt_require_gem(fd);
 
 	count = 3 + gem_aperture_size(fd) / (1024 * 1024);
-	intel_require_memory(count, 1024*1024, CHECK_RAM);
+	igt_require_memory(count, 1024*1024, CHECK_RAM);
 
 	handle = malloc(sizeof(uint32_t)*count*3);
 	tiling = handle + count;
diff --git a/tests/i915/gen3_render_tiledx_blits.c b/tests/i915/gen3_render_tiledx_blits.c
index b8aa0edc..ece86749 100644
--- a/tests/i915/gen3_render_tiledx_blits.c
+++ b/tests/i915/gen3_render_tiledx_blits.c
@@ -336,7 +336,7 @@ igt_simple_main
 	igt_require_gem(fd);
 
 	count = 3 + gem_aperture_size(fd) / (1024 * 1024);
-	intel_require_memory(count, 1024*1024, CHECK_RAM);
+	igt_require_memory(count, 1024*1024, CHECK_RAM);
 
 	handle = malloc(sizeof(uint32_t)*count*2);
 	start_val = handle + count;
diff --git a/tests/i915/gen3_render_tiledy_blits.c b/tests/i915/gen3_render_tiledy_blits.c
index 2d1b2d8e..30097be6 100644
--- a/tests/i915/gen3_render_tiledy_blits.c
+++ b/tests/i915/gen3_render_tiledy_blits.c
@@ -336,7 +336,7 @@ igt_simple_main
 	igt_require_gem(fd);
 
 	count = 3 + gem_aperture_size(fd) / (1024 * 1024);
-	intel_require_memory(count, 1024*1024, CHECK_RAM);
+	igt_require_memory(count, 1024*1024, CHECK_RAM);
 
 	handle = malloc(sizeof(uint32_t)*count*2);
 	start_val = handle + count;
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 67324061..c83a7911 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -337,7 +337,7 @@ static void test_allocations(int fd)
 	struct drm_i915_gem_exec_object2 obj[17];
 	unsigned long count;
 
-	intel_require_memory(2, 1ull<<(12 + ARRAY_SIZE(obj)), CHECK_RAM);
+	igt_require_memory(2, 1ull<<(12 + ARRAY_SIZE(obj)), CHECK_RAM);
 
 	memset(obj, 0, sizeof(obj));
 	for (int i = 0; i < ARRAY_SIZE(obj); i++) {
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index b35f2cb4..fa61693c 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -596,8 +596,8 @@ static void test_bb_large(int i915)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
-		if (!__intel_check_memory(2, sizes[i], CHECK_RAM,
-					  &required, &total))
+		if (!__igt_check_memory(2, sizes[i], CHECK_RAM,
+					&required, &total))
 			break;
 
 		igt_debug("Using object size %#x\n", sizes[i]);
@@ -632,7 +632,7 @@ static void test_bb_oversize(int i915)
 		.flags = I915_EXEC_BLT,
 	};
 
-	intel_require_memory(2, 8ull << 30, CHECK_RAM);
+	igt_require_memory(2, 8ull << 30, CHECK_RAM);
 	gem_write(i915, obj.handle, (4ull << 30) - sizeof(bbe),
 		  &bbe, sizeof(bbe));
 
diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 1c464f7a..23e451d3 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -175,12 +175,12 @@ test_shrink(int fd, unsigned int mode)
 	void *mem;
 
 	gem_quiescent_gpu(fd);
-	intel_purge_vm_caches(fd);
+	igt_purge_vm_caches(fd);
 
-	mem = intel_get_total_pinnable_mem(&size);
+	mem = igt_get_total_pinnable_mem(&size);
 	igt_assert(mem != MAP_FAILED);
 
-	intel_purge_vm_caches(fd);
+	igt_purge_vm_caches(fd);
 	igt_system_suspend_autoresume(mode, SUSPEND_TEST_NONE);
 
 	munmap(mem, size);
diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
index 7a850401..91ad3b4d 100644
--- a/tests/i915/kms_big_fb.c
+++ b/tests/i915/kms_big_fb.c
@@ -841,7 +841,7 @@ igt_main
 		igt_info("Max driver framebuffer size %dx%d\n",
 			 data.max_fb_width, data.max_fb_height);
 
-		data.ram_size = intel_get_total_ram_mb() << 20;
+		data.ram_size = igt_get_total_ram_mb() << 20;
 		data.aper_size = gem_aperture_size(data.drm_fd);
 		data.mappable_size = gem_mappable_aperture_size(data.drm_fd);
 
diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
index 0238d911..b22fb35c 100644
--- a/tests/prime_mmap_coherency.c
+++ b/tests/prime_mmap_coherency.c
@@ -265,16 +265,16 @@ static void test_ioctl_errors(void)
 	int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 
 	/* Ensure we can do at least one child */
-	intel_require_memory(2, width*height*4, CHECK_RAM);
+	igt_require_memory(2, width*height*4, CHECK_RAM);
 
 	for (int num_children = 1; num_children <= 8 *ncpus; num_children <<= 1) {
 		uint64_t required, total;
 
 		igt_info("Spawing %d interruptible children\n", num_children);
-		if (!__intel_check_memory(2*num_children,
-					  width*height*4,
-					  CHECK_RAM,
-					  &required, &total)) {
+		if (!__igt_check_memory(2*num_children,
+					width*height*4,
+					CHECK_RAM,
+					&required, &total)) {
 			igt_debug("Estimated that we need %'lluMiB for test, but only have %'lluMiB\n",
 				  (long long)(required >> 20),
 				  (long long)(total >> 20));
-- 
2.35.3
