Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2156E0CD
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2020 11:52:46 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Tue, 27 Oct 2020 17:07:50 +0530
Message-Id: <20201027113750.21591-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/drm_import_export: Added test
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Added test description to all the test and subtests.

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/drm_import_export.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
index 65cac60d..7dba30e6 100644
--- a/tests/drm_import_export.c
+++ b/tests/drm_import_export.c
@@ -43,6 +43,7 @@
 #include "i915/gem.h"
 
 #define DURATION 10
+IGT_TEST_DESCRIPTION("Basic check to verify the behaviour of libdrm bo for prime/flink");
 
 int fd;
 drm_intel_bufmgr *bufmgr;
@@ -249,17 +250,22 @@ igt_main {
 
 		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
 	}
-
+	igt_describe("It is possible to race between unreference of the underlying BO" 
+		     " and importing it from name. Test verifies that the behaviour of libdrm"
+                     " is consistent for flink or not.");
 	igt_subtest("import-close-race-flink") {
 		use_flink = true;
 		test_import_close_race();
 	}
-
+ 	igt_describe("It is possible to race between unreference of the underlying BO"
+                     " and importing it from prime_fd. Test verifies that the behaviour of libdrm"
+                     " is consistent for prime or not.");
 	igt_subtest("import-close-race-prime") {
 		use_flink = false;
 		test_import_close_race();
 	}
-
+	igt_describe("Multithreaded test to validate the (lack of) locking in the flink"
+    		     "code in libdrm-intel.");
 	igt_subtest("flink") {
 		use_flink = true;
 
@@ -273,7 +279,8 @@ igt_main {
 		pthread_join(test_thread_id3, NULL);
 		pthread_join(test_thread_id4, NULL);
 	}
-
+	igt_describe("Multithreaded test to validate the (lack of) locking in the prime"
+                     "code in libdrm-intel.");
 	igt_subtest("prime") {
 		use_flink = false;
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
