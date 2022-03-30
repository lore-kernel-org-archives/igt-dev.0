Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC6910F3B7
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Mar 2022 05:12:13 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 30 Mar 2022 10:41:04 +0530
Message-Id: <20220330051104.141396-1-riana.tauro@intel.com>
In-Reply-To: <20220328101339.136706-1-riana.tauro@intel.com>
References: <20220328101339.136706-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 1/2] tests/i915/i915_suspend: Add
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
This test will be part of CI fast-feedback test list

v2: Remove drm_cancel_work_at_exit
  - Add igt_describe (Anshuman)
v3: Added assertion on unload module (Anshuman)
v4: Addressed cosmetic review comments (Ashutosh)

Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 tests/i915/i915_suspend.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index da27ce09..d34b7a5d 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -41,6 +41,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
+#include "igt_kmod.h"
 #include "igt_device.h"
 
 #define OBJECT_SIZE (16*1024*1024)
@@ -202,10 +203,26 @@ test_forcewake(int fd, bool hibernate)
 	close (fw_fd);
 }
 
+static void
+test_suspend_without_i915(void)
+{
+	igt_kmsg(KMSG_INFO "Unloading i915\n");
+	igt_assert_eq(igt_i915_driver_unload(),0);
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
