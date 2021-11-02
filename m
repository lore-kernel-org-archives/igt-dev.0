Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFFF56FEA2
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 08:40:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue,  2 Nov 2021 09:39:41 +0100
Message-Id: <20211102083941.9644-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211102083941.9644-1-zbigniew.kempczynski@intel.com>
References: <20211102083941.9644-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/gem_sync: Use softpin path for
 no-reloc gens
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
List-ID: <igt-dev@lists.freedesktop.org>

Migrate to softpin with pre-warming batch or an allocator. Some tests
which don't fork can use pre-warming batch which establishes offsets in
the kernel before real work is performed. For such adding pinned flag
+ zeroing relocation is enough. For multiprocess scenarios we need to
arbitrate and an allocator need to be used instead.

v2: fix also tests which are not running on CI (Ashutosh)

v3: use appropriate allocator handle (ahnd) within active_wakeup_ring
    spinners (Ashutosh)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_sync.c | 59 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 0093ca25f..8c435845e 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -237,6 +237,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 	    int timeout, int wlen)
 {
 	struct intel_engine_data ied;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
@@ -250,8 +251,13 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		unsigned long cycles;
 		igt_spin_t *spin;
 
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
+		object.offset = get_offset(ahnd, object.handle, 4096, 0);
+		if (ahnd)
+			object.flags = EXEC_OBJECT_PINNED;
 		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -261,6 +267,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		execbuf.rsvd1 = ctx->id;
 
 		spin = __igt_spin_new(fd,
+				      .ahnd = ahnd,
 				      .ctx = ctx,
 				      .engine = execbuf.flags,
 				      .flags = (IGT_SPIN_POLL_RUN |
@@ -323,8 +330,11 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 
 		igt_spin_free(fd, spin);
 		gem_close(fd, object.handle);
+		put_offset(ahnd, object.handle);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
+	put_ahnd(ahnd);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
@@ -332,6 +342,7 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 			int num_children, int timeout)
 {
 	struct intel_engine_data ied;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
@@ -342,12 +353,16 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 		unsigned long cycles;
 		igt_spin_t *spin[2];
 
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+
 		spin[0] = __igt_spin_new(fd,
+					 .ahnd = ahnd,
 					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
 
 		spin[1] = __igt_spin_new(fd,
+					 .ahnd = ahnd,
 					 .ctx = ctx,
 					 .engine = ied_flags(&ied, child),
 					 .flags = IGT_SPIN_FAST);
@@ -370,12 +385,14 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
 		} while ((elapsed = gettime()) < end);
 		igt_spin_free(fd, spin[1]);
 		igt_spin_free(fd, spin[0]);
+		put_ahnd(ahnd);
 
 		igt_info("%s %ld cycles: %.3f us\n",
 			 ied_name(&ied, child),
 			 cycles, (elapsed - start) * 1e6 / cycles);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
+	put_ahnd(ahnd);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
@@ -384,6 +401,8 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		   int timeout, int wlen)
 {
 	struct intel_engine_data ied;
+	uint64_t ahnd0 = get_reloc_ahnd(fd, 0);
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
@@ -397,8 +416,14 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		unsigned long cycles;
 		igt_spin_t *spin[2];
 
+		ahnd0 = get_reloc_ahnd(fd, 0);
+		ahnd = get_reloc_ahnd(fd, ctx->id);
+
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
+		object.offset = get_offset(ahnd, object.handle, 4096, 0);
+		if (ahnd)
+			object.offset = EXEC_OBJECT_PINNED;
 		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -408,12 +433,14 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		execbuf.rsvd1 = ctx->id;
 
 		spin[0] = __igt_spin_new(fd,
+					 .ahnd = ahnd0,
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
 		igt_assert(igt_spin_has_poll(spin[0]));
 
 		spin[1] = __igt_spin_new(fd,
+					 .ahnd = ahnd0,
 					 .engine = execbuf.flags,
 					 .flags = (IGT_SPIN_POLL_RUN |
 						   IGT_SPIN_FAST));
@@ -490,8 +517,13 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		igt_spin_free(fd, spin[1]);
 		igt_spin_free(fd, spin[0]);
 		gem_close(fd, object.handle);
+		put_offset(ahnd, object.handle);
+		put_ahnd(ahnd);
+		put_ahnd(ahnd0);
 	}
 	igt_waitchildren_timeout(2*timeout, NULL);
+	put_ahnd(ahnd);
+	put_ahnd(ahnd0);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
@@ -501,6 +533,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
+	bool has_relocs = gem_has_relocations(fd);
 
 	ied = list_store_engines(fd, ctx, ring);
 	igt_require(ied.nengines);
@@ -532,10 +565,11 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 		gem_execbuf(fd, &execbuf);
 
 		object[0].flags |= EXEC_OBJECT_WRITE;
+		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
 		object[1].handle = gem_create(fd, 20*1024);
 
 		object[1].relocs_ptr = to_user_pointer(reloc);
-		object[1].relocation_count = 1024;
+		object[1].relocation_count = has_relocs ? 1024 : 0;
 
 		batch = gem_mmap__cpu(fd, object[1].handle, 0, 20*1024,
 				      PROT_WRITE | PROT_READ);
@@ -599,6 +633,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
+	bool has_relocs = gem_has_relocations(fd);
 
 	gem_require_contexts(fd);
 
@@ -644,7 +679,7 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
 			c->object[1].handle = gem_create(fd, sz);
 
 			c->object[1].relocs_ptr = to_user_pointer(c->reloc);
-			c->object[1].relocation_count = 1024 * i;
+			c->object[1].relocation_count = has_relocs ? 1024 * i : 0;
 
 			batch = gem_mmap__cpu(fd, c->object[1].handle, 0, sz,
 					      PROT_WRITE | PROT_READ);
@@ -789,6 +824,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 	int order[64];
 	uint32_t *batch, *b;
 	int done;
+	bool has_relocs = gem_has_relocations(fd);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(object);
@@ -805,9 +841,10 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
 	execbuf.buffer_count = 1;
 	gem_execbuf(fd, &execbuf);
 	object[0].flags |= EXEC_OBJECT_WRITE;
+	object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
 
 	object[1].relocs_ptr = to_user_pointer(reloc);
-	object[1].relocation_count = 1024;
+	object[1].relocation_count = has_relocs ? 1024 : 0;
 	execbuf.buffer_count = 2;
 
 	memset(reloc, 0, sizeof(reloc));
@@ -990,6 +1027,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct intel_engine_data ied;
+	bool has_relocs = gem_has_relocations(fd);
 
 	ied = list_store_engines(fd, ctx, ALL_ENGINES);
 	igt_require(ied.nengines);
@@ -1019,10 +1057,11 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
 		gem_execbuf(fd, &execbuf);
 
 		object[0].flags |= EXEC_OBJECT_WRITE;
+		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
 		object[1].handle = gem_create(fd, 1024*16 + 4096);
 
 		object[1].relocs_ptr = to_user_pointer(reloc);
-		object[1].relocation_count = 1024;
+		object[1].relocation_count = has_relocs ? 1024 : 0;
 
 		batch = gem_mmap__cpu(fd, object[1].handle, 0, 16*1024 + 4096,
 				      PROT_WRITE | PROT_READ);
@@ -1091,6 +1130,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 {
 	struct intel_engine_data ied;
 	const intel_ctx_t *tmp_ctx[2];
+	uint64_t ahnd = get_reloc_ahnd(fd, 0); /* just offset provider */
 
 	ied = list_engines(fd, ctx, ALL_ENGINES);
 	igt_require(ied.nengines);
@@ -1110,8 +1150,13 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 		double start, elapsed;
 		unsigned long cycles;
 
+		ahnd = get_reloc_ahnd(fd, 0);
+
 		memset(&object, 0, sizeof(object));
 		object.handle = gem_create(fd, 4096);
+		object.offset = get_offset(ahnd, object.handle, 4096, 0);
+		if (ahnd)
+			object.flags = EXEC_OBJECT_PINNED;
 		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
 
 		memset(&execbuf, 0, sizeof(execbuf));
@@ -1127,6 +1172,7 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 		do {
 			igt_spin_t *spin =
 				__igt_spin_new(fd,
+					       .ahnd = ahnd,
 					       .ctx = tmp_ctx[0],
 					       .engine = execbuf.flags);
 
@@ -1142,8 +1188,11 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
 			 ied_name(&ied, child), cycles, elapsed * 1e6/cycles);
 
 		gem_close(fd, object.handle);
+		put_offset(ahnd, object.handle);
+		put_ahnd(ahnd);
 	}
 	igt_waitchildren_timeout(timeout+10, NULL);
+	put_ahnd(ahnd);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
 	intel_ctx_destroy(fd, tmp_ctx[1]);
@@ -1201,6 +1250,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		intel_allocator_multiprocess_start();
 	}
 
 	/* Legacy for selecting rings. */
@@ -1264,6 +1314,7 @@ igt_main
 	}
 
 	igt_fixture {
+		intel_allocator_multiprocess_stop();
 		igt_stop_hang_detector();
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
-- 
2.26.0
