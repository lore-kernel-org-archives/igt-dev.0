Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1AD6EC9F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:34:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id ei4so617259pjb.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:34:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:59 -0500
Message-Id: <20210609043259.102581-44-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 93/93] tests/i915/gem_exec_balancer: Add a
 test for combind balancing and bonding
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

---
 tests/i915/gem_exec_balancer.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 39180258..325f0ab2 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -168,6 +168,7 @@ static uint32_t batch_create(int i915)
 static void invalid_balancer(int i915)
 {
 	I915_DEFINE_CONTEXT_ENGINES_LOAD_BALANCE(balancer, 64);
+	I915_DEFINE_CONTEXT_ENGINES_BOND(bond, 1);
 	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 64);
 	struct drm_i915_gem_context_param p = {
 		.param = I915_CONTEXT_PARAM_ENGINES,
@@ -284,6 +285,31 @@ static void invalid_balancer(int i915)
 
 		munmap(ptr + 4096, 4096);
 
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
+			igt_assert_eq(__gem_context_set_param(i915, &p), -EINVAL);
+		}
+
 		gem_context_destroy(i915, p.ctx_id);
 		free(ci);
 	}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
