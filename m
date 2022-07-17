Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7625212A339
 for <igt-dev@lists.freedesktop.org>; Sun, 17 Jul 2022 20:00:02 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Jul 2022 01:25:54 +0530
Message-Id: <20220717195554.162231-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220717195554.162231-1-mohammed.thasleem@intel.com>
References: <20220717195554.162231-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/2] tests/kms_lease: Test Cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sanitize the system state before starting the subtest.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 4f614e4e..46c41fca 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -102,6 +102,8 @@ static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
 	if (!output)
 		return -ENOENT;
 
+	igt_display_reset(display);
+
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, pipe);
 
@@ -138,7 +140,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 }
 
@@ -1246,6 +1248,7 @@ igt_main
 		data.master.fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.master.display, data.master.fd);
+		igt_display_require_output(&data.master.display);
 	}
 
 	for (f = funcs; f->name; f++) {
@@ -1314,4 +1317,9 @@ igt_main
 				lease_uevent(&data);
 		}
 	}
+
+	igt_fixture {
+		igt_display_fini(&data.master.display);
+		close(data.master.fd);
+	}
 }
-- 
2.25.1
