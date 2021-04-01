Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5821D6EC15
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:37 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id s11so362565pfm.1
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:37 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:42 -0500
Message-Id: <20210401021243.4147604-30-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 29/30] tests/i915/gem_wait: Convert to intel_ctx_t
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
 tests/i915/gem_wait.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 7b2b1c2b..a3e7f0c1 100644
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
@@ -169,11 +172,17 @@ static void test_all_engines(const char *name, int i915, unsigned int test)
 
 igt_main
 {
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
+
+		if (gem_has_contexts(fd))
+			ctx = intel_ctx_create_all_physical(fd);
+		else
+			ctx = intel_ctx_0(fd);
 	}
 
 	igt_subtest("invalid-flags")
@@ -201,7 +210,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -228,7 +237,7 @@ igt_main
 		}
 
 		for (const typeof(*tests) *t = tests; t->name; t++)
-			test_all_engines(t->name, fd, t->flags);
+			test_all_engines(t->name, fd, ctx, t->flags);
 
 		igt_fixture {
 			igt_stop_signal_helper();
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
