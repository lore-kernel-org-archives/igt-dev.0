Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6922B5FF
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Aug 2022 11:11:42 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 Aug 2022 16:37:10 +0530
Message-Id: <20220801110710.95609-3-mohammed.thasleem@intel.com>
In-Reply-To: <20220801110710.95609-1-mohammed.thasleem@intel.com>
References: <20220801110710.95609-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/2] tests/kms_lease: Test Cleanup
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

v2: Minor changes.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 6126ded9..1d4ff904 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -136,7 +136,7 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 
-	igt_output_set_pipe(output, PIPE_ANY);
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(display);
 }
 
@@ -1235,12 +1235,15 @@ igt_main
 		data.master.fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.master.display, data.master.fd);
+		igt_display_require_output(&data.master.display);
 	}
 
 	for (f = funcs; f->name; f++) {
 
 		igt_describe(f->desc);
 		igt_subtest_with_dynamic_f("%s", f->name) {
+			igt_display_reset(&data.master.display);
+			igt_display_commit(&data.master.display);
 			for_each_pipe_with_valid_output(&data.master.display, p, output) {
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p),
 					      igt_output_name(output)) {
@@ -1277,4 +1280,9 @@ igt_main
 	igt_describe("Tests all the uevent cases");
 	igt_subtest("lease-uevent")
 		lease_uevent(&data);
+
+	igt_fixture {
+		igt_display_fini(&data.master.display);
+		close(data.master.fd);
+	}
 }
-- 
2.25.1
