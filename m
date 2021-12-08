Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4FB6EA1C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Dec 2021 12:18:20 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Wed,  8 Dec 2021 17:37:38 +0530
Message-Id: <20211208120738.21790-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_engines: Added out fence
 for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, chris.p.wilson@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

To make spinner to be on same context for following execbuf,
spin out_fence is passed to execbuf.rsvd2.

Used IGT_SPIN_FENCE_OUT flag in spinner, we can stop
using no-preemption.

Added I915_EXEC_FENCE_IN to the execbuf.flags so that it
is executed after the spinner.
(Suggested by Chris Wilson).

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_engines.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 003dd171..0b8d5c78 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -298,7 +298,7 @@ static void execute_one(int i915)
 			spin = igt_spin_new(i915,
 					    .ahnd = ahnd,
 					    .ctx = ctx,
-					    .flags = (IGT_SPIN_NO_PREEMPTION |
+					    .flags = (IGT_SPIN_FENCE_OUT |
 						      IGT_SPIN_POLL_RUN));
 
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
@@ -314,13 +314,13 @@ static void execute_one(int i915)
 			}
 			cfg.num_engines = GEM_MAX_ENGINES;
 			ctx = intel_ctx_create(i915, &cfg);
+			execbuf.rsvd2 = spin->execbuf.rsvd2 >> 32;
 
-			igt_spin_busywait_until_started(spin);
 			for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
 				int expected = j == i ? 0 : -EINVAL;
 
 				execbuf.rsvd1 = ctx->id;
-				execbuf.flags = j;
+				execbuf.flags = j | I915_EXEC_FENCE_IN;
 				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
 					     "Failed to report the %s engine for slot %d (valid at %d)\n",
 					     j == i ? "valid" : "invalid", j, i);
@@ -331,6 +331,7 @@ static void execute_one(int i915)
 				      i != -1 ? 1 << e->class : 0);
 
 			igt_spin_free(i915, spin);
+			close(spin->execbuf.rsvd2 >> 32);
 			put_ahnd(ahnd);
 
 			gem_sync(i915, obj.handle);
-- 
2.25.1
