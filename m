Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E539810F250
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Oct 2022 14:41:01 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: petri.latvala@intel.com, kamil.konieczny@linux.intel.com,
 igt-dev@lists.freedesktop.org
Date: Wed, 19 Oct 2022 15:40:48 +0100
Message-Id: <20221019144048.2421051-4-adrian.larumbe@collabora.com>
In-Reply-To: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
References: <20221019144048.2421051-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 3/3] i915/gem_ctx_isolation: Skip engine
 reset context test on DG2
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

DG2 devices have both render and compute engines, but these belong to
the same reset domain, so context preservation tests involving a reset
must be skipped.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 tests/i915/gem_ctx_isolation.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 95f55c4b9c98..757de7bd657b 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -46,6 +46,7 @@ enum {
 	VCS2 = ENGINE(I915_ENGINE_CLASS_VIDEO, 2),
 	VCS3 = ENGINE(I915_ENGINE_CLASS_VIDEO, 3),
 	VECS0 = ENGINE(I915_ENGINE_CLASS_VIDEO_ENHANCE, 0),
+	CCS0 = ENGINE(I915_ENGINE_CLASS_COMPUTE, 0),
 };
 
 #define ALL ~0u
@@ -165,6 +166,8 @@ static const struct named_register {
 
 	{ "xCS_GPR", GEN9, ALL, 0x600, 32, .relative = true },
 
+	/* TODO: add CCS0 registers */
+
 	{}
 }, ignore_registers[] = {
 	{ "RCS timestamp", GEN6, ~0u, 0x2358 },
@@ -639,6 +642,23 @@ engine_has_context_isolation(const struct intel_execution_engine2 *e,
 	return false;
 }
 
+static bool
+has_engine_class(const intel_ctx_cfg_t *cfg, unsigned int class)
+{
+	const struct i915_engine_class_instance *eci;
+	unsigned int i;
+
+	igt_require(class <= I915_ENGINE_CLASS_COMPUTE);
+
+	for (i = 0; i < cfg->num_engines; i++) {
+		eci = &cfg->engines[i];
+		if (eci->engine_class == class)
+			return true;
+	}
+
+	return false;
+}
+
 static void nonpriv(int fd, const intel_ctx_cfg_t *cfg,
 		    const struct intel_execution_engine2 *e,
 		    unsigned int flags)
@@ -922,8 +942,18 @@ static void preservation(int fd, const intel_ctx_cfg_t *cfg,
 	gem_close(fd, read_regs(fd, ahnd[num_values], ctx[num_values], e, flags));
 	igt_spin_free(fd, spin);
 
-	if (flags & RESET)
+	if (flags & RESET) {
+		/*
+		 * TODO: Handle this better if the HW ever came to behave differently.
+		 */
+		igt_skip_on_f(has_engine_class(cfg, I915_ENGINE_CLASS_RENDER) &&
+			      has_engine_class(cfg, I915_ENGINE_CLASS_COMPUTE),
+			      "Both render and compute types of engines are present on the HW. \
+			      Skipping test because architecturally we don't make cross engine \
+			      isolation guarantees on those.\n");
+
 		inject_reset_context(fd, cfg, e);
+	}
 
 	switch (flags & SLEEP_MASK) {
 	case NOSLEEP:
-- 
2.38.0
