Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC45A6EC7E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:26 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so646827pjs.2
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:26 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:21 -0500
Message-Id: <20210609043035.102359-36-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 35/93] tests/prime_vgem: Convert to
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
 tests/prime_vgem.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index aeff282b..3023fd68 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -559,7 +559,7 @@ static bool prime_busy(int fd, bool excl)
 	return poll(&pfd, 1, 0) == 0;
 }
 
-static void work(int i915, int dmabuf, unsigned ring)
+static void work(int i915, int dmabuf, const intel_ctx_t *ctx, unsigned ring)
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
@@ -578,6 +578,7 @@ static void work(int i915, int dmabuf, unsigned ring)
 	execbuf.flags = ring;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = prime_fd_to_handle(i915, dmabuf);
@@ -654,7 +655,7 @@ static void work(int i915, int dmabuf, unsigned ring)
 	igt_assert(read_busy && write_busy);
 }
 
-static void test_busy(int i915, int vgem, unsigned ring)
+static void test_busy(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	struct timespec tv;
@@ -668,7 +669,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
 	vgem_create(vgem, &scratch);
 	dmabuf = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, dmabuf, ring);
+	work(i915, dmabuf, ctx, ring);
 
 	/* Calling busy in a loop should be enough to flush the rendering */
 	memset(&tv, 0, sizeof(tv));
@@ -684,7 +685,7 @@ static void test_busy(int i915, int vgem, unsigned ring)
 	close(dmabuf);
 }
 
-static void test_wait(int i915, int vgem, unsigned ring)
+static void test_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	struct pollfd pfd;
@@ -697,7 +698,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
 	vgem_create(vgem, &scratch);
 	pfd.fd = prime_handle_to_fd(vgem, scratch.handle);
 
-	work(i915, pfd.fd, ring);
+	work(i915, pfd.fd, ctx, ring);
 
 	pfd.events = POLLIN;
 	igt_assert_eq(poll(&pfd, 1, 10000), 1);
@@ -711,7 +712,7 @@ static void test_wait(int i915, int vgem, unsigned ring)
 	close(pfd.fd);
 }
 
-static void test_sync(int i915, int vgem, unsigned ring)
+static void test_sync(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	uint32_t *ptr;
@@ -728,7 +729,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, ring);
+	work(i915, dmabuf, ctx, ring);
 
 	prime_sync_start(dmabuf, false);
 	for (i = 0; i < 1024; i++)
@@ -739,7 +740,7 @@ static void test_sync(int i915, int vgem, unsigned ring)
 	munmap(ptr, scratch.size);
 }
 
-static void test_fence_wait(int i915, int vgem, unsigned ring)
+static void test_fence_wait(int i915, int vgem, const intel_ctx_t *ctx, unsigned ring)
 {
 	struct vgem_bo scratch;
 	uint32_t fence;
@@ -760,7 +761,7 @@ static void test_fence_wait(int i915, int vgem, unsigned ring)
 	igt_assert(ptr != MAP_FAILED);
 
 	igt_fork(child, 1)
-		work(i915, dmabuf, ring);
+		work(i915, dmabuf, ctx, ring);
 
 	sleep(1);
 
@@ -800,7 +801,7 @@ static void test_fence_hang(int i915, int vgem, unsigned flags)
 	igt_assert(ptr != MAP_FAILED);
 	gem_close(vgem, scratch.handle);
 
-	work(i915, dmabuf, 0);
+	work(i915, dmabuf, 0, 0);
 
 	/* The work should have been cancelled */
 
@@ -1042,12 +1043,15 @@ static void test_flip(int i915, int vgem, unsigned hang)
 }
 
 static void test_each_engine(const char *name, int vgem, int i915,
-			     void (*fn)(int i915, int vgem, unsigned int flags))
+			     void (*fn)(int i915, int vgem,
+					const intel_ctx_t *ctx,
+					unsigned int flags))
 {
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx = intel_ctx_create_all_physical(i915);
 
 	igt_subtest_with_dynamic(name) {
-		__for_each_physical_engine(i915, e) {
+		for_each_ctx_engine(i915, ctx, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
 				continue;
 
@@ -1056,10 +1060,12 @@ static void test_each_engine(const char *name, int vgem, int i915,
 
 			igt_dynamic_f("%s", e->name) {
 				gem_quiescent_gpu(i915);
-				fn(i915, vgem, e->flags);
+				fn(i915, vgem, ctx, e->flags);
 			}
 		}
 	}
+
+	intel_ctx_destroy(i915, ctx);
 }
 
 igt_main
@@ -1110,7 +1116,8 @@ igt_main
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
