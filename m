Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC7C6E44B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:31:53 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id p36so2649391pfw.11
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:31:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:35 -0500
Message-Id: <20210714173141.1381686-4-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/9] tests/i915/gem_ctx_persistence: Use
 intel_ctx_t for hang subtests
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

We need this for proper cmdparser detection

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 tests/i915/gem_ctx_persistence.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 142bac28e..f514e2b78 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -334,8 +334,9 @@ static void test_nonpersistent_hang(int i915, const intel_ctx_cfg_t *cfg,
 	igt_spin_free(i915, spin);
 }
 
-static void test_nohangcheck_hostile(int i915)
+static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 {
+	const struct intel_execution_engine2 *e;
 	int dir;
 
 	cleanup(i915);
@@ -350,15 +351,15 @@ static void test_nohangcheck_hostile(int i915)
 
 	igt_require(__enable_hangcheck(dir, false));
 
-	for_each_physical_ring(e, i915) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
-		uint32_t ctx = gem_context_create(i915);
+		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 		igt_spin_t *spin;
 
-		spin = igt_spin_new(i915, ctx,
-				    .engine = eb_ring(e),
+		spin = igt_spin_new(i915, .ctx = ctx,
+				    .engine = e->flags,
 				    .flags = IGT_SPIN_NO_PREEMPTION);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 
 		igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
@@ -369,8 +370,9 @@ static void test_nohangcheck_hostile(int i915)
 	close(dir);
 }
 
-static void test_nohangcheck_hang(int i915)
+static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 {
+	const struct intel_execution_engine2 *e;
 	int dir;
 
 	cleanup(i915);
@@ -387,15 +389,15 @@ static void test_nohangcheck_hang(int i915)
 
 	igt_require(__enable_hangcheck(dir, false));
 
-	for_each_physical_ring(e, i915) {
+	for_each_ctx_cfg_engine(i915, cfg, e) {
 		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
-		uint32_t ctx = gem_context_create(i915);
+		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
 		igt_spin_t *spin;
 
-		spin = igt_spin_new(i915, ctx,
-				    .engine = eb_ring(e),
+		spin = igt_spin_new(i915, .ctx = ctx,
+				    .engine = e->flags,
 				    .flags = IGT_SPIN_INVALID_CS);
-		gem_context_destroy(i915, ctx);
+		intel_ctx_destroy(i915, ctx);
 
 		igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
 
@@ -1131,6 +1133,7 @@ static void exit_handler(int sig)
 
 igt_main
 {
+	const intel_ctx_cfg_t empty_cfg = {};
 	struct {
 		const char *name;
 		void (*func)(int fd, const intel_ctx_cfg_t *cfg,
@@ -1182,9 +1185,9 @@ igt_main
 		test_userptr(i915);
 
 	igt_subtest("hostile")
-		test_nohangcheck_hostile(i915);
+		test_nohangcheck_hostile(i915, &empty_cfg);
 	igt_subtest("hang")
-		test_nohangcheck_hang(i915);
+		test_nohangcheck_hang(i915, &empty_cfg);
 
 	igt_subtest("heartbeat-stop")
 		test_noheartbeat_many(i915, 1, 0);
@@ -1204,7 +1207,6 @@ igt_main
 		for (test = tests; test->name; test++) {
 			igt_subtest_with_dynamic_f("legacy-engines-%s",
 						   test->name) {
-				const intel_ctx_cfg_t empty_cfg = {};
 				for_each_physical_ring(e, i915) {
 					igt_dynamic_f("%s", e->name) {
 						do_test(test->func, i915,
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
