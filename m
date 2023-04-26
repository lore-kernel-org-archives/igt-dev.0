Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B49C10E95A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 11:53:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 26 Apr 2023 17:17:24 +0530
Message-Id: <20230426114725.2244653-45-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 44/45] tests/kms_setmode: Add XE support
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
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_setmode.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bfa108916..a611d9382 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -30,6 +30,7 @@
 #include <string.h>
 #include <sys/time.h>
 #include <math.h>
+#include "xe/xe_query.h"
 
 #define MAX_CONNECTORS  10
 #define MAX_CRTCS       6
@@ -954,6 +955,9 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 
 		drm_resources = drmModeGetResources(drm_fd);
 		igt_require(drm_resources);
+
+		if (is_xe_device(drm_fd))
+			xe_device_get(drm_fd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
@@ -971,6 +975,9 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		drmModeFreeResources(drm_resources);
 
+		if (is_xe_device(drm_fd))
+			xe_device_put(drm_fd);
+
 		close(drm_fd);
 	}
 }
-- 
2.40.0
