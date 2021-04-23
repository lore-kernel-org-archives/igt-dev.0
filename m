Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC8F6EC87
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:42 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id e9so8897802plj.2
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:42 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:27 -0500
Message-Id: <20210423214853.876911-64-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 63/89] tests/core_hotplug: Convert to
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/core_hotunplug.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
index e6079fa3..9b28c8bb 100644
--- a/tests/core_hotunplug.c
+++ b/tests/core_hotunplug.c
@@ -258,6 +258,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 		.buffer_count = 1,
 	};
 	const struct intel_execution_engine2 *engine;
+	const intel_ctx_t *ctx;
 	int fence = -1, err = 0, status = 1;
 
 	local_debug("%s%s\n", prefix, "running i915 GPU healthcheck");
@@ -269,7 +270,9 @@ static int local_i915_healthcheck(int i915, const char *prefix)
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
 	/* As soon as a fence is open, don't fail before closing it */
-	__for_each_physical_engine(i915, engine) {
+	ctx = intel_ctx_create_all_physical(i915);
+	for_each_ctx_engine(i915, ctx, engine) {
+		execbuf.rsvd1 = ctx->id;
 		execbuf.flags = engine->flags | I915_EXEC_FENCE_OUT;
 		err = __gem_execbuf_wr(i915, &execbuf);
 		if (igt_warn_on_f(err < 0, "__gem_execbuf_wr() returned %d\n",
@@ -283,6 +286,7 @@ static int local_i915_healthcheck(int i915, const char *prefix)
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
