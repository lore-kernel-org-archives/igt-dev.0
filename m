Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4C6EC7E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:44 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso622100pjb.5
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:44 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:42 -0500
Message-Id: <20210609043259.102581-27-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 76/93] tests/i915/gem_vm_create: Delete
 destroy racing tests
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

The races these tests attempt to exercise won't exist once we rework the
context creation to make the VM immutable state.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_vm_create.c | 104 -------------------------------------
 1 file changed, 104 deletions(-)

diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
index 70b43dc6..4b77920b 100644
--- a/tests/i915/gem_vm_create.c
+++ b/tests/i915/gem_vm_create.c
@@ -353,104 +353,6 @@ static void isolation(int i915)
 	gem_vm_destroy(i915, vm[0]);
 }
 
-static void async_destroy(int i915)
-{
-	struct drm_i915_gem_context_param arg = {
-		.ctx_id = gem_context_create(i915),
-		.value = gem_vm_create(i915),
-		.param = I915_CONTEXT_PARAM_VM,
-	};
-	igt_spin_t *spin[2];
-	int err;
-
-	spin[0] = igt_spin_new(i915,
-			       .ctx_id = arg.ctx_id,
-			       .flags = IGT_SPIN_POLL_RUN);
-	igt_spin_busywait_until_started(spin[0]);
-
-	err = __gem_context_set_param(i915, &arg);
-	if (err == -EBUSY) /* update while busy may be verboten, let it ride. */
-		err = 0;
-	igt_assert_eq(err, 0);
-
-	spin[1] = __igt_spin_new(i915, .ctx_id = arg.ctx_id);
-
-	igt_spin_end(spin[0]);
-	gem_sync(i915, spin[0]->handle);
-
-	gem_vm_destroy(i915, arg.value);
-	gem_context_destroy(i915, arg.ctx_id);
-
-	igt_spin_end(spin[1]);
-	gem_sync(i915, spin[1]->handle);
-
-	for (int i = 0; i < ARRAY_SIZE(spin); i++)
-		igt_spin_free(i915, spin[i]);
-}
-
-static void destroy_race(int i915)
-{
-	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	uint32_t *vm;
-
-	/* Check we can execute a polling spinner */
-	igt_spin_free(i915, igt_spin_new(i915, .flags = IGT_SPIN_POLL_RUN));
-
-	vm = mmap(NULL, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
-	igt_assert(vm != MAP_FAILED);
-
-	for (int child = 0; child < ncpus; child++)
-		vm[child] = gem_vm_create(i915);
-
-	igt_fork(child, ncpus) {
-		uint32_t ctx = gem_context_create(i915);
-		igt_spin_t *spin;
-
-		spin = __igt_spin_new(i915, ctx, .flags = IGT_SPIN_POLL_RUN);
-		while (!READ_ONCE(vm[ncpus])) {
-			struct drm_i915_gem_context_param arg = {
-				.ctx_id = ctx,
-				.param = I915_CONTEXT_PARAM_VM,
-				.value = READ_ONCE(vm[child]),
-			};
-			igt_spin_t *nxt;
-
-			if (__gem_context_set_param(i915, &arg))
-				continue;
-
-			nxt = __igt_spin_new(i915, ctx,
-					     .flags = IGT_SPIN_POLL_RUN);
-
-			igt_spin_end(spin);
-			gem_sync(i915, spin->handle);
-			igt_spin_free(i915, spin);
-
-			usleep(1000 + hars_petruska_f54_1_random_unsafe() % 2000);
-
-			spin = nxt;
-		}
-
-		igt_spin_free(i915, spin);
-		gem_context_destroy(i915, ctx);
-	}
-
-	igt_until_timeout(5) {
-		for (int child = 0; child < ncpus; child++) {
-			gem_vm_destroy(i915, vm[child]);
-			vm[child] = gem_vm_create(i915);
-		}
-		usleep(1000 + hars_petruska_f54_1_random_unsafe() % 2000);
-	}
-
-	vm[ncpus] = 1;
-	igt_waitchildren();
-
-	for (int child = 0; child < ncpus; child++)
-		gem_vm_destroy(i915, vm[child]);
-
-	munmap(vm, 4096);
-}
-
 igt_main
 {
 	int i915 = -1;
@@ -480,12 +382,6 @@ igt_main
 
 		igt_subtest("create-ext")
 			create_ext(i915);
-
-		igt_subtest("async-destroy")
-			async_destroy(i915);
-
-		igt_subtest("destroy-race")
-			destroy_race(i915);
 	}
 
 	igt_fixture {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
