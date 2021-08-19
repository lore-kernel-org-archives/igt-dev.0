Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E026E4B5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 06:10:24 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Thu, 19 Aug 2021 11:40:29 +0530
Message-Id: <20210819061029.610090-1-mastanx.katragadda@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip invalid-bonds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, tejaskumarx.surendrakumar.upadhyay@intel.com
Cc: mastanx.katragadda@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Added skip which ever gen12+ platforms not supporing bonding.

Disable bonding on gen12+ platforms aside from ones already supported by
the i915 - TGL, RKL, and ADL-S.

Link: https://cgit.freedesktop.org/drm-tip/commit/?id=ce7e75c7ef1bf8ea3d947da8c674d2f40fd7d73

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/i915/gem_exec_balancer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 2f98950b..2d9c1a53 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -349,6 +349,10 @@ static void invalid_bonds(int i915)
 		bonds[n].num_bonds = 1;
 	}
 	engines.extensions = to_user_pointer(&bonds);
+
+	igt_skip_on_f(__set_param_fresh_context(i915, p) == -ENODEV,
+			"Bonding not supported\n");
+
 	igt_assert_eq(__set_param_fresh_context(i915, p), 0);
 
 	bonds[0].base.next_extension = -1ull;
-- 
2.25.1
