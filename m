Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14616EB0C
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 17:25:02 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id c204so15010508pfc.4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 10:25:02 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 23 Mar 2021 12:24:40 -0500
Message-Id: <20210323172441.3388732-9-jason@jlekstrand.net>
In-Reply-To: <20210323172441.3388732-1-jason@jlekstrand.net>
References: <20210323172441.3388732-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/9] tests/i915/gem_exec_balancer: Stop
 cloning engines
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

We've got the parameters to setup the balancer right there; we may as
well use them directly.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_balancer.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index bfd65b29..19948ecb 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -826,8 +826,8 @@ static void bonded_slice(int i915)
 		igt_fork(child, count + 1) { /* C: arbitrary background load */
 			igt_list_del(&spin->link);
 
-			ctx = gem_context_clone(i915, ctx,
-						I915_CONTEXT_CLONE_ENGINES, 0);
+			ctx = gem_context_create(i915);
+			set_load_balancer(i915, ctx, siblings, count, NULL);
 
 			while (!READ_ONCE(*stop)) {
 				spin = igt_spin_new(i915,
@@ -2442,8 +2442,7 @@ static void nop(int i915)
 				.buffers_ptr = to_user_pointer(&batch),
 				.buffer_count = 1,
 				.flags = child + 1,
-				.rsvd1 = gem_context_clone(i915, ctx,
-							   I915_CONTEXT_CLONE_ENGINES, 0),
+				.rsvd1 = load_balancer_create(i915, ci, count),
 			};
 			struct timespec tv = {};
 			unsigned long nops;
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
