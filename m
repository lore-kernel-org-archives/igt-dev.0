Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B8AA6E454
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:32:03 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id bt15so2046903pjb.2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:32:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:39 -0500
Message-Id: <20210714173141.1381686-8-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 7/9] Revert "i915/gem_exec_reloc: Flood the
 ring with GPU relocs"
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

This reverts commit 57ee41f12b7a53283fd812c5f72fcb39e6ad2197.

This validates gpu relocations, which we're about to delete.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_reloc.c | 92 -------------------------------------
 1 file changed, 92 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index 16e9910de..c51e79504 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -346,91 +346,6 @@ static void active(int fd, const intel_ctx_t *ctx, unsigned engine)
 	gem_close(fd, obj[0].handle);
 }
 
-static uint64_t many_relocs(unsigned long count, unsigned long *out)
-{
-	struct drm_i915_gem_relocation_entry *reloc;
-	unsigned long sz;
-	int i;
-
-	sz = count * sizeof(*reloc);
-	sz = ALIGN(sz, 4096);
-
-	reloc = mmap(0, sz, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
-	igt_assert(reloc != MAP_FAILED);
-	for (i = 0; i < count; i++) {
-		reloc[i].target_handle = 0;
-		reloc[i].presumed_offset = ~0ull;
-		reloc[i].offset = 8 * i;
-		reloc[i].delta = 8 * i;
-	}
-	mprotect(reloc, sz, PROT_READ);
-
-	*out = sz;
-	return to_user_pointer(reloc);
-}
-
-static void __many_active(int i915, const intel_ctx_t *ctx, unsigned engine,
-			  unsigned long count)
-{
-	unsigned long reloc_sz;
-	struct drm_i915_gem_exec_object2 obj[2] = {{
-		.handle = gem_create(i915, count * sizeof(uint64_t)),
-		.relocs_ptr = many_relocs(count, &reloc_sz),
-		.relocation_count = count,
-	}};
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(obj),
-		.buffer_count = ARRAY_SIZE(obj),
-		.flags = engine | I915_EXEC_HANDLE_LUT,
-		.rsvd1 = ctx->id,
-	};
-	igt_spin_t *spin;
-
-	spin = __igt_spin_new(i915,
-			      .ctx = ctx,
-			      .engine = engine,
-			      .dependency = obj[0].handle,
-			      .flags = (IGT_SPIN_FENCE_OUT |
-					IGT_SPIN_NO_PREEMPTION));
-	obj[1] = spin->obj[1];
-	gem_execbuf(i915, &execbuf);
-	igt_assert_eq(sync_fence_status(spin->out_fence), 0);
-	igt_spin_free(i915, spin);
-
-	for (unsigned long i = 0; i < count; i++) {
-		uint64_t addr;
-
-		gem_read(i915, obj[0].handle, i * sizeof(addr),
-			 &addr, sizeof(addr));
-
-		igt_assert_eq_u64(addr, obj[0].offset + i * sizeof(addr));
-	}
-
-	munmap(from_user_pointer(obj[0].relocs_ptr), reloc_sz);
-	gem_close(i915, obj[0].handle);
-}
-
-static void many_active(int i915, const intel_ctx_t *ctx, unsigned engine)
-{
-	const uint64_t max = 2048;
-	unsigned long count = 256;
-
-	igt_until_timeout(2) {
-		uint64_t required, total;
-
-		if (!__intel_check_memory(1, 8 * count, CHECK_RAM,
-					  &required, &total))
-			break;
-
-		igt_debug("Testing count:%lu\n", count);
-		__many_active(i915, ctx, engine, count);
-
-		count <<= 1;
-		if (count >= max)
-			break;
-	}
-}
-
 static unsigned int offset_in_page(void *addr)
 {
 	return (uintptr_t)addr & 4095;
@@ -1371,13 +1286,6 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("basic-many-active") {
-		for_each_ctx_engine(fd, ctx, e) {
-			igt_dynamic_f("%s", e->name)
-				many_active(fd, ctx, e->flags);
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
