Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BB76EC6C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2019 15:55:46 +0000 (UTC)
From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Fri, 20 Dec 2019 21:10:30 +0530
Message-Id: <20191220154030.25684-2-krishnaiah.bommu@intel.com>
In-Reply-To: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
References: <20191220154030.25684-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/gem_ctx_persistence:
 pre-emption support check.
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
Cc: Brian <brian.welty@intel.com>, Welty@freedesktop.org, Dutt@freedesktop.org, "Bommu,  Krishnaiah" <krishnaiah.bommu@intel.com>, Bommu@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Check for I915_SCHEDULER_CAP_PREEMPTION support, if driver has support for
pre-emption test will continue otherwise skip the test

Cc: Welty, Brian <brian.welty@intel.com>
Cc: Dutt, Sudeep <sudeep.dutt@intel.com>
Signed-off-by: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
---
 tests/i915/gem_ctx_persistence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
index d68431ae..282ce082 100644
--- a/tests/i915/gem_ctx_persistence.c
+++ b/tests/i915/gem_ctx_persistence.c
@@ -703,6 +703,7 @@ igt_main
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(i915);
 
+		igt_require(gem_scheduler_has_preemption(i915));
 		igt_require(has_persistence(i915));
 		enable_hangcheck(i915);
 
-- 
2.24.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
