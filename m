Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C16D10EED4
 for <igt-dev@lists.freedesktop.org>; Fri, 27 May 2022 08:17:19 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 27 May 2022 13:43:52 +0530
Message-Id: <20220527081353.3800969-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
References: <20220527081353.3800969-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t 3/4] lib/igt_kms: Add support for --resolution
 from igt_runner
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

Upon user request igt_runner will set an environment variable to choose
default DRM display mode for subtests instead of taking the preferred
mode.

Example:
Eventhough we have an 8K panel, Kernel may expose 4K or lesser mode
as a preferred mode. So all subtests will take this mode as a default
may cause losing the coverage.

This patch will parse the environment variable exposed by igt_runner
and take the decision to choose the mode from the available list.

The default is still to take the preferred mode exposed by the Kernel.
Other options are:
 * highest: Choose the mode with highest possible resolution.
 * lowest:  Choose the mode with lowest possible resolution.

Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 84e798b5..aa964e11 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1431,6 +1431,20 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 	igt_assert(ret != -1);
 }
 
+static int sort_drm_modes_asc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->hdisplay > mode2->hdisplay) - (mode2->hdisplay > mode1->hdisplay);
+}
+
+static int sort_drm_modes_dsc(const void *a, const void *b)
+{
+	const drmModeModeInfo *mode1 = a, *mode2 = b;
+
+	return (mode1->hdisplay < mode2->hdisplay) - (mode2->hdisplay < mode1->hdisplay);
+}
+
 /**
  * kmstest_get_connector_default_mode:
  * @drm_fd: DRM fd
@@ -1444,7 +1458,13 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
 bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 					drmModeModeInfo *mode)
 {
-	int i;
+	enum {
+		RESOLUTION_DEFAULT = 0,
+		RESOLUTION_HIGHEST,
+		RESOLUTION_LOWEST,
+	};
+	char *env;
+	int i, res = RESOLUTION_DEFAULT;
 
 	if (!connector->count_modes) {
 		igt_warn("no modes for connector %d\n",
@@ -1452,6 +1472,21 @@ bool kmstest_get_connector_default_mode(int drm_fd, drmModeConnector *connector,
 		return false;
 	}
 
+	env = getenv("IGT_KMS_RESOLUTION");
+	if (env)
+		res = atoi(env);
+
+	if (res) {
+		qsort(connector->modes,
+		      connector->count_modes,
+		      sizeof(drmModeModeInfo),
+		      (res == RESOLUTION_HIGHEST) ?
+			sort_drm_modes_dsc : sort_drm_modes_asc);
+
+		*mode = connector->modes[0];
+		return true;
+	}
+
 	for (i = 0; i < connector->count_modes; i++) {
 		if (i == 0 ||
 		    connector->modes[i].type & DRM_MODE_TYPE_PREFERRED) {
-- 
2.35.1
