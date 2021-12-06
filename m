Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E25F6FAD0
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Dec 2021 16:53:30 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Mon,  6 Dec 2021 22:12:51 +0530
Message-Id: <20211206164251.25983-1-arjun.melkaveri@intel.com>
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

Used IGT_SPIN_FENCE_OUT flag in spinner.

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ctx_engines.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
index 003dd171..c746f268 100644
--- a/tests/i915/gem_ctx_engines.c
+++ b/tests/i915/gem_ctx_engines.c
@@ -298,7 +298,7 @@ static void execute_one(int i915)
 			spin = igt_spin_new(i915,
 					    .ahnd = ahnd,
 					    .ctx = ctx,
-					    .flags = (IGT_SPIN_NO_PREEMPTION |
+					    .flags = (IGT_SPIN_FENCE_OUT | IGT_SPIN_NO_PREEMPTION |
 						      IGT_SPIN_POLL_RUN));
 
 			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
@@ -320,6 +320,7 @@ static void execute_one(int i915)
 				int expected = j == i ? 0 : -EINVAL;
 
 				execbuf.rsvd1 = ctx->id;
+				execbuf.rsvd2 = spin->out_fence;
 				execbuf.flags = j;
 				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
 					     "Failed to report the %s engine for slot %d (valid at %d)\n",
-- 
2.25.1
