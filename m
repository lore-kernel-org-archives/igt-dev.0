Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri,  6 Mar 2020 14:38:50 +0000
Message-Id: <20200306143850.673-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200306143850.673-1-tvrtko.ursulin@linux.intel.com>
References: <20200306143850.673-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] gem_wsim: Mark contexts as
 non-persistent
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

We want to mark workload contexts as non-persistent if possible so that we
do not have to worry about leaving long (or infinite!) batches running
post exit.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 benchmarks/gem_wsim.c | 50 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index c196b25317ce..7cb8ea5b18ba 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1431,16 +1431,48 @@ alloc_step_batch(struct workload *wrk, struct w_step *w, unsigned int flags)
 #endif
 }
 
-static void __ctx_set_prio(uint32_t ctx_id, unsigned int prio)
+static bool has_persistence(int i915)
 {
-	struct drm_i915_gem_context_param param = {
-		.ctx_id = ctx_id,
-		.param = I915_CONTEXT_PARAM_PRIORITY,
-		.value = prio,
+	struct drm_i915_gem_context_param p = {
+		.param = I915_CONTEXT_PARAM_PERSISTENCE,
 	};
+	uint64_t saved;
+
+	if (__gem_context_get_param(i915, &p))
+		return false;
+
+	saved = p.value;
+	p.value = 0;
+	if (__gem_context_set_param(i915, &p))
+		return false;
+
+	p.value = saved;
+	return __gem_context_set_param(i915, &p) == 0;
+}
+
+static bool __has_persistence;
+
+static void __configure_context(uint32_t ctx_id, unsigned int prio)
+{
+	if (prio) {
+		struct drm_i915_gem_context_param param = {
+			.ctx_id = ctx_id,
+			.param = I915_CONTEXT_PARAM_PRIORITY,
+			.value = prio,
+		};
 
-	if (prio)
 		gem_context_set_param(fd, &param);
+	}
+
+	/* Mark as non-persistent if supported. */
+	if (__has_persistence) {
+		struct drm_i915_gem_context_param param = {
+			.ctx_id = ctx_id,
+			.param = I915_CONTEXT_PARAM_PERSISTENCE,
+		};
+
+		gem_context_set_param(fd, &param);
+	}
 }
 
 static int __vm_destroy(int i915, uint32_t vm_id)
@@ -1743,7 +1775,7 @@ prepare_workload(unsigned int id, struct workload *wrk, unsigned int flags)
 			ctx_vcs ^= 1;
 		}
 
-		__ctx_set_prio(ctx_id, wrk->prio);
+		__configure_context(ctx_id, wrk->prio);
 
 		/*
 		 * Do we need a separate context to satisfy this workloads which
@@ -1772,7 +1804,7 @@ prepare_workload(unsigned int id, struct workload *wrk, unsigned int flags)
 			ctx_id = args.ctx_id;
 			wrk->ctx_list[i + 1].id = args.ctx_id;
 
-			__ctx_set_prio(ctx_id, wrk->prio);
+			__configure_context(ctx_id, wrk->prio);
 		}
 
 		if (ctx->engine_map) {
@@ -3280,6 +3312,8 @@ int main(int argc, char **argv)
 	fd = __drm_open_driver(DRIVER_INTEL);
 	igt_require(fd);
 
+	__has_persistence = has_persistence(fd);
+
 	intel_register_access_init(&mmio_data, intel_get_pci_device(), false, fd);
 
 	init_clocks();
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
