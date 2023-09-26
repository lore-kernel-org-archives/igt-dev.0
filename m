Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1ED910E42F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 19:59:12 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Sep 2023 01:19:52 +0530
Message-Id: <20230926194952.64561-4-mohammed.thasleem@intel.com>
In-Reply-To: <20230926194952.64561-1-mohammed.thasleem@intel.com>
References: <20230926194952.64561-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 3/3] tests/kms_lease: Add wrapper to create
 lease and store mcl.fd
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

Add wrapper to create lease and store mcl.fd and add
wrapper to all required subtests.

v2: -Add wrapper to create lease and store mcl.fd. (Ankit)
    -Update terminate lease.
v3: Add wrapper to all required subtests. (Ankit)
v4: Update create_lease. (Karthik)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 168 +++++++++++++++++++++++-----------------------
 1 file changed, 83 insertions(+), 85 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index cbf225ff2..4af075398 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -216,7 +216,6 @@ typedef struct {
 } lease_t;
 
 typedef struct {
-	int lease_fd;
 	lease_t lease;
 	lease_t master;
 	enum pipe pipe;
@@ -285,15 +284,25 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	igt_display_commit(display);
 }
 
-static int create_lease(int fd, struct drm_mode_create_lease *mcl)
+static int _create_lease(int fd, struct drm_mode_create_lease *mcl)
 {
 	int err = 0;
-
 	if (igt_ioctl(fd, DRM_IOCTL_MODE_CREATE_LEASE, mcl))
 		err = -errno;
 	return err;
 }
 
+static int create_lease(int fd, struct drm_mode_create_lease *mcl, int *lease_fd)
+{
+	int ret;
+
+	ret = _create_lease(fd, mcl);
+
+	if (lease_fd != NULL)
+		*lease_fd = mcl->fd;
+	return ret;
+}
+
 static int revoke_lease(int fd, struct drm_mode_revoke_lease *mrl)
 {
 	int err = 0;
@@ -336,9 +345,7 @@ static int make_lease(data_t *data)
 	/* We use universal planes, must add the primary plane */
 	object_ids[mcl.object_count++] = data->plane_id;
 
-	ret = create_lease(data->master.fd, &mcl);
-	data->lease_fd = mcl.fd;
-
+	ret = create_lease(data->master.fd, &mcl, &data->lease.fd);
 	if (ret)
 		return ret;
 
@@ -346,9 +353,9 @@ static int make_lease(data_t *data)
 	return 0;
 }
 
-static void terminate_lease(lease_t *lease)
+static void terminate_lease(int lease_fd)
 {
-	close(lease->fd);
+	close(lease_fd);
 }
 
 static int paint_fb(int drm_fd, struct igt_fb *fb, const char *test_name,
@@ -393,16 +400,16 @@ static void simple_lease(data_t *data)
 	cleanup_crtc(&data->lease,
 		     connector_id_to_output(&data->lease.display, data->connector_id));
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void empty_lease(data_t *data)
 {
 	struct drm_mode_create_lease mcl = {0};
 
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
 
-	close(mcl.fd);
+	close(data->lease.fd);
 }
 
 static void page_flip_implicit_plane(data_t *data)
@@ -434,8 +441,7 @@ static void page_flip_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease_fd = mcl.fd;
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -451,22 +457,22 @@ static void page_flip_implicit_plane(data_t *data)
 	igt_wait_for_vblank(data->master.fd,
 			display->pipes[pipe].crtc_offset);
 
-	do_or_die(drmModePageFlip(mcl.fd, data->crtc_id,
+	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
 			      data->master.primary_fb.fb_id,
 			      0, NULL));
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	object_ids[mcl.object_count++] = wrong_plane_id;
-	do_or_die(create_lease(data->master.fd, &mcl));
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 
 	igt_wait_for_vblank(data->master.fd,
 			display->pipes[pipe].crtc_offset);
 
-	igt_assert_eq(drmModePageFlip(mcl.fd, data->crtc_id,
+	igt_assert_eq(drmModePageFlip(data->lease.fd, data->crtc_id,
 				      data->master.primary_fb.fb_id,
 				      0, NULL),
 		      -EACCES);
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	cleanup_crtc(&data->master,
 		     connector_id_to_output(&data->master.display, data->connector_id));
@@ -504,8 +510,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease_fd = mcl.fd;
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/*
@@ -513,7 +518,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	 * then the client cap for aspect-ratio bits must be set.
 	 */
 	if (mode->flags & DRM_MODE_FLAG_PIC_AR_MASK) {
-		drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
+		drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
 	}
 
 	/* Set a mode on the leased output */
@@ -522,23 +527,21 @@ static void setcrtc_implicit_plane(data_t *data)
 	/* sanity check */
 	ret = drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
 			     0, 0, object_ids, 1, mode);
-	ret_mcl = drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
+	ret_mcl = drmModeSetCrtc(data->lease.fd, data->crtc_id, -1,
 				 0, 0, object_ids, 1, mode);
-	close(mcl.fd);
+	close(data->lease.fd);
 	igt_assert_eq(ret, 0);
 	igt_assert_eq(ret_mcl, 0);
 
 	object_ids[mcl.object_count++] = wrong_plane_id;
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease.fd = mcl.fd;
-
-	igt_assert_eq(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
+	igt_assert_eq(drmModeSetCrtc(data->lease.fd, data->crtc_id, -1,
 				     0, 0, object_ids, 1, mode),
 		      -EACCES);
 	/* make sure we are allowed to turn the CRTC off */
 	do_or_die(drmModeSetCrtc(mcl.fd, data->crtc_id,
 				 0, 0, 0, NULL, 0, NULL));
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	cleanup_crtc(&data->master,
 		     connector_id_to_output(&data->master.display, data->connector_id));
@@ -557,8 +560,7 @@ static void cursor_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease_fd = mcl.fd;
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -566,17 +568,16 @@ static void cursor_implicit_plane(data_t *data)
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
-	do_or_die(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0));
-	close(mcl.fd);
+	do_or_die(drmModeSetCursor(data->lease.fd, data->crtc_id, 0, 0, 0));
+	close(data->lease.fd);
 
 	/* primary plane is never the cursor */
 	object_ids[mcl.object_count++] = data->plane_id;
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease_fd = mcl.fd;
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
 
-	igt_assert_eq(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0),
+	igt_assert_eq(drmModeSetCursor(data->lease.fd, data->crtc_id, 0, 0, 0),
 		      -EACCES);
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	cleanup_crtc(&data->master,
 		     connector_id_to_output(&data->master.display, data->connector_id));
@@ -634,9 +635,8 @@ static void atomic_implicit_crtc(data_t *data)
 	drmModeFreeObjectProperties(props);
 	igt_assert(crtc_id_prop);
 
-	do_or_die(create_lease(data->master.fd, &mcl));
-	data->lease_fd = mcl.fd;
-	do_or_die(drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ATOMIC, 1));
+	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
+	do_or_die(drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_ATOMIC, 1));
 
 	/* check CRTC_ID property on the plane */
 	req = drmModeAtomicAlloc();
