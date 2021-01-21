Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 21 Jan 2021 10:50:05 +0000
Message-Id: <20210121105005.963616-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_persistence: Check for
 accidental banning
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Check that closing many contexts does not cause a ban.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_persistence.c | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index 1b7d18525..b51a9fcc7 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -1065,6 +1065,51 @@ static void smoketest(int i915)
 	gem_quiescent_gpu(i915);
 }
 
+static void many_contexts(int i915)
+{
+	const struct intel_execution_engine2 *e;
+	igt_spin_t *spin;
+
+	cleanup(i915);
+
+	/*
+	 * Perform many peristent kills from the same client. These should not
+	 * cause the client to be banned, which in turn prevents us from
+	 * creating new contexts, and submitting new execbuf.
+	 */
+
+	spin = igt_spin_new(i915, .flags = IGT_SPIN_NO_PREEMPTION);
+	igt_spin_end(spin);
+
+	igt_until_timeout(30) {
+		__for_each_physical_engine(i915, e) {
+			int64_t timeout = NSEC_PER_SEC;
+			uint32_t ctx;
+
+			ctx = gem_context_clone_with_engines(i915, 0);
+			gem_context_set_persistence(i915, ctx, false);
+
+			igt_spin_reset(spin);
+			spin->execbuf.rsvd1 = ctx;
+			spin->execbuf.flags &= ~63;
+			spin->execbuf.flags |= e->flags;
+			gem_execbuf(i915, &spin->execbuf);
+			gem_context_destroy(i915, ctx);
+
+			igt_assert_eq(gem_wait(i915, spin->handle, &timeout), 0);
+		}
+	}
+
+	/* And check we can still submit to the default context -- no bans! */
+	igt_spin_reset(spin);
+	spin->execbuf.rsvd1 = 0;
+	spin->execbuf.flags &= ~63;
+	gem_execbuf(i915, &spin->execbuf);
+
+	igt_spin_free(i915, spin);
+	gem_quiescent_gpu(i915);
+}
+
 static void replace_engines(int i915, const struct intel_execution_engine2 *e)
 {
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
@@ -1398,6 +1443,9 @@ igt_main
 			}
 		}
 
+		igt_subtest("many-contexts")
+			many_contexts(i915);
+
 		igt_subtest("smoketest")
 			smoketest(i915);
 	}
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
