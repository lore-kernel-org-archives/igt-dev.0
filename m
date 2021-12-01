Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2212F6E50D
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 06:55:11 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Dec 2021 14:54:27 +0800
Message-ID: <20211201065434.48827-5-stylon.wang@amd.com>
In-Reply-To: <20211201065434.48827-1-stylon.wang@amd.com>
References: <20211130083503.10221-1-stylon.wang@amd.com>
 <20211201065434.48827-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 04/11] tests/amdgpu/amd_plane: Switch
 mpo-swizzle-toggle to single-head
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Victor Lu <victorchengchi.lu@amd.com>, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[why]
Older ASIC does not support multi-head MPO

[how]
Rename current mpo-swizzle-toggle subtest to
mpo-swizzle-toggle-multihead. Change mpo-swizzle-toggle to only use one
output.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
---
 tests/amdgpu/amd_plane.c | 70 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index ba29bdd4..5666b9e7 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -232,7 +232,7 @@ static void test_mpo_4k(data_t *data)
 	igt_remove_fb(data->fd, &r_fb);
 }
 
-static void test_mpo_swizzle_toggle(data_t *data)
+static void test_mpo_swizzle_toggle_multihead(data_t *data)
 {
 	struct amdgpu_bo_metadata meta = {};
 	igt_display_t *display = &data->display;
@@ -306,6 +306,72 @@ static void test_mpo_swizzle_toggle(data_t *data)
 	igt_remove_fb(data->fd, &fb_1920_xr24_tiled);
 }
 
+static void test_mpo_swizzle_toggle(data_t *data)
+{
+	struct amdgpu_bo_metadata meta = {};
+	igt_display_t *display = &data->display;
+	igt_fb_t fb_1280_ar24_tiled, fb_1920_xb24_tiled, fb_1920_xb24_linear,
+		 fb_1920_xr24_tiled;
+	int w, h;
+
+	w = 2400;
+	h = 1350;
+
+	igt_create_pattern_fb(data->fd, 1280, 1024, DRM_FORMAT_ARGB8888, 0,
+			      &fb_1280_ar24_tiled);
+	igt_create_pattern_fb(data->fd, 1920, 1080, DRM_FORMAT_XBGR8888, 0,
+			      &fb_1920_xb24_tiled);
+	igt_create_pattern_fb(data->fd, 1920, 1080, DRM_FORMAT_XBGR8888, 0,
+			      &fb_1920_xb24_linear);
+	igt_create_pattern_fb(data->fd, 1920, 1080, DRM_FORMAT_XRGB8888, 0,
+			      &fb_1920_xr24_tiled);
+
+	meta.tiling_info = AMDGPU_TILING_SET(SWIZZLE_MODE, 0x19);
+	set_metadata(data, &fb_1280_ar24_tiled, &meta);
+
+	meta.tiling_info = AMDGPU_TILING_SET(SWIZZLE_MODE, 0x19);
+	set_metadata(data, &fb_1920_xb24_tiled, &meta);
+
+	meta.tiling_info = AMDGPU_TILING_SET(SWIZZLE_MODE, 0x19);
+	set_metadata(data, &fb_1920_xr24_tiled, &meta);
+
+	test_init(data);
+
+	/* Initial modeset */
+	igt_output_set_pipe(data->output[0], data->pipe_id[0]);
+	force_output_mode(data, data->output[0], &test_mode_1);
+
+	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
+	igt_plane_set_size(data->primary[0], w, h);
+
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+
+	/* Enable overlay plane. */
+	igt_plane_set_fb(data->overlay[0], &fb_1280_ar24_tiled);
+	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
+	igt_plane_set_size(data->primary[0], w, h);
+	igt_display_commit_atomic(display, 0, 0);
+
+	/* Switch to tiled. */
+	igt_plane_set_fb(data->overlay[0], &fb_1280_ar24_tiled);
+	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_tiled);
+	igt_plane_set_size(data->primary[0], w, h);
+	igt_display_commit_atomic(display, 0, 0);
+
+	/* Switch to linear. */
+	igt_plane_set_fb(data->overlay[0], &fb_1280_ar24_tiled);
+	igt_plane_set_fb(data->primary[0], &fb_1920_xb24_linear);
+	igt_plane_set_size(data->primary[0], w, h);
+	igt_display_commit_atomic(display, 0, 0);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &fb_1280_ar24_tiled);
+	igt_remove_fb(data->fd, &fb_1920_xb24_tiled);
+	igt_remove_fb(data->fd, &fb_1920_xb24_linear);
+	igt_remove_fb(data->fd, &fb_1920_xr24_tiled);
+}
+
+
 igt_main
 {
 	data_t data;
@@ -327,6 +393,8 @@ igt_main
 
 	igt_subtest("test-mpo-4k") test_mpo_4k(&data);
 	igt_subtest("mpo-swizzle-toggle") test_mpo_swizzle_toggle(&data);
+	igt_subtest("mpo-swizzle-toggle-multihead")
+		test_mpo_swizzle_toggle_multihead(&data);
 
 	igt_fixture
 	{
-- 
2.33.1
