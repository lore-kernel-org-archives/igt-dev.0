Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938CB6EB07
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 22:32:49 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id gb6so5359271pjb.0
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Mar 2021 15:32:49 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 19 Mar 2021 17:32:31 -0500
Message-Id: <20210319223233.2982842-7-jason@jlekstrand.net>
In-Reply-To: <20210319223233.2982842-1-jason@jlekstrand.net>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/i915/gem_ctx_create: Stop cloning
 engines
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

There's no reason to clone engines here, especially when context 0 is
just a default context so creating a new context will have the same
engines as context 0.
---
 tests/i915/gem_ctx_create.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 9a512a03..7d2ee8fb 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -299,9 +299,7 @@ static void maximum(int fd, int ncpus, unsigned mode)
 
 		err = -ENOMEM;
 		if (avail_mem > (count + 1) * ctx_size)
-			err =  __gem_context_clone(fd, 0,
-						   I915_CONTEXT_CLONE_ENGINES,
-						   0, &ctx_id);
+			err =  __gem_context_create(fd, &ctx_id);
 		if (err) {
 			igt_info("Created %lu contexts, before failing with '%s' [%d]\n",
 				 count, strerror(-err), -err);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
