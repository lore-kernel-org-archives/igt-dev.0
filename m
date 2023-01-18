Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57B510E68D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:14:00 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:50 -0800
Message-Id: <20230118071350.17498-20-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 19/19] tests/i915/vm_bind: Add userptr
 invalidation test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add vma-merge-execbuf3 subtest to gem_userptr_blits to
validate userptr invalidations with VM_BIND+execbuf3.

NOTE:
The test is derived from vma-merge subtest. There is a known
fence timeout issue with vma-merge subtest which the
vma-merge-execbuf3 inherits, but the test still passes none
the less validates userptr invalidation of persistent mappings
and rebinding the same in the subsequent submission.

v2: Add subtest description

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/gem_userptr_blits.c | 72 ++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 698508669..eae798b5e 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -60,7 +60,10 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_vm.h"
+#include "i915/i915_vm_bind.h"
 #include "igt.h"
+#include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_types.h"
 #include "sw_sync.h"
@@ -740,6 +743,69 @@ static void test_vma_merge(int i915)
 	put_ahnd(ahnd);
 }
 
+static void test_vma_merge_execbuf3(int i915)
+{
+	struct drm_i915_gem_context_param param = {
+		.param = I915_CONTEXT_PARAM_RECOVERABLE,
+		.value = 0,
+	};
+	const size_t sz = 2 * hugepagesize();
+	uint32_t handle, vm_id;
+	const intel_ctx_t *ctx;
+	igt_spin_t *spin;
+	uint64_t ahnd;
+	void *addr;
+
+	vm_id = gem_vm_create_in_vm_bind_mode(i915);
+	ctx = intel_ctx_create_all_physical(i915);
+	param.ctx_id = ctx->id;
+	gem_context_set_param(i915, &param);
+	gem_context_set_vm(i915, ctx->id, vm_id);
+	(void)gem_context_get_vm(i915, ctx->id);
+
+	ahnd = get_simple_ahnd(i915, ctx->id);
+	igt_require(ahnd);
+	addr = mmap(NULL, sz, PROT_READ | PROT_WRITE,
+		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+
+	gem_userptr(i915, addr + sz / 2, 4096, 0, userptr_flags, &handle);
+
+	spin = igt_spin_new(i915, .ctx = ctx, .vm_id = vm_id,
+			    .ahnd = ahnd, .dependency = handle,
+			    .flags = IGT_SPIN_EXECBUF3);
+
+	for (size_t x = 0; x < sz; x += 4096) {
+		if (x == sz / 2)
+			continue;
+
+		igt_assert(mmap(addr + x, 4096, PROT_READ | PROT_WRITE,
+				MAP_FIXED | MAP_SHARED | MAP_ANON, -1, 0) !=
+			   MAP_FAILED);
+	}
+
+	igt_spin_end(spin);
+	igt_spin_reset(spin);
+	igt_assert(syncobj_timeline_wait(i915, spin->out_syncobj, NULL, spin->nengines,
+					 gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+
+	/* Another submission will cause rebind of invalidated mappings */
+	gem_execbuf3(i915, &spin->execbuf3);
+	igt_spin_end(spin);
+	igt_assert(syncobj_timeline_wait(i915, &spin->out_syncobj[spin->nengines - 1],
+					 NULL, 1, gettime_ns() + (2 * NSEC_PER_SEC),
+					 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
+	gem_close(i915, handle);
+
+	munmap(addr, sz);
+
+	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
+
+	intel_ctx_destroy(i915, ctx);
+	gem_vm_destroy(i915, vm_id);
+}
+
 static void test_huge_split(int i915)
 {
 	const size_t sz = 2 * hugepagesize();
@@ -2628,6 +2694,12 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("vma-merge")
 			test_vma_merge(fd);
 
+		igt_describe("Validate userptr invalidation handling with execbuf3");
+		igt_subtest("vma-merge-execbuf3") {
+			igt_require(i915_vm_bind_version(fd) == 1);
+			test_vma_merge_execbuf3(fd);
+		}
+
 		igt_subtest("huge-split")
 			test_huge_split(fd);
 	}
-- 
2.21.0.rc0.32.g243a4c7e27
