Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE446EAC4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:53 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id z16so17554654pga.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:12:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:11 -0500
Message-Id: <20210415191145.2137858-41-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 40/74] tests/i915/gem_wait: Convert to
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

---
 tests/i915/gem_wait.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 7b2b1c2b..695d5076 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -74,13 +74,15 @@ static void invalid_buf(int fd)
 
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
@@ -146,21 +148,22 @@ static void basic(int fd, unsigned engine, unsigned flags)
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
@@ -169,11 +172,13 @@ static void test_all_engines(const char *name, int i915, unsigned int test)
 
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
@@ -201,7 +206,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -228,7 +233,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -237,6 +242,7 @@ igt_main
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
