Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BE110E807
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 12:42:22 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com,
 priyanka.dandamudi@intel.com
Date: Wed, 16 Feb 2022 18:05:08 +0530
Message-Id: <20220216123508.130647-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t ,
 v2] i915/gem_create: Added test description for test case
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

Cc: Melkaveri, Arjun <Arjun.Melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_create.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index 45804cde..0280fe31 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -489,30 +489,44 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 	}
 
+	igt_describe("Test tries to create a gem object of invalid size 0"
+		     " and checks if ioctl returns error.");
 	igt_subtest("create-invalid-size")
 		invalid_size_test(fd);
 
+	igt_describe("Test tries to exercise impossible size of buffer object and "
+		       "checks for the expected error.");
 	igt_subtest("create-massive")
 		massive_test(fd);
 
+	igt_describe("Test creates an object with non-aligned size request "
+		     "and assert the buffer is page aligned and tests the "
+		     "write into the padded extra memory.");
 	igt_subtest("create-valid-nonaligned")
 		valid_nonaligned_size(fd);
 
+	igt_describe("Test tries to create a gem object with size 15"
+		     " and checks if the actual created size to be default page size.");
 	igt_subtest("create-size-update")
 		size_update(fd);
 
+	igt_describe("Test tries to verify that all new objects are clear.");
 	igt_subtest("create-clear")
 		always_clear(fd, 30);
 
+	igt_describe("Test tries to create BO while GPU is busy.");
 	igt_subtest("busy-create")
 		busy_create(fd, 30);
 
+	igt_describe("Test tries to exercise create_ext placements extension");
 	igt_subtest("create-ext-placement-sanity-check")
 		create_ext_placement_sanity_check(fd);
 
+	igt_describe("Test tries to create object in each memory region using create_ext.");
 	igt_subtest("create-ext-placement-each")
 		create_ext_placement_each(fd);
 
+	igt_describe("Test tries to create object on all memory regions using create_ext.");
 	igt_subtest("create-ext-placement-all")
 		create_ext_placement_all(fd);
 
-- 
2.25.1
