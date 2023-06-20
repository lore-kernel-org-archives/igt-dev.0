Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B6810E0CF
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 19:16:09 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <stylon.wang@amd.com>,
 <hamza.mahfooz@amd.com>
Date: Tue, 20 Jun 2023 15:16:03 -0400
Message-ID: <20230620191603.94265-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_color: fix sub test
 crtc-lut-accuracy failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add reading degamma_lut_size and regamma_lut_size from Linux kernel
within test_crtc_lut_accuracy. Test fails within lut_init when
lut_size equals to zero.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_color.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 9eed1da38..34002ed88 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -53,7 +53,7 @@ typedef struct data {
 
 static void lut_init(lut_t *lut, uint32_t size)
 {
-	igt_assert(size > 0);
+	igt_assert_lt(0, size);
 
 	lut->size = size;
 	lut->data = malloc(size * sizeof(struct drm_color_lut));
@@ -229,7 +229,6 @@ static void test_crtc_linear_degamma(data_t *data)
 
 	data->degamma_lut_size =
 		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->degamma_lut_size);
 
 	lut_init(&lut_linear, data->degamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
@@ -277,7 +276,6 @@ static void test_crtc_linear_regamma(data_t *data)
 
 	data->regamma_lut_size =
 		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->regamma_lut_size);
 
 	lut_init(&lut_linear, data->regamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
@@ -340,6 +338,12 @@ static void test_crtc_lut_accuracy(data_t *data)
 	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
 
+	data->degamma_lut_size =
+		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
+
+	data->regamma_lut_size =
+		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
+
 	lut_init(&lut_degamma, data->degamma_lut_size);
 	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
 
-- 
2.25.1
