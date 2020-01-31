Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8936FBB0
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 17:31:29 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Fri, 31 Jan 2020 23:01:08 +0530
Message-Id: <20200131173109.12527-9-ramalingam.c@intel.com>
In-Reply-To: <20200131173109.12527-1-ramalingam.c@intel.com>
References: <20200131173109.12527-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/9] tests/i915_suspend: skip fence related
 tests, if no mmap_gtt
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
To: igt-dev <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When mappable aperture is not available, skip the fencing related tests.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 tests/i915/i915_suspend.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
index 5a2ec76699d6..47e134b12086 100644
--- a/tests/i915/i915_suspend.c
+++ b/tests/i915/i915_suspend.c
@@ -208,11 +208,15 @@ igt_main
 	igt_fixture
 		fd = drm_open_driver(DRIVER_INTEL);
 
-	igt_subtest("fence-restore-tiled2untiled")
+	igt_subtest("fence-restore-tiled2untiled") {
+		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, true, false);
+	}
 
-	igt_subtest("fence-restore-untiled")
+	igt_subtest("fence-restore-untiled") {
+		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, false, false);
+	}
 
 	igt_subtest("debugfs-reader")
 		test_debugfs_reader(fd, false);
@@ -226,11 +230,15 @@ igt_main
 	igt_subtest("forcewake")
 		test_forcewake(fd, false);
 
-	igt_subtest("fence-restore-tiled2untiled-hibernate")
+	igt_subtest("fence-restore-tiled2untiled-hibernate") {
+		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, true, true);
+	}
 
-	igt_subtest("fence-restore-untiled-hibernate")
+	igt_subtest("fence-restore-untiled-hibernate") {
+		gem_require_mappable_ggtt(fd);
 		test_fence_restore(fd, false, true);
+	}
 
 	igt_subtest("debugfs-reader-hibernate")
 		test_debugfs_reader(fd, true);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
