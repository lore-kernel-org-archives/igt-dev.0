Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35375112918
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 09:46:27 +0000 (UTC)
From: apoorva1.singh@intel.com
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com,
 kamil.konieczny@linux.intel.com
Date: Mon, 21 Feb 2022 15:26:33 +0530
Message-Id: <20220221095633.5834-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_exec_store: Add test description
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

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_exec_store.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index cb99f951..42e80041 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -35,6 +35,8 @@
 #include "igt_device.h"
 #include "igt_gt.h"
 
+IGT_TEST_DESCRIPTION("Exercise the store dword functionality using execbuf-ioctl");
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
+	       "of a buffer object");
 	test_each_engine("cachelines", fd, ctx, e)
 		store_cachelines(fd, ctx, e, 0);
 
+	igt_describe("Verify that each capable engine can store a dword to various page-sized "
+	       "buffer objects");
 	test_each_engine("pages", fd, ctx, e)
 		store_cachelines(fd, ctx, e, PAGES);
 
-- 
2.25.1
