Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F0E89D66
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2020 19:11:26 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Tue, 29 Sep 2020 00:44:10 +0530
Message-Id: <20200928191410.2285284-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_mmap_offset: Added subtests
 description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Added description for remaining subtests

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
---
 tests/i915/gem_mmap_offset.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index 82203bce..3c4bfd60 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -675,8 +675,12 @@ igt_main
 	igt_describe("Verify mapping to invalid gem objects won't be created");
 	igt_subtest_f("bad-object")
 		bad_object(i915);
+
+	igt_describe("Verify mapping to buffer object with invalid flag won't be created");
 	igt_subtest_f("bad-flags")
 		bad_flags(i915);
+
+	igt_describe("Verify mapping to buffer object with invalid extensions won't be created");
 	igt_subtest_f("bad-extensions")
 		bad_extensions(i915);
 
@@ -684,11 +688,17 @@ igt_main
 	igt_subtest_f("basic-uaf")
 		basic_uaf(i915);
 
+	igt_describe("Verify mapping to a buffer object which is associated with different fds "
+	       "works in isolation");
 	igt_subtest_f("isolation")
 		isolation(i915);
+
+	igt_describe("Verify initial page faulting completes within a specified time");
 	igt_subtest_f("pf-nonblock")
 		pf_nonblock(i915);
 
+	igt_describe("Tests read/write at the address space mapped using mmap-offset in the "
+	       "tracee's memory");
 	igt_subtest_with_dynamic("ptrace")
 		test_ptrace(i915);
 
@@ -696,12 +706,17 @@ igt_main
 	igt_subtest_f("close-race")
 		close_race(i915, 20);
 
+	igt_describe("Tests the performance of mmap-offset ioctl in a flooded environment "
+	       "created using multiple cocncurrent threads");
 	igt_subtest_f("open-flood")
 		open_flood(i915, 20);
 
+	igt_describe("Verify that the memory mapped using mmap-offset is always "
+	       "initialized with 0s");
 	igt_subtest_f("clear")
 		always_clear(i915, 20);
 
+	igt_describe("Verfiy data coherency of blt with mmap-offset");
 	igt_subtest_f("blt-coherency")
 		blt_coherency(i915);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
