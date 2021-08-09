Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C1789B7D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:55 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:04:54 +0200
Message-Id: <20210809130533.27759-27-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 26/65] tests/gem_exec_whisper: Adopt to
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_whisper.c | 39 ++++++++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index d16409203..104f0a160 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -89,6 +89,8 @@ struct hang {
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	int fd;
+	uint64_t ahnd;
+	uint64_t bb_offset;
 };
 
 static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
@@ -104,8 +106,10 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 	if (gem_has_contexts(fd)) {
 		h->ctx = intel_ctx_create(h->fd, cfg);
 		h->execbuf.rsvd1 = h->ctx->id;
+		h->ahnd = get_reloc_ahnd(fd, h->ctx->id);
 	} else {
 		h->ctx = NULL;
+		h->ahnd = get_reloc_ahnd(fd, 0);
 	}
 
 	memset(&h->execbuf, 0, sizeof(h->execbuf));
@@ -114,9 +118,12 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 
 	memset(&h->obj, 0, sizeof(h->obj));
 	h->obj.handle = gem_create(h->fd, 4096);
+	h->bb_offset = get_offset(h->ahnd, h->obj.handle, 4096, 0);
+	if (h->ahnd)
+		h->obj.flags |= EXEC_OBJECT_PINNED;
 
 	h->obj.relocs_ptr = to_user_pointer(&h->reloc);
-	h->obj.relocation_count = 1;
+	h->obj.relocation_count = !h->ahnd ? 1 : 0;
 	memset(&h->reloc, 0, sizeof(h->reloc));
 
 	batch = gem_mmap__cpu(h->fd, h->obj.handle, 0, 4096, PROT_WRITE);
@@ -138,8 +145,8 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = h->bb_offset;
+		batch[++i] = h->bb_offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
 		batch[++i] = 0;
@@ -167,6 +174,8 @@ static void submit_hang(struct hang *h, unsigned *engines, int nengine, unsigned
 
 static void fini_hang(struct hang *h)
 {
+	put_offset(h->ahnd, h->bb_offset);
+	put_ahnd(h->ahnd);
 	intel_ctx_destroy(h->fd, h->ctx);
 	close(h->fd);
 }
@@ -206,6 +215,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 	int i, n, loc;
 	int debugfs;
 	int nchild;
+	bool has_relocs = gem_has_relocations(fd);
 
 	if (flags & PRIORITY) {
 		igt_require(gem_scheduler_enabled(fd));
@@ -264,7 +274,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 		memset(&store, 0, sizeof(store));
 		store.handle = gem_create(fd, 4096);
 		store.relocs_ptr = to_user_pointer(&reloc);
-		store.relocation_count = 1;
+		store.relocation_count = has_relocs ? 1 : 0;
 
 		memset(&reloc, 0, sizeof(reloc));
 		reloc.offset = sizeof(uint32_t);
@@ -288,12 +298,18 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 			execbuf.flags |= I915_EXEC_NO_RELOC;
 			if (gen < 6)
 				execbuf.flags |= I915_EXEC_SECURE;
+
 			execbuf.rsvd1 = ctx->id;
 			igt_require(__gem_execbuf(fd, &execbuf) == 0);
 			scratch = tmp[0];
 			store = tmp[1];
 		}
 
+		if (!has_relocs) {
+			scratch.flags |= EXEC_OBJECT_PINNED;
+			store.flags |= EXEC_OBJECT_PINNED;
+		}
+
 		i = 0;
 		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 		if (gen >= 8) {
@@ -355,7 +371,9 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 			inter[n].presumed_offset = old_offset;
 			inter[n].delta = loc;
 			batches[n].relocs_ptr = to_user_pointer(&inter[n]);
-			batches[n].relocation_count = 1;
+			batches[n].relocation_count = has_relocs ? 1 : 0;
+			if (!has_relocs)
+				batches[n].flags |= EXEC_OBJECT_PINNED;
 			gem_write(fd, batches[n].handle, 0, batch, sizeof(batch));
 
 			old_offset = batches[n].offset;
@@ -396,7 +414,9 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 				tmp[1] = store;
 				verify_reloc(fd, store.handle, &reloc);
 				execbuf.buffers_ptr = to_user_pointer(tmp);
+
 				gem_execbuf(fd, &execbuf);
+
 				igt_assert_eq_u64(reloc.presumed_offset, tmp[0].offset);
 				if (flags & SYNC)
 					gem_sync(fd, tmp[0].handle);
@@ -450,7 +470,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 						gem_sync(this_fd, batches[n-1].handle);
 					relocations += inter[n].presumed_offset != old_offset;
 
-					batches[n-1].relocation_count = 1;
+					batches[n-1].relocation_count = has_relocs ? 1 : 0;
 					batches[n-1].flags &= ~EXEC_OBJECT_WRITE;
 
 					if (this_fd != fd) {
@@ -468,6 +488,8 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 				tmp[0] = tmp[1];
 				tmp[0].relocation_count = 0;
 				tmp[0].flags = EXEC_OBJECT_WRITE;
+				if (!has_relocs)
+					tmp[0].flags |= EXEC_OBJECT_PINNED;
 				reloc_migrations += tmp[0].offset != inter[0].presumed_offset;
 				tmp[0].offset = inter[0].presumed_offset;
 				old_offset = tmp[0].offset;
@@ -478,6 +500,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 					reloc_interruptions++;
 					inter[0].presumed_offset = tmp[0].offset;
 				}
+
 				igt_assert_eq_u64(inter[0].presumed_offset, tmp[0].offset);
 				relocations += inter[0].presumed_offset != old_offset;
 				batches[0] = tmp[1];
@@ -487,7 +510,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
 				igt_assert(tmp[0].flags & EXEC_OBJECT_WRITE);
 				igt_assert_eq_u64(reloc.presumed_offset, tmp[0].offset);
 				igt_assert(tmp[1].relocs_ptr == to_user_pointer(&reloc));
-				tmp[1].relocation_count = 1;
+				tmp[1].relocation_count = has_relocs ? 1 : 0;
 				tmp[1].flags &= ~EXEC_OBJECT_WRITE;
 				verify_reloc(fd, store.handle, &reloc);
 				gem_execbuf(fd, &execbuf);
@@ -591,6 +614,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		intel_allocator_multiprocess_start();
 	}
 
 	for (const struct mode *m = modes; m->name; m++) {
@@ -631,6 +655,7 @@ igt_main
 	}
 
 	igt_fixture {
+		intel_allocator_multiprocess_stop();
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
-- 
2.26.0
