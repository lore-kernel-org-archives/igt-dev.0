Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1808B6E9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Aug 2021 02:03:25 +0000 (UTC)
From: Mastan Katragadda <mastanx.katragadda@intel.com>
Date: Fri, 20 Aug 2021 07:33:27 +0530
Message-Id: <20210820020327.612886-1-mastanx.katragadda@intel.com>
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

Added skip which ever gen12+ platforms not supporting bonding.

Disable bonding on gen12+ platforms aside from ones already supported by
the i915 - TGL, RKL, and ADL-S.

Link: https://cgit.freedesktop.org/drm-tip/commit/?id=ce7e75c7ef1bf8ea3d947da8c674d2f40fd7d73

Changes since V1:
	- Updated skip assertion logic (Ashutosh)

Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
---
 tests/i915/gem_exec_balancer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 2f98950b..419efda7 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -337,6 +337,7 @@ static void invalid_bonds(int i915)
 	};
 	uint32_t handle;
 	void *ptr;
+	int ret;
 
 	memset(&engines, 0, sizeof(engines));
 	igt_assert_eq(__set_param_fresh_context(i915, p), 0);
@@ -349,7 +350,9 @@ static void invalid_bonds(int i915)
 		bonds[n].num_bonds = 1;
 	}
 	engines.extensions = to_user_pointer(&bonds);
-	igt_assert_eq(__set_param_fresh_context(i915, p), 0);
+	ret = __set_param_fresh_context(i915, p);
+	igt_skip_on_f(ret  == -ENODEV, "Bonding not supported\n");
+	igt_assert_eq(ret, 0);
 
 	bonds[0].base.next_extension = -1ull;
 	igt_assert_eq(__set_param_fresh_context(i915, p), -EFAULT);
-- 
2.25.1
