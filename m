Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2831F89BD5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jan 2021 05:15:50 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu, 28 Jan 2021 10:43:32 +0530
Message-Id: <20210128051332.4814-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t][V2]i915/gem_exec_gttfill: Added test
 description for test case.
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
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, arjun.melkaveri@intel.com, katarzyna.dec@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description to all the available subtests.

Cc: Dec Katarzyna <katarzyna.dec@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_exec_gttfill.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
index c0e27c9b..e6c756e6 100644
--- a/tests/i915/gem_exec_gttfill.c
+++ b/tests/i915/gem_exec_gttfill.c
@@ -216,9 +216,12 @@ igt_main
 		igt_fork_hang_detector(i915);
 	}
 
+	igt_describe("Check that we can handle enough batches to fill gtt");
 	igt_subtest("basic") /* just enough to run a single pass */
 		fillgtt(i915, ALL_ENGINES, 1);
 
+	igt_describe("checks the correctness of handling enought batches to fill gtt"
+			"for each engine");
 	igt_subtest_with_dynamic("engines") {
 		__for_each_physical_engine(i915, e) {
 			if (!gem_class_can_store_dword(i915, e->class))
@@ -229,6 +232,8 @@ igt_main
 		}
 	}
 
+	igt_describe("stress test check behaviour/correctness of handling"
+			"batches to fill gtt");
 	igt_subtest("all")
 		fillgtt(i915, ALL_ENGINES, 20);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
