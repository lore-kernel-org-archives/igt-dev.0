Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F8710EA99
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 08:46:19 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big joiner
 mode
Date: Fri, 12 Jan 2024 14:25:47 +0530
Message-Id: <20240112085547.673712-3-kunal1.joshi@intel.com>
In-Reply-To: <20240112085547.673712-1-kunal1.joshi@intel.com>
References: <20240112085547.673712-1-kunal1.joshi@intel.com>
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

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 lib/igt_kms.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2c55af05f..c4ecb0907 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1788,7 +1788,11 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		 * 0/lowest: Choose connector mode with lowest possible resolution.
 		 * 1/highest: Choose connector mode with highest possible resolution.
 		 */
-		if (!strcmp(env, "highest") || !strcmp(env, "1"))
+		if (!strcmp(env, "joiner") || !strcmp(env, "2"))
+			return bigjoiner_mode_found(drm_fd, connector, sort_drm_modes_by_clk_dsc, mode) ||
+			       bigjoiner_mode_found(drm_fd, connector, sort_drm_modes_by_res_dsc, mode) ||
+			       bigjoiner_mode_found(drm_fd, connector, sort_drm_modes_by_clk_dsc, mode);
+		else if (!strcmp(env, "highest") || !strcmp(env, "1"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
 		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
 			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
-- 
2.25.1
