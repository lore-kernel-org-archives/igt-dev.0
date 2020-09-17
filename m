Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C7D6E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2020 04:15:38 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu, 17 Sep 2020 09:50:05 +0530
Message-Id: <20200917042005.13347-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_set_tiling_vs_blt: Added
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
 tests/i915/gem_set_tiling_vs_blt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index cb164154..f99771ec 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -242,6 +242,8 @@ igt_main
 		batch = intel_batchbuffer_alloc(bufmgr, devid);
 	}
 
+	igt_describe("fill ring with buffer loaded parameters, chcek stride changing for"
+		     " untiled to tiled and check for synchronization on tiling change");
 	igt_subtest("untiled-to-tiled") {
 		tiling = I915_TILING_NONE;
 		tiling_after = I915_TILING_X;
@@ -250,6 +252,8 @@ igt_main
 		igt_assert(tiling_after == I915_TILING_X);
 	}
 
+	igt_describe("fill ring with buffer loaded parameters, chcek stride changing for"
+		     " tiled to untiled and check for synchronization on tiling change");
 	igt_subtest("tiled-to-untiled") {
 		tiling = I915_TILING_X;
 		tiling_after = I915_TILING_NONE;
@@ -258,6 +262,8 @@ igt_main
 		igt_assert(tiling_after == I915_TILING_NONE);
 	}
 
+	igt_describe("fill ring with buffer loaded parameters, chcek stride changing for"
+		     " tiled to tiled and check for synchronization on tiling change");
 	igt_subtest("tiled-to-tiled") {
 		tiling = I915_TILING_X;
 		tiling_after = I915_TILING_X;
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
