Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EE6730E6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Dec 2021 07:21:21 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Mon, 6 Dec 2021 15:20:18 +0800
Message-ID: <20211206072018.9053-12-stylon.wang@amd.com>
In-Reply-To: <20211206072018.9053-1-stylon.wang@amd.com>
References: <20211206072018.9053-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3 11/11] tests/amdgpu/amd_plane: Add P010
 format to MPO tests and add test descriptions
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
Cc: Bhawanpreet.Lakha@amd.com, Ahmad.Othman@amd.com, Hayden.Goodfellow@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_plane.c | 64 +++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 10 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index e4c7dca3..faaa1b87 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -24,6 +24,8 @@
 #include "libdrm/amdgpu.h"
 #include "libdrm/amdgpu_drm.h"
 
+IGT_TEST_DESCRIPTION("Tests for Multi Plane Overlay for single and dual displays");
+
 /* Maximum pipes on any AMD ASIC. */
 #define MAX_PIPES 6
 #define DISPLAYS_TO_TEST 2
@@ -485,7 +487,7 @@ static void test_display_mpo(data_t *data, enum test test, uint32_t format, int
 
 		igt_plane_set_fb(data->primary[n], &fb[n].ref_primary);
 
-		if (format == DRM_FORMAT_NV12)
+		if (format == DRM_FORMAT_NV12 || format == DRM_FORMAT_P010)
 			set_regamma_lut(data, &lut,  n);
 	}
 
@@ -739,20 +741,62 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("MPO with 4K planes");
 	igt_subtest("test-mpo-4k") test_mpo_4k(&data);
+	igt_describe("MPO with tiled and linear buffers");
 	igt_subtest("mpo-swizzle-toggle") test_mpo_swizzle_toggle(&data);
+	igt_describe("MPO with tiled and linear buffers on dual displays");
 	igt_subtest("mpo-swizzle-toggle-multihead")
 		test_mpo_swizzle_toggle_multihead(&data);
-	igt_subtest("mpo-pan-rgb") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, 1);
-	igt_subtest("mpo-pan-rgb-multihead") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, 1);
-	igt_subtest("mpo-pan-nv12-multihead") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-pan-multi-rgb") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-pan-multi-nv12") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-scale-rgb") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
-	igt_subtest("mpo-scale-rgb-multihead") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-scale-nv12") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, 1);
+
+	igt_describe("MPO and moving RGB primary plane around");
+	igt_subtest("mpo-pan-rgb")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, 1);
+	igt_describe("MPO and moving RGB primary plane around with dual displays");
+	igt_subtest("mpo-pan-rgb-multihead")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+
+	igt_describe("MPO and moving NV12 primary plane around");
+	igt_subtest("mpo-pan-nv12")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, 1);
+	igt_describe("MPO and moving NV12 primary plane around with dual displays");
+	igt_subtest("mpo-pan-nv12-multihead")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+
+	igt_describe("MPO and moving P010 primary plane around");
+	igt_subtest("mpo-pan-p010")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_P010, 1);
+	igt_describe("MPO and moving P010 primary plane around with dual displays");
+	igt_subtest("mpo-pan-p010-multihead")
+		test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_P010, DISPLAYS_TO_TEST);
+
+	igt_describe("MPO and moving RGB primary plane between 2 displays");
+	igt_subtest("mpo-pan-multi-rgb")
+		test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_describe("MPO and moving NV12 primary plane between 2 displays");
+	igt_subtest("mpo-pan-multi-nv12")
+		test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_describe("MPO and moving P010 primary plane between 2 displays");
+	igt_subtest("mpo-pan-multi-p010")
+		test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_P010, DISPLAYS_TO_TEST);
+
+	igt_describe("MPO and scaling RGB primary plane");
+	igt_subtest("mpo-scale-rgb")
+		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
+	igt_describe("MPO and scaling RGB primary plane with 2 displays");
+	igt_subtest("mpo-scale-rgb-multihead")
+		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_describe("MPO and scaling NV12 primary plane");
+	igt_subtest("mpo-scale-nv12")
+		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, 1);
+	igt_describe("MPO and scaling NV12 primary plane with 2 displays");
 	igt_subtest("mpo-scale-nv12-multihead") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_describe("MPO and scaling P010 primary plane");
+	igt_subtest("mpo-scale-p010")
+		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_P010, 1);
+	igt_describe("MPO and scaling P010 primary plane with 2 displays");
+	igt_subtest("mpo-scale-p010-multihead")
+		test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_P010, DISPLAYS_TO_TEST);
 
 	igt_fixture
 	{
-- 
2.33.1
