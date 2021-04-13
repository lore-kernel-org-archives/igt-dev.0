Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16F6E1BC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:45 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id m18so5273820plc.13
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:10 -0500
Message-Id: <20210413035350.261794-35-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 34/74] tests/gem_exec_whisper: Convert to
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
 tests/i915/gem_exec_whisper.c | 83 +++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 29 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 71bd610c..d66cc056 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -28,12 +28,14 @@
  */
 
 #include "i915/gem.h"
+#include "i915/gem_vm.h"
 #include "igt.h"
 #include "igt_debugfs.h"
 #include "igt_rapl.h"
 #include "igt_gt.h"
 #include "igt_rand.h"
 #include "igt_sysfs.h"
+#include "intel_ctx.h"
 
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
@@ -81,13 +83,14 @@ static void verify_reloc(int fd, uint32_t handle,
 #define BASIC 0x400
 
 struct hang {
+	const intel_ctx_t *ctx;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	int fd;
 };
 
-static void init_hang(struct hang *h, int fd)
+static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
 {
 	uint32_t *batch;
 	int i, gen;
@@ -97,6 +100,13 @@ static void init_hang(struct hang *h, int fd)
 
 	gen = intel_gen(intel_get_drm_devid(h->fd));
 
+	if (gem_has_contexts(fd)) {
+		h->ctx = intel_ctx_create(h->fd, cfg);
+		h->execbuf.rsvd1 = h->ctx->id;
+	} else {
+		h->ctx = NULL;
+	}
+
 	memset(&h->execbuf, 0, sizeof(h->execbuf));
 	h->execbuf.buffers_ptr = to_user_pointer(&h->obj);
 	h->execbuf.buffer_count = 1;
@@ -156,6 +166,7 @@ static void submit_hang(struct hang *h, unsigned *engines, int nengine, unsigned
 
 static void fini_hang(struct hang *h)
 {
+	intel_ctx_destroy(h->fd, h->ctx);
 	close(h->fd);
 }
 
@@ -165,7 +176,8 @@ static void ctx_set_random_priority(int fd, uint32_t ctx)
 	gem_context_set_priority(fd, ctx, prio);
 }
 
-static void whisper(int fd, unsigned engine, unsigned flags)
+static void whisper(int fd, const intel_ctx_t *ctx,
+		    unsigned engine, unsigned flags)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
@@ -179,7 +191,8 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 	const struct intel_execution_engine2 *e;
 	struct hang hang;
 	int fds[64];
-	uint32_t contexts[64];
+	intel_ctx_cfg_t local_cfg;
+	const intel_ctx_t *contexts[64];
 	unsigned nengine;
 	uint32_t batch[16];
 	unsigned int relocations = 0;
@@ -203,7 +216,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 		}
@@ -220,10 +233,10 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		gem_require_contexts(fd);
 
 	if (flags & QUEUES)
-		igt_require(gem_has_queues(fd));
+		igt_require(gem_has_vm(fd));
 
 	if (flags & HANG)
-		init_hang(&hang, fd);
+		init_hang(&hang, fd, &ctx->cfg);
 
 	nchild = 1;
 	if (flags & FORKED)
@@ -272,6 +285,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 			execbuf.flags |= I915_EXEC_NO_RELOC;
 			if (gen < 6)
 				execbuf.flags |= I915_EXEC_SECURE;
+			execbuf.rsvd1 = ctx->id;
 			igt_require(__gem_execbuf(fd, &execbuf) == 0);
 			scratch = tmp[0];
 			store = tmp[1];
@@ -293,18 +307,20 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		igt_assert(loc == sizeof(uint32_t) * i);
 		batch[++i] = MI_BATCH_BUFFER_END;
 
-		if (flags & CONTEXTS) {
-			for (n = 0; n < 64; n++)
-				contexts[n] = gem_context_clone_with_engines(fd, 0);
-		}
-		if (flags & QUEUES) {
-			for (n = 0; n < 64; n++)
-				contexts[n] = gem_queue_create(fd);
-		}
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++) {
 				fds[n] = gem_reopen_driver(fd);
-				gem_context_copy_engines(fd, 0, fds[n], 0);
+			}
+		}
+		if (flags & (CONTEXTS | QUEUES | FDS)) {
+			local_cfg = ctx->cfg;
+			if (flags & QUEUES) {
+				igt_assert(!(flags & FDS));
+				local_cfg.vm = gem_vm_create(fd);
+			}
+			for (n = 0; n < 64; n++) {
+				int this_fd = (flags & FDS) ? fds[n] : fd;
+				contexts[n] = intel_ctx_create(this_fd, &local_cfg);
 			}
 		}
 
