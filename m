Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589246E453
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:31:55 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id a2so3209936pgi.6
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:31:55 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:36 -0500
Message-Id: <20210714173141.1381686-5-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/9] i915: Improve the precision of command
 parser checks
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
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

The previous gem_has_cmdparser helper took an engine and did nothing
with it.  We delete the engine parameter and use the general helper for
the ALL_ENGINES cases.  For cases where we really do care about
something more precise, we add a version which takes an intel_ctx_cfg_t
and an engine specifier and is able to say whether or not that
particular engine has the command parser enabled.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/i915/gem_submission.c        | 38 ++++++++++++++++++++++++++++++--
 lib/i915/gem_submission.h        |  8 ++++---
 lib/igt_dummyload.c              | 15 ++++++++-----
 tests/i915/gem_ctx_persistence.c | 13 +++++++++--
 tests/i915/gem_eio.c             |  2 +-
 tests/i915/gem_exec_balancer.c   |  2 +-
 tests/i915/gen7_exec_parse.c     |  2 +-
 tests/i915/gen9_exec_parse.c     |  2 +-
 tests/i915/i915_hangman.c        |  2 +-
 9 files changed, 67 insertions(+), 17 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 60bedea83..f1af4f97c 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -215,7 +215,13 @@ void gem_test_all_engines(int i915)
 	close(i915);
 }
 
