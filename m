Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5B10E4B1
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 06:48:30 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 28 Mar 2022 12:17:21 +0530
Message-Id: <20220328064722.127301-2-riana.tauro@intel.com>
In-Reply-To: <20220328064722.127301-1-riana.tauro@intel.com>
References: <20220328064722.127301-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/i915_suspend: Add
 system-suspend-without-i915 subtest
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

Add a new subtest system-suspend-without-i915 to exercise suspend/resume cycle
without i915 module to know the system wide health of suspend/resume feature.
This test will be part of CI fast-feedback test list.

v2: Addressing review comments

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 tests/i915/i915_suspend.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index da27ce09..a610a16d 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -41,6 +41,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_kmod.h"
 #include "igt_device.h"
 
 #define OBJECT_SIZE (16*1024*1024)
@@ -202,10 +203,25 @@ test_forcewake(int fd, bool hibernate)
 	close (fw_fd);
 }
 
+static void
+test_suspend_without_i915(void)
+{
+	igt_i915_driver_unload();
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+
+	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
+	igt_assert_eq(igt_i915_driver_load(NULL), 0);
+}
+
 int fd;
 
 igt_main
 {
+	igt_describe("Validate system suspend cycle without i915 module");
+	igt_subtest("system-suspend-without-i915")
+		test_suspend_without_i915();
+
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
-- 
2.25.1
