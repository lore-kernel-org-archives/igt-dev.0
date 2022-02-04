Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD5A10E478
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Feb 2022 20:16:35 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Sat,  5 Feb 2022 01:33:33 +0530
Message-Id: <20220204200333.6383-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
To: arjun.melkaveri@intel.com, thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Resolved __gem_execbuf error seen, by passing spin->execbuf.rsvd2 >> 32.
As we are creating ctx for each engine .
Error resolved:-
(gem_ctx_engines:4117) CRITICAL: Failed assertion: __gem_execbuf(i915, &execbuf) == expected
(gem_ctx_engines:4117) CRITICAL: Failed to report the valid engine for slot 0 (valid at 0)

Introducing IGT_SPIN_FENCE_OUT means we can stop using the
no-preemption in spinner. Added
I915_EXEC_FENCE_IN to the execbuf.flags so that it
is executed after the spinner.
This is enhancement to the code .

Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_engines.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 003dd171..de4b822c 100644
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
-- 
2.25.1
