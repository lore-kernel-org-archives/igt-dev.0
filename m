Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D57089F4F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:37:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e7so6872911plj.7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:37:38 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:31 -0500
Message-Id: <20210614163704.365989-17-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 16/77] tests/i915/gem_ringfill: Convert to
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
 tests/i915/gem_ringfill.c | 48 +++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 9ad97532f..5d2169d65 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -94,7 +94,7 @@ static void fill_ring(int fd,
 	}
 }
 
-static void setup_execbuf(int fd,
+static void setup_execbuf(int fd, const intel_ctx_t *ctx,
 			  struct drm_i915_gem_execbuffer2 *execbuf,
 			  struct drm_i915_gem_exec_object2 *obj,
 			  struct drm_i915_gem_relocation_entry *reloc,
@@ -115,6 +115,8 @@ static void setup_execbuf(int fd,
 	if (gen > 3 && gen < 6)
 		execbuf->flags |= I915_EXEC_SECURE;
 
+	execbuf->rsvd1 = ctx->id;
+
 	obj[0].handle = gem_create(fd, 4096);
 	gem_write(fd, obj[0].handle, 0, &bbe, sizeof(bbe));
 	execbuf->buffer_count = 1;
@@ -168,7 +170,8 @@ static void setup_execbuf(int fd,
 	check_bo(fd, obj[0].handle);
 }
 
-static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
+static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
+		     unsigned flags, unsigned timeout)
 {
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc[1024];
@@ -176,15 +179,15 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 	igt_hang_t hang;
 
 	if (flags & (SUSPEND | HIBERNATE)) {
-		run_test(fd, ring, 0, 0);
+		run_test(fd, ctx, ring, 0, 0);
 		gem_quiescent_gpu(fd);
 	}
 
-	setup_execbuf(fd, &execbuf, obj, reloc, ring);
+	setup_execbuf(fd, ctx, &execbuf, obj, reloc, ring);
 
 	memset(&hang, 0, sizeof(hang));
 	if (flags & HANG)
-		hang = igt_hang_ring(fd, ring & ~(3<<13));
+		hang = igt_hang_ctx(fd, ctx->id, ring & ~(3<<13), 0);
 
 	if (flags & (CHILD | FORKED | BOMB)) {
 		int nchild;
@@ -198,16 +201,19 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 
 		igt_debug("Forking %d children\n", nchild);
 		igt_fork(child, nchild) {
+			const intel_ctx_t *child_ctx = NULL;
 			if (flags & NEWFD) {
 				int this;
 
 				this = gem_reopen_driver(fd);
-				gem_context_copy_engines(fd, 0, this, 0);
+				child_ctx = intel_ctx_create(fd, &ctx->cfg);
 				fd = this;
 
-				setup_execbuf(fd, &execbuf, obj, reloc, ring);
+				setup_execbuf(fd, child_ctx, &execbuf, obj, reloc, ring);
 			}
 			fill_ring(fd, &execbuf, flags, timeout);
+			if (child_ctx)
+				intel_ctx_destroy(fd, child_ctx);
 		}
 
 		if (flags & SUSPEND)
@@ -235,7 +241,7 @@ static void run_test(int fd, unsigned ring, unsigned flags, unsigned timeout)
 
 	if (flags & (SUSPEND | HIBERNATE)) {
 		gem_quiescent_gpu(fd);
-		run_test(fd, ring, 0, 0);
+		run_test(fd, ctx, ring, 0, 0);
 	}
 }
 
@@ -286,6 +292,7 @@ igt_main
 		{ NULL }
 	}, *m;
 	bool master = false;
+	const intel_ctx_t *ctx;
 	int fd = -1;
 
 	igt_fixture {
@@ -305,22 +312,20 @@ igt_main
 		ring_size = gem_measure_ring_inflight(fd, ALL_ENGINES, 0);
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size);
+
+		ctx = intel_ctx_create_all_physical(fd);
 	}
 
 	/* Legacy path for selecting "rings". */
 	for (m = modes; m->suffix; m++) {
 		igt_subtest_with_dynamic_f("legacy-%s", m->suffix) {
-			const struct intel_execution_ring *e;
-
 			igt_skip_on(m->flags & NEWFD && master);
 
-			for (e = intel_execution_rings; e->name; e++) {
-				if (!gem_has_ring(fd, eb_ring(e)))
-					continue;
-
+			for_each_ring(e, fd) {
 				igt_dynamic_f("%s", e->name) {
 					igt_require(gem_can_store_dword(fd, eb_ring(e)));
-					run_test(fd, eb_ring(e),
+					run_test(fd, intel_ctx_0(fd),
+						 eb_ring(e),
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
@@ -335,12 +340,13 @@ igt_main
 			const struct intel_execution_engine2 *e;
 
 			igt_skip_on(m->flags & NEWFD && master);
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
 
 				igt_dynamic_f("%s", e->name) {
-					run_test(fd, e->flags,
+					run_test(fd, ctx,
+						 e->flags,
 						 m->flags,
 						 m->timeout);
 					gem_quiescent_gpu(fd);
@@ -352,17 +358,19 @@ igt_main
 	igt_subtest("basic-all") {
 		const struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (!gem_class_can_store_dword(fd, e->class))
 				continue;
 
 			igt_fork(child, 1)
-				run_test(fd, e->flags, 0, 1);
+				run_test(fd, ctx, e->flags, 0, 1);
 		}
 
 		igt_waitchildren();
 	}
 
-	igt_fixture
+	igt_fixture {
+		intel_ctx_destroy(fd, ctx);
 		close(fd);
+	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
