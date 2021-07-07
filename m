Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5106E17F
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:45:09 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso1820423pjb.0
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:45:09 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:28 -0500
Message-Id: <20210707144337.180693-41-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 40/81] tests/i915/gem_exec_await: Convert to
 intel_ctx_t (v2)
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

v2 (Jason Ekstrand):
 - Create the context in the fixture
 - Pass the context config to gem_submission_measure()
 - Drop Zbigniew's review since it's close to a rewrite

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_await.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index ba8325ce3..bea57c61b 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -53,7 +53,8 @@ static void xchg_obj(void *array, unsigned i, unsigned j)
 }
 
 #define CONTEXTS 0x1
-static void wide(int fd, int ring_size, int timeout, unsigned int flags)
+static void wide(int fd, const intel_ctx_t *ctx, int ring_size,
+		 int timeout, unsigned int flags)
 {
 	const struct intel_execution_engine2 *engine;
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -63,6 +64,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 		struct drm_i915_gem_exec_object2 exec[2];
 		struct drm_i915_gem_relocation_entry reloc;
 		struct drm_i915_gem_execbuffer2 execbuf;
+		const intel_ctx_t *ctx;
 		uint32_t *cmd;
 	} *exec;
 	struct drm_i915_gem_exec_object2 *obj;
@@ -72,7 +74,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 	double time;
 
 	nengine = 0;
-	__for_each_physical_engine(fd, engine) {
+	for_each_ctx_engine(fd, ctx, engine) {
 		if (!gem_class_has_mutable_submission(fd, engine->class))
 			continue;
 
@@ -106,7 +108,10 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 					 I915_EXEC_HANDLE_LUT);
 
 		if (flags & CONTEXTS) {
-			exec[e].execbuf.rsvd1 = gem_context_create(fd);
+			exec[e].ctx = intel_ctx_create(fd, &ctx->cfg);
+			exec[e].execbuf.rsvd1 = exec[e].ctx->id;
+		} else {
+			exec[e].execbuf.rsvd1 = ctx->id;
 		}
 
 		exec[e].exec[0].handle = gem_create(fd, 4096);
@@ -151,9 +156,9 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
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
@@ -193,6 +198,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 			execbuf.flags = (engines[e] |
 					 I915_EXEC_NO_RELOC |
 					 I915_EXEC_HANDLE_LUT);
+			execbuf.rsvd1 = ctx->id;
 			gem_execbuf(fd, &execbuf);
 		}
 		clock_gettime(CLOCK_MONOTONIC, &now);
@@ -214,7 +220,7 @@ static void wide(int fd, int ring_size, int timeout, unsigned int flags)
 
 	for (unsigned e = 0; e < nengine; e++) {
 		if (flags & CONTEXTS)
-			gem_context_destroy(fd, exec[e].execbuf.rsvd1);
+			intel_ctx_destroy(fd, exec[e].ctx);
 
 		for (unsigned n = 0; n < ring_size; n++)
 			gem_close(fd, exec[e].obj[n].handle);
@@ -230,14 +236,16 @@ igt_main
 {
 	int ring_size = 0;
 	int device = -1;
+	const intel_ctx_t *ctx;
 
 	igt_fixture {
 
 		device = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(device);
 		gem_submission_print_method(device);
+		ctx = intel_ctx_create_all_physical(device);
 
-		ring_size = gem_submission_measure(device, NULL, ALL_ENGINES);
+		ring_size = gem_submission_measure(device, &ctx->cfg, ALL_ENGINES);
 
 		igt_info("Ring size: %d batches\n", ring_size);
 		igt_require(ring_size > 0);
@@ -246,15 +254,16 @@ igt_main
 	}
 
 	igt_subtest("wide-all")
-		wide(device, ring_size, 20, 0);
+		wide(device, ctx, ring_size, 20, 0);
 
 	igt_subtest("wide-contexts") {
 		gem_require_contexts(device);
-		wide(device, ring_size, 20, CONTEXTS);
+		wide(device, ctx, ring_size, 20, CONTEXTS);
 	}
 
 	igt_fixture {
 		igt_stop_hang_detector();
+		intel_ctx_destroy(device, ctx);
 		close(device);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
