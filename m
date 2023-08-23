Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A58C10E239
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 05:20:24 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:42:16 +0530
Message-Id: <20230823051216.27361-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230707143449.16139-1-mohammed.thasleem@intel.com>
References: <20230707143449.16139-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: Terminate lease fd before
 subtests execution
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

Failures happen at drmModeSetCursor and prepare_crtc_master or
prepare_crtc_lease which exit tests without termination of lease fd
which resulting in resource busy for sub-sequence execution, when
new lessor request for lease.

Terminate the lease fd when any assert happen with out termination
of lease fd and on any drmModeSetCrtc or drmModeGetCrtc exit.
Terminate lease fd on every display dependent subtests execution.

v2: -Separated prepare crtc for master and lease.
    -Removed lease_t from all sub-tests (Ankit).
v3: Updated commit message (Ankit).
v4: Avoid duplicating prepare_crtc (Ankit).
v5: -Add wrapper to create lease and store mcl.fd (Ankit).
    -Update terminate lease.
v6: Add wrapper to all required subtests.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 261 +++++++++++++++++++++++-----------------------
 1 file changed, 130 insertions(+), 131 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index fcdb2dbe6..932bf9110 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -237,6 +237,7 @@ typedef struct {
 } lease_t;
 
 typedef struct {
+	lease_t lease;
 	lease_t master;
 	enum pipe pipe;
 	uint32_t crtc_id;
@@ -252,9 +253,10 @@ static igt_output_t *connector_id_to_output(igt_display_t *display, uint32_t con
 	return igt_output_from_connector(display, &connector);
 }
 
-static int prepare_crtc(lease_t *lease, data_t *data)
+static int prepare_crtc(data_t *data, bool is_master)
 {
 	drmModeModeInfo *mode;
+	lease_t *lease = is_master ? &data->master : &data->lease;
 	igt_display_t *display = &lease->display;
 	igt_output_t *output = connector_id_to_output(display, data->connector_id);
 	enum pipe pipe = display->pipes[data->pipe].pipe;
@@ -274,7 +276,6 @@ static int prepare_crtc(lease_t *lease, data_t *data)
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &lease->primary_fb);
-
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &lease->primary_fb);
 
@@ -304,7 +305,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	igt_display_commit(display);
 }
 
-static int create_lease(int fd, struct drm_mode_create_lease *mcl)
+static int _create_lease(int fd, struct drm_mode_create_lease *mcl)
 {
 	int err = 0;
 
@@ -313,6 +314,17 @@ static int create_lease(int fd, struct drm_mode_create_lease *mcl)
 	return err;
 }
 
+static int create_lease(data_t *data, struct drm_mode_create_lease *mcl)
+{
+	int ret;
+
+	ret = _create_lease(data->master.fd, mcl);
+
+	if (!ret)
+		data->lease.fd = mcl->fd;
+	return ret;
+}
+
 static int revoke_lease(int fd, struct drm_mode_revoke_lease *mrl)
 {
 	int err = 0;
@@ -340,7 +352,7 @@ static int get_lease(int fd, struct drm_mode_get_lease *mgl)
 	return err;
 }
 
-static int make_lease(data_t *data, lease_t *lease)
+static int make_lease(data_t *data)
 {
 	uint32_t object_ids[3];
 	struct drm_mode_create_lease mcl;
@@ -355,19 +367,18 @@ static int make_lease(data_t *data, lease_t *lease)
 	/* We use universal planes, must add the primary plane */
 	object_ids[mcl.object_count++] = data->plane_id;
 
-	ret = create_lease(data->master.fd, &mcl);
+	ret = create_lease(data, &mcl);
 
 	if (ret)
 		return ret;
 
-	lease->fd = mcl.fd;
-	lease->lessee_id = mcl.lessee_id;
+	data->lease.lessee_id = mcl.lessee_id;
 	return 0;
 }
 
