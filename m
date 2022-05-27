Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0307010EED7
 for <igt-dev@lists.freedesktop.org>; Fri, 27 May 2022 08:17:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 13:43:53 +0530
Message-Id: <20220527081353.3800969-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
References: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 4/4] HAX: Add debug prints in choosing the
 default mode
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index aa964e11..74a26653 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1465,6 +1465,7 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 	};
 	char *env;
 	int i, res = RESOLUTION_DEFAULT;
+	char conn_name[10] = {0};
 
 	if (!connector->count_modes) {
 		igt_warn("no modes for connector %d\n",
@@ -1472,6 +1473,14 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		return false;
 	}
 
+	sprintf(conn_name, "%s-%d",
+			kmstest_connector_type_str(connector->connector_type),
+			connector->connector_type_id);
+
+	igt_info("[%s]: Available Modes:\n", conn_name);
+	for (i = 0; i < connector->count_modes; i++)
+		kmstest_dump_mode(&connector->modes[i]);
+
 	env = getenv("IGT_KMS_RESOLUTION");
 	if (env)
 		res = atoi(env);
@@ -1483,7 +1492,16 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		      (res == RESOLUTION_HIGHEST) ?
 			sort_drm_modes_dsc : sort_drm_modes_asc);
 
+		igt_info("[%s] Modes after sorting:\n", conn_name);
+		for (i = 0; i < connector->count_modes; i++)
+			kmstest_dump_mode(&connector->modes[i]);
+
 		*mode = connector->modes[0];
+
+		igt_info("Taking %s resolution mode as default: ",
+			 (res == RESOLUTION_HIGHEST) ? "Highest" : "Lowest");
+		kmstest_dump_mode(mode);
+
 		return true;
 	}
 
@@ -1491,8 +1509,12 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		if (i == 0 ||
 		    connector->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
 			*mode = connector->modes[i];
-			if (mode->type & DRM_MODE_TYPE_PREFERRED)
+			if (mode->type & DRM_MODE_TYPE_PREFERRED) {
+				igt_info("Taking Preferred mode as default: ");
+				kmstest_dump_mode(mode);
+
 				break;
+			}
 		}
 	}
 
-- 
2.35.1
