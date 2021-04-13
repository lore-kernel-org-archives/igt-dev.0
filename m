Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E99A6E1B7
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:55:23 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id f29so10998675pgm.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:55:23 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:53:37 -0500
Message-Id: <20210413035350.261794-62-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 61/74] tests/core_hotplug: Convert to
 intel_ctx_t
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

---
 tests/core_hotunplug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index 56a88fef..32b07501 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -256,6 +256,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 		.buffer_count = 1,
 	};
 	const struct intel_execution_engine2 *engine;
+	const intel_ctx_t *ctx;
 	int fence = -1, err = 0, status = 1;
 
 	local_debug("%s%s\n", prefix, "running i915 GPU healthcheck");
@@ -267,7 +268,9 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
 	/* As soon as a fence is open, don't fail before closing it */
-	__for_each_physical_engine(i915, engine) {
+	ctx = intel_ctx_create_all_physical(i915);
+	for_each_ctx_engine(i915, ctx, engine) {
+		execbuf.rsvd1 = ctx->id;
 		execbuf.flags = engine->flags | I915_EXEC_FENCE_OUT;
 		err = __gem_execbuf_wr(i915, &execbuf);
 		if (igt_warn_on_f(err < 0, "__gem_execbuf_wr() returned %d\n",
@@ -281,6 +284,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 			break;
 		}
 	}
+	intel_ctx_destroy(i915, ctx);
 	if (fence >= 0) {
 		status = sync_fence_wait(fence, -1);
 		if (igt_warn_on_f(status < 0, "sync_fence_wait() returned %d\n",
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