-static void terminate_lease(lease_t *lease)
+static void terminate_lease(int lease_fd)
 {
-	close(lease->fd);
+	close(lease_fd);
 }
 
 static int paint_fb(int drm_fd, struct igt_fb *fb, const char *test_name,
@@ -396,33 +407,32 @@ static void simple_lease(data_t *data)
 {
 	enum pipe pipe = data->pipe;
 
-	lease_t lease;
-
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	igt_display_require(&lease.display, lease.fd);
+	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&lease, data));
+	igt_assert_eq(0, prepare_crtc(data, false));
 
 	/* Paint something attractive */
-	paint_fb(lease.fd, &lease.primary_fb, "simple_lease",
-		 lease.mode->name, igt_output_name(lease.output), kmstest_pipe_name(pipe));
+	paint_fb(data->lease.fd, &data->lease.primary_fb, "simple_lease",
+		 data->lease.mode->name, igt_output_name(data->lease.output),
+		 kmstest_pipe_name(pipe));
 	igt_debug_wait_for_keypress("lease");
-	cleanup_crtc(&lease,
-		     connector_id_to_output(&lease.display, data->connector_id));
+	cleanup_crtc(&data->lease,
+		     connector_id_to_output(&data->lease.display, data->connector_id));
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void empty_lease(data_t *data)
 {
 	struct drm_mode_create_lease mcl = {0};
 
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
+	igt_assert_eq(create_lease(data, &mcl), 0);
 
-	close(mcl.fd);
+	close(data->lease.fd);
 }
 
 static void page_flip_implicit_plane(data_t *data)
@@ -454,11 +464,11 @@ static void page_flip_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
+	do_or_die(create_lease(data, &mcl));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
 	/* sanity check */
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
@@ -470,22 +480,22 @@ static void page_flip_implicit_plane(data_t *data)
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
+	do_or_die(create_lease(data, &mcl));
 
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
@@ -523,7 +533,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
+	do_or_die(create_lease(data, &mcl));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/*
@@ -531,31 +541,30 @@ static void setcrtc_implicit_plane(data_t *data)
 	 * then the client cap for aspect-ratio bits must be set.
 	 */
 	if (mode->flags & DRM_MODE_FLAG_PIC_AR_MASK) {
-		drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
+		drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
 	}
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
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
-
-	igt_assert_eq(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
+	do_or_die(create_lease(data, &mcl));
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
@@ -574,28 +583,28 @@ static void cursor_implicit_plane(data_t *data)
 	object_ids[mcl.object_count++] = data->crtc_id;
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
-	do_or_die(create_lease(data->master.fd, &mcl));
+	do_or_die(create_lease(data, &mcl));
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
-	do_or_die(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0));
-	close(mcl.fd);
+	do_or_die(drmModeSetCursor(data->lease.fd, data->crtc_id, 0, 0, 0));
+	close(data->lease.fd);
 
 	/* primary plane is never the cursor */
 	object_ids[mcl.object_count++] = data->plane_id;
-	do_or_die(create_lease(data->master.fd, &mcl));
+	do_or_die(create_lease(data, &mcl));
 
-	igt_assert_eq(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0),
+	igt_assert_eq(drmModeSetCursor(data->lease.fd, data->crtc_id, 0, 0, 0),
 		      -EACCES);
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	cleanup_crtc(&data->master,
 		     connector_id_to_output(&data->master.display, data->connector_id));
-}
+	}
 
 static void atomic_implicit_crtc(data_t *data)
 {
@@ -649,8 +658,8 @@ static void atomic_implicit_crtc(data_t *data)
 	drmModeFreeObjectProperties(props);
 	igt_assert(crtc_id_prop);
 
-	do_or_die(create_lease(data->master.fd, &mcl));
-	do_or_die(drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ATOMIC, 1));
+	do_or_die(create_lease(data, &mcl));
+	do_or_die(drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_ATOMIC, 1));
 
 	/* check CRTC_ID property on the plane */
 	req = drmModeAtomicAlloc();
