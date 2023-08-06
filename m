Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EE010E0E6
 for <igt-dev@lists.freedesktop.org>; Sun,  6 Aug 2023 16:48:09 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  6 Aug 2023 22:17:28 +0530
Message-Id: <20230806164729.1016167-4-swati2.sharma@intel.com>
In-Reply-To: <20230806164729.1016167-1-swati2.sharma@intel.com>
References: <20230806164729.1016167-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms: use dp-mst helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: ankit.k.nautiyal@freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove duplicate code and use helpers instead.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_content_protection.c | 33 ++-------------------------------
 tests/kms_display_modes.c      | 34 ++--------------------------------
 2 files changed, 4 insertions(+), 63 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6cdf81a28..325b9bf0d 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -534,42 +534,15 @@ test_content_protection(enum igt_commit_style s, int content_type)
 		igt_cleanup_uevents(data.uevent_monitor);
 }
 
-static int parse_path_blob(char *blob_data)
-{
-	int connector_id;
-	char *encoder;
-
-	encoder = strtok(blob_data, ":");
-	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
-
-	connector_id = atoi(strtok(NULL, "-"));
-
-	return connector_id;
-}
-
 static bool output_is_dp_mst(igt_output_t *output, int i)
 {
-	drmModePropertyBlobPtr path_blob = NULL;
-	uint64_t path_blob_id;
-	drmModeConnector *connector = output->config.connector;
-	struct kmstest_connector_config config;
-	const char *encoder;
 	int connector_id;
 	static int prev_connector_id;
 
-	kmstest_get_connector_config(data.drm_fd, output->config.connector->connector_id, -1, &config);
-	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
-
-	if (strcmp(encoder, "DP MST"))
+	if(igt_check_output_is_dp_mst(data.drm_fd, output))
 		return false;
 
-	igt_assert(kmstest_get_property(data.drm_fd, connector->connector_id,
-		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
-		   &path_blob_id, NULL));
-
-	igt_assert(path_blob = drmModeGetPropertyBlob(data.drm_fd, path_blob_id));
-
-	connector_id = parse_path_blob((char *) path_blob->data);
+	connector_id = igt_get_dp_mst_connector_id(data.drm_fd, output);
 
 	/*
 	 * Discarding outputs of other DP MST topology.
@@ -582,8 +555,6 @@ static bool output_is_dp_mst(igt_output_t *output, int i)
 			return false;
 	}
 
-	drmModeFreePropertyBlob(path_blob);
-
 	return true;
 }
 
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 93d91ef5b..e6b828c36 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -77,45 +77,15 @@ static drmModeModeInfo *get_mode(igt_output_t *output)
 	return required_mode;
 }
 
-static int parse_path_blob(char *blob_data)
-{
-	int connector_id;
-	char *encoder;
-
-	encoder = strtok(blob_data, ":");
-	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
-
-	connector_id = atoi(strtok(NULL, "-"));
-
-	return connector_id;
-}
-
 static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
 {
-	drmModePropertyBlobPtr path_blob = NULL;
-	uint64_t path_blob_id;
-	drmModeConnector *connector = output->config.connector;
-	struct kmstest_connector_config config;
-	const char *encoder;
 	int connector_id;
 	static int prev_connector_id;
 
-	kmstest_get_connector_config(data->drm_fd, output->config.connector->connector_id,
-				     -1, &config);
-	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
-
-	if (strcmp(encoder, "DP MST"))
+	if(igt_check_output_is_dp_mst(data->drm_fd, output))
 		return false;
 
-	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
-		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
-		   &path_blob_id, NULL));
-
-	igt_assert(path_blob = drmModeGetPropertyBlob(data->drm_fd, path_blob_id));
-
-	connector_id = parse_path_blob((char *) path_blob->data);
-
-	drmModeFreePropertyBlob(path_blob);
+	connector_id = igt_get_dp_mst_connector_id(data->drm_fd, output);
 
 	/*
 	 * Discarding outputs of other DP MST topology.
-- 
2.25.1
