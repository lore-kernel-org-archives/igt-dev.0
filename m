Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9FB6E108
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 19:57:38 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Mon, 29 Nov 2021 14:56:58 -0500
Message-ID: <20211129195659.1865321-5-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
References: <20211129195659.1865321-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 4/5] test/amdgpu: Add test description to
 amd_max_bpc and amd_color tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: harry.wentland@amd.com, markyacoub@google.com, nicholas.choi@amd.com, hayden.goodfellow@amd.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Stylon Wang <stylon.wang@amd.com>

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_color.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 74900ba9..2e1f3d84 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -24,7 +24,7 @@
 
 #include "igt.h"
 
-IGT_TEST_DESCRIPTION("Test Color Features at Plane level");
+IGT_TEST_DESCRIPTION("Test Color Features at Plane and CRTC level");
 
 /* (De)gamma LUT. */
 typedef struct lut {
@@ -884,16 +884,25 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests correctness of linear degamma on CRTC");
 	igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);
+	igt_describe("Tests correctness of linear regamma on CRTC");
 	igt_subtest("crtc-linear-regamma") test_crtc_linear_regamma(&data);
+	igt_describe("Tests color accuracy of CRTC degamma and regamma");
 	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
 
+	igt_describe("Tests color remapping using color transform matrix on planes");
 	igt_subtest("plane-ctm-color-remapping") test_plane_ctm_color_remapping(&data);
+	igt_describe("Tests reducing color intensity with color transform matrix on planes");
 	igt_subtest("plane-ctm-intensity-reduction") test_plane_ctm_intensity_reduction(&data);
+	igt_describe("Tests negative mapping with color transform matrix on planes");
 	igt_subtest("plane-ctm-negative-mapping") test_plane_ctm_negative_mapping(&data);
+	igt_describe("Tests positive and negative mapping with color transform matrix on planes");
 	igt_subtest("plane-ctm-mixed-mapping") test_plane_ctm_mixed_mapping(&data);
+	igt_describe("Tests max gamma curve (all values to maximum except 0) on planes");
 	igt_subtest("plane-max-degamma") test_plane_max_degamma(&data);
 
+	igt_describe("Tests combination of plane degamma and CRTC regamma");
 	igt_subtest("plane-crtc-degamma") test_plane_crtc_gamma_formats(&data);
 
 	igt_fixture
-- 
2.25.1
