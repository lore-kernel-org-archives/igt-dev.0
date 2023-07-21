Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC710E199
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jul 2023 13:05:11 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Jul 2023 15:04:57 +0200
Message-Id: <20230721130458.64856-3-aesteve@redhat.com>
In-Reply-To: <20230721130458.64856-1-aesteve@redhat.com>
References: <20230721130458.64856-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [igt-dev] [PATCH 2/3] igt_kms: add hotspot plane property
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: belmouss@redhat.com, Albert Esteve <aesteve@redhat.com>, javierm@redhat.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add HOTSPOT_X and HOTSPOT_Y properties
to the atomic_plane_properties struct.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 lib/igt_kms.c | 9 +++++++++
 lib/igt_kms.h | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f2b0eed57..0bda9ab15 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -601,6 +601,8 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
 	[IGT_PLANE_CRTC_Y] = "CRTC_Y",
 	[IGT_PLANE_CRTC_W] = "CRTC_W",
 	[IGT_PLANE_CRTC_H] = "CRTC_H",
+	[IGT_PLANE_HOTSPOT_X] = "HOTSPOT_X",
+	[IGT_PLANE_HOTSPOT_Y] = "HOTSPOT_Y",
 	[IGT_PLANE_FB_ID] = "FB_ID",
 	[IGT_PLANE_CRTC_ID] = "CRTC_ID",
 	[IGT_PLANE_IN_FENCE_FD] = "IN_FENCE_FD",
@@ -2296,6 +2298,11 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_SCALING_FILTER))
 		igt_plane_set_prop_enum(plane, IGT_PLANE_SCALING_FILTER, "Default");
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_X))
+		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_X, 0);
+	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
+		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -2679,6 +2686,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
 		display->is_atomic = 1;
+	
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1);
 
 	plane_resources = drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1b6988c17..b64be84b3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -318,7 +318,9 @@ enum igt_atomic_plane_properties {
        IGT_PLANE_ZPOS,
        IGT_PLANE_FB_DAMAGE_CLIPS,
        IGT_PLANE_SCALING_FILTER,
-       IGT_NUM_PLANE_PROPS
+       IGT_PLANE_HOTSPOT_X,
+       IGT_PLANE_HOTSPOT_Y,
+       IGT_NUM_PLANE_PROPS      
 };
 
 /**
-- 
2.40.0
