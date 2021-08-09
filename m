Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F84898F1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:09:08 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:05:04 +0200
Message-Id: <20210809130533.27759-37-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 36/65] tests/gem_spin_batch: Adopt to use
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_spin_batch.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
index 4a9d6c2df..653812c7a 100644
--- a/tests/i915/gem_spin_batch.c
+++ b/tests/i915/gem_spin_batch.c
@@ -45,13 +45,14 @@ static void spin(int fd, const intel_ctx_t *ctx_id,
 	struct timespec tv = { };
 	struct timespec itv = { };
 	uint64_t elapsed;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx_id->id);
 
-	spin = __igt_spin_new(fd, .ctx = ctx_id, .engine = engine,
-			      .flags = flags);
+	spin = __igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx_id,
+			      .engine = engine, .flags = flags);
 	while ((elapsed = igt_nsec_elapsed(&tv)) >> 30 < timeout_sec) {
 		igt_spin_t *next =
-			__igt_spin_new(fd, .ctx = ctx_id, .engine = engine,
-				       .flags = flags);
+			__igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx_id,
+				       .engine = engine, .flags = flags);
 
 		igt_spin_set_timeout(spin,
 				     timeout_100ms - igt_nsec_elapsed(&itv));
@@ -67,6 +68,7 @@ static void spin(int fd, const intel_ctx_t *ctx_id,
 		loops++;
 	}
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 
 	igt_info("Completed %ld loops in %lld ns, target %ld\n",
 		 loops, (long long)elapsed, (long)(elapsed / timeout_100ms));
@@ -82,11 +84,12 @@ static void spin_resubmit(int fd, const intel_ctx_t *ctx,
 {
 	const intel_ctx_t *new_ctx = NULL;
 	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 
 	if (flags & RESUBMIT_NEW_CTX)
 		igt_require(gem_has_contexts(fd));
 
-	spin = __igt_spin_new(fd, .ctx = ctx, .engine = engine);
+	spin = __igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = engine);
 	if (flags & RESUBMIT_NEW_CTX) {
 		new_ctx = intel_ctx_create(fd, &ctx->cfg);
 		spin->execbuf.rsvd1 = new_ctx->id;
@@ -110,6 +113,7 @@ static void spin_resubmit(int fd, const intel_ctx_t *ctx,
 		intel_ctx_destroy(fd, new_ctx);
 
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static void spin_exit_handler(int sig)
@@ -139,6 +143,7 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg = ctx->cfg;
 	struct igt_spin *spin, *n;
+	uint64_t ahnd;
 	IGT_LIST_HEAD(list);
 
 	for_each_ctx_cfg_engine(i915, &cfg, e) {
@@ -147,9 +152,11 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 
 		if (flags & PARALLEL_SPIN_NEW_CTX)
 			ctx = intel_ctx_create(i915, &cfg);
+		ahnd = get_reloc_ahnd(i915, ctx->id);
 
 		/* Prevent preemption so only one is allowed on each engine */
 		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
 				    .ctx = ctx,
 				    .engine = e->flags,
 				    .flags = (IGT_SPIN_POLL_RUN |
@@ -163,9 +170,11 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
 
 	igt_list_for_each_entry_safe(spin, n, &list, link) {
 		igt_assert(gem_bo_busy(i915, spin->handle));
+		ahnd = spin->ahnd;
 		igt_spin_end(spin);
 		gem_sync(i915, spin->handle);
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 	}
 }
 
@@ -249,12 +258,20 @@ igt_main
 
 #undef test_each_engine
 
-	igt_subtest("spin-each")
-		spin_on_all_engines(fd, ctx, 0, 3);
+	igt_subtest_group {
+		igt_fixture
+			intel_allocator_multiprocess_start();
 
-	igt_subtest("user-each") {
-		igt_require(has_userptr(fd));
-		spin_on_all_engines(fd, ctx, IGT_SPIN_USERPTR, 3);
+		igt_subtest("spin-each")
+			spin_on_all_engines(fd, ctx, 0, 3);
+
+		igt_subtest("user-each") {
+			igt_require(has_userptr(fd));
+			spin_on_all_engines(fd, ctx, IGT_SPIN_USERPTR, 3);
+		}
+
+		igt_fixture
+			intel_allocator_multiprocess_stop();
 	}
 
 	igt_fixture {
-- 
2.26.0
