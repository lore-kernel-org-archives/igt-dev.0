Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B22113951
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jun 2022 18:50:34 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jun 2022 00:21:27 +0530
Message-Id: <20220628185128.19692-4-swati2.sharma@intel.com>
In-Reply-To: <20220628185128.19692-1-swati2.sharma@intel.com>
References: <20220628185128.19692-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2 PATCH i-g-t 3/4] lib/igt_kms: Add scaling filter
 property
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

Added "scaling filter" as pipe and plane property.

v2: -Moved lib changes from 4/4 to 3/4
    -Renaming filter enum

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_kms.h |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bd606548..fdb13177 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -581,6 +581,7 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_ALPHA] = "alpha",
 	[IGT_PLANE_ZPOS] = "zpos",
 	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
+	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
 };
 
 const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
@@ -593,6 +594,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
 	[IGT_CRTC_ACTIVE] = "ACTIVE",
 	[IGT_CRTC_OUT_FENCE_PTR] = "OUT_FENCE_PTR",
 	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
+	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
 };
 
 const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
@@ -910,6 +912,28 @@ const char *kmstest_connector_status_str(int status)
 	return find_type_name(connector_status_names, status);
 }
 
+enum scaling_filter {
+       SCALING_FILTER_DEFAULT,
+       SCALING_FILTER_NEAREST_NEIGHBOR,
+};
+
+static const struct type_name scaling_filter_names[] = {
+	{ SCALING_FILTER_DEFAULT, "Default" },
+	{ SCALING_FILTER_NEAREST_NEIGHBOR, "Nearest Neighbor" },
+	{}
+};
+
+/**
+ * kmstest_scaling_filter_str:
+ * @filter: SCALING_FILTER_* filter value
+ *
+ * Returns: A string representing the scaling filter @filter.
+ */
+const char *kmstest_scaling_filter_str(int filter)
+{
+	return find_type_name(scaling_filter_names, filter);
+}
+
 static const struct type_name connector_type_names[] = {
 	{ DRM_MODE_CONNECTOR_Unknown, "Unknown" },
 	{ DRM_MODE_CONNECTOR_VGA, "VGA" },
@@ -2122,6 +2146,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_FB_DAMAGE_CLIPS))
 		igt_plane_set_prop_value(plane, IGT_PLANE_FB_DAMAGE_CLIPS, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER, "Default");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -2142,6 +2169,9 @@ static void igt_pipe_reset(igt_pipe_t *pipe)
 	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
 		igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
 
+	if (igt_pipe_obj_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
+		igt_pipe_obj_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
+
 	pipe->out_fence_fd = -1;
 }
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3e674e74..4b67708d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -107,6 +107,7 @@ enum igt_custom_edid_type {
 const char *kmstest_encoder_type_str(int type);
 const char *kmstest_connector_status_str(int status);
 const char *kmstest_connector_type_str(int type);
+const char *kmstest_scaling_filter_str(int filter);
 
 void kmstest_dump_mode(drmModeModeInfo *mode);
 #define MAX_HDISPLAY_PER_PIPE 5120
@@ -126,6 +127,7 @@ enum igt_atomic_crtc_properties {
        IGT_CRTC_ACTIVE,
        IGT_CRTC_OUT_FENCE_PTR,
        IGT_CRTC_VRR_ENABLED,
+       IGT_CRTC_SCALING_FILTER,
        IGT_NUM_CRTC_PROPS
 };
 
@@ -302,6 +304,7 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ALPHA,
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
+       IGT_PLANE_SCALING_FILTER,
        IGT_NUM_PLANE_PROPS
 };
 
-- 
2.25.1
