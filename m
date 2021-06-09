Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBFD6EC88
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:43 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id x73so17446983pfc.8
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:43 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:34 -0500
Message-Id: <20210609043035.102359-49-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 48/93] tests/i915/gem_exec_parallel: Convert
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_parallel.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
index 11cea5d7..60356f0b 100644
--- a/tests/i915/gem_exec_parallel.c
+++ b/tests/i915/gem_exec_parallel.c
@@ -57,6 +57,7 @@ struct thread {
 	unsigned flags;
 	uint32_t *scratch;
 	unsigned id;
+	const intel_ctx_t *ctx;
 	unsigned engine;
 	uint32_t used;
 	int fd, gen, *go;
@@ -68,6 +69,7 @@ static void *thread(void *data)
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *tmp_ctx = NULL;
 	uint32_t batch[16];
 	uint16_t used;
 	int fd, i;
@@ -79,7 +81,6 @@ static void *thread(void *data)
 
 	if (t->flags & FDS) {
 		fd = gem_reopen_driver(t->fd);
-		gem_context_copy_engines(t->fd, 0, fd, 0);
 	} else {
 		fd = t->fd;
 	}
@@ -122,8 +123,11 @@ static void *thread(void *data)
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
@@ -142,8 +146,8 @@ static void *thread(void *data)
 			gem_close(fd, obj[0].handle);
 	}
 
-	if (t->flags & CONTEXTS)
-		gem_context_destroy(fd, execbuf.rsvd1);
+	if (t->flags & (CONTEXTS | FDS))
+		intel_ctx_destroy(fd, tmp_ctx);
 	gem_close(fd, obj[1].handle);
 	if (t->flags & FDS)
 		close(fd);
@@ -197,7 +201,8 @@ static void handle_close(int fd, unsigned int flags, uint32_t handle, void *data
 	gem_close(fd, handle);
 }
 
-static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
+static void all(int fd, const intel_ctx_t *ctx,
+		struct intel_execution_engine2 *engine, unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
@@ -220,7 +225,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 	nengine = 0;
 	if (!engine) {
 		struct intel_execution_engine2 *e;
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 		}
@@ -247,6 +252,7 @@ static void all(int fd, struct intel_execution_engine2 *engine, unsigned flags)
 		threads[i].id = i;
 		threads[i].fd = fd;
 		threads[i].gen = gen;
+		threads[i].ctx = ctx;
 		threads[i].engine = engines[i % nengine];
 		threads[i].flags = flags;
 		threads[i].scratch = scratch;
@@ -288,11 +294,13 @@ igt_main
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
@@ -301,21 +309,22 @@ igt_main
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
