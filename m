Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83426EC11
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Apr 2021 02:13:27 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id v186so584592pgv.7
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Mar 2021 19:13:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 31 Mar 2021 21:12:36 -0500
Message-Id: <20210401021243.4147604-24-jason@jlekstrand.net>
In-Reply-To: <20210401021243.4147604-1-jason@jlekstrand.net>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 23/30] tests/prime_vgem: Convert to intel_ctx_t
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
 tests/prime_vgem.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 07ff69a2..9d8db8ba 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -558,7 +558,7 @@ static bool prime_busy(int fd, bool excl)
 	return poll(&pfd, 1, 0) == 0;
 }
 
-static void work(int i915, int dmabuf, unsigned ring)
+static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
@@ -577,6 +577,7 @@ static void work(int i915, int dmabuf, unsigned ring)
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = prime_fd_to_handle(i915, dmabuf);
@@ -653,7 +654,7 @@ static void work(int i915, int dmabuf, unsigned ring)
 	igt_assert(read_busy && write_busy);
 }
 
-static void test_busy(int i915, int vgem, unsigned ring)
+static void test_busy(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	struct timespec tv;
@@ -667,7 +668,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
 	vgem_create(vgem, &scratch);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, dmabuf, ring);
+	work(i915, dmabuf, ctx, ring);
 
 	/* Calling busy in a loop should be enough to flush the rendering */
 	memset(&tv, 0, sizeof(tv));
@@ -683,7 +684,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
 	close(dmabuf);
 }
 
-static void test_wait(int i915, int vgem, unsigned ring)
+static void test_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	struct pollfd pfd;
@@ -696,7 +697,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
 	vgem_create(vgem, &scratch);
 	pfd.fd = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, pfd.fd, ring);
+	work(i915, pfd.fd, ctx, ring);
 
 	pfd.events = POLLIN;
 	igt_assert_eq(poll(&pfd, 1, 10000), 1);
@@ -710,7 +711,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
 	close(pfd.fd);
 }
 
-static void test_sync(int i915, int vgem, unsigned ring)
+static void test_sync(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	uint32_t *ptr;
@@ -727,7 +728,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, ring);
+	work(i915, dmabuf, ctx, ring);
 
 	prime_sync_start(dmabuf, false);
 	for (i = 0; i < 1024; i++)
@@ -738,7 +739,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
 	munmap(ptr, scratch.size);
 }
 
-static void test_fence_wait(int i915, int vgem, unsigned ring)
+static void test_fence_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	uint32_t fence;
@@ -759,7 +760,7 @@ static void test_fence_wait(int i915, int vgem, unsigned ring)
 	igt_assert(ptr != MAP_FAILED);
 
 	igt_fork(child, 1)
-		work(i915, dmabuf, ring);
+		work(i915, dmabuf, ctx, ring);
 
 	sleep(1);
 
@@ -799,7 +800,7 @@ static void test_fence_hang(int i915, int vgem, unsigned flags)
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, 0);
+	work(i915, dmabuf, 0, 0);
 
 	/* The work should have been cancelled */
 
@@ -1041,12 +1042,20 @@ static void test_flip(int i915, int vgem, unsigned hang)
 }
 
 static void test_each_engine(const char *name, int vgem, int i915,
-			     void (*fn)(int i915, int vgem, unsigned int flags))
+			     void (*fn)(int i915, int vgem,
+					const intel_ctx_t *ctx,
+					unsigned int flags))
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
+
+	if (gem_has_contexts(i915))
+		ctx = intel_ctx_create_all_physical(i915);
+	else
+		ctx = intel_ctx_0(i915);
 
 	igt_subtest_with_dynamic(name) {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
 				continue;
 
@@ -1055,7 +1064,7 @@ static void test_each_engine(const char *name, int vgem, int i915,
 
 			igt_dynamic_f("%s", e->name) {
 				gem_quiescent_gpu(i915);
-				fn(i915, vgem, e->flags);
+				fn(i915, vgem, ctx, e->flags);
 			}
 		}
 	}
@@ -1109,7 +1118,8 @@ igt_main
 	{
 		static const struct {
 			const char *name;
-			void (*fn)(int i915, int vgem, unsigned int engine);
+			void (*fn)(int i915, int vgem, const intel_ctx_t *ctx,
+				   unsigned int engine);
 		} tests[] = {
 			{ "sync", test_sync },
 			{ "busy", test_busy },
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