@@ -663,7 +672,7 @@ static void atomic_implicit_crtc(data_t *data)
 	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == 0 || ret == -EINVAL);
 
-	ret = drmModeAtomicCommit(mcl.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	ret = drmModeAtomicCommit(data->lease.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 	igt_assert(ret == -EACCES);
 	drmModeAtomicFree(req);
 
@@ -678,29 +687,28 @@ static void atomic_implicit_crtc(data_t *data)
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
 static void lessee_list(data_t *data)
 {
-	lease_t lease;
 	struct drm_mode_list_lessees mll;
 	uint32_t lessees[1];
 
 	mll.pad = 0;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
 	/* check for nested leases */
 	mll.count_lessees = 0;
 	mll.lessees_ptr = 0;
-	igt_assert_eq(list_lessees(lease.fd, &mll), 0);
+	igt_assert_eq(list_lessees(data->lease.fd, &mll), 0);
 	igt_assert_eq(mll.count_lessees, 0);
 
 	/* Get the number of lessees */
@@ -722,14 +730,14 @@ static void lessee_list(data_t *data)
 	igt_assert_eq(mll.count_lessees, 1);
 
 	/* Make sure the listed lease is the same as the one we created */
-	igt_assert_eq(lessees[0], lease.lessee_id);
+	igt_assert_eq(lessees[0], data->lease.lessee_id);
 
 	/* invalid pad */
 	mll.pad = -1;
 	igt_assert_eq(list_lessees(data->master.fd, &mll), -EINVAL);
 	mll.pad = 0;
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 
 	/* Make sure the lease is gone */
 	igt_assert_eq(list_lessees(data->master.fd, &mll), 0);
@@ -739,7 +747,6 @@ static void lessee_list(data_t *data)
 /* Test getting the contents of a lease */
 static void lease_get(data_t *data)
 {
-	lease_t lease;
 	struct drm_mode_get_lease mgl;
 	int num_leased_obj = 3;
 	uint32_t objects[num_leased_obj];
@@ -748,12 +755,12 @@ static void lease_get(data_t *data)
 	mgl.pad = 0;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
 	/* Get the number of objects */
 	mgl.count_objects = 0;
 	mgl.objects_ptr = 0;
-	igt_assert_eq(get_lease(lease.fd, &mgl), 0);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), 0);
 
 	/* Make sure it's 2 */
 	igt_assert_eq(mgl.count_objects, num_leased_obj);
@@ -761,7 +768,7 @@ static void lease_get(data_t *data)
 	/* Get the objects */
 	mgl.objects_ptr = (uint64_t) (uintptr_t) objects;
 
-	igt_assert_eq(get_lease(lease.fd, &mgl), 0);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), 0);
 
 	/* Make sure it's 2 */
 	igt_assert_eq(mgl.count_objects, num_leased_obj);
@@ -787,28 +794,27 @@ static void lease_get(data_t *data)
 
 	/* invalid pad */
 	mgl.pad = -1;
-	igt_assert_eq(get_lease(lease.fd, &mgl), -EINVAL);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), -EINVAL);
 	mgl.pad = 0;
 
 	/* invalid pointer */
 	mgl.objects_ptr = 0;
