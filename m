Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A72C10E5B2
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 14:41:40 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Jul 2023 20:04:49 +0530
Message-Id: <20230707143449.16139-1-mohammed.thasleem@intel.com>
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

Check for lease fd and close lease fd on every display
dependent subtests execution.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index c8ae98206..83e94dfae 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -57,6 +57,7 @@ typedef struct {
 } lease_t;
 
 typedef struct {
+	int lease_fd;
 	lease_t master;
 	enum pipe pipe;
 	uint32_t crtc_id;
@@ -176,6 +177,7 @@ static int make_lease(data_t *data, lease_t *lease)
 	object_ids[mcl.object_count++] = data->plane_id;
 
 	ret = create_lease(data->master.fd, &mcl);
+	data->lease_fd = mcl.fd;
 
 	if (ret)
 		return ret;
@@ -275,6 +277,7 @@ static void page_flip_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -344,6 +347,7 @@ static void setcrtc_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/*
@@ -395,6 +399,7 @@ static void cursor_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -408,6 +413,7 @@ static void cursor_implicit_plane(data_t *data)
 	/* primary plane is never the cursor */
 	object_ids[mcl.object_count++] = data->plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 
 	igt_assert_eq(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0),
 		      -EACCES);
@@ -470,6 +476,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(crtc_id_prop);
 
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	do_or_die(drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ATOMIC, 1));
 
 	/* check CRTC_ID property on the plane */
@@ -1238,6 +1245,8 @@ igt_main
 							igt_pipe_get_plane_type(&data.master.display.pipes[data.pipe],
 									DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
+						if (data.lease_fd != 0)
+							close(data.lease_fd);
 					}
 				}
 			}
-- 
2.25.1
