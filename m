Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658E210E9F8
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 05:30:03 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] lib/igt_kms: add support for choosing big joiner mode
Date: Fri, 12 Jan 2024 11:09:32 +0530
Message-Id: <20240112053932.570651-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

add support to choose big joiner mode with environment
variable, use mode with highest clock if no mode with big joiner
found.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e4dea1a60..3d0fe635c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1783,15 +1783,30 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 	env = getenv("IGT_KMS_RESOLUTION");
 	if (env) {
 		/*
-		 * Only (0 or 1) and (lowest or highest) are allowed.
+		 * Only (0 or 1 or 2) and (lowest or highest or joiner) are allowed.
 		 *
 		 * 0/lowest: Choose connector mode with lowest possible resolution.
 		 * 1/highest: Choose connector mode with highest possible resolution.
+		 * 2/joiner: Choose connector mode with big joiner output or output
+		 *           with max clock requirement
 		 */
 		if (!strcmp(env, "highest") || !strcmp(env, "1"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
+		else if (!strcmp(env, "joiner") || !strcmp(env, "2")) {
+			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+			if (igt_bigjoiner_possible(&connector->modes[0], igt_get_max_dotclock(drm_fd))) {
+				*mode = connector->modes[0];
+				return true;
+			}
+			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+			if(igt_bigjoiner_possible(&connector->modes[0], igt_get_max_dotclock(drm_fd))) {
+				*mode = connector->modes[0];
+				return true;
+			}
+			igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+		}
 		else
 			goto default_mode;
 
-- 
2.25.1
