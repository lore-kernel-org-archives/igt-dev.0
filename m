Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  7 Dec 2020 16:11:49 +0000
Message-Id: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/query: Cross-check engine list
 against execbuf interface
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Check that every engine listed can be used in execbuf.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andi Shyti <andi.shyti@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/i915/i915_query.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index e7c6fc91e..cdf2d3403 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -633,6 +633,16 @@ has_engine(struct drm_i915_query_engine_info *engines,
 	return false;
 }
 
+static void gem_context_reset_engines(int i915, uint32_t ctx)
+{
+	struct drm_i915_gem_context_param param = {
+		.ctx_id = ctx,
+		.param = I915_CONTEXT_PARAM_ENGINES,
+	};
+
+	gem_context_set_param(i915, &param);
+}
+
 static void engines(int fd)
 {
 	struct drm_i915_query_engine_info *engines;
@@ -678,10 +688,24 @@ static void engines(int fd)
 	igt_assert_eq(engines->rsvd[1], 0);
 	igt_assert_eq(engines->rsvd[2], 0);
 
-	/* Check results match the legacy GET_PARAM (where we can). */
+	/* Confirm the individual engines exist with EXECBUFFER2 */
 	for (i = 0; i < engines->num_engines; i++) {
 		struct drm_i915_engine_info *engine =
 			(struct drm_i915_engine_info *)&engines->engines[i];
+		I915_DEFINE_CONTEXT_PARAM_ENGINES(p_engines, 1) = {
+			.engines = { engine->engine }
+		};
+		struct drm_i915_gem_context_param param = {
+			.param = I915_CONTEXT_PARAM_ENGINES,
+			.value = to_user_pointer(&p_engines),
+			.size = sizeof(p_engines),
+		};
+
+		struct drm_i915_gem_exec_object2 obj = {};
+		struct drm_i915_gem_execbuffer2 execbuf = {
+			.buffers_ptr = to_user_pointer(&obj),
+			.buffer_count = 1,
+		};
 
 		igt_debug("%u: class=%u instance=%u flags=%llx capabilities=%llx\n",
 			  i,
@@ -689,6 +713,15 @@ static void engines(int fd)
 			  engine->engine.engine_instance,
 			  engine->flags,
 			  engine->capabilities);
+		gem_context_set_param(fd, &param);
+		igt_assert_eq(__gem_execbuf(fd, &execbuf), -ENOENT);
+	}
+	gem_context_reset_engines(fd, 0);
+
+	/* Check results match the legacy GET_PARAM (where we can). */
+	for (i = 0; i < engines->num_engines; i++) {
+		struct drm_i915_engine_info *engine =
+			(struct drm_i915_engine_info *)&engines->engines[i];
 
 		switch (engine->engine.engine_class) {
 		case I915_ENGINE_CLASS_RENDER:
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
