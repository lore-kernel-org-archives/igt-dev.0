Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95A116EC83
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:32 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id a12so34915611pfc.7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:20 -0500
Message-Id: <20210423214853.876911-57-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 56/89] tests/i915/gem_exec_await: Convert to
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
 tests/i915/gem_exec_await.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index e64d2a94..8d26a173 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -62,16 +62,19 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 		struct drm_i915_gem_exec_object2 exec[2];
 		struct drm_i915_gem_relocation_entry reloc;
 		struct drm_i915_gem_execbuffer2 execbuf;
+		const intel_ctx_t *ctx;
 		uint32_t *cmd;
 	} *exec;
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 execbuf;
+	const intel_ctx_t *ctx;
 	unsigned engines[I915_EXEC_RING_MASK + 1], nengine;
 	unsigned long count;
 	double time;
 
+	ctx = intel_ctx_create_all_physical(fd);
 	nengine = 0;
-	__for_each_physical_engine(fd, engine) {
+	for_each_ctx_engine(fd, ctx, engine) {
 		if (!gem_class_has_mutable_submission(fd, engine->class))
 			continue;
 
@@ -105,7 +108,10 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 					 I915_EXEC_HANDLE_LUT);
 
 		if (flags & CONTEXTS) {
-			exec[e].execbuf.rsvd1 = gem_context_create(fd);
+			exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+			exec[e].execbuf.rsvd1 = exec[e].ctx->id;
+		} else {
+			exec[e].execbuf.rsvd1 = ctx->id;
 		}
 
 		exec[e].exec[0].handle = gem_create(fd, 4096);
@@ -150,9 +156,9 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 			int i;
 
 			if (flags & CONTEXTS) {
-				gem_context_destroy(fd, exec[e].execbuf.rsvd1);
-				exec[e].execbuf.rsvd1 =
-					gem_context_clone_with_engines(fd, 0);
+				intel_ctx_destroy(fd, exec[e].ctx);
+				exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+				exec[e].execbuf.rsvd1 = exec[e].ctx->id;
 			}
 
 			exec[e].reloc.presumed_offset = exec[e].exec[1].offset;
@@ -192,6 +198,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 			execbuf.flags = (engines[e] |
 					 I915_EXEC_NO_RELOC |
 					 I915_EXEC_HANDLE_LUT);
+			execbuf.rsvd1 = ctx->id;
 			gem_execbuf(fd, &execbuf);
 		}
 		clock_gettime(CLOCK_MONOTONIC, &now);
@@ -213,7 +220,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 
 	for (unsigned e = 0; e < nengine; e++) {
 		if (flags & CONTEXTS)
-			gem_context_destroy(fd, exec[e].execbuf.rsvd1);
+			intel_ctx_destroy(fd, exec[e].ctx);
 
 		for (unsigned n = 0; n < ring_size; n++)
 			gem_close(fd, exec[e].obj[n].handle);
@@ -222,6 +229,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 		munmap(exec[e].cmd, 4096);
 		gem_close(fd, exec[e].exec[1].handle);
 	}
+	intel_ctx_destroy(fd, ctx);
 	free(exec);
 }
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
