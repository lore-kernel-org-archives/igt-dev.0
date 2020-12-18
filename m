Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D799C8933D
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Dec 2020 16:55:00 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 18 Dec 2020 22:27:24 +0530
Message-Id: <20201218165724.325380-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_store: Add test description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for test and all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_store.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 771ee169..31856617 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -34,6 +34,8 @@
 #include "igt_device.h"
 #include "igt_gt.h"
 
+IGT_TEST_DESCRIPTION("Test the store functionality using execbuf-ioctl");
+
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 static void store_dword(int fd, const struct intel_execution_engine2 *e)
@@ -346,15 +348,21 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Verify that all engines can store dwords to a common buffer object");
 	igt_subtest("basic")
 		store_all(fd);
 
+	igt_describe("Verify that each engine can store a dword to a buffer object");
 	test_each_engine("dword", fd, e)
 		store_dword(fd, e);
 
+	igt_describe("Verify that each engine can store a dword to different cachelines "
+	       "of a buffer object");
 	test_each_engine("cachelines", fd, e)
 		store_cachelines(fd, e, 0);
 
+	igt_describe("Verify that each engine can store a dword to various page-sized "
+	       "buffer objects");
 	test_each_engine("pages", fd, e)
 		store_cachelines(fd, e, PAGES);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
