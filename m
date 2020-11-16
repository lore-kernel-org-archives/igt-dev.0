Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F27489E5A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2020 16:57:01 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 16 Nov 2020 22:29:54 +0530
Message-Id: <20201116165954.158540-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_wait: Add description for test and
 subtests
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

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_wait.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_wait.c b/tests/i915/gem_wait.c
index 7b2b1c2b..1cf40009 100644
--- a/tests/i915/gem_wait.c
+++ b/tests/i915/gem_wait.c
@@ -31,6 +31,8 @@
 #include "igt.h"
 #include "igt_vgem.h"
 
+IGT_TEST_DESCRIPTION("Tests the GEM_WAIT ioctl");
+
 static int __gem_wait(int fd, struct drm_i915_gem_wait *w)
 {
 	int err;
@@ -176,9 +178,11 @@ igt_main
 		igt_require_gem(fd);
 	}
 
+	igt_describe("Tests that GEM_WAIT ioctl returns relevant error with invalid flag");
 	igt_subtest("invalid-flags")
 		invalid_flags(fd);
 
+	igt_describe("Tests that GEM_WAIT ioctl returns relevant error with invalid buffer object");
 	igt_subtest("invalid-buf")
 		invalid_buf(fd);
 
@@ -200,8 +204,11 @@ igt_main
 			igt_fork_signal_helper();
 		}
 
-		for (const typeof(*tests) *t = tests; t->name; t++)
+		for (const typeof(*tests) *t = tests; t->name; t++) {
+			igt_describe_f("For all engines, test the GEM_WAIT ioctl waiting on "
+			       "buffer object in %s mode", t->name);
 			test_all_engines(t->name, fd, t->flags);
+		}
 
 		igt_fixture {
 			igt_stop_signal_helper();
@@ -227,8 +234,11 @@ igt_main
 			igt_fork_signal_helper();
 		}
 
-		for (const typeof(*tests) *t = tests; t->name; t++)
+		for (const typeof(*tests) *t = tests; t->name; t++) {
+			igt_describe_f("For all engines, test the GEM_WAIT ioctl waiting on "
+			       "buffer object in %s mode when hang is allowed", (t->name+5));
 			test_all_engines(t->name, fd, t->flags);
+		}
 
 		igt_fixture {
 			igt_stop_signal_helper();
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
