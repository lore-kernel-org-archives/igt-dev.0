Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396C110E699
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 06:42:32 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Fri, 11 Mar 2022 12:04:52 +0530
Message-Id: <20220311063453.180090-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220311063453.180090-1-priyanka.dandamudi@intel.com>
References: <20220311063453.180090-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_wait: Add description for test
 and subtests
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

Add description for test and all the subtests

v2: Rebase

v3: Modified descriptions

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_wait.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index b17927b6..860a615c 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -32,6 +32,8 @@
 #include "igt.h"
 #include "igt_vgem.h"
 
+IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
+
 static int __gem_wait(int fd, struct drm_i915_gem_wait *w)
 {
 	int err;
@@ -185,9 +187,11 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 	}
 
+	igt_describe("Verify that GEM_WAIT called with invalid flag will fail.");
 	igt_subtest("invalid-flags")
 		invalid_flags(fd);
 
+	igt_describe("Verify that GEM_WAIT called with invalid buffer object will fail.");
 	igt_subtest("invalid-buf")
 		invalid_buf(fd);
 
@@ -209,8 +213,11 @@ igt_main
 			igt_fork_signal_helper();
 		}
 
-		for (const typeof(*tests) *t = tests; t->name; t++)
+		for (const typeof(*tests) *t = tests; t->name; t++) {
+			igt_describe_f("Verify GEM_WAIT basic functionality in"
+				       " %s mode.", t->name);
 			test_all_engines(t->name, fd, ctx, t->flags);
+		}
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -236,8 +243,11 @@ igt_main
 			igt_fork_signal_helper();
 		}
 
-		for (const typeof(*tests) *t = tests; t->name; t++)
+		for (const typeof(*tests) *t = tests; t->name; t++) {
+			igt_describe_f("Verify GEM_WAIT functionality in %s mode,"
+				       " when hang is allowed.", (t->name+5));
 			test_all_engines(t->name, fd, ctx, t->flags);
+		}
 
 		igt_fixture {
 			igt_stop_signal_helper();
-- 
2.25.1
