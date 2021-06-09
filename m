Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48006EC81
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:20 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id n12so18339957pgs.13
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:20 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:16 -0500
Message-Id: <20210609043035.102359-31-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 30/93] tests/i915/gem_exec_store: Convert to
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
 tests/i915/gem_exec_store.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 2df0b27f..37a90bd1 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -37,7 +37,8 @@
 
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
-static void store_dword(int fd, const struct intel_execution_engine2 *e)
+static void store_dword(int fd, const intel_ctx_t *ctx,
+			const struct intel_execution_engine2 *e)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -53,6 +54,7 @@ static void store_dword(int fd, const struct intel_execution_engine2 *e)
 	execbuf.flags = e->flags;
 	if (gen > 3 && gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
@@ -94,7 +96,8 @@ static void store_dword(int fd, const struct intel_execution_engine2 *e)
 }
 
 #define PAGES 1
-static void store_cachelines(int fd, const struct intel_execution_engine2 *e,
+static void store_cachelines(int fd, const intel_ctx_t *ctx,
+			     const struct intel_execution_engine2 *e,
 			     unsigned int flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -114,6 +117,7 @@ static void store_cachelines(int fd, const struct intel_execution_engine2 *e,
 	execbuf.flags = e->flags;
 	if (gen > 3 && gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	obj = calloc(execbuf.buffer_count, sizeof(*obj));
 	igt_assert(obj);
@@ -171,7 +175,7 @@ static void store_cachelines(int fd, const struct intel_execution_engine2 *e,
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
-static void store_all(int fd)
+static void store_all(int fd, const intel_ctx_t *ctx)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[2];
@@ -186,7 +190,7 @@ static void store_all(int fd)
 	int i, j;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, engine) {
+	for_each_ctx_engine(fd, ctx, engine) {
 		if (!gem_class_can_store_dword(fd, engine->class))
 			continue;
 		nengine++;
@@ -207,6 +211,7 @@ static void store_all(int fd)
 	execbuf.buffer_count = 2;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, nengine*sizeof(uint32_t));
@@ -232,7 +237,7 @@ static void store_all(int fd)
 
 	nengine = 0;
 	intel_detect_and_clear_missed_interrupts(fd);
-	__for_each_physical_engine(fd, engine) {
+	for_each_ctx_engine(fd, ctx, engine) {
 		if (!gem_class_can_store_dword(fd, engine->class))
 			continue;
 
@@ -323,14 +328,15 @@ static int print_welcome(int fd)
 	return info->graphics_ver;
 }
 
-#define test_each_engine(T, i915, e)  \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+#define test_each_engine(T, i915, ctx, e)  \
+	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = NULL;
 	int fd;
 
 	igt_fixture {
@@ -343,24 +349,26 @@ igt_main
 			igt_device_set_master(fd);
 
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
 	}
 
 	igt_subtest("basic")
-		store_all(fd);
+		store_all(fd, ctx);
 
-	test_each_engine("dword", fd, e)
-		store_dword(fd, e);
+	test_each_engine("dword", fd, ctx, e)
+		store_dword(fd, ctx, e);
 
-	test_each_engine("cachelines", fd, e)
-		store_cachelines(fd, e, 0);
+	test_each_engine("cachelines", fd, ctx, e)
+		store_cachelines(fd, ctx, e, 0);
 
-	test_each_engine("pages", fd, e)
-		store_cachelines(fd, e, PAGES);
+	test_each_engine("pages", fd, ctx, e)
+		store_cachelines(fd, ctx, e, PAGES);
 
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
