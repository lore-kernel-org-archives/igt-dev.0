Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6F86E442
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:32:00 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id v7so3228136pgl.2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:32:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:38 -0500
Message-Id: <20210714173141.1381686-7-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/9] Revert "test/i915/gem_exec_reloc:
 Restore interclient testings"
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
Cc: Petri Latvala <petri.latvala@intel.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

This reverts commit cf2f41b3d3dfabaf3a4837062f996f3491a350b1.

And I mean revert with extreme prejudice because this was already
thrown out in

commit 39e9aa1032a4e60f776f34b3ccf4fb728abbfe5c
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Aug 10 11:00:34 2020 +0200

    tests/i915: Remove subtests that rely on async relocation behavior

and Chris then decided to undo that without any acks from the people
who've removed these tests. Or well anyone else. Commit fights in
upstream repositories are not acceptable.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Arkadiusz Hiler <arek@hiler.eu>
---
 tests/i915/gem_exec_reloc.c | 224 ------------------------------------
 1 file changed, 224 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index d54473341..16e9910de 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -431,79 +431,6 @@ static void many_active(int i915, const intel_ctx_t *ctx, unsigned engine)
 	}
 }
 
-static void __wide_active(int i915, const intel_ctx_t *ctx, unsigned engine,
-			  unsigned long count)
-{
-	struct drm_i915_gem_relocation_entry *reloc =
-		calloc(count, sizeof(*reloc));
-	struct drm_i915_gem_exec_object2 *obj =
-		calloc(count + 1, sizeof(*obj));
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(obj),
-		.buffer_count = count + 1,
-		.flags = engine | I915_EXEC_HANDLE_LUT,
-		.rsvd1 = ctx->id,
-	};
-	igt_spin_t *spin;
-
-	for (unsigned long i = 0; i < count; i++) {
-		obj[i].handle = gem_create(i915, 4096);
-		obj[i].flags = EXEC_OBJECT_WRITE;
-		obj[i].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	}
-
-	spin = __igt_spin_new(i915,
-			      .ctx = ctx,
-			      .engine = engine,
-			      .flags = (IGT_SPIN_FENCE_OUT |
-					IGT_SPIN_NO_PREEMPTION));
-	obj[count] = spin->obj[1];
-	gem_execbuf(i915, &execbuf); /* mark all the objects as active */
-
-	for (unsigned long i = 0; i < count; i++) {
-		reloc[i].target_handle = i;
-		reloc[i].presumed_offset = ~0ull;
-		obj[i].relocs_ptr = to_user_pointer(&reloc[i]);
-		obj[i].relocation_count = 1;
-	}
-	gem_execbuf(i915, &execbuf); /* relocation onto active objects */
-
-	igt_assert_eq(sync_fence_status(spin->out_fence), 0);
-	igt_spin_free(i915, spin);
-
-	for (unsigned long i = 0; i < count; i++) {
-		uint64_t addr;
-
-		gem_read(i915, obj[i].handle, 0, &addr, sizeof(addr));
-		igt_assert_eq_u64(addr, obj[i].offset);
-
-		gem_close(i915, obj[i].handle);
-	}
-	free(obj);
-	free(reloc);
-}
-
-static void wide_active(int i915, const intel_ctx_t *ctx, unsigned engine)
-{
-	const uint64_t max = gem_aperture_size(i915) / 4096 / 2;
-	unsigned long count = 256;
-
-	igt_until_timeout(2) {
-		uint64_t required, total;
-
-		if (!__intel_check_memory(count, 4096, CHECK_RAM,
-					  &required, &total))
-			break;
-
-		igt_debug("Testing count:%lu\n", count);
-		__wide_active(i915, ctx, engine, count);
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
@@ -951,147 +878,6 @@ static void basic_softpin(int fd)
 	gem_close(fd, obj[1].handle);
 }
 
-static struct drm_i915_gem_relocation_entry *
-parallel_relocs(int count, unsigned long *out)
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
-		reloc[i].delta = i;
-		reloc[i].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-		reloc[i].write_domain = 0;
-	}
-	mprotect(reloc, sz, PROT_READ);
-
-	*out = sz;
-	return reloc;
-}
-
-static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
-{
-	int err;
-
-	err = 0;
-	if (ioctl(i915, DRM_IOCTL_I915_GEM_EXECBUFFER2, execbuf)) {
-		err = -errno;
-		igt_assume(err);
-	}
-
-	errno = 0;
-	return err;
-}
-
-static int stop;
-static void sighandler(int sig)
-{
-	stop = 1;
-}
-
-static void parallel_child(int i915, const intel_ctx_t *ctx,
-			   const struct intel_execution_engine2 *engine,
-			   struct drm_i915_gem_relocation_entry *reloc,
-			   uint32_t common)
-{
-	igt_spin_t *spin = __igt_spin_new(i915, .ctx = ctx,
-					  .engine = engine->flags);
-	struct drm_i915_gem_exec_object2 reloc_target = {
-		.handle = gem_create(i915, 32 * 1024 * 8),
-		.relocation_count = 32 * 1024,
-		.relocs_ptr = to_user_pointer(reloc),
-	};
-	struct drm_i915_gem_exec_object2 obj[3] = {
-		reloc_target,
-		{ .handle = common },
-		spin->obj[1],
-	};
-	struct drm_i915_gem_execbuffer2 execbuf = {
-		.buffers_ptr = to_user_pointer(obj),
-		.buffer_count = ARRAY_SIZE(obj),
-		.flags = engine->flags | I915_EXEC_HANDLE_LUT,
-		.rsvd1 = ctx->id,
-	};
-	struct sigaction act = {
-		.sa_handler = sighandler,
-	};
-	unsigned long count = 0;
-
-	sigaction(SIGINT, &act, NULL);
-	while (!READ_ONCE(stop)) {
-		int err = __execbuf(i915, &execbuf);
-		if (err == -EINTR)
-			break;
-
-		igt_assert_eq(err, 0);
-		count++;
-	}
-
-	igt_info("%s: count %lu\n", engine->name, count);
-	igt_spin_free(i915, spin);
-}
-
-static void kill_children(int sig)
-{
-	signal(sig, SIG_IGN);
-	kill(-getpgrp(), SIGINT);
-	signal(sig, SIG_DFL);
-}
-
-static void parallel(int i915, const intel_ctx_t *ctx)
-{
-	const struct intel_execution_engine2 *e;
-	struct drm_i915_gem_relocation_entry *reloc;
-	uint32_t common = gem_create(i915, 4096);
-	uint32_t batch = batch_create(i915);
-	unsigned long reloc_sz;
-
-	reloc = parallel_relocs(32 * 1024, &reloc_sz);
-
-	stop = 0;
-	for_each_ctx_engine(i915, ctx, e) {
-		igt_fork(child, 1)
-			parallel_child(i915, ctx, e, reloc, common);
-	}
-	sleep(2);
-
-	if (gem_scheduler_has_preemption(i915)) {
-		const intel_ctx_t *tmp_ctx = intel_ctx_create(i915, &ctx->cfg);
-
-		for_each_ctx_engine(i915, tmp_ctx, e) {
-			struct drm_i915_gem_exec_object2 obj[2] = {
-				{ .handle = common },
-				{ .handle = batch },
-			};
-			struct drm_i915_gem_execbuffer2 execbuf = {
-				.buffers_ptr = to_user_pointer(obj),
-				.buffer_count = ARRAY_SIZE(obj),
-				.flags = e->flags,
-				.rsvd1 = tmp_ctx->id,
-			};
-			gem_execbuf(i915, &execbuf);
-		}
-
-		intel_ctx_destroy(i915, tmp_ctx);
-	}
-	gem_sync(i915, batch);
-	gem_close(i915, batch);
-
-	kill_children(SIGINT);
-	igt_waitchildren();
-
-	gem_close(i915, common);
-	munmap(reloc, reloc_sz);
-}
-
 #define CONCURRENT 1024
 
 static uint64_t concurrent_relocs(int i915, int idx, int count)
@@ -1592,16 +1378,6 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("basic-wide-active") {
-		for_each_ctx_engine(fd, ctx, e) {
-			igt_dynamic_f("%s", e->name)
-				wide_active(fd, ctx, e->flags);
-		}
-	}
-
-	igt_subtest("basic-parallel")
-		parallel(fd, ctx);
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
