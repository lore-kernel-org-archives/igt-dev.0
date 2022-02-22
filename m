Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD410E893
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 14:08:52 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Feb 2022 19:38:38 +0530
Message-Id: <20220222140838.21823-3-anshuman.gupta@intel.com>
In-Reply-To: <20220222140838.21823-1-anshuman.gupta@intel.com>
References: <20220222140838.21823-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/2] test/perf_pmu: Change module unload
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

v2:
- Use igt_assert_neq(__igt_i915_driver_unload(NULL), 0). [Petri]
v3:
- Use igt_assert(ret !=0 && !(strcmp(who, "i915"))). [Ashutosh]

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/perf_pmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 4f3cb6145..c48cc07df 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -2046,7 +2046,8 @@ static void test_unload(unsigned int num_engines)
 		const struct intel_execution_engine2 *e;
 		int fd[4 + num_engines * 3], i;
 		uint64_t *buf;
-		int count = 0;
+		int count = 0, ret;
+		const char *who;
 		int i915;
 
 		i915 = __drm_open_driver(DRIVER_INTEL);
@@ -2101,7 +2102,8 @@ static void test_unload(unsigned int num_engines)
 
 		igt_debug("Read %d events from perf and trial unload\n", count);
 		pmu_read_multi(fd[0], count, buf);
-		igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SKIP);
+		ret = __igt_i915_driver_unload(&who);
+		igt_assert(ret != 0 && !strcmp(who, "i915"));
 		pmu_read_multi(fd[0], count, buf);
 
 		igt_debug("Close perf\n");
@@ -2114,7 +2116,7 @@ static void test_unload(unsigned int num_engines)
 	igt_waitchildren();
 
 	igt_debug("Final unload\n");
-	igt_assert_eq(__igt_i915_driver_unload(NULL), IGT_EXIT_SUCCESS);
+	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
 }
 
 #define test_each_engine(T, i915, ctx, e) \
@@ -2394,7 +2396,7 @@ igt_main
 	}
 
 	igt_subtest("module-unload") {
-		igt_require(igt_i915_driver_unload() == IGT_EXIT_SUCCESS);
+		igt_require(igt_i915_driver_unload() == 0);
 		for (int pass = 0; pass < 3; pass++)
 			test_unload(num_engines);
 	}
-- 
2.26.2
