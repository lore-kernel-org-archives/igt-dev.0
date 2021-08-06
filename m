Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FF36EB8A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:22 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:07 +0200
Message-Id: <20210806094649.21162-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 14/56] tests/gem_ctx_isolation: Adopt to
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
 tests/i915/gem_ctx_isolation.c | 97 +++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 24ddde0bc..c57e05079 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -277,6 +277,7 @@ static void tmpl_regs(int fd,
 }
 
 static uint32_t read_regs(int fd,
+			  uint64_t ahnd,
 			  const intel_ctx_t *ctx,
 			  const struct intel_execution_engine2 *e,
 			  unsigned int flags)
@@ -305,6 +306,12 @@ static uint32_t read_regs(int fd,
 	obj[0].handle = gem_create(fd, regs_size);
 	obj[1].handle = gem_create(fd, batch_size);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
+	if (ahnd) {
+		obj[0].offset = get_offset(ahnd, obj[0].handle, regs_size, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[1].offset = get_offset(ahnd, obj[1].handle, batch_size, 0);
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	b = batch = gem_mmap__cpu(fd, obj[1].handle, 0, batch_size, PROT_WRITE);
 	gem_set_domain(fd, obj[1].handle,
@@ -334,14 +341,14 @@ static uint32_t read_regs(int fd,
 			reloc[n].delta = offset;
 			reloc[n].read_domains = I915_GEM_DOMAIN_RENDER;
 			reloc[n].write_domain = I915_GEM_DOMAIN_RENDER;
-			*b++ = offset;
+			*b++ = obj[0].offset + offset;
 			if (r64b)
-				*b++ = 0;
+				*b++ = (obj[0].offset + offset) >> 32;
 			n++;
 		}
 	}
 
-	obj[1].relocation_count = n;
+	obj[1].relocation_count = !ahnd ? n : 0;
 	*b++ = MI_BATCH_BUFFER_END;
 	munmap(batch, batch_size);
 
@@ -353,6 +360,7 @@ static uint32_t read_regs(int fd,
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
 	free(reloc);
+	put_offset(ahnd, obj[1].handle);
 
 	return obj[0].handle;
 }
@@ -419,6 +427,7 @@ static void write_regs(int fd,
 }
 
 static void restore_regs(int fd,
+			 uint64_t ahnd,
 			 const intel_ctx_t *ctx,
 			 const struct intel_execution_engine2 *e,
 			 unsigned int flags,
@@ -434,6 +443,7 @@ static void restore_regs(int fd,
 	struct drm_i915_gem_relocation_entry *reloc;
 	unsigned int batch_size, n;
 	uint32_t *batch, *b;
+	uint32_t regs_size = NUM_REGS * sizeof(uint32_t);
 
 	if (gen < 7) /* no LRM */
 		return;
@@ -448,6 +458,12 @@ static void restore_regs(int fd,
 	obj[0].handle = regs;
 	obj[1].handle = gem_create(fd, batch_size);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
+	if (ahnd) {
+		obj[0].offset = get_offset(ahnd, obj[0].handle, regs_size, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[1].offset = get_offset(ahnd, obj[1].handle, batch_size, 0);
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	b = batch = gem_mmap__cpu(fd, obj[1].handle, 0, batch_size, PROT_WRITE);
 	gem_set_domain(fd, obj[1].handle,
@@ -477,13 +493,13 @@ static void restore_regs(int fd,
 			reloc[n].delta = offset;
 			reloc[n].read_domains = I915_GEM_DOMAIN_RENDER;
 			reloc[n].write_domain = 0;
-			*b++ = offset;
+			*b++ = obj[0].offset + offset;
 			if (r64b)
-				*b++ = 0;
+				*b++ = (obj[0].offset + offset) >> 32;
 			n++;
 		}
 	}
-	obj[1].relocation_count = n;
+	obj[1].relocation_count = !ahnd ? n : 0;
 	*b++ = MI_BATCH_BUFFER_END;
 	munmap(batch, batch_size);
 
@@ -494,6 +510,7 @@ static void restore_regs(int fd,
 	execbuf.rsvd1 = ctx->id;
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
+	put_offset(ahnd, obj[1].offset);
 }
 
 __attribute__((unused))
@@ -622,15 +639,20 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 		igt_spin_t *spin = NULL;
 		const intel_ctx_t *ctx;
 		uint32_t regs[2], tmpl;
+		uint64_t ahnd;
 
 		ctx = intel_ctx_create(fd, cfg);
+		ahnd = get_reloc_ahnd(fd, ctx->id);
 
-		tmpl = read_regs(fd, ctx, e, flags);
-		regs[0] = read_regs(fd, ctx, e, flags);
+		tmpl = read_regs(fd, ahnd, ctx, e, flags);
+		regs[0] = read_regs(fd, ahnd, ctx, e, flags);
 
 		tmpl_regs(fd, e, tmpl, values[v]);
 
-		spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
+		spin = igt_spin_new(fd,
+				    .ahnd = ahnd,
+				    .ctx = ctx,
+				    .engine = e->flags);
 
 		igt_debug("%s[%d]: Setting all registers to 0x%08x\n",
 			  __func__, v, values[v]);
@@ -638,15 +660,18 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 
 		if (flags & DIRTY2) {
 			const intel_ctx_t *sw = intel_ctx_create(fd, &ctx->cfg);
+			uint64_t ahnd_sw = get_reloc_ahnd(fd, sw->id);
 			igt_spin_t *syncpt, *dirt;
 
 			/* Explicit sync to keep the switch between write/read */
 			syncpt = igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags,
 					      .flags = IGT_SPIN_FENCE_OUT);
 
 			dirt = igt_spin_new(fd,
+					    .ahnd = ahnd_sw,
 					    .ctx = sw,
 					    .engine = e->flags,
 					    .fence = syncpt->out_fence,
@@ -655,6 +680,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 			igt_spin_free(fd, syncpt);
 
 			syncpt = igt_spin_new(fd,
+					      .ahnd = ahnd,
 					      .ctx = ctx,
 					      .engine = e->flags,
 					      .fence = dirt->out_fence,
@@ -663,15 +689,16 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 
 			igt_spin_free(fd, syncpt);
 			intel_ctx_destroy(fd, sw);
+			put_ahnd(ahnd_sw);
 		}
 
-		regs[1] = read_regs(fd, ctx, e, flags);
+		regs[1] = read_regs(fd, ahnd, ctx, e, flags);
 
 		/*
 		 * Restore the original register values before the HW idles.
 		 * Or else it may never restart!
 		 */
-		restore_regs(fd, ctx, e, flags, regs[0]);
+		restore_regs(fd, ahnd, ctx, e, flags, regs[0]);
 
 		igt_spin_free(fd, spin);
 
@@ -681,6 +708,7 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 			gem_close(fd, regs[n]);
 		intel_ctx_destroy(fd, ctx);
 		gem_close(fd, tmpl);
+		put_ahnd(ahnd);
 	}
 }
 
@@ -706,11 +734,16 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		igt_spin_t *spin = NULL;
 		const intel_ctx_t *ctx[2];
 		uint32_t regs[2], tmp;
+		uint64_t ahnd[2];
 
 		ctx[0] = intel_ctx_create(fd, cfg);
-		regs[0] = read_regs(fd, ctx[0], e, flags);
+		ahnd[0] = get_reloc_ahnd(fd, ctx[0]->id);
+		regs[0] = read_regs(fd, ahnd[0], ctx[0], e, flags);
 
-		spin = igt_spin_new(fd, .ctx = ctx[0], .engine = e->flags);
+		spin = igt_spin_new(fd,
+				    .ahnd = ahnd[0],
+				    .ctx = ctx[0],
+				    .engine = e->flags);
 
 		if (flags & DIRTY1) {
 			igt_debug("%s[%d]: Setting all registers of ctx 0 to 0x%08x\n",
@@ -727,7 +760,8 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		 * see the corruption from the previous context instead!
 		 */
 		ctx[1] = intel_ctx_create(fd, cfg);
-		regs[1] = read_regs(fd, ctx[1], e, flags);
+		ahnd[1] = get_reloc_ahnd(fd, ctx[1]->id);
+		regs[1] = read_regs(fd, ahnd[1], ctx[1], e, flags);
 
 		if (flags & DIRTY2) {
 			igt_debug("%s[%d]: Setting all registers of ctx 1 to 0x%08x\n",
@@ -739,8 +773,8 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		 * Restore the original register values before the HW idles.
 		 * Or else it may never restart!
 		 */
-		tmp = read_regs(fd, ctx[0], e, flags);
-		restore_regs(fd, ctx[0], e, flags, regs[0]);
+		tmp = read_regs(fd, ahnd[0], ctx[0], e, flags);
+		restore_regs(fd, ahnd[0], ctx[0], e, flags, regs[0]);
 
 		igt_spin_free(fd, spin);
 
@@ -752,6 +786,7 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 		for (int n = 0; n < ARRAY_SIZE(ctx); n++) {
 			gem_close(fd, regs[n]);
 			intel_ctx_destroy(fd, ctx[n]);
+			put_ahnd(ahnd[n]);
 		}
 		gem_close(fd, tmp);
 	}
@@ -781,7 +816,9 @@ static void inject_reset_context(int fd, const intel_ctx_cfg_t *cfg,
 				 const struct intel_execution_engine2 *e)
 {
 	const intel_ctx_t *ctx = create_reset_context(fd, cfg);
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	struct igt_spin_factory opts = {
+		.ahnd = ahnd,
 		.ctx = ctx,
 		.engine = e->flags,
 		.flags = IGT_SPIN_FAST,
@@ -826,21 +863,27 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 	const unsigned int num_values = ARRAY_SIZE(values);
 	const intel_ctx_t *ctx[num_values + 1];
 	uint32_t regs[num_values + 1][2];
+	uint64_t ahnd[num_values + 1];
 	igt_spin_t *spin;
 
 	gem_quiescent_gpu(fd);
 
 	ctx[num_values] = intel_ctx_create(fd, cfg);
-	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
-	regs[num_values][0] = read_regs(fd, ctx[num_values], e, flags);
+	ahnd[num_values] = get_reloc_ahnd(fd, ctx[num_values]->id);
+	spin = igt_spin_new(fd,
+			    .ahnd = ahnd[num_values],
+			    .ctx = ctx[num_values],
+			    .engine = e->flags);
+	regs[num_values][0] = read_regs(fd, ahnd[num_values], ctx[num_values],
+					e, flags);
 	for (int v = 0; v < num_values; v++) {
 		ctx[v] = intel_ctx_create(fd, cfg);
+		ahnd[v] = get_reloc_ahnd(fd, ctx[v]->id);
 		write_regs(fd, ctx[v], e, flags, values[v]);
 
-		regs[v][0] = read_regs(fd, ctx[v], e, flags);
-
+		regs[v][0] = read_regs(fd, ahnd[v], ctx[v], e, flags);
 	}
-	gem_close(fd, read_regs(fd, ctx[num_values], e, flags));
+	gem_close(fd, read_regs(fd, ahnd[num_values], ctx[num_values], e, flags));
 	igt_spin_free(fd, spin);
 
 	if (flags & RESET)
@@ -871,10 +914,14 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 		break;
 	}
 
-	spin = igt_spin_new(fd, .ctx = ctx[num_values], .engine = e->flags);
+	spin = igt_spin_new(fd,
+			    .ahnd = ahnd[num_values],
+			    .ctx = ctx[num_values],
+			    .engine = e->flags);
 	for (int v = 0; v < num_values; v++)
-		regs[v][1] = read_regs(fd, ctx[v], e, flags);
-	regs[num_values][1] = read_regs(fd, ctx[num_values], e, flags);
+		regs[v][1] = read_regs(fd, ahnd[v], ctx[v], e, flags);
+	regs[num_values][1] = read_regs(fd, ahnd[num_values], ctx[num_values],
+					e, flags);
 	igt_spin_free(fd, spin);
 
 	for (int v = 0; v < num_values; v++) {
@@ -886,9 +933,11 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 		gem_close(fd, regs[v][0]);
 		gem_close(fd, regs[v][1]);
 		intel_ctx_destroy(fd, ctx[v]);
+		put_ahnd(ahnd[v]);
 	}
 	compare_regs(fd, e, regs[num_values][0], regs[num_values][1], "clean");
 	intel_ctx_destroy(fd, ctx[num_values]);
+	put_ahnd(ahnd[num_values]);
 }
 
 static unsigned int __has_context_isolation(int fd)
-- 
2.26.0
