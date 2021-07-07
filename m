Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D886E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:47:45 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y2so2333843pff.11
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:47:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:46:43 -0500
Message-Id: <20210707144643.181001-32-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 81/81] tests/i915/gem_exec_balancer: Add a
 test for combined balancing and bonding (v2)
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

v2 (Jason Ekstrand):
 - Use __set_param_fresh_context

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_balancer.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 28fc2d33a..40077aced 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -181,6 +181,7 @@ __set_param_fresh_context(int i915, struct drm_i915_gem_context_param param)
 static void invalid_balancer(int i915)
 {
 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balancer, 64);
+	I915_DEFINE_CONTEXT_ENGINES_BOND(bond, 1);
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 64);
 	struct drm_i915_gem_context_param p = {
 		.param = I915_CONTEXT_PARAM_ENGINES,
@@ -295,6 +296,32 @@ static void invalid_balancer(int i915)
 		igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
 
 		munmap(ptr + 4096, 4096);
+
+		if (count >= 2) {
+			/* You can't bond to a balanced engine */
+			memset(&bond, 0, sizeof(bond));
+			bond.base.name = I915_CONTEXT_ENGINES_EXT_BOND;
+			bond.master = ci[0];
+			bond.virtual_index = 0;
+			bond.num_bonds = 1;
+			bond.engines[0] = ci[1];
+
+			balancer.base.next_extension = to_user_pointer(&bond);
+			balancer.engine_index = 0;
+			balancer.num_siblings = count;
+			memcpy(balancer.engines, ci, count * sizeof(*ci));
+
+			memset(&engines, 0, sizeof(engines));
+			engines.engines[0].engine_class = I915_ENGINE_CLASS_INVALID;
+			engines.engines[0].engine_instance = I915_ENGINE_CLASS_INVALID_NONE;
+			engines.extensions = to_user_pointer(&balancer);
+
+			p.size = (sizeof(struct i915_context_param_engines) +
+				  sizeof(*engines.engines));
+
+			igt_assert_eq(__set_param_fresh_context(i915, p), -EINVAL);
+		}
+
 		free(ci);
 	}
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
