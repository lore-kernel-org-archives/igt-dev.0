Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1346010E045
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 15:33:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 21:01:18 +0530
Message-Id: <20220901153118.262000-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220901092748.224317-1-bhanuprakash.modem@intel.com>
References: <20220901092748.224317-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] lib/igt_kms: Choose default mode based on
 --environment flag from igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

igt_runner provides --environment flag KEY=VALUE pair as the environment
variable to execute test processes. Upon user request igt_runner will set
an environment variable to choose default DRM display mode for subtests
instead of taking the preferred mode.

Example:
Eventhough we have an 8K panel, Kernel may expose 4K or lesser mode
as a preferred mode. So all subtests will take this mode as a default
may cause losing the coverage.

This patch will parse the environment variable exposed by igt_runner
and take the decision to choose the mode from the available list.

Possible options are:
  0/lowest: Choose the mode with lowest possible resolution.
  1/highest: Choose the mode with highest possible resolution.

By default (without this flag) fallback to take the preferred mode exposed
by the Kernel.

Usage:
./igt_runner --environment "IGT_KMS_RESOLUTION=1" ...
./igt_runner --environment "IGT_KMS_RESOLUTION=lowest" ...

V2:
- Allow "lowest" & "highest" options too

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 1ba3bd2a..7d4916a7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1586,6 +1586,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode)
 {
+	char *env;
 	int i;
 
 	if (!connector->count_modes) {
@@ -1594,6 +1595,26 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		return false;
 	}
 
+	env = getenv("IGT_KMS_RESOLUTION");
+	if (env) {
+		/*
+		 * Only (0 or 1) and (lowest or highest) are allowed.
+		 *
+		 * 0/lowest: Choose connector mode with lowest possible resolution.
+		 * 1/highest: Choose connector mode with highest possible resolution.
+		 */
+		if (!strcmp(env, "highest") || !strcmp(env, "1"))
+			igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+		else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
+			igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
+		else
+			goto default_mode;
+
+		*mode = connector->modes[0];
+		return true;
+	}
+
+default_mode:
 	for (i = 0; i < connector->count_modes; i++) {
 		if (i == 0 ||
 		    connector->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
-- 
2.35.1