-	igt_assert_eq(get_lease(lease.fd, &mgl), -EFAULT);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), -EFAULT);
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void lease_unleased_crtc(data_t *data)
 {
-	lease_t lease;
 	enum pipe p;
 	uint32_t bad_crtc_id;
 	drmModeCrtc *crtc;
 	int ret;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	igt_display_require(&lease.display, lease.fd);
+	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Find another CRTC that we don't control */
 	bad_crtc_id = 0;
@@ -824,36 +830,35 @@ static void lease_unleased_crtc(data_t *data)
 	igt_skip_on(bad_crtc_id == 0);
 
 	/* sanity check */
-	ret = drmModeSetCrtc(lease.fd, data->crtc_id, 0, 0, 0, NULL, 0, NULL);
+	ret = drmModeSetCrtc(data->lease.fd, data->crtc_id, 0, 0, 0, NULL, 0, NULL);
 	igt_assert_eq(ret, 0);
-	crtc = drmModeGetCrtc(lease.fd, data->crtc_id);
+	crtc = drmModeGetCrtc(data->lease.fd, data->crtc_id);
 	igt_assert(crtc);
 	drmModeFreeCrtc(crtc);
 
 	/* Attempt to use the unleased crtc id. We need raw ioctl to bypass the
 	 * igt_kms helpers.
 	 */
-	ret = drmModeSetCrtc(lease.fd, bad_crtc_id, 0, 0, 0, NULL, 0, NULL);
+	ret = drmModeSetCrtc(data->lease.fd, bad_crtc_id, 0, 0, 0, NULL, 0, NULL);
 	igt_assert_eq(ret, -ENOENT);
-	crtc = drmModeGetCrtc(lease.fd, bad_crtc_id);
+	crtc = drmModeGetCrtc(data->lease.fd, bad_crtc_id);
 	igt_assert(!crtc);
 	igt_assert_eq(errno, ENOENT);
 	drmModeFreeCrtc(crtc);
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 }
 
 static void lease_unleased_connector(data_t *data)
 {
-	lease_t lease;
 	int o;
 	uint32_t bad_connector_id;
 	drmModeConnector *c;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	igt_display_require(&lease.display, lease.fd);
+	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* Find another connector that we don't control */
 	bad_connector_id = 0;
@@ -866,72 +871,70 @@ static void lease_unleased_connector(data_t *data)
 	igt_skip_on(bad_connector_id == 0);
 
 	/* sanity check */
-	c = drmModeGetConnector(lease.fd, data->connector_id);
+	c = drmModeGetConnector(data->lease.fd, data->connector_id);
 	igt_assert(c);
 
 	/* Attempt to use the unleased connector id. Note that the
 	 */
-	c = drmModeGetConnector(lease.fd, bad_connector_id);
+	c = drmModeGetConnector(data->lease.fd, bad_connector_id);
 	igt_assert(!c);
 	igt_assert_eq(errno, ENOENT);
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 }
 
 /* Test revocation of lease */
 static void lease_revoke(data_t *data)
 {
-	lease_t lease;
 	struct drm_mode_revoke_lease mrl;
 	int ret;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	igt_display_require(&lease.display, lease.fd);
+	igt_display_require(&data->lease.display, data->lease.fd);
 
 	/* try to revoke an invalid lease */
 	mrl.lessee_id = 0;
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), -ENOENT);
 
 	/* try to revoke with the wrong fd */
-	mrl.lessee_id = lease.lessee_id;
-	igt_assert_eq(revoke_lease(lease.fd, &mrl), -EACCES);
+	mrl.lessee_id = data->lease.lessee_id;
+	igt_assert_eq(revoke_lease(data->lease.fd, &mrl), -EACCES);
 
 	/* Revoke the lease using the master fd */
-	mrl.lessee_id = lease.lessee_id;
+	mrl.lessee_id = data->lease.lessee_id;
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), 0);
 
 	/* Try to use the leased objects */
-	ret = prepare_crtc(&lease, data);
+	ret = prepare_crtc(data, false);
 
 	/* Ensure that the expected error is returned */
 	igt_assert_eq(ret, -ENOENT);
 
-	terminate_lease(&lease);
+	terminate_lease(data->lease.fd);
 
 	/* make sure the lease is gone */
