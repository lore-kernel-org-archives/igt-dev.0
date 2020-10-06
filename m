Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA986E071
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2020 04:01:42 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Tue,  6 Oct 2020 09:35:14 +0530
Message-Id: <20201006040514.21500-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_set_tiling_vs_pwrite:
 Added description for test case
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
 tests/i915/gem_set_tiling_vs_pwrite.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 302ea24b..09310f2b 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -71,7 +71,7 @@ igt_simple_main
 		*ptr = 0xdeadbeef;
 	}
 
-	igt_info("testing pwrite on tiled buffer\n");
+	igt_describe("set tiling stride and domain, check pwrite coherency on tiled buffer.\n");
 	gem_write(fd, handle, 0, data, OBJECT_SIZE);
 	memset(data, 0, OBJECT_SIZE);
 	gem_read(fd, handle, 0, data, OBJECT_SIZE);
@@ -87,7 +87,8 @@ igt_simple_main
 
 	gem_set_tiling(fd, handle, I915_TILING_NONE, 0);
 
-	igt_info("testing pwrite on untiled, but still fenced buffer\n");
+	igt_describe("set tiling stride as none and domain, test pwrite coherency on"
+		     " still fenced buffer.\n");
 	gem_write(fd, handle, 0, data, OBJECT_SIZE);
 	memset(data, 0, OBJECT_SIZE);
 	gem_read(fd, handle, 0, data, OBJECT_SIZE);
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
