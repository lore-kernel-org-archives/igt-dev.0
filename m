Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3D36EC7E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:31:29 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e1so461415plh.8
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:31:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:30:23 -0500
Message-Id: <20210609043035.102359-38-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 37/93] tests/i915/gem_ctx_exec: Stop cloning
 contexts in close_race
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

Nothing in this subtest sets the set of engines on ctx0 so there's no
point in cloning them.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_ctx_exec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index a8616f95..6db2d598 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -351,7 +351,7 @@ static void close_race(int i915)
 	igt_assert(contexts != MAP_FAILED);
 
 	for (int child = 0; child < ncpus; child++)
-		contexts[child] = gem_context_clone_with_engines(i915, 0);
+		contexts[child] = gem_context_create(i915);
 
 	igt_fork(child, ncpus) {
 		spin = __igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN);
@@ -405,8 +405,7 @@ static void close_race(int i915)
 		 */
 		for (int child = 0; child < ncpus; child++) {
 			gem_context_destroy(i915, contexts[child]);
-			contexts[child] =
-				gem_context_clone_with_engines(i915, 0);
+			contexts[child] = gem_context_create(i915);
 		}
 		usleep(1000 + hars_petruska_f54_1_random_unsafe() % 2000);
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
