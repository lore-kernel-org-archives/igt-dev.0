Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6A36E455
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:32:05 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id l11so2033426pji.5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:32:05 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:40 -0500
Message-Id: <20210714173141.1381686-9-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/9] Revert "i915/gem_exec_reloc: Check that
 relocations do not block"
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
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>, Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

This reverts commit 5343ca6ad8fac39fe4d468f771af72c968404bea.

This validates gpu relocations, which we're about to delete.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_reloc.c | 129 ------------------------------------
 1 file changed, 129 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index c51e79504..b1505a1b0 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -346,121 +346,6 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 	gem_close(fd, obj[0].handle);
 }
 
-static unsigned int offset_in_page(void *addr)
-{
-	return (uintptr_t)addr & 4095;
-}
-
-static void active_spin(int fd, const intel_ctx_t *ctx, unsigned engine)
-{
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
-	struct drm_i915_gem_relocation_entry reloc;
-	struct drm_i915_gem_exec_object2 obj[2];
-	struct drm_i915_gem_execbuffer2 execbuf;
-	igt_spin_t *spin;
-
-	spin = igt_spin_new(fd,
-			    .ctx = ctx,
-			    .engine = engine,
-			    .flags = IGT_SPIN_NO_PREEMPTION);
-
-	memset(obj, 0, sizeof(obj));
-	obj[0] = spin->obj[IGT_SPIN_BATCH];
-	obj[0].relocs_ptr = to_user_pointer(&reloc);
-	obj[0].relocation_count = 1;
-	obj[1].handle = gem_create(fd, 4096);
-	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
-
-	memset(&reloc, 0, sizeof(reloc));
-	reloc.presumed_offset = -1;
-	reloc.offset = offset_in_page(spin->condition);
-	reloc.target_handle = obj[0].handle;
-
-	memset(&execbuf, 0, sizeof(execbuf));
-	execbuf.buffers_ptr = to_user_pointer(obj);
-	execbuf.buffer_count = 2;
-	execbuf.flags = engine;
-	execbuf.rsvd1 = ctx->id;
-
-	gem_execbuf(fd, &execbuf);
-	gem_close(fd, obj[1].handle);
-	igt_assert_eq(*spin->condition, spin->cmd_precondition);
-
-	igt_spin_end(spin);
-	gem_sync(fd, spin->handle);
-
-	igt_assert_eq(*spin->condition, obj[0].offset);
-	igt_spin_free(fd, spin);
-}
-
-static void others_spin(int i915, const intel_ctx_t *ctx, unsigned engine)
-{
-	struct drm_i915_gem_relocation_entry reloc = {};
-	struct drm_i915_gem_exec_object2 obj = {
-		.relocs_ptr = to_user_pointer(&reloc),
-		.relocation_count = 1,
-	};
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(&obj),
-		.buffer_count = 1,
-		.flags = engine,
-		.rsvd1 = ctx->id,
-	};
-	const struct intel_execution_engine2 *e;
-	igt_spin_t *spin = NULL;
-	uint64_t addr;
-	int fence;
-
-	for_each_ctx_engine(i915, ctx, e) {
-		if (e->flags == engine)
-			continue;
-
-		if (!spin) {
-			spin = igt_spin_new(i915,
-					    .ctx = ctx,
-					    .engine = e->flags,
-					    .flags = IGT_SPIN_FENCE_OUT);
-			fence = dup(spin->out_fence);
-		} else {
-			int old_fence;
-
-			spin->execbuf.flags &= ~I915_EXEC_RING_MASK;
-			spin->execbuf.flags |= e->flags;
-			gem_execbuf_wr(i915, &spin->execbuf);
-
-			old_fence = fence;
-			fence = sync_fence_merge(old_fence,
-						 spin->execbuf.rsvd2 >> 32);
-			close(spin->execbuf.rsvd2 >> 32);
-			close(old_fence);
-		}
-	}
-	igt_require(spin);
-
-	/* All other engines are busy, let's relocate! */
-	obj.handle = batch_create(i915);
-	reloc.target_handle = obj.handle;
-	reloc.presumed_offset = -1;
-	reloc.offset = 64;
-	gem_execbuf(i915, &execbuf);
-
-	/* Verify the relocation took place */
-	gem_read(i915, obj.handle, 64, &addr, sizeof(addr));
-	igt_assert_eq_u64(addr, obj.offset);
-	gem_close(i915, obj.handle);
-
-	/* Even if the spinner was harmed in the process */
-	igt_spin_end(spin);
-	igt_assert_eq(sync_fence_wait(fence, 200), 0);
-	igt_assert_neq(sync_fence_status(fence), 0);
-	if (sync_fence_status(fence) < 0)
-		igt_warn("Spinner was cancelled, %s\n",
-			 strerror(-sync_fence_status(fence)));
-	close(fence);
-
-	igt_spin_free(i915, spin);
-}
-
 static bool has_64b_reloc(int fd)
 {
 	return intel_gen(intel_get_drm_devid(fd)) >= 8;
@@ -1272,20 +1157,6 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("basic-spin") {
-		for_each_ctx_engine(fd, ctx, e) {
-			igt_dynamic_f("%s", e->name)
-				active_spin(fd, ctx, e->flags);
-		}
-	}
-
-	igt_subtest_with_dynamic("basic-spin-others") {
-		for_each_ctx_engine(fd, ctx, e) {
-			igt_dynamic_f("%s", e->name)
-				others_spin(fd, ctx, e->flags);
-		}
-	}
-
 	igt_subtest("basic-concurrent0")
 		concurrent(fd, ctx, 0);
 	igt_subtest("basic-concurrent16")
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
