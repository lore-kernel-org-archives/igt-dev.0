Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B40B6EC6D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:29 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h20so25875546plr.4
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:41 -0500
Message-Id: <20210423214853.876911-18-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 17/89] lib/dummyload: Support intel_ctx_t
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
 lib/igt_dummyload.c | 30 ++++++++++++++++++++++--------
 lib/igt_dummyload.h |  4 ++++
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 5a11ec4e..ac83b331 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -123,16 +123,28 @@ emit_recursive_batch(igt_spin_t *spin,
 	addr += random() % addr / 2;
 	addr &= -4096;
 
+	assert(!(opts->ctx && opts->ctx_id));
+
 	nengine = 0;
 	if (opts->engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *engine;
 
-		for_each_context_engine(fd, opts->ctx_id, engine) {
-			if (opts->flags & IGT_SPIN_POLL_RUN &&
-			    !gem_class_can_store_dword(fd, engine->class))
-				continue;
+		if (opts->ctx) {
+			for_each_ctx_engine(fd, opts->ctx, engine) {
+				if (opts->flags & IGT_SPIN_POLL_RUN &&
+				    !gem_class_can_store_dword(fd, engine->class))
+					continue;
 
-			flags[nengine++] = engine->flags;
+				flags[nengine++] = engine->flags;
+			}
+		} else {
+			for_each_context_engine(fd, opts->ctx_id, engine) {
+				if (opts->flags & IGT_SPIN_POLL_RUN &&
+				    !gem_class_can_store_dword(fd, engine->class))
+					continue;
+
+				flags[nengine++] = engine->flags;
+			}
 		}
 	} else {
 		flags[nengine++] = opts->engine;
@@ -325,7 +337,7 @@ emit_recursive_batch(igt_spin_t *spin,
 
 	execbuf->buffers_ptr =
 	       	to_user_pointer(obj + (2 - execbuf->buffer_count));
-	execbuf->rsvd1 = opts->ctx_id;
+	execbuf->rsvd1 = opts->ctx ? opts->ctx->id : opts->ctx_id;
 
 	if (opts->flags & IGT_SPIN_FENCE_OUT)
 		execbuf->flags |= I915_EXEC_FENCE_OUT;
@@ -422,8 +434,10 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 		struct intel_execution_engine2 e;
 		int class;
 
-		if (!gem_context_lookup_engine(fd, opts->engine,
-					       opts->ctx_id, &e)) {
+		if (opts->ctx) {
+			class = opts->ctx->cfg.engines[opts->engine].engine_class;
+		} else if (!gem_context_lookup_engine(fd, opts->engine,
+						      opts->ctx_id, &e)) {
 			class = e.class;
 		} else {
 			gem_require_ring(fd, opts->engine);
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index ad1ce28c..4534d2ca 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -31,10 +31,12 @@
 #include "igt_core.h"
 #include "igt_list.h"
 #include "i915_drm.h"
+#include "intel_ctx.h"
 
 typedef struct igt_spin {
 	struct igt_list_head link;
 
+
 	uint32_t handle;
 	uint32_t poll_handle;
 
@@ -62,6 +64,7 @@ typedef struct igt_spin {
 /**
  * igt_spin_factory_t:
  * @ctx_id: GEM context handle
+ * @ctx: intel_ctx_t context wrapper
  * @dependency: GEM object to depend on
  * @engine: Flags describing the engine to execute on
  * @flags: Set of IGT_SPIN_* flags
@@ -71,6 +74,7 @@ typedef struct igt_spin {
  */
 typedef struct igt_spin_factory {
 	uint32_t ctx_id;
+	const intel_ctx_t *ctx;
 	uint32_t dependency;
 	unsigned int engine;
 	unsigned int flags;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
