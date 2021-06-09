Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F136EC9A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:57 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id x73so17450433pfc.8
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:57 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:51 -0500
Message-Id: <20210609043259.102581-36-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 85/93] igt/dummyload: Require an intel_ctx_t
 for POLL_RUN and !ALL_ENGINES
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

This lets us drop gem_context_lookup_engines

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_engine_topology.c | 29 -----------------------------
 lib/i915/gem_engine_topology.h |  3 ---
 lib/igt_dummyload.c            | 20 +++++---------------
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 1b6ac6d2..612519ec 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -316,35 +316,6 @@ intel_engine_list_for_ctx_cfg(int fd, const intel_ctx_cfg_t *cfg)
 	}
 }
 
-static int gem_topology_get_param(int fd,
-				  struct drm_i915_gem_context_param *p)
-{
-	if (igt_only_list_subtests())
-		return -ENODEV;
-
-	if (__gem_context_get_param(fd, p))
-		return -1; /* using default engine map */
-
-	return 0;
-}
-
-int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
-			      struct intel_execution_engine2 *e)
-{
-	DEFINE_CONTEXT_ENGINES_PARAM(engines, param, ctx_id, GEM_MAX_ENGINES);
-
-	/* a bit paranoic */
-	igt_assert(e);
-
-	if (gem_topology_get_param(fd, &param) || !param.size)
-		return -EINVAL;
-
-	e->class = engines.engines[engine].engine_class;
-	e->instance = engines.engines[engine].engine_instance;
-
-	return 0;
-}
-
 /**
  * gem_has_engine_topology:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 8f5987f6..991d0ff8 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,9 +61,6 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
-int gem_context_lookup_engine(int fd, uint64_t engine, uint32_t ctx_id,
-			      struct intel_execution_engine2 *e);
-
 bool gem_context_has_engine_map(int fd, uint32_t ctx);
 
 bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index f32fff38..315de2a5 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -421,22 +421,12 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 {
 	igt_spin_t *spin;
 
-	if (opts->engine != ALL_ENGINES) {
-		struct intel_execution_engine2 e;
-		int class;
-
-		if (opts->ctx) {
-			class = opts->ctx->cfg.engines[opts->engine].engine_class;
-		} else if (!gem_context_lookup_engine(fd, opts->engine,
-						      opts->ctx_id, &e)) {
-			class = e.class;
-		} else {
-			gem_require_ring(fd, opts->engine);
-			class = gem_execbuf_flags_to_engine_class(opts->engine);
-		}
+	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine != ALL_ENGINES) {
+		unsigned int class;
 
-		if (opts->flags & IGT_SPIN_POLL_RUN)
-			igt_require(gem_class_can_store_dword(fd, class));
+		igt_assert(opts->ctx);
+		class = intel_ctx_engine_class(opts->ctx, opts->engine);
+		igt_require(gem_class_can_store_dword(fd, class));
 	}
 
 	if (opts->flags & IGT_SPIN_INVALID_CS)
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