@@ -649,7 +649,7 @@ static void atomic_implicit_crtc(data_t *data)
 	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
-	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	ret = drmModeAtomicCommit(data->lease.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == -EACCES);
 	drmModeAtomicFree(req);
 
@@ -664,11 +664,11 @@ static void atomic_implicit_crtc(data_t *data)
 	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
-	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	ret = drmModeAtomicCommit(data->lease.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == -EACCES);
 	drmModeAtomicFree(req);
 
-	close(mcl.fd);
+	close(data->lease.fd);
 }
 
 /* Test listing lessees */
@@ -714,7 +714,7 @@ static void lessee_list(data_t *data)
 	igt_assert_eq(list_lessees(data->master.fd, &mll), -EINVAL);
 	mll.pad = 0;
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 
 	/* Make sure the lease is gone */
 	igt_assert_eq(list_lessees(data->master.fd, &mll), 0);
@@ -778,7 +778,7 @@ static void lease_get(data_t *data)
 	mgl.objects_ptr = 0;
 	igt_assert_eq(get_lease(data->lease.fd, &mgl), -EFAULT);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void lease_unleased_crtc(data_t *data)
@@ -823,7 +823,7 @@ static void lease_unleased_crtc(data_t *data)
 	igt_assert_eq(errno, ENOENT);
 	drmModeFreeCrtc(crtc);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void lease_unleased_connector(data_t *data)
@@ -857,7 +857,7 @@ static void lease_unleased_connector(data_t *data)
 	igt_assert(!c);
 	igt_assert_eq(errno, ENOENT);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 }
 
 /* Test revocation of lease */
@@ -889,7 +889,7 @@ static void lease_revoke(data_t *data)
 	/* Ensure that the expected error is returned */
 	igt_assert_eq(ret, -ENOENT);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 
 	/* make sure the lease is gone */
 	mrl.lessee_id = data->lease.lessee_id;
@@ -906,12 +906,12 @@ static void lease_again(data_t *data)
 	/* Attempt to re-lease the same objects */
 	igt_assert_eq(make_lease(data), -EBUSY);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 
 	/* Now attempt to lease the same objects */
 	igt_assert_eq(make_lease(data), 0);
 
-	terminate_lease(&data->lease);
+	terminate_lease(data->lease.fd);
 }
 
 #define assert_unleased(ret) \
