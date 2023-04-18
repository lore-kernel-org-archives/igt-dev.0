Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA19810E814
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:49:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:39 +0530
Message-Id: <20230418164501.1687266-24-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 23/45] tests/kms_3d: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_3d.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index c6bef67c1..437c8a481 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -23,6 +23,7 @@
  */
 
 #include "igt.h"
+#include "xe/xe_query.h"
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
@@ -36,6 +37,9 @@ igt_simple_main
 
 	drm_fd = drm_open_driver_master(DRIVER_ANY);
 
+	if (is_xe_device(drm_fd))
+		xe_device_get(drm_fd);
+
 	res = drmModeGetResources(drm_fd);
 	igt_require(res);
 
@@ -111,5 +115,9 @@ igt_simple_main
 	kmstest_force_edid(drm_fd, connector, NULL);
 
 	drmModeFreeConnector(connector);
+
+	if (is_xe_device(drm_fd))
+		xe_device_put(drm_fd);
+
 	close(drm_fd);
 }
-- 
2.40.0
