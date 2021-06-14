Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960889F6F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:08 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id p13so10975618pfw.0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:36:54 -0500
Message-Id: <20210614163704.365989-40-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 39/77] tests/i915/gem_exec_await: Convert to
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
index 6db30695f..5270b4cdf 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -63,16 +63,19 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
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
 
@@ -106,7 +109,10 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 					 I915_EXEC_HANDLE_LUT);
 
 		if (flags & CONTEXTS) {
-			exec[e].execbuf.rsvd1 = gem_context_create(fd);
+			exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+			exec[e].execbuf.rsvd1 = exec[e].ctx->id;
+		} else {
+			exec[e].execbuf.rsvd1 = ctx->id;
 		}
 
 		exec[e].exec[0].handle = gem_create(fd, 4096);
@@ -151,9 +157,9 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
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
@@ -193,6 +199,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 			execbuf.flags = (engines[e] |
 					 I915_EXEC_NO_RELOC |
 					 I915_EXEC_HANDLE_LUT);
+			execbuf.rsvd1 = ctx->id;
 			gem_execbuf(fd, &execbuf);
 		}
 		clock_gettime(CLOCK_MONOTONIC, &now);
@@ -214,7 +221,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 
 	for (unsigned e = 0; e < nengine; e++) {
 		if (flags & CONTEXTS)
-			gem_context_destroy(fd, exec[e].execbuf.rsvd1);
+			intel_ctx_destroy(fd, exec[e].ctx);
 
 		for (unsigned n = 0; n < ring_size; n++)
 			gem_close(fd, exec[e].obj[n].handle);
@@ -223,6 +230,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
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
