Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93D66E19C
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2020 05:08:29 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Tue, 21 Jul 2020 10:37:07 +0530
Message-Id: <20200721050707.14803-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_softpin: Added test description
 for test case.
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
To: arjun.melkaveri@intel.com, sai.gowtham.ch@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: sai gowtham <sai.gowtham.ch@intel.com>

Added test description for test and to all the subtests that are
available.

Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
---
 tests/i915/gem_softpin.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 202abdd8..2e2bf048 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -29,6 +29,12 @@
 #include "i915/gem.h"
 #include "igt.h"
 
+IGT_TEST_DESCRIPTION("These tests exercise the userptr ioctl to create shared buffers"
+		" between CPU and GPU. They contain error and normal usage scenarios."
+		" They also contain a couple of stress tests which copy buffers between"
+		" CPU and GPU. These tests rely on the softpin in order to pin buffers"
+		" to a certain VA");
+
 #define EXEC_OBJECT_PINNED	(1<<4)
 #define EXEC_OBJECT_SUPPORTS_48B_ADDRESS (1<<3)
 
@@ -557,30 +563,55 @@ igt_main
 		igt_require(gem_can_store_dword(fd, 0));
 	}
 
+	igt_describe("This test does negative testing like passing invalid offset values,"
+			" invalid alignment values, passing beyond bond of aperture value,"
+			" and gen8 canonical addressing, the intension of this test to"
+			" check the behaviour with invalid inputs");
 	igt_subtest("invalid")
 		test_invalid(fd);
+
+	igt_describe("This test is to verify if the concept of softpin works, where we"
+			" are trying pass different offset values to the execbuf and"
+			" check the behaviour");
 	igt_subtest("softpin")
 		test_softpin(fd);
+
+	igt_describe("This test checks the behaviour by runing on all possible"
+			" page alligned overlaps");
 	igt_subtest("overlap")
 		test_overlap(fd);
+
+	igt_describe("This test swaps the offset values of two objects and checks"
+			" the behaviour");
 	igt_subtest("reverse")
 		test_reverse(fd);
 
+	igt_describe("This test explicitly tests the no relocation support");
 	igt_subtest("noreloc")
 		test_noreloc(fd, NOSLEEP, 0);
+
+	igt_describe("Tests the no relocation support with interruptible");
 	igt_subtest("noreloc-interruptible")
 		test_noreloc(fd, NOSLEEP, INTERRUPTIBLE);
+
+	igt_describe("Check norelocations hold versus suspend/resume");
 	igt_subtest("noreloc-S3")
 		test_noreloc(fd, SUSPEND, 0);
+
+	igt_describe("Check norelocations hold versus suspend/resume");
 	igt_subtest("noreloc-S4")
 		test_noreloc(fd, HIBERNATE, 0);
 
 	for (int signal = 0; signal <= 1; signal++) {
+		igt_describe("This test checks the behaviour of softpin with busy batch");
 		igt_subtest_f("evict-active%s", signal ? "-interruptible" : "")
 			test_evict_active(fd, signal);
+
+		igt_describe("Snoop test by forcibly injecting signals");
 		igt_subtest_f("evict-snoop%s", signal ? "-interruptible" : "")
 			test_evict_snoop(fd, signal);
 	}
+	igt_describe("Checks behaviour of softpin with hung batch");
 	igt_subtest("evict-hang")
 		test_evict_hang(fd);
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
