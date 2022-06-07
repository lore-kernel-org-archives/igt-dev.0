Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BF910ED41
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 14:40:38 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Jun 2022 16:39:53 +0200
Message-Id: <20220607143953.5247-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: Fix execution of
 parallel-submit on dg2+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nirmoy.das@intel.com, chris@chris-wilson.co.uk
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

From dg2, there are multiple compute engines which conflict with the
parallel-submit restriction; check for the illegal engine class prior to
running the test.

And from dg2, MI_ATOMIC is only valid for use with system memory for
INC, DEC and MOV operation, not the ADD used in the test workload.
Replace the ADD+1 with an INC, so that the same workload runs on all
platforms.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6157
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/intel_reg.h                |  3 ++-
 tests/i915/gem_exec_balancer.c | 49 +++++++++++++++++++++++++---------
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index cb6272889..e26ee82a5 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2645,8 +2645,9 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define STATE3D_COLOR_FACTOR	((0x3<<29)|(0x1d<<24)|(0x01<<16))
 
 /* Atomics */
-#define MI_ATOMIC			((0x2f << 23) | 2)
+#define MI_ATOMIC			((0x2f << 23) | 1)
 #define   MI_ATOMIC_INLINE_DATA         (1 << 18)
+#define   MI_ATOMIC_INC                 (0x5 << 8)
 #define   MI_ATOMIC_ADD                 (0x7 << 8)
 
 /* Batch */
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 857d00856..186975c46 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2895,12 +2895,10 @@ static void parallel_thread(int i915, unsigned int flags,
 	ctx = intel_ctx_create(i915, &cfg);
 
 	i = 0;
-	batch[i] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
-		MI_ATOMIC_ADD;
+	batch[i] = MI_ATOMIC | MI_ATOMIC_INC;
 #define TARGET_BO_OFFSET	(0x1 << 16)
 	batch[++i] = TARGET_BO_OFFSET;
 	batch[++i] = 0;
-	batch[++i] = 1;
 	batch[++i] = MI_BATCH_BUFFER_END;
 
 	memset(obj, 0, sizeof(obj));
@@ -2978,7 +2976,9 @@ static void parallel(int i915, unsigned int flags)
 
 	for (class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
-		unsigned int count, bb_per_execbuf;
+		const intel_ctx_t *ctx;
+		intel_ctx_cfg_t cfg;
+		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
 		if (!siblings)
@@ -2990,10 +2990,19 @@ static void parallel(int i915, unsigned int flags)
 		}
 
 		logical_sort_siblings(i915, siblings, count);
-		bb_per_execbuf = count;
 
-		parallel_thread(i915, flags, siblings,
-				count, bb_per_execbuf);
+		memset(&cfg, 0, sizeof(cfg));
+		cfg.parallel = true;
+		cfg.num_engines = 1;
+		cfg.width = 2;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * 2);
+		if (__intel_ctx_create(i915, &cfg, &ctx)) {
+			free(siblings);
+			continue;
+		}
+		intel_ctx_destroy(i915, ctx);
+
+		parallel_thread(i915, flags, siblings, count, count);
 
 		free(siblings);
 	}
@@ -3005,7 +3014,8 @@ static void parallel_balancer(int i915, unsigned int flags)
 
 	for (class = 0; class < 32; class++) {
 		struct i915_engine_class_instance *siblings;
-		unsigned int bb_per_execbuf;
+		const intel_ctx_t *ctx;
+		intel_ctx_cfg_t cfg;
 		unsigned int count;
 
 		siblings = list_engines(i915, 1u << class, &count);
@@ -3019,7 +3029,19 @@ static void parallel_balancer(int i915, unsigned int flags)
 
 		logical_sort_siblings(i915, siblings, count);
 
-		for (bb_per_execbuf = 2; count / bb_per_execbuf > 1;
+		memset(&cfg, 0, sizeof(cfg));
+		cfg.parallel = true;
+		cfg.num_engines = 1;
+		cfg.width = 2;
+		memcpy(cfg.engines, siblings, sizeof(*siblings) * 2);
+		if (__intel_ctx_create(i915, &cfg, &ctx)) {
+			free(siblings);
+			continue;
+		}
+		intel_ctx_destroy(i915, ctx);
+
+		for (unsigned int bb_per_execbuf = 2;
+		     count / bb_per_execbuf > 1;
 		     ++bb_per_execbuf) {
 			igt_fork(child, count / bb_per_execbuf)
 				parallel_thread(i915,
@@ -3108,13 +3130,14 @@ static void parallel_ordering(int i915, unsigned int flags)
 		cfg.width = count;
 		memcpy(cfg.engines, siblings, sizeof(*siblings) * count);
 
-		ctx = intel_ctx_create(i915, &cfg);
+		if (__intel_ctx_create(i915, &cfg, &ctx)) {
+			free(siblings);
+			continue;
+		}
 
-		batch[i] = MI_ATOMIC | MI_ATOMIC_INLINE_DATA |
-			MI_ATOMIC_ADD;
+		batch[i] = MI_ATOMIC | MI_ATOMIC_INC;
 		batch[++i] = TARGET_BO_OFFSET;
 		batch[++i] = 0;
-		batch[++i] = 1;
 		batch[++i] = MI_BATCH_BUFFER_END;
 
 		memset(obj, 0, sizeof(obj));
-- 
2.35.1
