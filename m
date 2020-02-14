Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 14 Feb 2020 19:40:14 +0000
Message-Id: <20200214194016.4054376-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
References: <20200214194016.4054376-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] i915/gem_ctx_engine: Exercise
 for_each_context_engine() with custom engine[]
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Set up a custom engine map with no engines, and check that the
for_each_context_engine() correctly iterates over nothing.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_engines.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 063140e0f..6a2edd1e0 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -549,6 +549,31 @@ static void independent(int i915)
 	gem_context_destroy(i915, param.ctx_id);
 }
 
+static void libapi(int i915)
+{
+	struct i915_context_param_engines engines = {};
+	struct drm_i915_gem_context_param p = {
+		.ctx_id = gem_context_create(i915),
+		.param = I915_CONTEXT_PARAM_ENGINES,
+		.value = to_user_pointer(&engines),
+		.size = sizeof(engines),
+	};
+	const struct intel_execution_engine2 *e;
+	unsigned int count = 0;
+
+	gem_context_set_param(i915, &p);
+
+	for_each_context_engine(i915, p.ctx_id, e)
+		count++;
+	igt_assert_eq(count, 0);
+
+	____for_each_physical_engine(i915, p.ctx_id, e)
+		count++;
+	igt_assert_eq(count, 0);
+
+	gem_context_destroy(i915, p.ctx_id);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -584,6 +609,9 @@ igt_main
 	igt_subtest("independent")
 		independent(i915);
 
+	igt_subtest("libapi")
+		libapi(i915);
+
 	igt_fixture
 		igt_stop_hang_detector();
 }
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
