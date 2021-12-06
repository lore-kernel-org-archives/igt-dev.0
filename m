Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239F0730E6
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Dec 2021 07:21:13 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Mon, 6 Dec 2021 15:20:15 +0800
Message-ID: <20211206072018.9053-9-stylon.wang@amd.com>
In-Reply-To: <20211206072018.9053-1-stylon.wang@amd.com>
References: <20211206072018.9053-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v3 08/11] tests/amdgpu/amd_plane: Add MPO
 scale and pan subtest single display option
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

[Why]
The MPO scale and pan subtests is valid with one display and our current
CI setup only has one display.

[How]
Change the MPO scale and pan subtests to be single display and add
"-multihead" subtests for the two for the original dual display config

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
---
 tests/amdgpu/amd_plane.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 9506421d..12669239 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -740,12 +740,16 @@ igt_main
 	igt_subtest("mpo-swizzle-toggle") test_mpo_swizzle_toggle(&data);
 	igt_subtest("mpo-swizzle-toggle-multihead")
 		test_mpo_swizzle_toggle_multihead(&data);
-	igt_subtest("mpo-pan-rgb") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-pan-rgb") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, 1);
+	igt_subtest("mpo-pan-rgb-multihead") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-pan-nv12") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, 1);
+	igt_subtest("mpo-pan-nv12-multihead") test_display_mpo(&data, MPO_SINGLE_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 	igt_subtest("mpo-pan-multi-rgb") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
 	igt_subtest("mpo-pan-multi-nv12") test_display_mpo(&data, MPO_MULTI_PAN, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-scale-rgb") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
-	igt_subtest("mpo-scale-nv12") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-scale-rgb") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, 1);
+	igt_subtest("mpo-scale-rgb-multihead") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_XRGB8888, DISPLAYS_TO_TEST);
+	igt_subtest("mpo-scale-nv12") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, 1);
+	igt_subtest("mpo-scale-nv12-multihead") test_display_mpo(&data, MPO_SCALE, DRM_FORMAT_NV12, DISPLAYS_TO_TEST);
 
 	igt_fixture
 	{
-- 
2.33.1
