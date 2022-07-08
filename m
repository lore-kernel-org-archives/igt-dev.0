Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270C910E5A8
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Jul 2022 18:38:05 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id l12so11666935plk.13
 for <igt-dev@lists.freedesktop.org>; Fri, 08 Jul 2022 11:38:05 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Jul 2022 11:38:15 -0700
Message-Id: <20220708183815.1828067-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt] tests/kms_lease: Remove
 page_flip_implicit_plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I don't see anything on the kernel side restricting leased planes to
primary planes.  And for drivers where non-primary and primary planes
are interchangable, there is no reason to expect the pageflip to fail.
So just remove the test, it is not valid.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_lease.c | 71 -----------------------------------------------
 1 file changed, 71 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 0bf102a6..89817894 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -259,75 +259,6 @@ static void empty_lease(data_t *data)
 	close(mcl.fd);
 }
 
-static void page_flip_implicit_plane(data_t *data)
-{
-	uint32_t object_ids[3];
-	struct drm_mode_create_lease mcl;
-	drmModePlaneRes *plane_resources;
-	uint32_t wrong_plane_id = 0;
-	int i;
-	enum pipe pipe;
-	igt_display_t *display;
-
-	/* find a plane which isn't the primary one for us */
-	plane_resources = drmModeGetPlaneResources(data->master.fd);
-	for (i = 0; i < plane_resources->count_planes; i++) {
-		if (plane_resources->planes[i] != data->plane_id) {
-			wrong_plane_id = plane_resources->planes[i];
-			break;
-		}
-	}
-	drmModeFreePlaneResources(plane_resources);
-	igt_require(wrong_plane_id);
-
-	mcl.object_ids = (uint64_t) (uintptr_t) &object_ids[0];
-	mcl.object_count = 0;
-	mcl.flags = 0;
-
-	object_ids[mcl.object_count++] = data->connector_id;
-	object_ids[mcl.object_count++] = data->crtc_id;
-
-	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
-	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-
-	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data->connector_id, data->crtc_id));
-
-	/* sanity check */
-	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
-			      data->master.primary_fb.fb_id,
-			      0, NULL));
-
-	display = &data->master.display;
-	pipe = crtc_id_to_pipe(display, data->crtc_id);
-
-	igt_wait_for_vblank(data->master.fd,
-			display->pipes[pipe].crtc_offset);
-
-	do_or_die(drmModePageFlip(mcl.fd, data->crtc_id,
-			      data->master.primary_fb.fb_id,
-			      0, NULL));
-	close(mcl.fd);
-
-	object_ids[mcl.object_count++] = wrong_plane_id;
-	do_or_die(create_lease(data->master.fd, &mcl));
-
-	pipe = crtc_id_to_pipe(display, data->crtc_id);
-
-	igt_wait_for_vblank(data->master.fd,
-			display->pipes[pipe].crtc_offset);
-
-	igt_assert_eq(drmModePageFlip(mcl.fd, data->crtc_id,
-				      data->master.primary_fb.fb_id,
-				      0, NULL),
-		      -EACCES);
-	close(mcl.fd);
-
-	cleanup_crtc(&data->master,
-		     connector_id_to_output(&data->master.display, data->connector_id));
-}
-
 static void setcrtc_implicit_plane(data_t *data)
 {
 	uint32_t object_ids[3];
@@ -1235,8 +1166,6 @@ igt_main
 		{ "lease_invalid_connector", lease_invalid_connector, "Tests leasing an invalid connector" },
 		{ "lease_invalid_crtc", lease_invalid_crtc, "Tests leasing an invalid crtc" },
 		{ "lease_invalid_plane", lease_invalid_plane, "Tests leasing an invalid plane" },
-		{ "page_flip_implicit_plane", page_flip_implicit_plane, "Negative test by using a "
-			"non-primary plane with the page flip ioctl" },
 		{ "setcrtc_implicit_plane", setcrtc_implicit_plane, "Negative test by using a "
 			"non-primary plane with the setcrtc ioctl" },
 		{ "cursor_implicit_plane", cursor_implicit_plane, "Negative test by using a non-primary"
-- 
2.36.1