-	mrl.lessee_id = lease.lessee_id;
+	mrl.lessee_id = data->lease.lessee_id;
 	igt_assert_eq(revoke_lease(data->master.fd, &mrl), -ENOENT);
 }
 
 /* Test leasing objects more than once */
 static void lease_again(data_t *data)
 {
-	lease_t lease_a, lease_b;
 
 	/* Create a valid lease */
-	igt_assert_eq(make_lease(data, &lease_a), 0);
+	igt_assert_eq(make_lease(data), 0);
 
 	/* Attempt to re-lease the same objects */
-	igt_assert_eq(make_lease(data, &lease_b), -EBUSY);
+	igt_assert_eq(make_lease(data), -EBUSY);
 
-	terminate_lease(&lease_a);
+	terminate_lease(data->lease.fd);
 
 	/* Now attempt to lease the same objects */
-	igt_assert_eq(make_lease(data, &lease_b), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	terminate_lease(&lease_b);
+	terminate_lease(data->lease.fd);
 }
 
 #define assert_unleased(ret) \
@@ -941,14 +944,13 @@ static void lease_again(data_t *data)
 /* Test leasing an invalid connector */
 static void lease_invalid_connector(data_t *data)
 {
-	lease_t lease;
 	uint32_t save_connector_id;
 	int ret;
 
 	/* Create an invalid lease */
 	save_connector_id = data->connector_id;
 	data->connector_id = 0xbaadf00d;
-	ret = make_lease(data, &lease);
+	ret = make_lease(data);
 	data->connector_id = save_connector_id;
 	assert_unleased(ret);
 }
@@ -956,28 +958,26 @@ static void lease_invalid_connector(data_t *data)
 /* Test leasing an invalid crtc */
 static void lease_invalid_crtc(data_t *data)
 {
-	lease_t lease;
 	uint32_t save_crtc_id;
 	int ret;
 
 	/* Create an invalid lease */
 	save_crtc_id = data->crtc_id;
 	data->crtc_id = 0xbaadf00d;
-	ret = make_lease(data, &lease);
+	ret = make_lease(data);
 	data->crtc_id = save_crtc_id;
 	assert_unleased(ret);
 }
 
 static void lease_invalid_plane(data_t *data)
 {
-	lease_t lease;
 	uint32_t save_plane_id;
 	int ret;
 
 	/* Create an invalid lease */
 	save_plane_id = data->plane_id;
 	data->plane_id = 0xbaadf00d;
-	ret = make_lease(data, &lease);
+	ret = make_lease(data);
 	data->plane_id = save_plane_id;
 	assert_unleased(ret);
 }
@@ -995,76 +995,76 @@ static void invalid_create_leases(data_t *data)
 
 	/* NULL array pointer */
 	mcl.object_count = 1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);
+	igt_assert_eq(create_lease(data, &mcl), -EFAULT);
 
 	/* nil object */
 	object_ids[0] = 0;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOENT);
+	igt_assert_eq(create_lease(data, &mcl), -ENOENT);
 
 	/* no crtc, non-universal_plane */
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	object_ids[0] = data->master.display.outputs[0].id;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), -EINVAL);
 
 	/* no connector, non-universal_plane */
 	object_ids[0] = data->master.display.pipes[0].crtc_id;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), -EINVAL);
 
 	/* sanity check */
 	object_ids[0] = data->master.display.pipes[0].crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
 	mcl.object_count = 2;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	close(data->lease.fd);
 
 	/* no plane, universal planes */
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), -EINVAL);
 
 	/* sanity check */
 	object_ids[2] = igt_pipe_get_plane_type(&data->master.display.pipes[0],
 						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_count = 3;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	close(data->lease.fd);
 
 	/* array overflow, do a small scan around overflow sizes */
 	for (int i = 1; i <= 4; i++) {
 		mcl.object_count = UINT32_MAX / sizeof(object_ids[0]) + i;
-		igt_assert_eq(create_lease(data->master.fd, &mcl), -ENOMEM);
+		igt_assert_eq(create_lease(data, &mcl), -ENOMEM);
 	}
 
 	/* sanity check */
 	mcl.object_count = 3;
 	mcl.flags = O_CLOEXEC | O_NONBLOCK;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	close(data->lease.fd);
 
 	/* invalid flags */
 	mcl.flags = -1;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), -EINVAL);
 
 	/* no subleasing */
 	mcl.object_count = 3;
 	mcl.flags = 0;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	tmp_fd = mcl.fd;
