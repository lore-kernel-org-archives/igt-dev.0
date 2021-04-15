Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725A6EABA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:46 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id s14so7780125pjl.5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:12:46 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:06 -0500
Message-Id: <20210415191145.2137858-36-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 35/74] tests/i915/gem_ctx_exec: Stop cloning
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
---
 tests/i915/gem_ctx_exec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
index 03c66bf7..95b286b2 100644
--- a/tests/i915/gem_ctx_exec.c
+++ b/tests/i915/gem_ctx_exec.c
@@ -350,7 +350,7 @@ static void close_race(int i915)
 	igt_assert(contexts != MAP_FAILED);
 
 	for (int child = 0; child < ncpus; child++)
-		contexts[child] = gem_context_clone_with_engines(i915, 0);
+		contexts[child] = gem_context_create(i915);
 
 	igt_fork(child, ncpus) {
 		spin = __igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN);
@@ -404,8 +404,7 @@ static void close_race(int i915)
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
