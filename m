Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BED989F71
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:49 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id m2so2378530pgk.7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:40 -0500
Message-Id: <20210614163704.365989-26-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 25/77] tests/i915/gem_wait: Convert to
 intel_ctx_t
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_wait.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 81ac25b59..8ebd610dd 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -75,13 +75,15 @@ static void invalid_buf(int fd)
 
 #define timespec_isset(x) ((x)->tv_sec | (x)->tv_nsec)
 
-static void basic(int fd, unsigned engine, unsigned flags)
+static void basic(int fd, const intel_ctx_t *ctx, unsigned engine,
+		  unsigned flags)
 {
 	IGT_CORK_HANDLE(cork);
 	uint32_t plug =
 		flags & (WRITE | AWAIT) ? igt_cork_plug(&cork, fd) : 0;
 	igt_spin_t *spin =
 		igt_spin_new(fd,
+			     .ctx = ctx,
 			     .engine = engine,
 			     .dependency = plug,
 			     .flags = (flags & HANG) ? IGT_SPIN_NO_PREEMPTION : 0);
@@ -147,21 +149,22 @@ static void basic(int fd, unsigned engine, unsigned flags)
 	igt_spin_free(fd, spin);
 }
 
-static void test_all_engines(const char *name, int i915, unsigned int test)
+static void test_all_engines(const char *name, int i915, const intel_ctx_t *ctx,
+			     unsigned int test)
 {
 	const struct intel_execution_engine2 *e;
 
 	igt_subtest_with_dynamic(name) {
 		igt_dynamic("all") {
 			gem_quiescent_gpu(i915);
-			basic(i915, ALL_ENGINES, test);
+			basic(i915, ctx, ALL_ENGINES, test);
 			gem_quiescent_gpu(i915);
 		}
 
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			igt_dynamic_f("%s", e->name) {
 				gem_quiescent_gpu(i915);
-				basic(i915, e->flags, test);
+				basic(i915, ctx, e->flags, test);
 				gem_quiescent_gpu(i915);
 			}
 		}
@@ -170,11 +173,13 @@ static void test_all_engines(const char *name, int i915, unsigned int test)
 
 igt_main
 {
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 	}
 
 	igt_subtest("invalid-flags")
@@ -202,7 +207,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -229,7 +234,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -238,6 +243,7 @@ igt_main
 	}
 
 	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