-int gem_cmdparser_version(int i915, uint32_t engine)
+/**
+ * gem_cmdparser_version:
+ * @i915: open i915 drm file descriptor
+ *
+ * Returns the command parser version
+ */
+int gem_cmdparser_version(int i915)
 {
 	int version = 0;
 	drm_i915_getparam_t gp = {
@@ -227,6 +233,34 @@ int gem_cmdparser_version(int i915, uint32_t engine)
 	return version;
 }
 
+/**
+ * gem_engine_has_cmdparser:
+ * @i915: open i915 drm file descriptor
+ * @class: an intel_ctx_cfg_t
+ * @engine: an engine specifier
+ *
+ * Returns true if the given engine has a command parser
+ */
+bool gem_engine_has_cmdparser(int i915, const intel_ctx_cfg_t *cfg,
+			      unsigned int engine)
+{
+	const int gen = intel_gen(intel_get_drm_devid(i915));
+	const int parser_version = gem_cmdparser_version(i915);
+	const int class = intel_ctx_cfg_engine_class(cfg, engine);
+
+	if (parser_version < 0)
+		return false;
+
+	if (gen == 7)
+		return true;
+
+	/* GFX version 9 BLT command parsing was added in parser version 10 */
+	if (gen == 9 && class == I915_ENGINE_CLASS_COPY && parser_version >= 10)
+		return true;
+
+	return false;
+}
+
 bool gem_has_blitter(int i915)
 {
 	unsigned int blt;
@@ -248,7 +282,7 @@ static bool gem_engine_has_immutable_submission(int i915, int class)
 	const int gen = intel_gen(intel_get_drm_devid(i915));
         int parser_version;
 
-	parser_version = gem_cmdparser_version(i915, 0);
+	parser_version = gem_cmdparser_version(i915);
 	if (parser_version < 0)
 		return false;
 
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index 44e6e3118..9b3e2a4e5 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -39,11 +39,13 @@ bool gem_has_guc_submission(int fd);
 bool gem_engine_has_mutable_submission(int fd, unsigned int engine);
 bool gem_class_has_mutable_submission(int fd, int class);
 
-int gem_cmdparser_version(int i915, uint32_t engine);
-static inline bool gem_has_cmdparser(int i915, uint32_t engine)
+int gem_cmdparser_version(int i915);
+static inline bool gem_has_cmdparser(int i915)
 {
-	return gem_cmdparser_version(i915, engine) > 0;
+	return gem_cmdparser_version(i915) > 0;
 }
+bool gem_engine_has_cmdparser(int i915, const intel_ctx_cfg_t *cfg,
+			      unsigned int engine);
 
 bool gem_has_blitter(int i915);
 void gem_require_blitter(int i915);
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 5354b9c2b..8a5ad5ee3 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -251,9 +251,11 @@ emit_recursive_batch(igt_spin_t *spin,
 	/* Allow ourselves to be preempted */
 	if (!(opts->flags & IGT_SPIN_NO_PREEMPTION))
 		*cs++ = MI_ARB_CHK;
-	if (opts->flags & IGT_SPIN_INVALID_CS &&
-	    !gem_has_cmdparser(fd, opts->engine))
-		*cs++ = 0xdeadbeef;
+	if (opts->flags & IGT_SPIN_INVALID_CS) {
+		igt_assert(opts->ctx);
+		if (!gem_engine_has_cmdparser(fd, &opts->ctx->cfg, opts->engine))
+			*cs++ = 0xdeadbeef;
+	}
 
 	/* Pad with a few nops so that we do not completely hog the system.
 	 *
@@ -432,8 +434,11 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 		igt_require(gem_class_can_store_dword(fd, class));
 	}
 
-	if (opts->flags & IGT_SPIN_INVALID_CS)
-		igt_require(!gem_has_cmdparser(fd, opts->engine));
+	if (opts->flags & IGT_SPIN_INVALID_CS) {
+		igt_assert(opts->ctx);
+		igt_require(!gem_engine_has_cmdparser(fd, &opts->ctx->cfg,
+						      opts->engine));
+	}
 
 	spin = spin_create(fd, opts);
 
diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index f514e2b78..c6db06b8b 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -373,6 +373,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
 static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 {
 	const struct intel_execution_engine2 *e;
+	int testable_engines = 0;
 	int dir;
 
 	cleanup(i915);
@@ -382,7 +383,11 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 	 * we forcibly terminate that context.
 	 */
 
-	igt_require(!gem_has_cmdparser(i915, ALL_ENGINES));
+	for_each_ctx_cfg_engine(i915, cfg, e) {
+		if (!gem_engine_has_cmdparser(i915, cfg, e->flags))
+			testable_engines++;
+	}
+	igt_require(testable_engines);
 
 	dir = igt_params_open(i915);
 	igt_require(dir != -1);
@@ -391,9 +396,13 @@ static void test_nohangcheck_hang(int i915, const intel_ctx_cfg_t *cfg)
 
 	for_each_ctx_cfg_engine(i915, cfg, e) {
 		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
-		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
+		const intel_ctx_t *ctx;
 		igt_spin_t *spin;
 
+		if (!gem_engine_has_cmdparser(i915, cfg, e->flags))
+			continue;
+
+		ctx = intel_ctx_create(i915, cfg);
 		spin = igt_spin_new(i915, .ctx = ctx,
 				    .engine = e->flags,
 				    .flags = IGT_SPIN_INVALID_CS);
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index b03ddab54..d6a5e23bd 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -183,7 +183,7 @@ static igt_spin_t * __spin_poll(int fd, const intel_ctx_t *ctx,
 		.flags = IGT_SPIN_NO_PREEMPTION | IGT_SPIN_FENCE_OUT,
 	};
 
-	if (!gem_has_cmdparser(fd, opts.engine) &&
+	if (!gem_engine_has_cmdparser(fd, &ctx->cfg, opts.engine) &&
 	    intel_gen(intel_get_drm_devid(fd)) != 6)
 		opts.flags |= IGT_SPIN_INVALID_CS;
 
diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 070f392b1..2f98950bb 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -2257,7 +2257,7 @@ static void hangme(int i915)
 			flags = IGT_SPIN_FENCE_IN |
 				IGT_SPIN_FENCE_OUT |
 				IGT_SPIN_NO_PREEMPTION;
-			if (!gem_has_cmdparser(i915, ALL_ENGINES))
+			if (!gem_engine_has_cmdparser(i915, &ctx->cfg, 0))
 				flags |= IGT_SPIN_INVALID_CS;
 			for (int j = 0; j < ARRAY_SIZE(c->spin); j++)  {
 				c->spin[j] = __igt_spin_new(i915, .ctx = ctx,
diff --git a/tests/i915/gen7_exec_parse.c b/tests/i915/gen7_exec_parse.c
index 8326fd5c8..67324061d 100644
--- a/tests/i915/gen7_exec_parse.c
+++ b/tests/i915/gen7_exec_parse.c
@@ -463,7 +463,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 
-		parser_version = gem_cmdparser_version(fd, 0);
+		parser_version = gem_cmdparser_version(fd);
 		igt_require(parser_version != -1);
 
 		igt_require(gem_uses_ppgtt(fd));
diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 6e6ee3af7..b35f2cb43 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -1188,7 +1188,7 @@ igt_main
 		igt_require_gem(i915);
 		gem_require_blitter(i915);
 
-		igt_require(gem_cmdparser_version(i915, I915_EXEC_BLT) >= 10);
+		igt_require(gem_cmdparser_version(i915) >= 10);
 		igt_require(intel_gen(intel_get_drm_devid(i915)) == 9);
 
 		handle = gem_create(i915, HANDLE_SIZE);
diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index a8e9891e0..ddead9493 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -236,7 +236,7 @@ test_engine_hang(const intel_ctx_t *ctx,
 	IGT_LIST_HEAD(list);
 
 	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
-		    gem_has_cmdparser(device, e->flags));
+		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
 
 	/* Fill all the other engines with background load */
 	for_each_ctx_engine(device, ctx, other) {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
