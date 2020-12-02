Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF4C6E89C
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Dec 2020 07:05:18 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Wed,  2 Dec 2020 12:37:51 +0530
Message-Id: <20201202070751.245061-1-apoorva1.singh@intel.com>
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
To: katarzyna.dec@intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added test description to all the available subtests.

v2: Modified few descriptions to be more specific

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Dec, Katarzyna <katarzyna.dec@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_mmap.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/i915/gem_mmap.c b/tests/i915/gem_mmap.c
index 8bad9b14..25c09dd3 100644
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
@@ -236,6 +241,8 @@ igt_main
 		}
 	}
 
+	igt_describe("Test basics of newly mapped gem object like default content, write and read "
+	       "coherency, mapping existence after gem_close and unmapping");
 	igt_subtest("basic") {
 		struct drm_i915_gem_mmap arg = {
 			.handle = gem_create(fd, OBJECT_SIZE),
@@ -263,6 +270,7 @@ igt_main
 		munmap(addr, OBJECT_SIZE);
 	}
 
+	igt_describe("Map small buffer object though direct CPU access, bypassing GPU.");
 	igt_subtest("short-mmap") {
 		uint32_t handle = gem_create(fd, OBJECT_SIZE);
 
@@ -275,15 +283,28 @@ igt_main
 		gem_close(fd, handle);
 	}
 
+	igt_describe("Verify that GTT page faults are asynchronous to GPU rendering and "
+	       "completes within a specific time");
 	igt_subtest("pf-nonblock")
 		test_pf_nonblock(fd);
 
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "of a small buffer object");
 	igt_subtest("basic-small-bo")
 		test_huge_bo(-1);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "of a big buffer object");
 	igt_subtest("big-bo")
 		test_huge_bo(0);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "of a huge buffer object");
 	igt_subtest("huge-bo")
 		test_huge_bo(1);
+
+	igt_describe("Test the write read coherency and simultaneous access of different pages "
+	       "of a swap buffer object");
 	igt_subtest("swap-bo")
 		test_huge_bo(2);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
