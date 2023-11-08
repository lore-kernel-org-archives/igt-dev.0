Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883CF10E7E6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 16:40:18 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 11:39:51 -0500
Message-ID: <20231108164006.106967-3-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
References: <20231108164006.106967-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH v3 02/12] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
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

We don't want to set this by default since existing tests
might require COLOR_RANGE and COLOR_ENCODING plane properties.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm.h | 15 +++++++++++++++
 lib/igt_kms.c          |  4 ++++
 lib/igt_kms.h          |  1 +
 3 files changed, 20 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 02540248deb1..002337cc9709 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -836,6 +836,21 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ * This capability is currently in development.
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 453103f900a6..033fa1e236e8 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2797,6 +2797,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
 		display->has_virt_cursor_plane = 1;
 
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+		display->has_plane_color_pipeline = 1;
+
+
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9028ab9be40a..0ebb2c640b81 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -464,6 +464,7 @@ struct igt_display {
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
+	bool has_plane_color_pipeline;
 	bool first_commit;
 
 	uint64_t *modifiers;
-- 
2.42.0
