Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683946E442
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:31:51 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id q10so2653485pfj.12
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:31:51 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:33 -0500
Message-Id: <20210714173141.1381686-2-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/9] lib/intel_ctx: Add a
 intel_ctx_cfg_engine_class helper
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/intel_ctx.c | 42 +++++++++++++++++++++++++++---------------
 lib/intel_ctx.h |  1 +
 2 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index 5495fa764..f28c15544 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -267,6 +267,32 @@ const intel_ctx_t *intel_ctx_create_all_physical(int fd)
 	return intel_ctx_create(fd, &cfg);
 }
 
+/**
+ * intel_ctx_cfg_engine_class:
+ * @cfg: an intel_ctx_cfg_t
+ * @engine: an engine specifier
+ *
+ * Returns the class for the given engine.
+ */
+int intel_ctx_cfg_engine_class(const intel_ctx_cfg_t *cfg, unsigned int engine)
+{
+	if (cfg->load_balance) {
+		if (engine == 0) {
+			/* This is our virtual engine */
+			return cfg->engines[0].engine_class;
+		} else {
+			/* This is a physical engine */
+			igt_assert(engine - 1 < cfg->num_engines);
+			return cfg->engines[engine - 1].engine_class;
+		}
+	} else if (cfg->num_engines > 0) {
+		igt_assert(engine < cfg->num_engines);
+		return cfg->engines[engine].engine_class;
+	} else {
+		return gem_execbuf_flags_to_engine_class(engine);
+	}
+}
+
 /**
  * intel_ctx_destroy:
  * @fd: open i915 drm file descriptor
@@ -292,19 +318,5 @@ void intel_ctx_destroy(int fd, const intel_ctx_t *ctx)
  */
 unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine)
 {
-	if (ctx->cfg.load_balance) {
-		if (engine == 0) {
-			/* This is our virtual engine */
-			return ctx->cfg.engines[0].engine_class;
-		} else {
-			/* This is a physical engine */
-			igt_assert(engine - 1 < ctx->cfg.num_engines);
-			return ctx->cfg.engines[engine - 1].engine_class;
-		}
-	} else if (ctx->cfg.num_engines) {
-		igt_assert(engine < ctx->cfg.num_engines);
-		return ctx->cfg.engines[engine].engine_class;
-	} else {
-		return gem_execbuf_flags_to_engine_class(engine);
-	}
+	return intel_ctx_cfg_engine_class(&ctx->cfg, engine);
 }
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index d4cb435a7..9649f6d96 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -52,6 +52,7 @@ typedef struct intel_ctx_cfg {
 
 intel_ctx_cfg_t intel_ctx_cfg_for_engine(unsigned int class, unsigned int inst);
 intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd);
+int intel_ctx_cfg_engine_class(const intel_ctx_cfg_t *cfg, unsigned int engine);
 
 /**
  * intel_ctx_t:
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
