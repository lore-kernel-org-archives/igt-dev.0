Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6E10E87F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Mar 2022 10:19:56 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 24 Mar 2022 15:48:51 +0530
Message-Id: <20220324101852.73089-4-riana.tauro@intel.com>
In-Reply-To: <20220324101852.73089-1-riana.tauro@intel.com>
References: <20220324101852.73089-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 3/4] tests/i915/i915_suspend: Add
 suspend/resume cycle without i915 module
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

Exercise suspend/resume cycles without i915 module
to know the system wide health of suspend/resume feature
before executing i915 suspend/resume tests.

Signed-off-by: Tauro, Riana <riana.tauro@intel.com>
---
 tests/i915/i915_suspend.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index da27ce09..09f74617 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -202,6 +202,17 @@ test_forcewake(int fd, bool hibernate)
 	close (fw_fd);
 }
 
+static int
+basic_system_suspend(int fd, bool hibernate)
+{
+	int suspend = hibernate ? SUSPEND_STATE_DISK : SUSPEND_STATE_MEM;
+	close(fd);
+	fd = -1;
+        igt_i915_unload_systemsuspend(suspend,SUSPEND_TEST_NONE);
+        fd = drm_open_driver(DRIVER_INTEL);
+	return fd;
+}
+
 int fd;
 
 igt_main
@@ -210,45 +221,61 @@ igt_main
 		fd = drm_open_driver(DRIVER_INTEL);
 
 	igt_subtest("fence-restore-tiled2untiled") {
+		fd = basic_system_suspend(fd, false);
 		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, true, false);
 	}
 
 	igt_subtest("fence-restore-untiled") {
+		fd = basic_system_suspend(fd, false);
 		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, false, false);
 	}
 
-	igt_subtest("debugfs-reader")
+	igt_subtest("debugfs-reader") {
+		fd = basic_system_suspend(fd, false);
 		test_debugfs_reader(fd, false);
+	}
 
-	igt_subtest("sysfs-reader")
+	igt_subtest("sysfs-reader") {
+		fd = basic_system_suspend(fd, false);
 		test_sysfs_reader(fd, false);
+	}
 
 	igt_subtest("shrink")
 		test_shrink(fd, SUSPEND_STATE_MEM);
 
-	igt_subtest("forcewake")
+	igt_subtest("forcewake") {
+		fd = basic_system_suspend(fd, false);
 		test_forcewake(fd, false);
+	}
 
 	igt_subtest("fence-restore-tiled2untiled-hibernate") {
+		fd = basic_system_suspend(fd, true);
 		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, true, true);
 	}
 
 	igt_subtest("fence-restore-untiled-hibernate") {
+		fd = basic_system_suspend(fd, true);
 		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, false, true);
 	}
 
-	igt_subtest("debugfs-reader-hibernate")
+	igt_subtest("debugfs-reader-hibernate") {
+		fd = basic_system_suspend(fd, true);
 		test_debugfs_reader(fd, true);
+	}
 
-	igt_subtest("sysfs-reader-hibernate")
+	igt_subtest("sysfs-reader-hibernate") {
+		fd = basic_system_suspend(fd, true);
 		test_sysfs_reader(fd, true);
+	}
 
-	igt_subtest("forcewake-hibernate")
+	igt_subtest("forcewake-hibernate") {
+		fd = basic_system_suspend(fd, true);
 		test_forcewake(fd, true);
+	}
 
 	igt_fixture
 		close(fd);
-- 
2.25.1
