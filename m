Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A592E6EB7E
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 09:40:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1394361wms.1
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 02:40:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue,  8 Jun 2021 11:40:18 +0200
Message-Id: <20210608094020.21598-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
References: <20210608094020.21598-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/7] Revert "i915/gem_exec_reloc: Flood the
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

This reverts commit 57ee41f12b7a53283fd812c5f72fcb39e6ad2197.

This validates gpu relocations, which we're about to delete.

Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 tests/i915/gem_exec_reloc.c | 89 -------------------------------------
 1 file changed, 89 deletions(-)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index c3f42aff9c9a..cbd40962c610 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -344,88 +344,6 @@ static void active(int fd, unsigned engine)
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
-static void __many_active(int i915, unsigned engine, unsigned long count)
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
-	};
-	igt_spin_t *spin;
-
-	spin = __igt_spin_new(i915,
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
-static void many_active(int i915, unsigned engine)
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
-		__many_active(i915, engine, count);
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
@@ -1053,13 +971,6 @@ igt_main
 		}
 	}
 
-	igt_subtest_with_dynamic("basic-many-active") {
-		__for_each_physical_engine(fd, e) {
-			igt_dynamic_f("%s", e->name)
-				many_active(fd, e->flags);
-		}
-	}
-
 	igt_subtest("invalid-domains")
 		invalid_domains(fd);
 
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
