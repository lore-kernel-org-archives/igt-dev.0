Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920AC6EB88
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:47:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:05 +0200
Message-Id: <20210806094649.21162-13-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 12/56] tests/gem_ctx_exec: Adopt to use
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
 tests/i915/gem_ctx_exec.c | 46 +++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 4d3d1c12f..a1270a889 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -178,6 +178,7 @@ static void norecovery(int i915)
 		};
 		int expect = pass == 0 ? -EIO : 0;
 		igt_spin_t *spin;
+		uint64_t ahnd = get_reloc_ahnd(i915, param.ctx_id);
 
 		gem_context_set_param(i915, &param);
 
@@ -185,7 +186,9 @@ static void norecovery(int i915)
 		gem_context_get_param(i915, &param);
 		igt_assert_eq(param.value, pass);
 
-		spin = __igt_spin_new(i915, .ctx = ctx,
+		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
+				      .ctx = ctx,
 				      .flags = IGT_SPIN_POLL_RUN);
 		igt_spin_busywait_until_started(spin);
 
@@ -196,6 +199,7 @@ static void norecovery(int i915)
 		igt_spin_free(i915, spin);
 
 		intel_ctx_destroy(i915, ctx);
+		put_ahnd(ahnd);
 	}
 
 	 igt_disallow_hang(i915, hang);
@@ -271,6 +275,7 @@ static void nohangcheck_hostile(int i915)
 	const intel_ctx_t *ctx;
 	int err = 0;
 	int dir;
+	uint64_t ahnd;
 
 	/*
 	 * Even if the user disables hangcheck during their context,
@@ -284,6 +289,7 @@ static void nohangcheck_hostile(int i915)
 
 	ctx = intel_ctx_create_all_physical(i915);
 	hang = igt_allow_hang(i915, ctx->id, 0);
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	igt_require(__enable_hangcheck(dir, false));
 
@@ -295,7 +301,9 @@ static void nohangcheck_hostile(int i915)
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
 
-		spin = __igt_spin_new(i915, .ctx = ctx,
+		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
+				      .ctx = ctx,
 				      .engine = e->flags,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_FENCE_OUT));
@@ -333,6 +341,7 @@ static void nohangcheck_hostile(int i915)
 
 	igt_assert_eq(sync_fence_status(fence), -EIO);
 	close(fence);
+	put_ahnd(ahnd);
 
 	close(dir);
 	close(i915);
@@ -345,10 +354,14 @@ static void close_race(int i915)
 	const intel_ctx_t **ctx;
 	uint32_t *ctx_id;
 	igt_spin_t *spin;
+	uint64_t ahnd;
 
 	/* Check we can execute a polling spinner */
 	base_ctx = intel_ctx_create(i915, NULL);
-	igt_spin_free(i915, igt_spin_new(i915, .ctx = base_ctx,
+	ahnd = get_reloc_ahnd(i915, base_ctx->id);
+	igt_spin_free(i915, igt_spin_new(i915,
+					 .ahnd = ahnd,
+					 .ctx = base_ctx,
 					 .flags = IGT_SPIN_POLL_RUN));
 
 	ctx = calloc(ncpus, sizeof(*ctx));
@@ -361,7 +374,10 @@ static void close_race(int i915)
 	}
 
 	igt_fork(child, ncpus) {
-		spin = __igt_spin_new(i915, .ctx = base_ctx,
+		ahnd = get_reloc_ahnd(i915, base_ctx->id);
+		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
+				      .ctx = base_ctx,
 				      .flags = IGT_SPIN_POLL_RUN);
 		igt_spin_end(spin);
 		gem_sync(i915, spin->handle);
@@ -403,6 +419,7 @@ static void close_race(int i915)
 		}
 
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 	}
 
 	igt_until_timeout(5) {
@@ -425,6 +442,7 @@ static void close_race(int i915)
 	intel_ctx_destroy(i915, base_ctx);
 	for (int child = 0; child < ncpus; child++)
 		intel_ctx_destroy(i915, ctx[child]);
+	put_ahnd(ahnd);
 
 	free(ctx);
 	munmap(ctx_id, 4096);
@@ -474,11 +492,22 @@ igt_main
 	igt_subtest("basic-nohangcheck")
 		nohangcheck_hostile(fd);
 
-	igt_subtest("basic-close-race")
-		close_race(fd);
+	igt_subtest_group {
+		igt_fixture {
+			intel_allocator_multiprocess_start();
+		}
+
+		igt_subtest("basic-close-race")
+			close_race(fd);
+
+		igt_fixture {
+			intel_allocator_multiprocess_stop();
+		}
+	}
 
 	igt_subtest("reset-pin-leak") {
 		int i;
+		uint64_t ahnd;
 
 		/*
 		 * Use an explicit context to isolate the test from
@@ -486,6 +515,7 @@ igt_main
 		 * default context (eg. if they would be eliminated).
 		 */
 		ctx_id = gem_context_create(fd);
+		ahnd = get_reloc_ahnd(fd, ctx_id);
 
 		/*
 		 * Iterate enough times that the kernel will
@@ -493,7 +523,8 @@ igt_main
 		 * the last context is leaked at every reset.
 		 */
 		for (i = 0; i < 20; i++) {
-			igt_hang_t hang = igt_hang_ring(fd, 0);
+
+			igt_hang_t hang = igt_hang_ring_with_ahnd(fd, 0, ahnd);
 
 			igt_assert_eq(exec(fd, handle, 0, 0), 0);
 			igt_assert_eq(exec(fd, handle, 0, ctx_id), 0);
@@ -501,5 +532,6 @@ igt_main
 		}
 
 		gem_context_destroy(fd, ctx_id);
+		put_ahnd(ahnd);
 	}
 }
-- 
2.26.0
