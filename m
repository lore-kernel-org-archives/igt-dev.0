Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E3610E285
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Dec 2021 09:57:13 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Tue, 14 Dec 2021 15:21:47 +0530
Message-Id: <20211214095147.4084117-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/gem_exec_balancer: bonding support
 check in invalid-balancer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Bonding is disabled on GEN12+ platforms, except ones already
supported by the i915 - TGL, RKL, and ADL-S.

Currently few tests are failing for same reason, with this
change they should rightly skip with proper message.

Reference: https://cgit.freedesktop.org/drm-tip/commit/?id=ce7e75c7ef1bf8ea3d947da8c674d2f40fd7d734

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 tests/i915/gem_exec_balancer.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index d58734ab..5be38267 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -300,6 +300,8 @@ static void invalid_balancer(int i915)
 		munmap(ptr + 4096, 4096);
 
 		if (count >= 2) {
+			int ret;
+
 			/* You can't bond to a balanced engine */
 			memset(&bond, 0, sizeof(bond));
 			bond.base.name = I915_CONTEXT_ENGINES_EXT_BOND;
@@ -321,7 +323,9 @@ static void invalid_balancer(int i915)
 			p.size = (sizeof(struct i915_context_param_engines) +
 				  sizeof(*engines.engines));
 
-			igt_assert_eq(__set_param_fresh_context(i915, p), -EINVAL);
+			ret = __set_param_fresh_context(i915, p);
+			igt_skip_on_f(ret  == -ENODEV, "Bonding not supported\n");
+			igt_assert_eq(ret, -EINVAL);
 		}
 
 		free(ci);
-- 
2.31.1
