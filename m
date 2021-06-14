Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00B89F75
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:38:17 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id t17so9100057pga.5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:38:17 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:37:02 -0500
Message-Id: <20210614163704.365989-48-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 47/77] tests/i915/gem_exec_balancer: Stop
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

We have the list of engines and bonding info in each case.  Using clone
is just being lazy for no good reason.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_balancer.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 286c11d50..2452fe93e 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -827,8 +827,7 @@ static void bonded_slice(int i915)
 		igt_fork(child, count + 1) { /* C: arbitrary background load */
 			igt_list_del(&spin->link);
 
-			ctx = gem_context_clone(i915, ctx,
-						I915_CONTEXT_CLONE_ENGINES, 0);
+			ctx = load_balancer_create(i915, siblings, count);
 
 			while (!READ_ONCE(*stop)) {
 				spin = igt_spin_new(i915,
@@ -2280,7 +2279,8 @@ static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbuf)
 	return err;
 }
 
-static uint32_t *sema(int i915, uint32_t ctx)
+static uint32_t *sema(int i915, struct i915_engine_class_instance *ci,
+		      unsigned int count)
 {
 	uint32_t *ctl;
 	struct drm_i915_gem_exec_object2 batch = {
@@ -2291,7 +2291,7 @@ static uint32_t *sema(int i915, uint32_t ctx)
 	struct drm_i915_gem_execbuffer2 execbuf = {
 		.buffers_ptr = to_user_pointer(&batch),
 		.buffer_count = 1,
-		.rsvd1 = gem_context_clone_with_engines(i915, ctx),
+		.rsvd1 = load_balancer_create(i915, ci, count),
 	};
 
 	for (int n = 1; n <= 32; n++) {
@@ -2313,12 +2313,14 @@ static uint32_t *sema(int i915, uint32_t ctx)
 	return ctl;
 }
 
-static void __waits(int i915, int timeout, uint32_t ctx, unsigned int count)
+static void __waits(int i915, int timeout,
+		    struct i915_engine_class_instance *ci,
+		    unsigned int count)
 {
 	uint32_t *semaphores[count + 1];
 
 	for (int i = 0; i <= count; i++)
-		semaphores[i] = sema(i915, ctx);
+		semaphores[i] = sema(i915, ci, count);
 
 	igt_until_timeout(timeout) {
 		int i = rand() % (count + 1);
@@ -2330,7 +2332,7 @@ static void __waits(int i915, int timeout, uint32_t ctx, unsigned int count)
 		if ((*semaphores[i] += rand() % 32) >= 32) {
 			*semaphores[i] = 0xffffffff;
 			munmap(semaphores[i], 4096);
-			semaphores[i] = sema(i915, ctx);
+			semaphores[i] = sema(i915, ci, count);
 		}
 	}
 
@@ -2359,7 +2361,7 @@ static void waits(int i915, int timeout)
 		if (count > 1) {
 			uint32_t ctx = load_balancer_create(i915, ci, count);
 
-			__waits(i915, timeout, ctx, count);
+			__waits(i915, timeout, ci, count);
 
 			gem_context_destroy(i915, ctx);
 		}
@@ -2443,8 +2445,7 @@ static void nop(int i915)
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
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
