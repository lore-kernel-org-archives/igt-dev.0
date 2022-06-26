Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8510E06A
 for <igt-dev@lists.freedesktop.org>; Sun, 26 Jun 2022 18:08:34 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 sai.gowtham.ch@intel.com
Date: Sun, 26 Jun 2022 23:37:49 +0530
Message-Id: <20220626180750.23747-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220626180750.23747-1-sai.gowtham.ch@intel.com>
References: <20220626180750.23747-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_softpin: Added test
 description for test case.
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Added test description for test and to all the subtests that are
available.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_softpin.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index b851c90e..ce62a584 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -32,6 +32,10 @@
 #include "igt_rand.h"
 #include "intel_allocator.h"
 
+IGT_TEST_DESCRIPTION("Tests softpin feature with normal usage, invalid inputs"
+		     " scenarios and couple of eviction tests which copy buffers"
+		     " between CPU and GPU.");
+
 #define EXEC_OBJECT_PINNED	(1<<4)
 #define EXEC_OBJECT_SUPPORTS_48B_ADDRESS (1<<3)
 
@@ -1248,6 +1252,7 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 	}
 
+	igt_describe("Check that invalid inputs are handled correctly.");
 	igt_subtest("invalid")
 		test_invalid(fd);
 
@@ -1258,30 +1263,44 @@ igt_main
 			igt_require(gem_uses_full_ppgtt(fd));
 		}
 
+		igt_describe("Check full placement control under full-ppGTT.");
 		igt_subtest("zero")
 			test_zero(fd);
 
+		igt_describe("Check the last 32b page is excluded.");
 		igt_subtest("32b-excludes-last-page")
 			test_32b_last_page(fd);
 
+		igt_describe("Check the total occupancy by using pad-to-size to fill"
+			     " the entire GTT.");
 		igt_subtest("full")
 			test_full(fd);
 
+		igt_describe("Check that we can place objects at start/end of the GTT"
+			     " using the allocator.");
 		igt_subtest("allocator-basic")
 			test_allocator_basic(fd, false);
 
+		igt_describe("Check that if we can reserve a space for an object"
+			     " starting from a given offset.");
 		igt_subtest("allocator-basic-reserve")
 			test_allocator_basic(fd, true);
 
+		igt_describe("Check that we can combine manual placement with automatic"
+			     " GTT placement.");
 		igt_subtest("allocator-nopin")
 			test_allocator_nopin(fd, false);
 
+		igt_describe("Check that we can combine manual placement with automatic"
+			     " GTT placement and reserves/unreserves space for objects.");
 		igt_subtest("allocator-nopin-reserve")
 			test_allocator_nopin(fd, true);
 
+		igt_describe("Check if multiple processes can use alloctor.");
 		igt_subtest("allocator-fork")
 			test_allocator_fork(fd);
 
+		igt_describe("Exercise eviction with softpinning.");
 		test_each_engine("allocator-evict", fd, ctx, e)
 			test_allocator_evict(fd, ctx, e->flags, 20);
 
@@ -1294,28 +1313,45 @@ igt_main
 	igt_subtest("safe-alignment")
 		safe_alignment(fd);
 
+	igt_describe("Check softpinning of a gem buffer object.");
 	igt_subtest("softpin")
 		test_softpin(fd);
+
+	igt_describe("Check all the possible pages aligned overlaps.");
 	igt_subtest("overlap")
 		test_overlap(fd);
+
+	igt_describe("Check that if the user demands the vma be swapped.");
 	igt_subtest("reverse")
 		test_reverse(fd);
 
+	igt_describe("Check that no relocs support works.");
 	igt_subtest("noreloc")
 		test_noreloc(fd, NOSLEEP, 0);
+
+	igt_describe("Check no relocs support with interruptible.");
 	igt_subtest("noreloc-interruptible")
 		test_noreloc(fd, NOSLEEP, INTERRUPTIBLE);
+
+	igt_describe("Check norelocs survives after suspend to RAM/resume cycle.");
 	igt_subtest("noreloc-S3")
 		test_noreloc(fd, SUSPEND, 0);
+
+	igt_describe("Check norelocs survives after suspend to disk/resume cycle.");
 	igt_subtest("noreloc-S4")
 		test_noreloc(fd, HIBERNATE, 0);
 
 	for (int signal = 0; signal <= 1; signal++) {
+		igt_describe("Stress test which checks softpin with busy batch.");
 		igt_subtest_f("evict-active%s", signal ? "-interruptible" : "")
 			test_evict_active(fd, signal);
+
+		igt_describe("check that Snooping test by forcibly injecting signals works.");
 		igt_subtest_f("evict-snoop%s", signal ? "-interruptible" : "")
 			test_evict_snoop(fd, signal);
 	}
+
+	igt_describe("Checks behaviour of softpin with hung batch.");
 	igt_subtest("evict-hang")
 		test_evict_hang(fd);
 
-- 
2.35.1
