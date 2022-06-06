Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DA2112CC6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 08:47:20 +0000 (UTC)
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 sai.gowtham.ch@intel.com, Priyanka.Dandamudi@intel.com
Date: Mon,  6 Jun 2022 14:17:36 +0530
Message-Id: <20220606084737.1707988-2-janga.rahul.kumar@intel.com>
In-Reply-To: <20220606084737.1707988-1-janga.rahul.kumar@intel.com>
References: <20220606084737.1707988-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] tests/i915/gem_render_tiled_blits : Added
 subtests description
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

Added test description to all the available subtests and
fix file name in the file description comments.

v2: Fix syntax issues.
v3: Modified subtest description.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_render_tiled_blits.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index 13c1f37a..52d67b76 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -25,7 +25,7 @@
  *
  */
 
-/** @file gem_linear_render_blits.c
+/** @file gem_render_tiled_blits.c
  *
  * This is a test of doing many blits, with a working set
  * larger than the aperture size.
@@ -49,6 +49,10 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("Tests performs cyclic forward, backward and random blits on tiled buffer "
+		      "objects using render engine with various working set sizes and compares "
+		      "outputs with expected ones.");
+
 #define WIDTH 512
 #define STRIDE (WIDTH*4)
 #define HEIGHT 512
@@ -205,16 +209,20 @@ igt_main
 		igt_require(gem_available_fences(fd) > 0);
 	}
 
+	igt_describe("Check basic functionality.");
 	igt_subtest("basic") {
 		run_test(fd, 2);
 	}
 
+	igt_describe("Check with working set size larger than aperture size.");
 	igt_subtest("aperture-thrash") {
 		count = 3 * gem_aperture_size(fd) / SIZE / 2;
 		igt_require_memory(count, SIZE, CHECK_RAM);
 		run_test(fd, count);
 	}
 
+	igt_describe("Check with working set size larger than aperture size and "
+		     "a helper process to shrink buffer object caches.");
 	igt_subtest("aperture-shrink") {
 		igt_fork_shrink_helper(fd);
 
@@ -225,6 +233,8 @@ igt_main
 		igt_stop_shrink_helper();
 	}
 
+	igt_describe("Check with working set size larger than system memory size "
+		     "resulting in usage and thrashing of swap space.");
 	igt_subtest("swap-thrash") {
 		uint64_t swap_mb = igt_get_total_swap_mb();
 		igt_require(swap_mb > 0);
-- 
2.25.1
