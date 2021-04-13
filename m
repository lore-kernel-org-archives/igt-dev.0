Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7015B6E1B7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:30 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id r13so3985568pjf.2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:30 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:00 -0500
Message-Id: <20210413035350.261794-25-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 24/74] tests/i915/gem_exec_async: Convert to
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
 tests/i915/gem_exec_async.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
index 412ad737..121ef238 100644
--- a/tests/i915/gem_exec_async.c
+++ b/tests/i915/gem_exec_async.c
@@ -26,7 +26,7 @@
 
 IGT_TEST_DESCRIPTION("Check that we can issue concurrent writes across the engines.");
 
-static void store_dword(int fd, unsigned ring,
+static void store_dword(int fd, const intel_ctx_t *ctx, unsigned ring,
 			uint32_t target, uint32_t offset, uint32_t value)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -42,6 +42,7 @@ static void store_dword(int fd, unsigned ring,
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = target;
@@ -79,7 +80,8 @@ static void store_dword(int fd, unsigned ring,
 	gem_close(fd, obj[1].handle);
 }
 
-static void one(int fd, unsigned engine, unsigned int flags)
+static void one(int fd, const intel_ctx_t *ctx,
+		unsigned engine, unsigned int flags)
 #define FORKED (1 << 0)
 {
 	const struct intel_execution_engine2 *e;
@@ -93,10 +95,11 @@ static void one(int fd, unsigned engine, unsigned int flags)
 	 * the scratch for write. Then on the other rings try and
 	 * write into that target. If it blocks we hang the GPU...
 	 */
-	spin = igt_spin_new(fd, .engine = engine, .dependency = scratch);
+	spin = igt_spin_new(fd, .ctx = ctx, .engine = engine,
+			    .dependency = scratch);
 
 	i = 0;
-	__for_each_physical_engine(fd, e) {
+	for_each_ctx_engine(fd, ctx, e) {
 		if (e->flags == engine)
 			continue;
 
@@ -105,9 +108,9 @@ static void one(int fd, unsigned engine, unsigned int flags)
 
 		if (flags & FORKED) {
 			igt_fork(child, 1)
-				store_dword(fd, e->flags, scratch, 4*i, ~i);
+				store_dword(fd, ctx, e->flags, scratch, 4*i, ~i);
 		} else {
-			store_dword(fd, e->flags, scratch, 4*i, ~i);
+			store_dword(fd, ctx, e->flags, scratch, 4*i, ~i);
 		}
 		i++;
 	}
@@ -134,13 +137,14 @@ static bool has_async_execbuf(int fd)
 	return async > 0;
 }
 
-#define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e) \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd = -1;
 
 	igt_fixture {
@@ -148,17 +152,21 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mmap_wc(fd);
 		igt_require(has_async_execbuf(fd));
+
+		ctx = intel_ctx_create_all_physical(fd);
+
 		igt_fork_hang_detector(fd);
 	}
 
-	test_each_engine("concurrent-writes", fd, e)
-		one(fd, e->flags, 0);
+	test_each_engine("concurrent-writes", fd, ctx, e)
+		one(fd, ctx, e->flags, 0);
 
-	test_each_engine("forked-writes", fd, e)
-		one(fd, e->flags, FORKED);
+	test_each_engine("forked-writes", fd, ctx, e)
+		one(fd, ctx, e->flags, FORKED);
 
 	igt_fixture {
 		igt_stop_hang_detector();
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
