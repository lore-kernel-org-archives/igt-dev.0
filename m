Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732716E9A5
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2020 04:33:00 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu,  9 Jul 2020 10:01:55 +0530
Message-Id: <20200709043155.23839-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t]i915/gem_exec_suspend: Added test
 description for test case
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
To: igt-dev@lists.freedesktop.org, ranjeet1.kumar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: ranjeet kumar <ranjeet1.kumar@intel.com>

Added test description for subtest.

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: ranjeet kumar <ranjeet1.kumar@intel.com>
---
 tests/i915/gem_exec_suspend.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index d768db91..8c9258f5 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -50,6 +50,9 @@
 #define CACHED (1<<8)
 #define HANG (2<<8)
 
+IGT_TEST_DESCRIPTION("executing batch buffer objects on suspend and then checks"
+		     " for the result");
+
 static void run_test(int fd, unsigned ring, unsigned flags);
 
 static void check_bo(int fd, uint32_t handle)
@@ -312,23 +315,33 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("checks normal condition before sending into suspend");
 	igt_subtest("basic")
 		run_test(fd, ALL_ENGINES, NOSLEEP);
+	igt_describe("system in idle state no operation");
 	igt_subtest("basic-S0")
 		run_test(fd, ALL_ENGINES, IDLE);
+	igt_describe("suspend-to-mem target state and resume with with some operation");
 	igt_subtest("basic-S3-devices")
 		run_test(fd, ALL_ENGINES, SUSPEND_DEVICES);
+	igt_describe("suspend-to-mem and resume with no operation");
 	igt_subtest("basic-S3")
 		run_test(fd, ALL_ENGINES, SUSPEND);
+	igt_describe("suspend-to-disk target state and resume with with some operation");
 	igt_subtest("basic-S4-devices")
 		run_test(fd, ALL_ENGINES, HIBERNATE_DEVICES);
+	igt_describe("suspend-to-disk and resume with no operation");
 	igt_subtest("basic-S4")
 		run_test(fd, ALL_ENGINES, HIBERNATE);
 
 	for (e = intel_execution_engines; e->name; e++) {
 		for (m = modes; m->suffix; m++) {
+			igt_describe("Test normal operation write and some reloc"
+				     " operation performed");
 			igt_subtest_f("%s-uncached%s", e->name, m->suffix)
 				run_test(fd, eb_ring(e), m->mode | UNCACHED);
+			igt_describe("Wraps the SET_CACHING ioctl and then performed"
+				     " write and reloc operation");
 			igt_subtest_f("%s-cached%s", e->name, m->suffix)
 				run_test(fd, eb_ring(e), m->mode | CACHED);
 		}
@@ -339,13 +352,19 @@ igt_main
 		hang = igt_allow_hang(fd, 0, 0);
 	}
 
+	igt_describe("Start a recursive call of batch on a ring and return structure"
+		     " with suspended state");
 	igt_subtest("hang-S3")
 		run_test(fd, 0, SUSPEND | HANG);
+	igt_describe("Start a recursive call of batch on a ring and return structure"
+		     " with hibernate state");
 	igt_subtest("hang-S4")
 		run_test(fd, 0, HIBERNATE | HANG);
 
+	igt_describe("Test is to report energy level");
 	igt_subtest("power-S0")
 		power_test(fd, 0, IDLE);
+	igt_describe("Test to report power consumed and discharge rate while suspended");
 	igt_subtest("power-S3")
 		power_test(fd, 0, SUSPEND);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
