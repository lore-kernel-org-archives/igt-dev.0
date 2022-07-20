Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0C811BE41
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jul 2022 14:01:17 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 20 Jul 2022 16:01:03 +0200
Message-Id: <6c9bbab6a9f52ccb2458f80757be4ea5e47a444b.1658322887.git.karolina.drobnik@intel.com>
In-Reply-To: <cover.1658322887.git.karolina.drobnik@intel.com>
References: <cover.1658322887.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/gem_exec_fence: Check stored
 values only for valid workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

test_fence_await verifies if a fence used to pipeline work signals
correctly. await-hang and nb-await-hang test cases inject GPU hang,
which causes an erroneous state, meaning the fence will be signaled
without execution. The error causes an instant reset of the command
streamer for the hanging workload. This revealed a problem with how
we verify the fence state and results. The test assumes that the
error notification happens after a hang is declared, which takes
longer than submitting the next set of fences, making the test pass
every time. With the immediate reset, this might not happen, so the
assertion fails, as there are no active fences in the GPU hang case.

Move the check for active fence to the path for non-hanging workload,
and verify results only in this scenario.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
---
 tests/i915/gem_exec_fence.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index d46914c2..c1bd2a38 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -351,17 +351,19 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */

 	/* Check for invalidly completing the task early */
-	igt_assert(fence_busy(spin->out_fence));
-	for (int n = 0; n < i; n++)
-		igt_assert_eq_u32(out[n], 0);
+	if ((flags & HANG) == 0) {
+		igt_assert(fence_busy(spin->out_fence));
+		for (int n = 0; n < i; n++)
+			igt_assert_eq_u32(out[n], 0);

-	if ((flags & HANG) == 0)
 		igt_spin_end(spin);
+	}

 	igt_waitchildren();

 	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
-	while (i--)
+	igt_assert(!fence_busy(spin->out_fence));
+	while ((flags & HANG) == 0 && i--)
 		igt_assert_eq_u32(out[i], i);
 	munmap(out, 4096);

--
2.25.1
