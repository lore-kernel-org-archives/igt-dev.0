Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DAB6EB8D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:10 +0200
Message-Id: <20210806094649.21162-18-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 17/56] tests/gem_exec_async: Adopt to use
 allocator
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

v2: Add comment which explains using simple + calculating batch
    offsets (Ashutosh)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_async.c | 67 +++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index a3be6b3ee..ddebae131 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -27,8 +27,11 @@
 
 IGT_TEST_DESCRIPTION("Check that we can issue concurrent writes across the engines.");
 
-static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
-			uint32_t target, uint32_t offset, uint32_t value)
+#define SZ_1M (1024 * 1024)
+
+static void store_dword(int fd, int id, const intel_ctx_t *ctx,
+			 unsigned ring, uint32_t target, uint64_t target_offset,
+			 uint32_t offset, uint32_t value)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -50,6 +53,15 @@ static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 	obj[0].flags = EXEC_OBJECT_ASYNC;
 	obj[1].handle = gem_create(fd, 4096);
 
+	if (id) {
+		obj[0].offset = target_offset;
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[1].offset = (id + 1) * SZ_1M;
+		obj[1].flags |= EXEC_OBJECT_PINNED |
+				EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	}
+
 	memset(&reloc, 0, sizeof(reloc));
 	reloc.target_handle = obj[0].handle;
 	reloc.presumed_offset = 0;
@@ -58,13 +70,13 @@ static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
 	obj[1].relocs_ptr = to_user_pointer(&reloc);
-	obj[1].relocation_count = 1;
+	obj[1].relocation_count = !id ? 1 : 0;
 
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = offset;
-		batch[++i] = 0;
+		batch[++i] = target_offset + offset;
+		batch[++i] = (target_offset + offset) >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
 		batch[++i] = offset;
@@ -89,6 +101,8 @@ static void one(int fd, const intel_ctx_t *ctx,
 	uint32_t scratch = gem_create(fd, 4096);
 	igt_spin_t *spin;
 	uint32_t *result;
+	uint64_t ahnd = get_simple_l2h_ahnd(fd, ctx->id);
+	uint64_t scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 	int i;
 
 	/*
@@ -96,11 +110,26 @@ static void one(int fd, const intel_ctx_t *ctx,
 	 * the scratch for write. Then on the other rings try and
 	 * write into that target. If it blocks we hang the GPU...
 	 */
-	spin = igt_spin_new(fd, .ctx = ctx, .engine = engine,
+	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
+			    .ctx = ctx,
+			    .engine = engine,
 			    .dependency = scratch);
 
 	i = 0;
 	for_each_ctx_engine(fd, ctx, e) {
+		/*
+		 * We need to have same scratch_offset within spinner and
+		 * store_dword(). That's why simple allocator was chosen.
+		 * We can pass ahnd (simple) to store_dword() but it cannot
+		 * be used to acquire batch offset, because likely get same
+		 * offset for different batches.
+		 *
+		 * That's why we pass id which allows us calculate distinct
+		 * batch offset for each child.
+		 */
+		int id = ahnd ? (i + 1) : 0;
+
 		if (e->flags == engine)
 			continue;
 
@@ -108,10 +137,15 @@ static void one(int fd, const intel_ctx_t *ctx,
 			continue;
 
 		if (flags & FORKED) {
-			igt_fork(child, 1)
-				store_dword(fd, ctx, e->flags, scratch, 4*i, ~i);
+			igt_fork(child, 1) {
+				store_dword(fd, id, ctx, e->flags,
+					    scratch, scratch_offset,
+					    4*i, ~i);
+			}
 		} else {
-			store_dword(fd, ctx, e->flags, scratch, 4*i, ~i);
+			store_dword(fd, id, ctx, e->flags,
+				    scratch, scratch_offset,
+				    4*i, ~i);
 		}
 		i++;
 	}
@@ -124,6 +158,7 @@ static void one(int fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(fd, spin);
 	gem_close(fd, scratch);
+	put_ahnd(ahnd);
 }
 
 static bool has_async_execbuf(int fd)
@@ -162,8 +197,18 @@ igt_main
 	test_each_engine("concurrent-writes", fd, ctx, e)
 		one(fd, ctx, e->flags, 0);
 
-	test_each_engine("forked-writes", fd, ctx, e)
-		one(fd, ctx, e->flags, FORKED);
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
+
+		test_each_engine("forked-writes", fd, ctx, e)
+			one(fd, ctx, e->flags, FORKED);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
-- 
2.26.0
