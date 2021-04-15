Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAA86EAB8
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:15 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id r13so8839172pjf.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:12:15 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:10:46 -0500
Message-Id: <20210415191145.2137858-16-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 15/74] lib/igt_spin: Support intel_ctx_t
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
index aee72da8..b26a7b7d 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -32,9 +32,12 @@
 #include "igt_list.h"
 #include "i915_drm.h"
 
+struct intel_ctx;
+
 typedef struct igt_spin {
 	struct igt_list_head link;
 
+
 	uint32_t handle;
 	uint32_t poll_handle;
 
@@ -61,6 +64,7 @@ typedef struct igt_spin {
 
 struct igt_spin_factory {
 	uint32_t ctx_id;
+	const struct intel_ctx *ctx;
 	uint32_t dependency;
 	unsigned int engine;
 	unsigned int flags;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
