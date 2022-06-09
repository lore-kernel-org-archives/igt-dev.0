Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758FB112A35
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 05:28:11 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com
Date: Thu,  9 Jun 2022 10:58:18 +0530
Message-Id: <20220609052819.1980745-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220609052819.1980745-1-janga.rahul.kumar@intel.com>
References: <20220609052819.1980745-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_exec_suspend : Added subtests
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Added test description to basic subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/i915/gem_exec_suspend.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 401026ef..495748ec 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -37,6 +37,8 @@
 #include "igt_gt.h"
 #include "igt_sysfs.h"
 
+IGT_TEST_DESCRIPTION("Tests execute batches using execbuf ioctl across various suspend resume "
+		     "states and validates the execution result by comparing with expected ones.");
 #define NOSLEEP 0
 #define IDLE 1
 #define SUSPEND_DEVICES 2
@@ -296,19 +298,26 @@ igt_main
 		const char *name;
 		unsigned int flags;
 		void (*fn)(int, const intel_ctx_t *, unsigned, unsigned, uint32_t);
+		const char *describe;
 	} *test, tests_all_engines[] = {
-		{ "basic", NOSLEEP, run_test },
-		{ "basic-S0", IDLE, run_test },
-		{ "basic-S3-devices", SUSPEND_DEVICES, run_test },
-		{ "basic-S3", SUSPEND, run_test },
-		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test },
-		{ "basic-S4", HIBERNATE, run_test },
+		{ "basic", NOSLEEP, run_test, "Check basic functionality." },
+		{ "basic-S0", IDLE, run_test, "Check with suspend-to-idle target state." },
+		{ "basic-S3-devices", SUSPEND_DEVICES, run_test, "Check with suspend-to-mem target "
+						"state and suspend sequence termination point set "
+						"to device suspend state." },
+		{ "basic-S3", SUSPEND, run_test, "Check with suspend-to-mem target state, perform "
+						 "a full suspend/resume cycle." },
+		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test, "Check with suspend-to-disk "
+						"target state and suspend sequence termination "
+						"point set to device suspend state." },
+		{ "basic-S4", HIBERNATE, run_test, "Check with suspend-to-disk target state, "
+						"perform a full suspend/resume cycle." },
 		{ }
 	}, tests_power_hang[] = {
-		{ "hang-S3", SUSPEND | HANG, run_test },
-		{ "hang-S4", HIBERNATE | HANG, run_test },
-		{ "power-S0", IDLE, power_test },
-		{ "power-S3", SUSPEND, power_test },
+		{ "hang-S3", SUSPEND | HANG, run_test, "" },
+		{ "hang-S4", HIBERNATE | HANG, run_test, "" },
+		{ "power-S0", IDLE, power_test, "" },
+		{ "power-S3", SUSPEND, power_test, "" },
 		{ }
 	};
 	const struct intel_execution_engine2 *e;
@@ -359,8 +368,10 @@ igt_main
 		} \
 	}
 
-	for (test = tests_all_engines; test->name; test++)
+	for (test = tests_all_engines; test->name; test++) {
+		igt_describe(test->describe);
 		subtest_for_each_combination(test->name, intel_ctx_0(fd), test->flags, test->fn);
+	}
 
 	for (m = modes; m->suffix; m++) {
 		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
-- 
2.25.1
