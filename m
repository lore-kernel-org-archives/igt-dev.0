Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E6210F24F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 14:41:01 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: petri.latvala@intel.com, kamil.konieczny@linux.intel.com,
 igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 15:40:47 +0100
Message-Id: <20221019144048.2421051-3-adrian.larumbe@collabora.com>
In-Reply-To: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
References: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 2/3] i915/gem_ctx_isolation: Change
 semantics of ctx isolation uAPI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: adrian.larumbe@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

ioctl I915_PARAM_HAS_CONTEXT_ISOLATION param is meant to report whether all
the engines in the system support context isolation, but the way the return
value was being used did not respect the contract on the uAPI.

Also reckon whether engine has context isolation in user space, rather than
relying on a bitmask provided by the I915_PARAM_HAS_CONTEXT_ISOLATION ioctl,
which is due to change to a single boolean value.

Skip all engine tests for which context isolation is not supported.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 tests/i915/gem_ctx_isolation.c | 67 +++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index dc52a9a03130..95f55c4b9c98 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -626,6 +626,19 @@ static void compare_regs(int fd, const struct intel_execution_engine2 *e,
 		     num_errors, who);
 }
 
+static bool
+engine_has_context_isolation(const struct intel_execution_engine2 *e,
+			     int gen)
+{
+	if (gen > 8)
+		return true;
+
+	if (gen >= 6 && gen <= 8 && e->class == I915_ENGINE_CLASS_RENDER)
+		return true;
+
+	return false;
+}
+
 static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 		    const struct intel_execution_engine2 *e,
 		    unsigned int flags)
@@ -643,9 +656,11 @@ static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 		0xdeadbeef
 	};
 	unsigned int num_values = ARRAY_SIZE(values);
+	unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 
 	/* Sigh -- hsw: we need cmdparser access to our own registers! */
 	igt_skip_on(intel_gen(intel_get_drm_devid(fd)) < 8);
+	igt_require(engine_has_context_isolation(e, gen));
 
 	gem_quiescent_gpu(fd);
 
@@ -741,6 +756,9 @@ static void isolation(int fd, const intel_ctx_cfg_t *cfg,
 	};
 	unsigned int num_values =
 		flags & (DIRTY1 | DIRTY2) ? ARRAY_SIZE(values) : 1;
+	unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+
+	igt_require(engine_has_context_isolation(e, gen));
 
 	gem_quiescent_gpu(fd);
 
@@ -875,12 +893,15 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 		0xaaaaaaaa,
 		0xdeadbeef
 	};
+	unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const unsigned int num_values = ARRAY_SIZE(values);
 	const intel_ctx_t *ctx[num_values + 1];
 	uint32_t regs[num_values + 1][2];
 	uint64_t ahnd[num_values + 1];
 	igt_spin_t *spin;
 
+	igt_require(engine_has_context_isolation(e, gen));
+
 	gem_quiescent_gpu(fd);
 
 	ctx[num_values] = intel_ctx_create(fd, cfg);
@@ -955,45 +976,25 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 	put_ahnd(ahnd[num_values]);
 }
 
-static unsigned int __has_context_isolation(int fd)
-{
-	struct drm_i915_getparam gp;
-	int value = 0;
-
-	memset(&gp, 0, sizeof(gp));
-	gp.param = 50; /* I915_PARAM_HAS_CONTEXT_ISOLATION */
-	gp.value = &value;
-
-	igt_ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp);
-	errno = 0;
-
-	return value;
-}
-
-#define test_each_engine(e, i915, cfg, mask) \
+#define test_each_engine(e, i915, cfg) \
 	for_each_ctx_cfg_engine(i915, cfg, e) \
-		for_each_if(mask & (1 << (e)->class)) \
-			igt_dynamic_f("%s", (e)->name)
+	     igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
-	unsigned int has_context_isolation = 0;
 	const struct intel_execution_engine2 *e;
 	intel_ctx_cfg_t cfg;
 	igt_fd_t(i915);
+	unsigned int gen;
 
 	igt_fixture {
-		int gen;
-
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 		igt_require(gem_has_contexts(i915));
 		cfg = intel_ctx_cfg_all_physical(i915);
 
-		has_context_isolation = __has_context_isolation(i915);
-		igt_require(has_context_isolation);
-
 		gen = intel_gen(intel_get_drm_devid(i915));
+		igt_require(gen >= 2);
 
 		igt_warn_on_f(gen > LAST_KNOWN_GEN,
 			      "GEN not recognized! Test needs to be updated to run.\n");
@@ -1005,42 +1006,42 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("nonpriv") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			nonpriv(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("nonpriv-switch") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			nonpriv(i915, &cfg, e, DIRTY2);
 	}
 
 	igt_subtest_with_dynamic("clean") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			isolation(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("dirty-create") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			isolation(i915, &cfg, e, DIRTY1);
 	}
 
 	igt_subtest_with_dynamic("dirty-switch") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			isolation(i915, &cfg, e, DIRTY2);
 	}
 
 	igt_subtest_with_dynamic("preservation") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			preservation(i915, &cfg, e, 0);
 	}
 
 	igt_subtest_with_dynamic("preservation-S3") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			preservation(i915, &cfg, e, S3);
 	}
 
 	igt_subtest_with_dynamic("preservation-S4") {
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			preservation(i915, &cfg, e, S4);
 	}
 
@@ -1051,7 +1052,7 @@ igt_main
 	igt_subtest_with_dynamic("preservation-reset") {
 		igt_hang_t hang = igt_allow_hang(i915, 0, 0);
 
-		test_each_engine(e, i915, &cfg, has_context_isolation)
+		test_each_engine(e, i915, &cfg)
 			preservation(i915, &cfg, e, RESET);
 
 		igt_disallow_hang(i915, hang);
-- 
2.38.0
