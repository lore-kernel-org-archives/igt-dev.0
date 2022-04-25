Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A5410E325
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 11:07:47 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 25 Apr 2022 16:29:18 +0530
Message-Id: <20220425105919.508029-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220425105919.508029-1-priyanka.dandamudi@intel.com>
References: <20220425105919.508029-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_set_tiling_vs_blt: Add
 description for test case
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add test description for subtest.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_set_tiling_vs_blt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index bf274be9..5e3bf6a1 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -232,6 +232,7 @@ igt_main
 		bops = buf_ops_create(fd);
 	}
 
+	igt_describe("Check for proper synchronization of untiled->tiled transition.");
 	igt_subtest("untiled-to-tiled") {
 		tiling = I915_TILING_NONE;
 		tiling_after = I915_TILING_X;
@@ -240,6 +241,7 @@ igt_main
 		igt_assert(tiling_after == I915_TILING_X);
 	}
 
+	igt_describe("Check for proper synchronization of tiled->untiled transition.");
 	igt_subtest("tiled-to-untiled") {
 		tiling = I915_TILING_X;
 		tiling_after = I915_TILING_NONE;
@@ -248,6 +250,7 @@ igt_main
 		igt_assert(tiling_after == I915_TILING_NONE);
 	}
 
+	igt_describe("Check for proper synchronization of tiled->tiled transition.");
 	igt_subtest("tiled-to-tiled") {
 		tiling = I915_TILING_X;
 		tiling_after = I915_TILING_X;
-- 
2.25.1
