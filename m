Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214C6EB46
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2020 11:40:07 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri,  4 Sep 2020 17:13:24 +0530
Message-Id: <20200904114324.1604117-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap: Added test description for
 test case
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
To: igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test description to all the available subtests.

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_mmap.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index f8cf052e..4ad62ad9 100644
--- a/tests/i915/gem_mmap.c
+++ b/tests/i915/gem_mmap.c
@@ -37,6 +37,8 @@
 #include <sys/ioctl.h>
 #include "drm.h"
 
+IGT_TEST_DESCRIPTION("Basic MMAP IOCTL tests for memory regions\n");
+
 #define OBJECT_SIZE 16384
 #define PAGE_SIZE 4096
 int fd;
@@ -155,6 +157,7 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
+	igt_describe("Verify mapping to invalid gem objects won't be created");
 	igt_subtest("bad-object") {
 		uint32_t real_handle = gem_create(fd, 4096);
 		uint32_t handles[20];
@@ -179,6 +182,7 @@ igt_main
 		gem_close(fd, real_handle);
 	}
 
+	igt_describe("Verify mapping to gem object with invalid offset won't be created");
 	igt_subtest("bad-offset") {
 		struct bad_offset {
 			uint64_t size;
@@ -206,6 +210,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Verify mapping to gem object with invalid size won't be created");
 	igt_subtest("bad-size") {
 		uint64_t bad_size[] = {
 			0,
@@ -229,6 +234,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Test basics of newly mapped gem object like default content, write and read "
+	       "coherency, mapping existence after gem_close and unmapping");
 	igt_subtest("basic") {
 		struct drm_i915_gem_mmap arg = {
 			.handle = gem_create(fd, OBJECT_SIZE),
@@ -256,6 +263,7 @@ igt_main
 		munmap(addr, OBJECT_SIZE);
 	}
 
+	igt_describe("Verify mapping to gem object is successful using IGT library function");
 	igt_subtest("short-mmap") {
 		uint32_t handle = gem_create(fd, OBJECT_SIZE);
 
@@ -268,15 +276,27 @@ igt_main
 		gem_close(fd, handle);
 	}
 
+	igt_describe("Verify initial page faulting completes within a specified time");
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "in a newly mapped basic small buffer object");
 	igt_subtest("basic-small-bo")
 		test_huge_bo(-1);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "in a newly mapped big buffer object");
 	igt_subtest("big-bo")
 		test_huge_bo(0);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "in a newly mapped huge buffer object");
 	igt_subtest("huge-bo")
 		test_huge_bo(1);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "in a newly mapped swap buffer object");
 	igt_subtest("swap-bo")
 		test_huge_bo(2);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
