Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3AA6E850
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 22:44:22 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Wed, 17 Mar 2021 18:44:07 -0400
Message-Id: <20210317224407.447572-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't unset primary_fb
 when testing other planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Currently, nouveau doesn't support having a CRTC without a primary FB set. We
won't reject such configurations, but the behavior is undefined which will cause
CRCs to become undefined. So, avoid clearing the primary FB while we're testing
non-primary planes.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Martin Peres <martin.peres@free.fr>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>
---
 tests/kms_plane.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 298a9375..c87983a4 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -817,9 +817,10 @@ enum crc_set { PACKED_CRC_SET,
 	       MAX_CRC_SET };
 
 static bool test_format_plane(data_t *data, enum pipe pipe,
-			      igt_output_t *output, igt_plane_t *plane)
+			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
 {
 	struct igt_fb fb = {};
+	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
 	drmModeModeInfo *mode;
 	uint32_t format, ref_format;
 	uint64_t modifier, ref_modifier;
@@ -879,7 +880,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 			height = test_fb.height;
 		}
 
-		igt_plane_set_fb(plane, NULL);
+		igt_plane_set_fb(plane, clear_fb);
 
 		igt_remove_fb(data->drm_fd, &test_fb);
 	}
@@ -937,7 +938,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_pipe_crc_stop(data->pipe_crc);
 
-	igt_plane_set_fb(plane, NULL);
+	igt_plane_set_fb(plane, clear_fb);
 	igt_remove_fb(data->drm_fd, &fb);
 
 	return result;
@@ -1010,7 +1011,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		result &= test_format_plane(data, pipe, output, plane);
+		result &= test_format_plane(data, pipe, output, plane, &primary_fb);
 	}
 
 	test_fini(data);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
