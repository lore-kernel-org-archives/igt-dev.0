Return-path: <SRS0=Vgj9=TF=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D69C10E15C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Feb 2022 12:44:03 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Tue, 22 Feb 2022 18:06:56 +0530
Message-Id: <20220222123656.19055-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,
 v3] i915/gem_create: Added test description for test case
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

Added test description to all the available subtests.

v2: Added test description for newly added subtets.

v3: Updated test descriptions.

Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_create.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 45804cde..9b5786f3 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -59,9 +59,8 @@
 #include "i915/gem_mman.h"
 #include "i915_drm.h"
 
-IGT_TEST_DESCRIPTION("This is a test for the gem_create ioctl,"
-		     " where the goal is to simply ensure that basics work"
-		     " and invalid input combinations are rejected.");
+IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
+		     " and that invalid input combinations are rejected.");
 
 #define PAGE_SIZE 4096
 
@@ -489,30 +488,44 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
+	igt_describe("Try to create a gem object of invalid size 0"
+		     " and check if ioctl returns error.");
 	igt_subtest("create-invalid-size")
 		invalid_size_test(fd);
 
+	igt_describe("Exercise creation of buffer object with impossible"
+		     " size and check for the expected error.");
 	igt_subtest("create-massive")
 		massive_test(fd);
 
+	igt_describe("Try to create an object with non-aligned size, check"
+		     " we got one with size aligned up to page size and test"
+		     " we can write into the padded extra memory.");
 	igt_subtest("create-valid-nonaligned")
 		valid_nonaligned_size(fd);
 
+	igt_describe("Try to create a gem object with size 15"
+		     " and check actual created size.");
 	igt_subtest("create-size-update")
 		size_update(fd);
 
+	igt_describe("Verify that all new objects are clear.");
 	igt_subtest("create-clear")
 		always_clear(fd, 30);
 
+	igt_describe("Create buffer objects while GPU is busy.");
 	igt_subtest("busy-create")
 		busy_create(fd, 30);
 
+	igt_describe("Exercise create_ext placements extension.");
 	igt_subtest("create-ext-placement-sanity-check")
 		create_ext_placement_sanity_check(fd);
 
+	igt_describe("Create object in each memory region using create_ext.");
 	igt_subtest("create-ext-placement-each")
 		create_ext_placement_each(fd);
 
+	igt_describe("Create object on all memory regions using create_ext.");
 	igt_subtest("create-ext-placement-all")
 		create_ext_placement_all(fd);
 
-- 
2.25.1
