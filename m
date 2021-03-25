Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561C66EB4C
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Mar 2021 10:12:23 +0000 (UTC)
From: Anand Moon <anandx.ram.moon@intel.com>
Date: Thu, 25 Mar 2021 15:44:04 +0530
Message-Id: <20210325101404.2735-1-anandx.ram.moon@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] tests/i915/perf: Added check for testcase to get
 discarded on less than gen12 platform
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
To: igt-dev@lists.freedesktop.org, Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added check for testcase to get discarded on less than gen12 platform

Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Anand Moon <anandx.ram.moon@intel.com>
---
 tests/i915/perf.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tests/i915/perf.c b/tests/i915/perf.c
index 664fd0a9..18cf9fb1 100644
--- a/tests/i915/perf.c
+++ b/tests/i915/perf.c
@@ -5062,19 +5062,20 @@ igt_main
 	}
 
 	igt_subtest_group {
-		igt_fixture igt_require(intel_gen(devid) >= 12);
+		if (intel_gen(devid) >= 12) {
 
-		igt_describe("Test MI REPORT PERF COUNT for Gen 12");
-		igt_subtest("gen12-mi-rpc")
-			gen12_test_mi_rpc();
+			igt_describe("Test MI REPORT PERF COUNT for Gen 12");
+			igt_subtest("gen12-mi-rpc")
+				gen12_test_mi_rpc();
 
-		igt_describe("Test OA TLB invalidate");
-		igt_subtest("gen12-oa-tlb-invalidate")
-			gen12_test_oa_tlb_invalidate();
+			igt_describe("Test OA TLB invalidate");
+			igt_subtest("gen12-oa-tlb-invalidate")
+				gen12_test_oa_tlb_invalidate();
 
-		igt_describe("Measure performance for a specific context using OAR in Gen 12");
-		igt_subtest("gen12-unprivileged-single-ctx-counters")
-			gen12_test_single_ctx_render_target_writes_a_counter();
+			igt_describe("Measure performance for a specific context using OAR in Gen 12");
+			igt_subtest("gen12-unprivileged-single-ctx-counters")
+				gen12_test_single_ctx_render_target_writes_a_counter();
+		}
 	}
 
 	igt_subtest("rc6-disable")
-- 
2.31.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
