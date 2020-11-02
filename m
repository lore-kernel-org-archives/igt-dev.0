Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1326E0EA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2020 15:16:06 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon,  2 Nov 2020 20:49:12 +0530
Message-Id: <20201102151912.66557-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_tiled_fence_blits: Added test
 description for test case
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

Added test and subtests description

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_tiled_fence_blits.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 0a633d91..433bf7b1 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -45,6 +45,9 @@
 #include "igt.h"
 #include "igt_x86.h"
 
+IGT_TEST_DESCRIPTION("Test doing many tiled blits, with a working set larger"
+		     " than the mappable aperture size.");
+
 enum { width = 512, height = 512 };
 static uint32_t linear[width * height];
 static const int bo_size = sizeof(linear);
@@ -236,9 +239,14 @@ igt_main
 		count = (count + ncpus - 1) / ncpus;
 	}
 
+	igt_describe("Validates the content of small number of tiled buffer objects "
+	       "after random tiled blits among each other");
 	igt_subtest("basic")
 		run_test (fd, 2);
 
+	igt_describe("Validates the content of large number of tiled buffer objects "
+	       "(working set larger than the mappable aperture size) after random tiled blits among "
+	       "each other, performed on multiple parallel threads");
 	igt_subtest("normal") {
 		igt_fork(child, ncpus)
 			run_test(fd, count);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
