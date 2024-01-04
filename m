Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7066910E38C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jan 2024 05:56:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Subject: [i-g-t 1/2] tests/kms_feature_discovery: Add basic sanity test
Date: Thu,  4 Jan 2024 11:21:05 +0530
Message-Id: <20240104055106.1949767-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20240104055106.1949767-1-bhanuprakash.modem@intel.com>
References: <20240104055106.1949767-1-bhanuprakash.modem@intel.com>
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
