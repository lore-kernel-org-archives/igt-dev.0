Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C78F10E361
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Mar 2022 14:17:51 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: kamil.konieczny@linux.intel.com, igt-dev@lists.freedesktop.org,
 arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com
Date: Mon, 21 Mar 2022 19:39:49 +0530
Message-Id: <20220321140950.268112-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220321140950.268112-1-priyanka.dandamudi@intel.com>
References: <20220321140950.268112-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/drm_import_export: Added test
 description for test case
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

Added test description to all the test and subtests.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
---
 tests/drm_import_export.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/drm_import_export.c b/tests/drm_import_export.c
index 65cac60d..e21ac8ae 100644
--- a/tests/drm_import_export.c
+++ b/tests/drm_import_export.c
@@ -43,6 +43,7 @@
 #include "i915/gem.h"
 
 #define DURATION 10
+IGT_TEST_DESCRIPTION("Basic check to verify the behaviour of libdrm bo for prime/flink");
 
 int fd;
 drm_intel_bufmgr *bufmgr;
@@ -250,16 +251,22 @@ igt_main {
 		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
 	}
 
+	igt_describe("Verify whether the behaviour of libdrm"
+                     " is consistent for flink or not.");
 	igt_subtest("import-close-race-flink") {
 		use_flink = true;
 		test_import_close_race();
 	}
 
+ 	igt_describe("Verify whether the behaviour of libdrm"
+                     " is consistent for prime or not.");
 	igt_subtest("import-close-race-prime") {
 		use_flink = false;
 		test_import_close_race();
 	}
 
+	igt_describe("Multithreaded test to validate the (lack of) locking in the flink"
+    		     "code in libdrm-intel.");
 	igt_subtest("flink") {
 		use_flink = true;
 
@@ -274,6 +281,8 @@ igt_main {
 		pthread_join(test_thread_id4, NULL);
 	}
 
+	igt_describe("Multithreaded test to validate the (lack of) locking in the prime"
+                     "code in libdrm-intel.");
 	igt_subtest("prime") {
 		use_flink = false;
 
-- 
2.25.1
