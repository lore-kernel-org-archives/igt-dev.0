Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A676EB9B
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2020 05:22:21 +0000 (UTC)
From: sandeep.kumar.parupalli@intel.com
Date: Fri, 25 Sep 2020 10:44:59 +0530
Message-Id: <20200925051459.31347-1-sandeep.kumar.parupalli@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_cs_tlb: Added test description for
 test case
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
To: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com, Arjun.Melkaveri@intel.com, ramadevi.gandi@intel.com, sandeep.kumar.parupalli@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Parupalli Sandeep Kumar <sandeep.kumar.parupalli@intel.com>

Added test description to avaliable sub test

Signed-off-by: Parupalli Sandeep Kumar <sandeep.kumar.parupalli@intel.com>
---
 tests/i915/gem_cs_tlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_cs_tlb.c b/tests/i915/gem_cs_tlb.c
index f72879c3..eeed8e6e 100644
--- a/tests/i915/gem_cs_tlb.c
+++ b/tests/i915/gem_cs_tlb.c
@@ -149,7 +149,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
 	}
-
+	igt_describe("Test checks whether we correctly invalidate cs tlb & coherency for each engine");
 	igt_subtest_with_dynamic("engines") {
 		__for_each_physical_engine(fd, e) {
 			igt_dynamic_f("%s", e->name)
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
