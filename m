Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF8BD10E03F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 10:26:34 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 12:26:27 +0200
Message-Id: <20220610102627.29585-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer: fix
 parallel_ordering with no-reloc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make sure to allocate ahnd so that spinner starts with no-reloc
execbuf otherwise this will fail on platforms with relocation disabled.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6117
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_exec_balancer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 186975c46..636c96f9e 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -3108,6 +3108,7 @@ static void parallel_ordering(int i915, unsigned int flags)
 		unsigned int count;
 		int i = 0, fence = 0;
 		uint32_t batch[16];
+		uint64_t ahnd;
 		struct drm_i915_gem_execbuffer2 execbuf;
 		struct drm_i915_gem_exec_object2 obj[32];
 		igt_spin_t *spin;
@@ -3162,7 +3163,9 @@ static void parallel_ordering(int i915, unsigned int flags)
 
 		/* Block parallel submission */
 		spin_ctx = ctx_create_engines(i915, siblings, count);
+		ahnd = get_simple_ahnd(i915, spin_ctx->id);
 		spin = __igt_spin_new(i915,
+				      .ahnd = ahnd,
 				      .ctx = spin_ctx,
 				      .engine = 0,
 				      .flags = IGT_SPIN_FENCE_OUT |
-- 
2.35.1
