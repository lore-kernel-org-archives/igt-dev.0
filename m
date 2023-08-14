Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50F1C10E085
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 16:22:05 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 14 Aug 2023 21:44:12 +0530
Message-Id: <20230814161412.19157-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230731200110.233275-1-mohammed.thasleem@intel.com>
References: <20230731200110.233275-1-mohammed.thasleem@intel.com>
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
    -Removed lease_t from all sub-tests.
v3: Updated commit message.
v4: Avoid duplicating prepare_crtc.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 130 +++++++++++++++++++++++-----------------------
 1 file changed, 64 insertions(+), 66 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index c8ae98206..9823e9265 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -57,6 +57,7 @@ typedef struct {
 } lease_t;
 
 typedef struct {
+	lease_t lease;
 	lease_t master;
 	enum pipe pipe;
 	uint32_t crtc_id;
@@ -72,9 +73,10 @@ static igt_output_t *connector_id_to_output(igt_display_t *display, uint32_t con
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
@@ -94,7 +96,6 @@ static int prepare_crtc(lease_t *lease, data_t *data)
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &lease->primary_fb);
-
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &lease->primary_fb);
 
@@ -160,7 +161,7 @@ static int get_lease(int fd, struct drm_mode_get_lease *mgl)
 	return err;
 }
 
-static int make_lease(data_t *data, lease_t *lease)
+static int make_lease(data_t *data)
 {
 	uint32_t object_ids[3];
 	struct drm_mode_create_lease mcl;
@@ -176,12 +177,12 @@ static int make_lease(data_t *data, lease_t *lease)
 	object_ids[mcl.object_count++] = data->plane_id;
 
 	ret = create_lease(data->master.fd, &mcl);
+	data->lease.fd = mcl.fd;
 
 	if (ret)
 		return ret;
 
-	lease->fd = mcl.fd;
-	lease->lessee_id = mcl.lessee_id;
+	data->lease.lessee_id = mcl.lessee_id;
 	return 0;
 }
 
@@ -216,24 +217,23 @@ static void simple_lease(data_t *data)
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
+	terminate_lease(&data->lease);
 }
 
 static void empty_lease(data_t *data)
@@ -275,10 +275,11 @@ static void page_flip_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
 	/* sanity check */
 	do_or_die(drmModePageFlip(data->master.fd, data->crtc_id,
@@ -344,6 +345,7 @@ static void setcrtc_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/*
@@ -355,7 +357,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	}
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
 	/* sanity check */
 	ret = drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
@@ -368,6 +370,7 @@ static void setcrtc_implicit_plane(data_t *data)
 
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 
 	igt_assert_eq(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
 				     0, 0, object_ids, 1, mode),
@@ -395,10 +398,11 @@ static void cursor_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
-	igt_assert_eq(0, prepare_crtc(&data->master, data));
+	igt_assert_eq(0, prepare_crtc(data, true));
 
 	/* sanity check */
 	do_or_die(drmModeSetCursor(data->master.fd, data->crtc_id, 0, 0, 0));
@@ -408,6 +412,7 @@ static void cursor_implicit_plane(data_t *data)
 	/* primary plane is never the cursor */
 	object_ids[mcl.object_count++] = data->plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 
 	igt_assert_eq(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0),
 		      -EACCES);
@@ -415,7 +420,7 @@ static void cursor_implicit_plane(data_t *data)
 
 	cleanup_crtc(&data->master,
 		     connector_id_to_output(&data->master.display, data->connector_id));
-}
+	}
 
 static void atomic_implicit_crtc(data_t *data)
 {
@@ -470,6 +475,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(crtc_id_prop);
 
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease.fd = mcl.fd;
 	do_or_die(drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ATOMIC, 1));
 
 	/* check CRTC_ID property on the plane */
@@ -508,19 +514,18 @@ static void atomic_implicit_crtc(data_t *data)
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
@@ -542,14 +547,14 @@ static void lessee_list(data_t *data)
 	igt_assert_eq(mll.count_lessees, 1);
 
 	/* Make sure the listed lease is the same as the one we created */
-	igt_assert_eq(lessees[0], lease.lessee_id);
+	igt_assert_eq(lessees[0], data->lease.lessee_id);
 
 	/* invalid pad */
 	mll.pad = -1;
 	igt_assert_eq(list_lessees(data->master.fd, &mll), -EINVAL);
 	mll.pad = 0;
 
-	terminate_lease(&lease);
+	terminate_lease(&data->lease);
 
 	/* Make sure the lease is gone */
 	igt_assert_eq(list_lessees(data->master.fd, &mll), 0);
@@ -559,7 +564,6 @@ static void lessee_list(data_t *data)
 /* Test getting the contents of a lease */
 static void lease_get(data_t *data)
 {
-	lease_t lease;
 	struct drm_mode_get_lease mgl;
 	int num_leased_obj = 3;
 	uint32_t objects[num_leased_obj];
@@ -568,12 +572,12 @@ static void lease_get(data_t *data)
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
@@ -581,7 +585,7 @@ static void lease_get(data_t *data)
 	/* Get the objects */
 	mgl.objects_ptr = (uint64_t) (uintptr_t) objects;
 
-	igt_assert_eq(get_lease(lease.fd, &mgl), 0);
+	igt_assert_eq(get_lease(data->lease.fd, &mgl), 0);
 
 	/* Make sure it's 2 */
 	igt_assert_eq(mgl.count_objects, num_leased_obj);
@@ -607,28 +611,27 @@ static void lease_get(data_t *data)
 
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
+	terminate_lease(&data->lease);
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
@@ -644,36 +647,35 @@ static void lease_unleased_crtc(data_t *data)
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
+	terminate_lease(&data->lease);
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
@@ -686,72 +688,70 @@ static void lease_unleased_connector(data_t *data)
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
+	terminate_lease(&data->lease);
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
+	terminate_lease(&data->lease);
 
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
+	terminate_lease(&data->lease);
 
 	/* Now attempt to lease the same objects */
-	igt_assert_eq(make_lease(data, &lease_b), 0);
+	igt_assert_eq(make_lease(data), 0);
 
-	terminate_lease(&lease_b);
+	terminate_lease(&data->lease);
 }
 
 #define assert_unleased(ret) \
@@ -761,14 +761,13 @@ static void lease_again(data_t *data)
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
@@ -776,28 +775,26 @@ static void lease_invalid_connector(data_t *data)
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
@@ -1239,6 +1236,7 @@ igt_main
 									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
 					}
+					terminate_lease(&data.lease);
 				}
 			}
 		}
-- 
2.25.1