-	igt_assert_eq(create_lease(tmp_fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	tmp_fd = data->lease.fd;
+	igt_assert_eq(_create_lease(tmp_fd, &mcl), -EINVAL);
 	close(tmp_fd);
 
 	/* no double-leasing */
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	tmp_fd = mcl.fd;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EBUSY);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	tmp_fd = data->lease.fd;
+	igt_assert_eq(create_lease(data, &mcl), -EBUSY);
 	close(tmp_fd);
 
 	/* no double leasing */
 	object_ids[3] = object_ids[2];
 	mcl.object_count = 4;
 	/* Note: the ENOSPC is from idr double-insertion failing */
-	ret = create_lease(data->master.fd, &mcl);
+	ret = create_lease(data, &mcl);
 	assert_double_id_err(ret);
 
 	/* no encoder leasing */
@@ -1072,7 +1072,7 @@ static void invalid_create_leases(data_t *data)
 	igt_assert(resources);
 	igt_assert(resources->count_encoders > 0);
 	object_ids[3] = resources->encoders[0];
-	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
+	igt_assert_eq(create_lease(data, &mcl), -EINVAL);
 	drmModeFreeResources(resources);
 }
 
@@ -1158,19 +1158,17 @@ static void possible_crtcs_filtering(data_t *data)
 	mcl.flags = 0;
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		int lease_fd;
 
 		object_ids[mcl.object_count - 1] =
 			resources->crtcs[i];
 
-		igt_assert_eq(create_lease(master_fd, &mcl), 0);
-		lease_fd = mcl.fd;
+		igt_assert_eq(create_lease(data, &mcl), 0);
 
-		drmSetClientCap(lease_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+		drmSetClientCap(data->lease.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
-		check_crtc_masks(master_fd, lease_fd, 1 << i);
+		check_crtc_masks(master_fd, data->lease.fd, 1 << i);
 
-		close(lease_fd);
+		close(data->lease.fd);
 	}
 
 	free(object_ids);
@@ -1197,7 +1195,7 @@ static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
 	mcl.object_count = 3;
 	mcl.flags = 0;
 
-	igt_assert_eq(create_lease(master_fd, &mcl), expected_ret);
+	igt_assert_eq(_create_lease(master_fd, &mcl), expected_ret);
 
 	return expected_ret == 0 ? mcl.fd : 0;
 }
@@ -1291,13 +1289,13 @@ static void implicit_plane_lease(data_t *data)
 	mcl.flags = 0;
 
 	/* sanity check */
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
-	close(mcl.fd);
+	igt_assert_eq(create_lease(data, &mcl), 0);
+	close(data->lease.fd);
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 
 	/* non universal plane automatically adds primary/cursor plane */
 	mcl.object_count = 2;
-	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
+	igt_assert_eq(create_lease(data, &mcl), 0);
 
 	mgl.pad = 0;
 	mgl.count_objects = 0;
@@ -1306,17 +1304,17 @@ static void implicit_plane_lease(data_t *data)
 
 	igt_assert_eq(mgl.count_objects, 3 + (cursor_id ? 1 : 0));
 
-	close(mcl.fd);
+	close(data->lease.fd);
 
 	/* check that implicit lease doesn't lead to confusion when
 	 * explicitly adding primary plane */
 	mcl.object_count = 3;
-	ret = create_lease(data->master.fd, &mcl);
+	ret = create_lease(data, &mcl);
 	assert_double_id_err(ret);
 
 	/* same for the cursor */
 	object_ids[2] = cursor_id;
-	ret = create_lease(data->master.fd, &mcl);
+	ret = create_lease(data, &mcl);
 	assert_double_id_err(ret);
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -1419,6 +1417,7 @@ igt_main
 									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
 					}
+					terminate_lease(data.lease.fd);
 				}
 			}
 		}
-- 
2.25.1
