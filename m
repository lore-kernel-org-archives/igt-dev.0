Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B12310E402
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jan 2024 10:32:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t] tests/intel/i915_suspend: Fix WARN of invalid fd
Date: Tue,  9 Jan 2024 15:57:03 +0530
Message-Id: <20240109102703.2529736-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Move "basic-s2idle-without-i915" & "basic-s3-without-i915" to
end of the file to avoid WARNs:

(i915_suspend:7563) drmtest-WARNING: Don't attempt to close standard/invalid file descriptor: -1

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/i915_suspend.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
index c25805584..bf5a170d3 100644
--- a/tests/intel/i915_suspend.c
+++ b/tests/intel/i915_suspend.c
@@ -320,14 +320,6 @@ int fd;
 
 igt_main
 {
-	igt_describe("Validate suspend-to-idle without i915 module");
-	igt_subtest("basic-s2idle-without-i915")
-		test_suspend_without_i915(SUSPEND_STATE_FREEZE);
-
-	igt_describe("Validate S3 without i915 module");
-	igt_subtest("basic-s3-without-i915")
-		test_suspend_without_i915(SUSPEND_STATE_S3);
-
 	igt_fixture {
 		/*
 		 * Since above subtests may fail, leaving i915 module unloaded
@@ -384,4 +376,12 @@ igt_main
 
 	igt_fixture
 		drm_close_driver(fd);
+
+	igt_describe("Validate suspend-to-idle without i915 module");
+	igt_subtest("basic-s2idle-without-i915")
+		test_suspend_without_i915(SUSPEND_STATE_FREEZE);
+
+	igt_describe("Validate S3 without i915 module");
+	igt_subtest("basic-s3-without-i915")
+		test_suspend_without_i915(SUSPEND_STATE_S3);
 }
-- 
2.40.0
