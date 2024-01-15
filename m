Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34C110E292
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jan 2024 10:49:33 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big joiner
 mode
Date: Mon, 15 Jan 2024 16:28:54 +0530
Message-Id: <20240115105854.827266-3-kunal1.joshi@intel.com>
In-Reply-To: <20240115105854.827266-1-kunal1.joshi@intel.com>
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
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

v2: reuse bigjoiner_mode_found (Bhanu)
v3: avoid returning from multiple places (Bhanu)
    avoid frequent debugfs reads (Bhanu)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index cb6d57c2d..2c4210d4b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1771,8 +1771,9 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode)
 {
+	bool found;
 	char *env;
-	int i;
+	int i, max_dotclock;
 
 	if (!connector->count_modes) {
 		igt_warn("no modes for connector %d\n",
@@ -1781,21 +1782,34 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 	}
 
 	env = getenv("IGT_KMS_RESOLUTION");
+	max_dotclock = igt_get_max_dotclock(drm_fd);
 	if (env) {
 		/*
-		 * Only (0 or 1) and (lowest or highest) are allowed.
+		 * Only (0 or 1 or 2) and (lowest or highest or joiner) are allowed.
 		 *
 		 * 0/lowest: Choose connector mode with lowest possible resolution.
 		 * 1/highest: Choose connector mode with highest possible resolution.
+		 * 2/joiner: Choose connector mode with bigjoiner support or with
+			     highest clock if can't support  big joiner
 		 */
-		if (!strcmp(env, "highest") || !strcmp(env, "1"))
+		if (!strcmp(env, "joiner") || !strcmp(env, "2"))
+			found = bigjoiner_mode_found(drm_fd, connector,
+						     sort_drm_modes_by_clk_dsc,mode,
+						     max_dotclock) ||
+				bigjoiner_mode_found(drm_fd, connector,
+						     sort_drm_modes_by_res_dsc, mode,
+						     max_dotclock) ||
+				bigjoiner_mode_found(drm_fd, connector,
+						     sort_drm_modes_by_clk_dsc, mode,
+						     max_dotclock);
+		else if (!strcmp(env, "highest") || !strcmp(env, "1"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
 		else
 			goto default_mode;
-
-		*mode = connector->modes[0];
+		if (!found)
+			*mode = connector->modes[0];
 		return true;
 	}
 
-- 
2.25.1
