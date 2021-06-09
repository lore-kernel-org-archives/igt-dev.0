Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA6A6EC9A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:59 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so640497pjz.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:59 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:53 -0500
Message-Id: <20210609043259.102581-38-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 87/93] lib/intel_bb: Remove
 intel_bb_assign_vm and tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

It's not used by anything other than the tests for that functionality
and it relies on setting the VM via SET_CONTEXT_PARAM which is
deprecated.  Delete it for now.  We can add it back in later if it's
actually useful and do it properly then.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/intel_batchbuffer.c   |  52 -------------------
 lib/intel_batchbuffer.h   |   3 --
 tests/i915/api_intel_bb.c | 104 --------------------------------------
 3 files changed, 159 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index cc976a62..da8ee3a9 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -1513,14 +1513,6 @@ static void __intel_bb_destroy_cache(struct intel_bb *ibb)
 	ibb->root = NULL;
 }
 
-static void __intel_bb_detach_intel_bufs(struct intel_bb *ibb)
-{
-	struct intel_buf *entry, *tmp;
-
-	igt_list_for_each_entry_safe(entry, tmp, &ibb->intel_bufs, link)
-		intel_bb_detach_intel_buf(ibb, entry);
-}
-
 static void __intel_bb_remove_intel_bufs(struct intel_bb *ibb)
 {
 	struct intel_buf *entry, *tmp;
@@ -1649,50 +1641,6 @@ int intel_bb_sync(struct intel_bb *ibb)
 	return ret;
 }
 