@@ -972,76 +972,76 @@ static void invalid_create_leases(data_t *data)
 
 	/* NULL array pointer */
 	mcl.object_count = 1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EFAULT);
 
 	/* nil object */
 	object_ids[0] = 0;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOENT);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -ENOENT);
 
 	/* no crtc, non-universal_plane */
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	object_ids[0] = data->master.display.outputs[0].id;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EINVAL);
 
 	/* no connector, non-universal_plane */
 	object_ids[0] = data->master.display.pipes[0].crtc_id;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EINVAL);
 
 	/* sanity check */
 	object_ids[0] = data->master.display.pipes[0].crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
 	mcl.object_count = 2;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	close(data->lease.fd);
 
 	/* no plane, universal planes */
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EINVAL);
 
 	/* sanity check */
 	object_ids[2] = igt_pipe_get_plane_type(&data->master.display.pipes[0],
 						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_count = 3;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	close(data->lease.fd);
 
 	/* array overflow, do a small scan around overflow sizes */
 	for (int i = 1; i <= 4; i++) {
 		mcl.object_count = UINT32_MAX / sizeof(object_ids[0]) + i;
-		igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOMEM);
+		igt_assert_eq(_create_lease(data->master.fd, &mcl), -ENOMEM);
 	}
 
 	/* sanity check */
 	mcl.object_count = 3;
 	mcl.flags = O_CLOEXEC | O_NONBLOCK;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	close(data->lease.fd);
 
 	/* invalid flags */
 	mcl.flags = -1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EINVAL);
 
 	/* no subleasing */
 	mcl.object_count = 3;
 	mcl.flags = 0;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	tmp_fd = mcl.fd;
-	igt_assert_eq(create_lease(tmp_fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	tmp_fd = data->lease.fd;
+	igt_assert_eq(_create_lease(tmp_fd, &mcl), -EINVAL);
 	close(tmp_fd);
 
 	/* no double-leasing */
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	tmp_fd = mcl.fd;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EBUSY);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	tmp_fd = data->lease.fd;
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EBUSY);
 	close(tmp_fd);
 
 	/* no double leasing */
 	object_ids[3] = object_ids[2];
 	mcl.object_count = 4;
 	/* Note: the ENOSPC is from idr double-insertion failing */
-	ret = create_lease(data->master.fd, &mcl);
+	ret = _create_lease(data->master.fd, &mcl);
 	assert_double_id_err(ret);
 
 	/* no encoder leasing */
@@ -1049,7 +1049,7 @@ static void invalid_create_leases(data_t *data)
 	igt_assert(resources);
 	igt_assert(resources->count_encoders > 0);
 	object_ids[3] = resources->encoders[0];
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(_create_lease(data->master.fd, &mcl), -EINVAL);
 	drmModeFreeResources(resources);
 }
 
@@ -1135,19 +1135,17 @@ static void possible_crtcs_filtering(data_t *data)
 	mcl.flags = 0;
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		int lease_fd;
 
 		object_ids[mcl.object_count - 1] =
 			resources->crtcs[i];
 
-		igt_assert_eq(create_lease(master_fd, &mcl), 0);
-		lease_fd = mcl.fd;
+		igt_assert_eq(create_lease(master_fd, &mcl, &data->lease.fd), 0);
 
-		drmSetClientCap(lease_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+		drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
-		check_crtc_masks(master_fd, lease_fd, 1 << i);
+		check_crtc_masks(master_fd, data->lease.fd, 1 << i);
 
-		close(lease_fd);
+		close(data->lease.fd);
 	}
 
 	free(object_ids);
@@ -1174,7 +1172,7 @@ static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
 	mcl.object_count = 3;
 	mcl.flags = 0;
 
-	igt_assert_eq(create_lease(master_fd, &mcl), expected_ret);
+	igt_assert_eq(_create_lease(master_fd, &mcl), expected_ret);
 
 	return expected_ret == 0 ? mcl.fd : 0;
 }
@@ -1268,32 +1266,32 @@ static void implicit_plane_lease(data_t *data)
 	mcl.flags = 0;
 
 	/* sanity check */
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
+	close(data->lease.fd);
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 
 	/* non universal plane automatically adds primary/cursor plane */
 	mcl.object_count = 2;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
+	igt_assert_eq(create_lease(data->master.fd, &mcl, &data->lease.fd), 0);
 
 	mgl.pad = 0;
 	mgl.count_objects = 0;
 	mgl.objects_ptr = 0;
-	igt_assert_eq(get_lease(mcl.fd, &mgl), 0);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), 0);
 
 	igt_assert_eq(mgl.count_objects, 3 + (cursor_id ? 1 : 0));
 
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	/* check that implicit lease doesn't lead to confusion when
 	 * explicitly adding primary plane */
 	mcl.object_count = 3;
-	ret = create_lease(data->master.fd, &mcl);
+	ret = _create_lease(data->master.fd, &mcl);
 	assert_double_id_err(ret);
 
 	/* same for the cursor */
 	object_ids[2] = cursor_id;
-	ret = create_lease(data->master.fd, &mcl);
+	ret = _create_lease(data->master.fd, &mcl);
 	assert_double_id_err(ret);
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -1396,7 +1394,7 @@ igt_main
 									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
 					}
-					terminate_lease(&data.lease);
+					terminate_lease(data.lease.fd);
 				}
 			}
 		}
-- 
2.25.1
