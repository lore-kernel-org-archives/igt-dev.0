Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  5 Aug 2022 10:09:28 +0200
Message-Id: <20220805080928.169952-3-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20220805080928.169952-1-janusz.krzysztofik@linux.intel.com>
References: <20220805080928.169952-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/gem_exec_fence: Restore pre-hang
 checks in *await-hang scenarios
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Commit c8f6aaf32d83 "tests/gem_exec_fence: Check stored values only for
valid workloads" resolved an issue, observed in *await-hang scenarios,
where a fence exposed by an invalid spin batch was signaled asynchronously
to pending checks for depended test batches still waiting for that fence.
Those checks have been disabled, weakening those scenarios.

This change takes an alternative approach: it makes the invalid spin batch
dependent on another fence so the test has full control over the moment
when that batch starts, triggers a GPU hang and its fence is signaled.
With that in place, the test is able to check synchronously if execution
of dependent test batches is still blocked on the not yet signaled fence
of the not yet completed spin batch, as it does in counterpart non-hanging
scenarios.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 tests/i915/gem_exec_fence.c | 45 ++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 11d99781b0..27af9718d9 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -309,10 +309,10 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 {
 	const struct intel_execution_engine2 *e2;
 	uint32_t scratch = gem_create(fd, 4096);
-	igt_spin_t *spin;
+	igt_spin_t *spin, *invalid_spin;
 	uint32_t *out;
 	uint64_t scratch_offset, ahnd = get_reloc_ahnd(fd, ctx->id);
-	int i;
+	int out_fence, i;
 
 	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 
@@ -325,10 +325,25 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = IGT_SPIN_FENCE_OUT |
-				     IGT_SPIN_POLL_RUN |
-				     spin_hang(flags));
+				     IGT_SPIN_POLL_RUN);
 	igt_assert(spin->out_fence != -1);
 
+	if (flags & HANG) {
+		invalid_spin = igt_spin_new(fd,
+					    .ahnd = ahnd,
+					    .ctx = ctx,
+					    .engine = e->flags,
+					    .fence = spin->out_fence,
+					    .flags = IGT_SPIN_FENCE_IN |
+						     IGT_SPIN_FENCE_OUT |
+						     IGT_SPIN_POLL_RUN |
+						     spin_hang(flags));
+		igt_assert(invalid_spin->out_fence != -1);
+		out_fence = invalid_spin->out_fence;
+	} else {
+		out_fence = spin->out_fence;
+	}
+
 	i = 0;
 	for_each_ctx_engine(fd, ctx, e2) {
 		if (!gem_class_can_store_dword(fd, e2->class))
@@ -337,12 +352,12 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 		i++;
 
 		if (flags & NONBLOCK) {
-			igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
+			igt_store_word(fd, ahnd, ctx, e2, out_fence,
 				       scratch, scratch_offset, i, i);
 		} else {
 			igt_fork(child, 1) {
 				ahnd = get_reloc_ahnd(fd, ctx->id);
-				igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
+				igt_store_word(fd, ahnd, ctx, e2, out_fence,
 					       scratch, scratch_offset, i, i);
 				put_ahnd(ahnd);
 			}
@@ -353,19 +368,21 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 	/* Long, but not too long to anger preemption disable checks */
 	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
 
-	if ((flags & HANG) == 0) {
-		/* Check for invalidly completing the task early */
+	/* Check for invalidly completing the task early */
+	if (flags & HANG) {
 		igt_assert(fence_busy(spin->out_fence));
-		for (int n = 1; n <= i; n++)
-			igt_assert_eq_u32(out[n], 0);
-
-		igt_spin_end(spin);
+		igt_fail_on(igt_spin_has_started(invalid_spin));
 	}
+	igt_assert(fence_busy(out_fence));
+	for (int n = 1; n <= i; n++)
+		igt_assert_eq_u32(out[n], 0);
+
+	igt_spin_end(spin);
 
 	igt_waitchildren();
 
 	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
-	igt_assert(!fence_busy(spin->out_fence));
+	igt_assert(!fence_busy(out_fence));
 	if ((flags & HANG) == 0) {
 		do
 			igt_assert_eq_u32(out[i], i);
@@ -373,6 +390,8 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 	}
 	munmap(out, 4096);
 
+	if (flags & HANG)
+		igt_spin_free(fd, invalid_spin);
 	igt_spin_free(fd, spin);
 	gem_close(fd, scratch);
 	put_offset(ahnd, scratch);
-- 
2.25.1
