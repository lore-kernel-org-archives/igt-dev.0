Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634B010E33B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Apr 2022 12:23:52 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 25 Apr 2022 17:51:46 +0530
Message-Id: <20220425122147.1141783-2-riana.tauro@intel.com>
In-Reply-To: <20220425122147.1141783-1-riana.tauro@intel.com>
References: <20220425122147.1141783-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add s2idle and
 s3 subtests without i915
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

From: "Tauro, Riana" <riana.tauro@intel.com>

Add new tests basic-s2idle-without-i915 and basic-s3-without-i915
to exercise s2idle and s3 cycles to know the system wide
health of suspend/resume

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 tests/i915/i915_suspend.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index d34b7a5d..8203b806 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -204,12 +204,12 @@ test_forcewake(int fd, bool hibernate)
 }
 
 static void
-test_suspend_without_i915(void)
+test_suspend_without_i915(int state)
 {
 	igt_kmsg(KMSG_INFO "Unloading i915\n");
 	igt_assert_eq(igt_i915_driver_unload(),0);
 
-	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
 
 	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
 	igt_assert_eq(igt_i915_driver_load(NULL), 0);
@@ -219,9 +219,13 @@ int fd;
 
 igt_main
 {
-	igt_describe("Validate system suspend cycle without i915 module");
-	igt_subtest("system-suspend-without-i915")
-		test_suspend_without_i915();
+	igt_describe("Validate suspend-to-idle without i915 module");
+	igt_subtest("basic-s2idle-without-i915")
+		test_suspend_without_i915(SUSPEND_STATE_FREEZE);
+
+	igt_describe("Validate S3 without i915 module");
+	igt_subtest("basic-s3-without-i915")
+		test_suspend_without_i915(SUSPEND_STATE_MEM);
 
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
-- 
2.25.1
