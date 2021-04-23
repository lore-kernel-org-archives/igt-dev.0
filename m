Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F078F6EC7B
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:53:02 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id s14so18942781pjl.5
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:53:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:52:45 -0500
Message-Id: <20210423215252.877174-4-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 82/89] lib/igt_dummyload: Stop supporting
 ALL_ENGINES without an intel_ctx_t
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
 lib/igt_dummyload.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index ac83b331..ae6c9542 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -129,22 +129,13 @@ emit_recursive_batch(igt_spin_t *spin,
 	if (opts->engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *engine;
 
-		if (opts->ctx) {
-			for_each_ctx_engine(fd, opts->ctx, engine) {
-				if (opts->flags & IGT_SPIN_POLL_RUN &&
-				    !gem_class_can_store_dword(fd, engine->class))
-					continue;
+		igt_assert(opts->ctx);
+		for_each_ctx_engine(fd, opts->ctx, engine) {
+			if (opts->flags & IGT_SPIN_POLL_RUN &&
+			    !gem_class_can_store_dword(fd, engine->class))
+				continue;
 
-				flags[nengine++] = engine->flags;
-			}
-		} else {
-			for_each_context_engine(fd, opts->ctx_id, engine) {
-				if (opts->flags & IGT_SPIN_POLL_RUN &&
-				    !gem_class_can_store_dword(fd, engine->class))
-					continue;
-
-				flags[nengine++] = engine->flags;
-			}
+			flags[nengine++] = engine->flags;
 		}
 	} else {
 		flags[nengine++] = opts->engine;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
