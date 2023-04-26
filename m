Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8410E96E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:52:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:06 +0530
Message-Id: <20230426114725.2244653-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 26/45] tests/kms_3d: Add XE support
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
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
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
