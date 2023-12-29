Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C49510E280
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Dec 2023 10:24:17 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Subject: [i-g-t] tests/kms_feature_discovery: Add basic sanity test
Date: Fri, 29 Dec 2023 15:48:53 +0530
Message-Id: <20231229101853.897242-1-bhanuprakash.modem@intel.com>
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

Add basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is
working fine.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_feature_discovery.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
index 5bca9ad76..eb762928f 100644
--- a/tests/kms_feature_discovery.c
+++ b/tests/kms_feature_discovery.c
@@ -44,6 +44,9 @@
 #include "igt_types.h"
 
 /**
+ * SUBTEST: basic-rte
+ * Description: Basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is working fine.
+ *
  * SUBTEST: display
  * Description: Make sure that we have display support.
  *
@@ -87,6 +90,17 @@ igt_main {
 		debugfs_fd = igt_debugfs_dir(fd);
 	}
 
+	igt_describe("Basic sanity test to make sure DRM_IOCTL_MODE_GETRESOURCES is working fine.");
+	igt_subtest("basic-rte") {
+		drmModeResPtr resources = drmModeGetResources(fd);
+
+		/* Operation not supported on non-display platforms. */
+		if (!resources)
+			igt_assert_eq(errno, EOPNOTSUPP);
+
+		drmModeFreeResources(resources);
+	}
+
 	igt_subtest_group {
 		igt_fixture {
 			igt_display_require(&display, fd);
-- 
2.40.0
