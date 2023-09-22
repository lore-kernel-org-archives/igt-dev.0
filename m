Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082910E705
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:30 -0700
Message-Id: <20230922215233.2438200-3-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] i915/pmu: Pass config directly to the
 init test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The busy config may need to be modified across the tests for a new
busyness interface. In preparation for that, pass the config directly to
the init test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 87078ad38..eafa3d988 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -356,22 +356,21 @@ static int open_group(int i915, uint64_t config, int group)
 	return fd;
 }
 
-static void
-init(int gem_fd, const intel_ctx_t *ctx,
-     const struct intel_execution_engine2 *e, uint8_t sample)
+static void init(int gem_fd, const intel_ctx_t *ctx,
+		 const struct intel_execution_engine2 *e, uint64_t config)
 {
 	int fd, err = 0;
 	bool exists;
 
 	errno = 0;
-	fd = perf_i915_open(gem_fd,
-			    __I915_PMU_ENGINE(e->class, e->instance, sample));
+	fd = perf_i915_open(gem_fd, config);
+
 	if (fd < 0)
 		err = errno;
 
 	exists = gem_context_has_engine(gem_fd, ctx->id, e->flags);
 	if (intel_gen(intel_get_drm_devid(gem_fd)) < 6 &&
-	    sample == I915_SAMPLE_SEMA)
+	    config == I915_PMU_ENGINE_SEMA(e->class, e->instance))
 		exists = false;
 
 	if (exists) {
@@ -2581,13 +2580,13 @@ igt_main
 	 * is correctly rejected.
 	 */
 	test_each_engine("init-busy", fd, ctx, e)
-		init(fd, ctx, e, I915_SAMPLE_BUSY);
+		init(fd, ctx, e, I915_PMU_ENGINE_BUSY(e->class, e->instance));
 
 	test_each_engine("init-wait", fd, ctx, e)
-		init(fd, ctx, e, I915_SAMPLE_WAIT);
+		init(fd, ctx, e, I915_PMU_ENGINE_WAIT(e->class, e->instance));
 
 	test_each_engine("init-sema", fd, ctx, e)
-		init(fd, ctx, e, I915_SAMPLE_SEMA);
+		init(fd, ctx, e, I915_PMU_ENGINE_SEMA(e->class, e->instance));
 
 	/**
 	 * Test that engines show no load when idle.
-- 
2.38.1
