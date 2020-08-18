Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8848C89D56
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2020 03:42:52 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Tue, 18 Aug 2020 09:09:50 +0530
Message-Id: <20200818033950.3008-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_set_tiling_vs_gtt: Added
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
 tests/i915/gem_set_tiling_vs_gtt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_set_tiling_vs_gtt.c b/tests/i915/gem_set_tiling_vs_gtt.c
index cee9c02c..bd974cd3 100644
--- a/tests/i915/gem_set_tiling_vs_gtt.c
+++ b/tests/i915/gem_set_tiling_vs_gtt.c
@@ -75,7 +75,7 @@ igt_simple_main
 
 	gem_set_tiling(fd, handle, I915_TILING_X, TEST_STRIDE);
 
-	igt_info("testing untiled->tiled\n");
+	igt_describe("testing mmap coherency of gem buffer object on untiled->tiled");
 	tiling_changed = false;
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	/* Too lazy to check for the correct tiling, and impossible anyway on
@@ -91,7 +91,7 @@ igt_simple_main
 
 	gem_set_tiling(fd, handle, I915_TILING_X, TEST_STRIDE*2);
 
-	igt_info("testing tiled->tiled\n");
+	igt_describe("testing mmap coherency of gem buffer object on tiled->tiled");
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	for (i = 0; i < OBJECT_SIZE/4; i++) {
 		int tile_row = i / (TEST_STRIDE * tile_height / 4);
@@ -116,7 +116,7 @@ igt_simple_main
 		ptr[i] = data[i] = i;
 
 	gem_set_tiling(fd, handle, I915_TILING_NONE, 0);
-	igt_info("testing tiled->untiled\n");
+	igt_describe("testing mmap coherency of gem buffer object on tiled->untiled");
 	tiling_changed = false;
 	gem_set_domain(fd, handle, I915_GEM_DOMAIN_GTT, 0);
 	/* Too lazy to check for the correct tiling, and impossible anyway on
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
