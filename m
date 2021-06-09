Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC536EC95
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:52 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id e22so18357665pgv.10
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:48 -0500
Message-Id: <20210609043259.102581-33-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 82/93] lib/igt_dummyload: Stop supporting
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
index c7c685b8..f32fff38 100644
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
