Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748AA10ED0E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 15:44:52 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 21:14:34 +0530
Message-Id: <20220217154434.13877-3-anshuman.gupta@intel.com>
In-Reply-To: <20220217154434.13877-1-anshuman.gupta@intel.com>
References: <20220217154434.13877-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] test/perf_pmu: Change module unload
 assertion
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update the module unload assertion values according to
to returned values from igt_i915_driver_unload() and
__igt_i915_driver_unload() instead of IGT process exit
values.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/perf_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 4f3cb6145..a8ea914ca 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2101,7 +2101,7 @@ static void test_unload(unsigned int num_engines)
 
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
-		igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SKIP);
+		igt_assert(__igt_i915_driver_unload(NULL) != 0);
 		pmu_read_multi(fd[0], count, buf);
 
 		igt_debug("Close perf\n");
@@ -2114,7 +2114,7 @@ static void test_unload(unsigned int num_engines)
 	igt_waitchildren();
 
 	igt_debug("Final unload\n");
-	igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SUCCESS);
+	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
 }
 
 #define test_each_engine(T, i915, ctx, e) \
@@ -2394,7 +2394,7 @@ igt_main
 	}
 
 	igt_subtest("module-unload") {
-		igt_require(igt_i915_driver_unload() == IGT_EXIT_SUCCESS);
+		igt_require(igt_i915_driver_unload() == 0);
 		for (int pass = 0; pass < 3; pass++)
 			test_unload(num_engines);
 	}
-- 
2.26.2
