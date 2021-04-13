Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D866E1AA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:52 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id i190so10550461pfc.12
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:15 -0500
Message-Id: <20210413035350.261794-40-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 39/74] tests/i915/gem_userptr_blits: Convert
 to intel_ctx_t
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
List-ID: <igt-dev@lists.freedesktop.org>

---
 tests/i915/gem_userptr_blits.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 7a80c016..b5450751 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -623,7 +623,7 @@ static void test_nohangcheck_hostile(int i915)
 {
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
-	uint32_t ctx;
+	const intel_ctx_t *ctx;
 	int fence = -1;
 	int err = 0;
 	int dir;
@@ -638,11 +638,11 @@ static void test_nohangcheck_hostile(int i915)
 	dir = igt_params_open(i915);
 	igt_require(dir != -1);
 
-	ctx = gem_context_create(i915);
-	hang = igt_allow_hang(i915, ctx, 0);
+	ctx = intel_ctx_create_all_physical(i915);
+	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(__enable_hangcheck(dir, false));
 
-	____for_each_physical_engine(i915, ctx, e) {
+	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
 		int new;
 
@@ -650,7 +650,7 @@ static void test_nohangcheck_hostile(int i915)
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
 
-		spin = __igt_spin_new(i915, ctx,
+		spin = __igt_spin_new(i915, .ctx = ctx,
 				      .engine = e->flags,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_USERPTR |
@@ -672,7 +672,7 @@ static void test_nohangcheck_hostile(int i915)
 			fence = tmp;
 		}
 	}
-	gem_context_destroy(i915, ctx);
+	intel_ctx_destroy(i915, ctx);
 	igt_assert(fence != -1);
 
 	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
@@ -1352,7 +1352,8 @@ static int test_dmabuf(void)
 	return 0;
 }
 
-static void store_dword_rand(int i915, unsigned int engine,
+static void store_dword_rand(int i915, const intel_ctx_t *ctx,
+			     unsigned int engine,
 			     uint32_t target, uint64_t sz,
 			     int count)
 {
@@ -1384,6 +1385,7 @@ static void store_dword_rand(int i915, unsigned int engine,
 	exec.flags = engine;
 	if (gen < 6)
 		exec.flags |= I915_EXEC_SECURE;
+	exec.rsvd1 = ctx->id;
 
 	i = 0;
 	for (int n = 0; n < count; n++) {
@@ -1501,17 +1503,19 @@ static void test_readonly(int i915)
 
 	igt_fork(child, 1) {
 		const struct intel_execution_engine2 *e;
+		const intel_ctx_t *ctx;
 		char *orig;
 
 		orig = g_compute_checksum_for_data(G_CHECKSUM_SHA1, pages, sz);
 
 		gem_userptr(i915, space, total, true, userptr_flags, &rhandle);
 
-		__for_each_physical_engine(i915, e) {
+		ctx = intel_ctx_create_all_physical(i915);
+		for_each_ctx_engine(i915, ctx, e) {
 			char *ref, *result;
 
 			/* First tweak the backing store through the write */
-			store_dword_rand(i915, e->flags, whandle, sz, 64);
+			store_dword_rand(i915, ctx, e->flags, whandle, sz, 64);
 			gem_sync(i915, whandle);
 			ref = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
 							  pages, sz);
@@ -1520,7 +1524,7 @@ static void test_readonly(int i915)
 			igt_assert(strcmp(ref, orig));
 
 			/* Now try the same through the read-only handle */
-			store_dword_rand(i915, e->flags, rhandle, total, 64);
+			store_dword_rand(i915, ctx, e->flags, rhandle, total, 64);
 			gem_sync(i915, rhandle);
 			result = g_compute_checksum_for_data(G_CHECKSUM_SHA1,
 							     pages, sz);
@@ -1536,6 +1540,7 @@ static void test_readonly(int i915)
 			g_free(orig);
 			orig = ref;
 		}
+		intel_ctx_destroy(i915, ctx);
 
 		gem_close(i915, rhandle);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
