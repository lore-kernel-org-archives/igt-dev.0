Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2613F6E2AF
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 03:02:57 +0000 (UTC)
From: ranjeet1.kumar@intel.com
Date: Thu, 23 Jul 2020 08:31:55 +0530
Message-Id: <20200723030155.1609-1-ranjeet1.kumar@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ppgtt: Added description for test
 case
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
 tests/i915/gem_ppgtt.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/gem_ppgtt.c b/tests/i915/gem_ppgtt.c
index 8c02e4af..b98c2144 100644
--- a/tests/i915/gem_ppgtt.c
+++ b/tests/i915/gem_ppgtt.c
@@ -45,6 +45,10 @@
 #define HEIGHT 512
 #define SIZE (HEIGHT*STRIDE)
 
+IGT_TEST_DESCRIPTION("Exercise full ppgtt in multiple fd, create context and"
+		     " surfaces for each child process and do copy operation"
+		     " on render and blitter engine.");
+
 static drm_intel_bo *create_bo(drm_intel_bufmgr *bufmgr,
 			       uint32_t pixel)
 {
@@ -300,6 +304,9 @@ igt_main
 		close(fd);
 	}
 
+	igt_describe("Checks for enough memory for child process to co-exist,"
+		     " each child keeps its own surfaces and perform copy"
+		     " operation on blitter and render" );
 	igt_subtest("blt-vs-render-ctx0") {
 		drm_intel_bo *bcs[1], *rcs[N_CHILD];
 
@@ -312,6 +319,10 @@ igt_main
 		surfaces_check(rcs, N_CHILD, 0x8000 / N_CHILD);
 	}
 
+	igt_describe("Create context for the each child process, enough memory"
+		     " required for the child to co-exist and all writes are"
+		     " flushed into the context for the execution first start"
+		     " with rcs then bcs ");
 	igt_subtest("blt-vs-render-ctxN") {
 		drm_intel_bo *bcs[1], *rcs[N_CHILD];
 
@@ -324,6 +335,10 @@ igt_main
 		surfaces_check(rcs, N_CHILD, 0x8000 / N_CHILD);
 	}
 
+	igt_describe("Wraps gem_open ioctl which is use to export a gem buffer"
+		     " objects into device global flink namespace, clear flinked"
+		     " bo so new bo gets same size and offset and flush should be"
+		     " done before VMA leaks");
 	igt_subtest("flink-and-close-vma-leak")
 		flink_and_close();
 }
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
