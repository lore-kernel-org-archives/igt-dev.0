Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D034910E00D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 10:55:04 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jun 2022 12:54:57 +0200
Message-Id: <20220610105457.30432-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t] i915/gem_exec_balancer: fix
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_exec_balancer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 186975c46..6e6bf4704 100644
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
@@ -3204,6 +3207,7 @@ static void parallel_ordering(int i915, unsigned int flags)
 			gem_close(i915, obj[i].handle);
 		free(siblings);
 		igt_spin_free(i915, spin);
+		put_ahnd(ahnd);
 	}
 }
 
-- 
2.35.1
