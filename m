Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 15:51:10 -0800
Message-Id: <20220113235118.1575410-8-John.C.Harrison@Intel.com>
In-Reply-To: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
References: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t 07/15] lib/store: Refactor common store
 code into helper function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A lot of tests use almost identical code for creating a batch buffer
which does a single write to memory and another is about to be added.
Instead, move the most generic version into a common helper function.
Unfortunately, the other instances are all subtly different enough to
make it not so trivial to try to use the helper. It could be done but
it is unclear if it is worth the effort at this point. This patch
proves the concept, if people like it enough then it can be extended.

v2: Fix up object address vs store offset confusion (with help from
Zbigniew K).
v3: Cope with >32bit store_offset (review feedback from Matthew Brost).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/igt_store.c             | 100 ++++++++++++++++++++++++++++++++++++
 lib/igt_store.h             |  12 +++++
 lib/meson.build             |   1 +
 tests/i915/gem_exec_fence.c |  77 ++-------------------------
 tests/i915/i915_hangman.c   |   1 +
 5 files changed, 119 insertions(+), 72 deletions(-)
 create mode 100644 lib/igt_store.c
 create mode 100644 lib/igt_store.h

diff --git a/lib/igt_store.c b/lib/igt_store.c
new file mode 100644
index 000000000..98c6c4fbd
--- /dev/null
+++ b/lib/igt_store.c
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "i915/gem_create.h"
+#include "igt_core.h"
+#include "drmtest.h"
+#include "igt_store.h"
+#include "intel_chipset.h"
+#include "intel_reg.h"
+#include "ioctl_wrappers.h"
+#include "lib/intel_allocator.h"
+
+/**
+ * SECTION:igt_store_word
+ * @short_description: Library for writing a value to memory
+ * @title: StoreWord
+ * @include: igt.h
+ *
+ * A lot of igt testcases need some mechanism for writing a value to memory
+ * as a test that a batch buffer has executed.
+ *
+ * NB: Requires master for STORE_DWORD on gen4/5.
+ */
+void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+		    const struct intel_execution_engine2 *e,
+		    int fence, uint32_t target_handle,
+		    uint64_t target_gpu_addr,
+		    uint64_t store_offset, uint32_t store_value)
+{
+	const int SCRATCH = 0;
+	const int BATCH = 1;
+	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_relocation_entry reloc;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	uint32_t batch[16];
+	uint64_t bb_offset, delta;
+	int i;
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.buffer_count = ARRAY_SIZE(obj);
+	execbuf.flags = e->flags;
+	execbuf.rsvd1 = ctx->id;
+	if (fence != -1) {
+		execbuf.flags |= I915_EXEC_FENCE_IN;
+		execbuf.rsvd2 = fence;
+	}
+	if (gen < 6)
+		execbuf.flags |= I915_EXEC_SECURE;
+
+	memset(obj, 0, sizeof(obj));
+	obj[SCRATCH].handle = target_handle;
+
+	obj[BATCH].handle = gem_create(fd, 4096);
+	obj[BATCH].relocs_ptr = to_user_pointer(&reloc);
+	obj[BATCH].relocation_count = !ahnd ? 1 : 0;
+	bb_offset = get_offset(ahnd, obj[BATCH].handle, 4096, 0);
+	memset(&reloc, 0, sizeof(reloc));
+
+	i = 0;
+	delta = sizeof(uint32_t) * store_offset;
+	if (!ahnd) {
+		reloc.target_handle = obj[SCRATCH].handle;
+		reloc.presumed_offset = -1;
+		reloc.offset = sizeof(uint32_t) * (i + 1);
+		reloc.delta = lower_32_bits(delta);
+		igt_assert_eq(upper_32_bits(delta), 0);
+		reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+	} else {
+		obj[SCRATCH].offset = target_gpu_addr;
+		obj[SCRATCH].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[BATCH].offset = bb_offset;
+		obj[BATCH].flags |= EXEC_OBJECT_PINNED;
+	}
+	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
+	if (gen >= 8) {
+		uint64_t addr = target_gpu_addr + delta;
+		batch[++i] = lower_32_bits(addr);
+		batch[++i] = upper_32_bits(addr);
+	} else if (gen >= 4) {
+		batch[++i] = 0;
+		batch[++i] = lower_32_bits(delta);
+		igt_assert_eq(upper_32_bits(delta), 0);
+		reloc.offset += sizeof(uint32_t);
+	} else {
+		batch[i]--;
+		batch[++i] = lower_32_bits(delta);
+		igt_assert_eq(upper_32_bits(delta), 0);
+	}
+	batch[++i] = store_value;
+	batch[++i] = MI_BATCH_BUFFER_END;
+	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
+	gem_execbuf(fd, &execbuf);
+	gem_close(fd, obj[BATCH].handle);
+	put_offset(ahnd, obj[BATCH].handle);
+}
diff --git a/lib/igt_store.h b/lib/igt_store.h
new file mode 100644
index 000000000..5c6c8263c
--- /dev/null
+++ b/lib/igt_store.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021 Intel Corporation
+ */
+
+#include "igt_gt.h"
+
+void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
+		    const struct intel_execution_engine2 *e,
+		    int fence, uint32_t target_handle,
+		    uint64_t target_gpu_addr,
+		    uint64_t store_offset, uint32_t store_value);
diff --git a/lib/meson.build b/lib/meson.build
index b9568a71b..3e43316d1 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -72,6 +72,7 @@ lib_sources = [
 	'igt_map.c',
 	'igt_pm.c',
 	'igt_dummyload.c',
+	'igt_store.c',
 	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_panfrost.c',
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 9a6336ce9..196236b27 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -28,6 +28,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_store.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
@@ -57,74 +58,6 @@ struct sync_merge_data {
 #define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
-static void store(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
-		  const struct intel_execution_engine2 *e,
-		  int fence, uint32_t target, uint64_t target_offset,
-		  unsigned offset_value)
-{
-	const int SCRATCH = 0;
-	const int BATCH = 1;
-	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-	struct drm_i915_gem_exec_object2 obj[2];
-	struct drm_i915_gem_relocation_entry reloc;
-	struct drm_i915_gem_execbuffer2 execbuf;
-	uint32_t batch[16], delta;
-	uint64_t bb_offset;
-	int i;
-
-	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.buffer_count = 2;
-	execbuf.flags = e->flags | I915_EXEC_FENCE_IN;
-	execbuf.rsvd1 = ctx->id;
-	execbuf.rsvd2 = fence;
-	if (gen < 6)
-		execbuf.flags |= I915_EXEC_SECURE;
-
-	memset(obj, 0, sizeof(obj));
-	obj[SCRATCH].handle = target;
-
-	obj[BATCH].handle = gem_create(fd, 4096);
-	obj[BATCH].relocs_ptr = to_user_pointer(&reloc);
-	obj[BATCH].relocation_count = !ahnd ? 1 : 0;
-	bb_offset = get_offset(ahnd, obj[BATCH].handle, 4096, 0);
-	memset(&reloc, 0, sizeof(reloc));
-
-	i = 0;
-	delta = sizeof(uint32_t) * offset_value;
-	if (!ahnd) {
-		reloc.target_handle = obj[SCRATCH].handle;
-		reloc.presumed_offset = -1;
-		reloc.offset = sizeof(uint32_t) * (i + 1);
-		reloc.delta = delta;
-		reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-		reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-	} else {
-		obj[SCRATCH].offset = target_offset;
-		obj[SCRATCH].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
-		obj[BATCH].offset = bb_offset;
-		obj[BATCH].flags |= EXEC_OBJECT_PINNED;
-	}
-	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
-	if (gen >= 8) {
-		batch[++i] = target_offset + delta;
-		batch[++i] = target_offset >> 32;
-	} else if (gen >= 4) {
-		batch[++i] = 0;
-		batch[++i] = delta;
-		reloc.offset += sizeof(uint32_t);
-	} else {
-		batch[i]--;
-		batch[++i] = delta;
-	}
-	batch[++i] = offset_value;
-	batch[++i] = MI_BATCH_BUFFER_END;
-	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
-	gem_execbuf(fd, &execbuf);
-	gem_close(fd, obj[BATCH].handle);
-	put_offset(ahnd, obj[BATCH].handle);
-}
-
 static bool fence_busy(int fence)
 {
 	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) == 0;
@@ -400,13 +333,13 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 			continue;
 
 		if (flags & NONBLOCK) {
-			store(fd, ahnd, ctx, e2, spin->out_fence,
-			      scratch, scratch_offset, i);
+			igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
+				       scratch, scratch_offset, i, i);
 		} else {
 			igt_fork(child, 1) {
 				ahnd = get_reloc_ahnd(fd, ctx->id);
-				store(fd, ahnd, ctx, e2, spin->out_fence,
-				      scratch, scratch_offset, i);
+				igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
+					       scratch, scratch_offset, i, i);
 				put_ahnd(ahnd);
 			}
 		}
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 6656b3fcd..5a0c9497c 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -36,6 +36,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_store.h"
 #include "igt_sysfs.h"
 #include "igt_debugfs.h"
 #include "sw_sync.h"
-- 
2.25.1
