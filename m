Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D702E6E053
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:43:05 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:32 +0200
Message-Id: <20210806134145.24634-44-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 43/56] tests/gem_workarounds: Adopt to
 use allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_workarounds.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index e240901c4..3d1851279 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -94,6 +94,7 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 	uint32_t *base, *out;
 	igt_spin_t *spin;
 	int fw, fail = 0;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	reloc = calloc(num_wa_regs, sizeof(*reloc));
 	igt_assert(reloc);
@@ -109,7 +110,13 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 	gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
 	obj[1].handle = gem_create(i915, batch_sz);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
-	obj[1].relocation_count = num_wa_regs;
+	obj[1].relocation_count = !ahnd ? num_wa_regs : 0;
+	if (ahnd) {
+		obj[0].offset = get_offset(ahnd, obj[0].handle, result_sz, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[1].offset = get_offset(ahnd, obj[1].handle, batch_sz, 0);
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	out = base =
 		gem_mmap__cpu(i915, obj[1].handle, 0, batch_sz, PROT_WRITE);
@@ -121,9 +128,9 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 		reloc[i].delta = i * sizeof(uint32_t);
 		reloc[i].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 		reloc[i].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-		*out++ = reloc[i].delta;
+		*out++ = obj[0].offset + reloc[i].delta;
 		if (gen >= 8)
-			*out++ = 0;
+			*out++ = (obj[0].offset + reloc[i].delta) >> 32;
 	}
 	*out++ = MI_BATCH_BUFFER_END;
 	munmap(base, batch_sz);
@@ -136,7 +143,8 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 
 	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
 
-	spin = igt_spin_new(i915, .ctx = ctx, .flags = IGT_SPIN_POLL_RUN);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
+			    .flags = IGT_SPIN_POLL_RUN);
 	igt_spin_busywait_until_started(spin);
 
 	fw = igt_open_forcewake_handle(i915);
@@ -172,6 +180,7 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 
 	close(fw);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 
 	gem_close(i915, obj[1].handle);
 	gem_close(i915, obj[0].handle);
-- 
2.26.0
