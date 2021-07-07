Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994396E198
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:27 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u14so2467839pga.11
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:27 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:33 -0500
Message-Id: <20210707144643.181001-22-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 71/81] tests/i915/i915_query: Convert to
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
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_query.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 29b938e9c..0add3401b 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -682,19 +682,14 @@ static void engines(int fd)
 	for (i = 0; i < engines->num_engines; i++) {
 		struct drm_i915_engine_info *engine =
 			(struct drm_i915_engine_info *)&engines->engines[i];
-		I915_DEFINE_CONTEXT_PARAM_ENGINES(p_engines, 1) = {
-			.engines = { engine->engine }
-		};
-		struct drm_i915_gem_context_param param = {
-			.param = I915_CONTEXT_PARAM_ENGINES,
-			.value = to_user_pointer(&p_engines),
-			.size = sizeof(p_engines),
-		};
-
+		const intel_ctx_t *ctx =
+			intel_ctx_create_for_engine(fd, engine->engine.engine_class,
+						    engine->engine.engine_instance);
 		struct drm_i915_gem_exec_object2 obj = {};
 		struct drm_i915_gem_execbuffer2 execbuf = {
 			.buffers_ptr = to_user_pointer(&obj),
 			.buffer_count = 1,
+			.rsvd1 = ctx->id,
 		};
 
 		igt_debug("%u: class=%u instance=%u flags=%llx capabilities=%llx\n",
@@ -703,11 +698,9 @@ static void engines(int fd)
 			  engine->engine.engine_instance,
 			  engine->flags,
 			  engine->capabilities);
-		gem_context_set_param(fd, &param);
 		igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
 
-		param.size = 0; /* reset context engine map to defaults */
-		gem_context_set_param(fd, &param);
+		intel_ctx_destroy(fd, ctx);
 	}
 
 	/* Check results match the legacy GET_PARAM (where we can). */
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