-uint64_t intel_bb_assign_vm(struct intel_bb *ibb, uint64_t allocator,
-			    uint32_t vm_id)
-{
-	struct drm_i915_gem_context_param arg = {
-		.param = I915_CONTEXT_PARAM_VM,
-	};
-	uint64_t prev_allocator = ibb->allocator_handle;
-	bool closed = false;
-
-	if (ibb->vm_id == vm_id) {
-		igt_debug("Skipping to assign same vm_id: %u\n", vm_id);
-		return 0;
-	}
-
-	/* Cannot switch if someone keeps bb refcount */
-	igt_assert(ibb->refcount == 1);
-
-	/* Detach intel_bufs and remove bb handle */
-	__intel_bb_detach_intel_bufs(ibb);
-	intel_bb_remove_object(ibb, ibb->handle, ibb->batch_offset, ibb->size);
-
-	/* Cache + objects are not valid after change anymore */
-	__intel_bb_destroy_objects(ibb);
-	__intel_bb_destroy_cache(ibb);
-
-	/* Attach new allocator */
-	ibb->allocator_handle = allocator;
-
-	/* Setparam */
-	ibb->vm_id = vm_id;
-
-	/* Skip set param, we likely return to default vm */
-	if (vm_id) {
-		arg.ctx_id = ibb->ctx;
-		arg.value = vm_id;
-		gem_context_set_param(ibb->i915, &arg);
-	}
-
-	/* Recreate bb */
-	intel_bb_reset(ibb, false);
-
-	return closed ? 0 : prev_allocator;
-}
-
 /*
  * intel_bb_print:
  * @ibb: pointer to intel_bb
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 6f148713..a2056a66 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -523,9 +523,6 @@ static inline void intel_bb_unref(struct intel_bb *ibb)
 void intel_bb_reset(struct intel_bb *ibb, bool purge_objects_cache);
 int intel_bb_sync(struct intel_bb *ibb);
 
-uint64_t intel_bb_assign_vm(struct intel_bb *ibb, uint64_t allocator,
-			    uint32_t vm_id);
-
 void intel_bb_print(struct intel_bb *ibb);
 void intel_bb_dump(struct intel_bb *ibb, const char *filename);
 void intel_bb_set_debug(struct intel_bb *ibb, bool debug);
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 7ffe64fc..74cb1841 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -241,107 +241,6 @@ static void bb_with_allocator(struct buf_ops *bops)
 	intel_bb_destroy(ibb);
 }
 
-static void bb_with_vm(struct buf_ops *bops)
-{
-	int i915 = buf_ops_get_fd(bops);
-	struct drm_i915_gem_context_param arg = {
-		.param = I915_CONTEXT_PARAM_VM,
-	};
-	struct intel_bb *ibb;
-	struct intel_buf *src, *dst, *gap;
-	uint32_t ctx = 0, vm_id1, vm_id2;
-	uint64_t prev_vm, vm;
-	uint64_t src_addr[5], dst_addr[5];
-
-	igt_require(gem_uses_full_ppgtt(i915));
-
-	ibb = intel_bb_create_with_allocator(i915, ctx, PAGE_SIZE,
-					     INTEL_ALLOCATOR_SIMPLE);
-	if (debug_bb)
-		intel_bb_set_debug(ibb, true);
-
-	src = intel_buf_create(bops, 4096/32, 32, 8, 0, I915_TILING_NONE,
-			       I915_COMPRESSION_NONE);
-	dst = intel_buf_create(bops, 4096/32, 32, 8, 0, I915_TILING_NONE,
-			       I915_COMPRESSION_NONE);
-	gap = intel_buf_create(bops, 4096, 128, 8, 0, I915_TILING_NONE,
-			       I915_COMPRESSION_NONE);
-
-	/* vm for second blit */
-	vm_id1 = gem_vm_create(i915);
-
-	/* Get vm_id for default vm */
-	arg.ctx_id = ctx;
-	gem_context_get_param(i915, &arg);
-	vm_id2 = arg.value;
-
-	igt_debug("Vm_id1: %u\n", vm_id1);
-	igt_debug("Vm_id2: %u\n", vm_id2);
-
-	/* First blit without set calling setparam */
-	intel_bb_copy_intel_buf(ibb, dst, src, 4096);
-	src_addr[0] = src->addr.offset;
-	dst_addr[0] = dst->addr.offset;
-	igt_debug("step1: src: 0x%llx, dst: 0x%llx\n",
-		  (long long) src_addr[0], (long long) dst_addr[0]);
-
-	/* Open new allocator with vm_id */
-	vm = intel_allocator_open_vm(i915, vm_id1, INTEL_ALLOCATOR_SIMPLE);
-	prev_vm = intel_bb_assign_vm(ibb, vm, vm_id1);
-
-	intel_bb_add_intel_buf(ibb, gap, false);
-	intel_bb_copy_intel_buf(ibb, dst, src, 4096);
-	src_addr[1] = src->addr.offset;
-	dst_addr[1] = dst->addr.offset;
-	igt_debug("step2: src: 0x%llx, dst: 0x%llx\n",
-		  (long long) src_addr[1], (long long) dst_addr[1]);
-
-	/* Back with default vm */
-	intel_bb_assign_vm(ibb, prev_vm, vm_id2);
-	intel_bb_add_intel_buf(ibb, gap, false);
-	intel_bb_copy_intel_buf(ibb, dst, src, 4096);
-	src_addr[2] = src->addr.offset;
-	dst_addr[2] = dst->addr.offset;
-	igt_debug("step3: src: 0x%llx, dst: 0x%llx\n",
-		  (long long) src_addr[2], (long long) dst_addr[2]);
-
-	/* And exchange one more time */
-	intel_bb_assign_vm(ibb, vm, vm_id1);
-	intel_bb_copy_intel_buf(ibb, dst, src, 4096);
-	src_addr[3] = src->addr.offset;
-	dst_addr[3] = dst->addr.offset;
-	igt_debug("step4: src: 0x%llx, dst: 0x%llx\n",
-		  (long long) src_addr[3], (long long) dst_addr[3]);
-
-	/* Back with default vm */
-	gem_vm_destroy(i915, vm_id1);
-	gem_vm_destroy(i915, vm_id2);
-	intel_bb_assign_vm(ibb, prev_vm, 0);
-
-	/* We can close it after assign previous vm to ibb */
-	intel_allocator_close(vm);
-
-	/* Try default vm still works */
-	intel_bb_copy_intel_buf(ibb, dst, src, 4096);
-	src_addr[4] = src->addr.offset;
-	dst_addr[4] = dst->addr.offset;
-	igt_debug("step5: src: 0x%llx, dst: 0x%llx\n",
-		  (long long) src_addr[4], (long long) dst_addr[4]);
-
-	/* Addresses should match for vm and prev_vm blits */
-	igt_assert_eq(src_addr[0], src_addr[2]);
-	igt_assert_eq(dst_addr[0], dst_addr[2]);
-	igt_assert_eq(src_addr[1], src_addr[3]);
-	igt_assert_eq(dst_addr[1], dst_addr[3]);
-	igt_assert_eq(src_addr[2], src_addr[4]);
-	igt_assert_eq(dst_addr[2], dst_addr[4]);
-
-	intel_buf_destroy(src);
-	intel_buf_destroy(dst);
-	intel_buf_destroy(gap);
-	intel_bb_destroy(ibb);
-}
-
 /*
  * Make sure we lead to realloc in the intel_bb.
  */
@@ -1558,9 +1457,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
 	igt_subtest("bb-with-allocator")
 		bb_with_allocator(bops);
 
-	igt_subtest("bb-with-vm")
-		bb_with_vm(bops);
-
 	igt_subtest("lot-of-buffers")
 		lot_of_buffers(bops);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