@@ -413,8 +429,8 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 						execbuf.flags &= ~ENGINE_MASK;
 						execbuf.flags |= engines[rand() % nengine];
 					}
-					if (flags & (CONTEXTS | QUEUES)) {
-						execbuf.rsvd1 = contexts[rand() % 64];
+					if (flags & (CONTEXTS | QUEUES | FDS)) {
+						execbuf.rsvd1 = contexts[rand() % 64]->id;
 						if (flags & PRIORITY)
 							ctx_set_random_priority(this_fd, execbuf.rsvd1);
 					}
@@ -442,7 +458,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 					}
 				}
 				execbuf.flags &= ~ENGINE_MASK;
-				execbuf.rsvd1 = 0;
+				execbuf.rsvd1 = ctx->id;
 				execbuf.buffers_ptr = to_user_pointer(&tmp);
 
 				tmp[0] = tmp[1];
@@ -492,16 +508,22 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		gem_close(fd, scratch.handle);
 		gem_close(fd, store.handle);
 
+		if (flags & (CONTEXTS | QUEUES | FDS)) {
+			for (n = 0; n < 64; n++) {
+				int this_fd = (flags & FDS) ? fds[n] : fd;
+				intel_ctx_destroy(this_fd, contexts[n]);
+			}
+			if (local_cfg.vm) {
+				igt_assert(!(flags & FDS));
+				gem_vm_destroy(fd, local_cfg.vm);
+			}
+		}
+		for (n = 0; n < QLEN; n++)
+			gem_close(fd, batches[n].handle);
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++)
 				close(fds[n]);
 		}
-		if (flags & (CONTEXTS | QUEUES)) {
-			for (n = 0; n < 64; n++)
-				gem_context_destroy(fd, contexts[n]);
-		}
-		for (n = 0; n < QLEN; n++)
-			gem_close(fd, batches[n].handle);
 	}
 
 	igt_waitchildren();
@@ -554,6 +576,7 @@ igt_main
 		{ NULL }
 	};
 	const struct intel_execution_engine2 *e;
+	const intel_ctx_t *ctx;
 	int fd = -1;
 
 	igt_fixture {
@@ -561,6 +584,7 @@ igt_main
 		igt_require_gem(fd);
 		igt_require(gem_can_store_dword(fd, 0));
 		gem_submission_print_method(fd);
+		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
 	}
@@ -568,10 +592,10 @@ igt_main
 	for (const struct mode *m = modes; m->name; m++) {
 		igt_subtest_f("%s%s",
 			      m->flags & BASIC ? "basic-" : "", m->name)
-			whisper(fd, ALL_ENGINES, m->flags);
+			whisper(fd, ctx, ALL_ENGINES, m->flags);
 		igt_subtest_f("%s%s-all",
 			      m->flags & BASIC ? "basic-" : "", m->name)
-			whisper(fd, ALL_ENGINES, m->flags | ALL);
+			whisper(fd, ctx, ALL_ENGINES, m->flags | ALL);
 	}
 
 	for (const struct mode *m = modes; m->name; m++) {
@@ -579,12 +603,12 @@ igt_main
 			continue;
 
 		igt_subtest_with_dynamic_f("%s", m->name) {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
 
 				igt_dynamic_f("%s", e->name)
-					whisper(fd, e->flags, m->flags);
+					whisper(fd, ctx, e->flags, m->flags);
 			}
 		}
 	}
@@ -598,11 +622,12 @@ igt_main
 			if (m->flags & INTERRUPTIBLE)
 				continue;
 			igt_subtest_f("hang-%s", m->name)
-				whisper(fd, ALL_ENGINES, m->flags | HANG);
+				whisper(fd, ctx, ALL_ENGINES, m->flags | HANG);
 		}
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
