Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F8110E0E6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 17:30:43 +0000 (UTC)
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <sunpeng.li@amd.com>, <harry.wentland@amd.com>, <nicholas.kazlauskas@amd.com>
Date: Thu, 23 Mar 2023 13:30:03 -0400
Message-ID: <20230323173003.592421-1-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <8307c87d-e96c-ee2d-48bb-a2964a349e31@amd.com>
References: <8307c87d-e96c-ee2d-48bb-a2964a349e31@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] amdgpu_amd_plane: Add Multi MPO invalid test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
We cannot draw cursor on a video plane so if the usermode trys to use
the topmost plane as a video plane we should reject that commit

[How]
Trying to use a video format (NV12) as the topmost plane should fail
atomic check

*v2
- Update test description
- Formatting fixes

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 tests/amdgpu/amd_plane.c | 55 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 4115d692..fd46fb04 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -544,6 +544,57 @@ static void test_panning_2_display(data_t *data, int w, int h, struct fbc *fbc)
 
 }
 
+/*
+ * This tests invalid plane format order
+ *
+ * Since we cannot draw a cursor on a video plane the top most plane cannot be a video plane.
+ * This test tries to commit a configuration where the topmost plane is a video plane. This is
+ * expected to fail since we do not support that configuration.
+ */
+static void test_multi_mpo_invalid(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	uint32_t regamma_lut_size;
+	lut_t lut;
+	struct fbc fb[4];
+	int valid_outputs = 0;
+	int w, h;
+	int ret;
+
+	test_init(data);
+
+	w = data->w[0];
+	h = data->h[0];
+
+	/* Skip test if we don't have 2 overlay planes */
+	igt_skip_on(!data->overlay2[0]);
+
+	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
+
+	igt_create_color_fb(data->fd, w, h, DRM_FORMAT_XRGB8888, 0, 1.0, 1.0, 1.0, &fb[0].test_primary);
+	igt_create_fb(data->fd, w, h, DRM_FORMAT_NV12, 0, &fb[0].test_overlay);
+
+	/* Top most plane is NV12 (video plane) */
+	igt_create_fb(data->fd, w, h, DRM_FORMAT_NV12, 0, &fb[0].test_overlay2);
+
+	igt_plane_set_fb(data->primary[0], &fb[0].test_primary);
+	igt_plane_set_fb(data->overlay[0], &fb[0].test_overlay);
+	igt_plane_set_fb(data->overlay2[0], &fb[0].test_overlay2);
+
+	/* This should fail as the topmost plane is NV12 */
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+
+	if (!ret)
+		igt_assert(0);
+
+	test_fini(data);
+
+	igt_remove_fb(data->fd, &fb[0].test_primary);
+	igt_remove_fb(data->fd, &fb[0].test_overlay);
+	igt_remove_fb(data->fd, &fb[0].test_overlay2);
+}
+
 /*
  * Setup and runner for panning test. Creates common video sizes and pans them across the display
  */
@@ -911,6 +962,10 @@ igt_main
 	igt_subtest("multi-overlay")
 		test_display_mpo(&data, MPO_MULTI_OVERLAY, DRM_FORMAT_NV12, 1);
 
+	igt_describe("Invalid MPO with 2 overlays planes and a primary plane");
+	igt_subtest("multi-overlay-invalid")
+		test_multi_mpo_invalid(&data);
+
 	igt_describe("MPO and scaling RGB primary plane");
 	igt_subtest("mpo-scale-rgb")
 		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
-- 
2.25.1
