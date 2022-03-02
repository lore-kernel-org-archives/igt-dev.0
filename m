Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD29E10F1C5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Mar 2022 09:05:25 +0000 (UTC)
From: apoorva1.singh@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Wed,  2 Mar 2022 14:45:17 +0530
Message-Id: <20220302091517.833483-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v4] i915/gem_exec_store: Add test description
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

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for test and all subtests

v2: Rebase

v3: Incorporated changes in description based
    on feedback

v4: Minor alignment adjustments

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_store.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index cb99f951..efb9907e 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -35,6 +35,8 @@
 #include "igt_device.h"
 #include "igt_gt.h"
 
+IGT_TEST_DESCRIPTION("Exercise store dword functionality using execbuf-ioctl");
+
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
 /* Without alignment detection we assume the worst-case scenario. */
@@ -432,15 +434,21 @@ igt_main
 		igt_fork_hang_detector(fd);
 	}
 
+	igt_describe("Verify that all capable engines can store dwords to a common buffer object");
 	igt_subtest("basic")
 		store_all(fd, ctx);
 
+	igt_describe("Verify that each capable engine can store a dword to a buffer object");
 	test_each_engine("dword", fd, ctx, e)
 		store_dword(fd, ctx, e);
 
+	igt_describe("Verify that each capable engine can store a dword to different cachelines "
+		     "of a buffer object");
 	test_each_engine("cachelines", fd, ctx, e)
 		store_cachelines(fd, ctx, e, 0);
 
+	igt_describe("Verify that each capable engine can store a dword to various page-sized "
+		     "buffer objects");
 	test_each_engine("pages", fd, ctx, e)
 		store_cachelines(fd, ctx, e, PAGES);
 
-- 
2.25.1
