Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF76E226
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 11:56:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 75-20020a9d08510000b02904acfe6bcccaso2129029oty.12
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 04:56:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 06:56:12 -0500
Message-Id: <20210714115612.1350201-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] test/i915/gem_ringfill: Create contexts on
 the right FD with NEW_FD
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

We originally did the re-open dance because we were copying engines from
ctx0 on one FD to ctx0 on the other and we needed both FDs.  When we
converted to intel_ctx_t in 81e16a59d788 ("tests/i915/gem_ringfill:
Convert to intel_ctx_t"), we got the FDs wrong in the context create.
This both fixes the bug and avoids the whold FD dance.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Fixes: 81e16a59d788 ("tests/i915/gem_ringfill: Convert to intel_ctx_t")
---
 tests/i915/gem_ringfill.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
index 5d2169d65..d32d47994 100644
--- a/tests/i915/gem_ringfill.c
+++ b/tests/i915/gem_ringfill.c
@@ -203,11 +203,8 @@ static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
 		igt_fork(child, nchild) {
 			const intel_ctx_t *child_ctx = NULL;
 			if (flags & NEWFD) {
-				int this;
-
-				this = gem_reopen_driver(fd);
+				fd = gem_reopen_driver(fd);
 				child_ctx = intel_ctx_create(fd, &ctx->cfg);
-				fd = this;
 
 				setup_execbuf(fd, child_ctx, &execbuf, obj, reloc, ring);
 			}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
