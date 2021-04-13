Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A446E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:01 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m11so10561147pfc.11
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:22 -0500
Message-Id: <20210413035350.261794-47-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 46/74] tests/i915/gem_exec_parallel: Convert
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
 tests/i915/gem_exec_parallel.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index c9cf9d7a..89330c20 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -56,6 +56,7 @@ struct thread {
 	unsigned flags;
 	uint32_t *scratch;
 	unsigned id;
+	const intel_ctx_t *ctx;
 	unsigned engine;
 	uint32_t used;
 	int fd, gen, *go;
@@ -67,6 +68,7 @@ static void *thread(void *data)
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *tmp_ctx = NULL;
 	uint32_t batch[16];
 	uint16_t used;
 	int fd, i;
@@ -78,7 +80,6 @@ static void *thread(void *data)
 
 	if (t->flags & FDS) {
 		fd = gem_reopen_driver(t->fd);
-		gem_context_copy_engines(t->fd, 0, fd, 0);
 	} else {
 		fd = t->fd;
 	}
@@ -121,8 +122,11 @@ static void *thread(void *data)
 	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (t->gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
-	if (t->flags & CONTEXTS) {
-		execbuf.rsvd1 = gem_context_clone_with_engines(fd, 0);
+	if (t->flags & (CONTEXTS | FDS)) {
+		tmp_ctx = intel_ctx_create(fd, &t->ctx->cfg);
+		execbuf.rsvd1 = tmp_ctx->id;
+	} else {
+		execbuf.rsvd1 = t->ctx->id;
 	}
 
 	used = 0;
@@ -141,8 +145,8 @@ static void *thread(void *data)
 			gem_close(fd, obj[0].handle);
 	}
 
-	if (t->flags & CONTEXTS)
-		gem_context_destroy(fd, execbuf.rsvd1);
+	if (t->flags & (CONTEXTS | FDS))
+		intel_ctx_destroy(fd, tmp_ctx);
 	gem_close(fd, obj[1].handle);
 	if (t->flags & FDS)
 		close(fd);
@@ -196,7 +200,8 @@ static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data
 	gem_close(fd, handle);
 }
 
-static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
+static void all(int fd, const intel_ctx_t *ctx,
+		struct intel_execution_engine2 *engine, unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
@@ -219,7 +224,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 	nengine = 0;
 	if (!engine) {
 		struct intel_execution_engine2 *e;
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 		}
@@ -246,6 +251,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 		threads[i].id = i;
 		threads[i].fd = fd;
 		threads[i].gen = gen;
+		threads[i].ctx = ctx;
 		threads[i].engine = engines[i % nengine];
 		threads[i].flags = flags;
 		threads[i].scratch = scratch;
@@ -287,11 +293,13 @@ igt_main
 		{ "userptr", USERPTR },
 		{ NULL }
 	};
+	const intel_ctx_t *ctx = NULL;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
 	}
@@ -300,21 +308,22 @@ igt_main
 		for (const struct mode *m = modes; m->name; m++)
 			igt_dynamic(m->name)
 				/* NULL value means all engines */
-				all(fd, NULL, m->flags);
+				all(fd, ctx, NULL, m->flags);
 	}
 
 	for (const struct mode *m = modes; m->name; m++) {
 		igt_subtest_with_dynamic(m->name) {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				if (gem_class_can_store_dword(fd, e->class))
 					igt_dynamic(e->name)
-						all(fd, e, m->flags);
+						all(fd, ctx, e, m->flags);
 			}
 		}
 	}
 
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
