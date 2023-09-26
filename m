Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8510E42F
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 19:59:12 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 27 Sep 2023 01:19:50 +0530
Message-Id: <20230926194952.64561-2-mohammed.thasleem@intel.com>
In-Reply-To: <20230926194952.64561-1-mohammed.thasleem@intel.com>
References: <20230926194952.64561-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/3] tests/kms_lease: Terminate lease fd before
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

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 9ada6d5ea..dc6124ede 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -216,6 +216,7 @@ typedef struct {
 } lease_t;
 
 typedef struct {
+	int lease_fd;
 	lease_t master;
 	enum pipe pipe;
 	uint32_t crtc_id;
@@ -335,6 +336,7 @@ static int make_lease(data_t *data, lease_t *lease)
 	object_ids[mcl.object_count++] = data->plane_id;
 
 	ret = create_lease(data->master.fd, &mcl);
+	data->lease_fd = mcl.fd;
 
 	if (ret)
 		return ret;
@@ -434,6 +436,7 @@ static void page_flip_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -503,6 +506,7 @@ static void setcrtc_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/*
@@ -554,6 +558,7 @@ static void cursor_implicit_plane(data_t *data)
 
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	/* Set a mode on the leased output */
@@ -567,6 +572,7 @@ static void cursor_implicit_plane(data_t *data)
 	/* primary plane is never the cursor */
 	object_ids[mcl.object_count++] = data->plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 
 	igt_assert_eq(drmModeSetCursor(mcl.fd, data->crtc_id, 0, 0, 0),
 		      -EACCES);
@@ -629,6 +635,7 @@ static void atomic_implicit_crtc(data_t *data)
 	igt_assert(crtc_id_prop);
 
 	do_or_die(create_lease(data->master.fd, &mcl));
+	data->lease_fd = mcl.fd;
 	do_or_die(drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ATOMIC, 1));
 
 	/* check CRTC_ID property on the plane */
@@ -1397,6 +1404,8 @@ igt_main
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
