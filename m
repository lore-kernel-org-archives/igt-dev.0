Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B5310E121
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 06:38:02 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Feb 2023 12:10:18 +0530
Message-Id: <20230206064018.23932-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Add
 downscaling+upscaling tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Coelho@freedesktop.org, Luciano <luciano.coelho@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In newer hardware versions (i.e. display version >= 14), the second
scaler doesn't support downscaling. Current driver design in the
case of 2 plane scaling scenario is if plane1-US and plane2-DS,
it's reject for now. That's why new tests are added for plane1-DS
and plane2-US, so that different DS+US combinations can be validated.

Cc: Coelho, Luciano <luciano.coelho@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_plane_scaling.c | 66 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 887a55e63..4c7393b00 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -31,7 +31,8 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
 enum scaler_combo_test_type {
 	TEST_PLANES_UPSCALE = 0,
 	TEST_PLANES_DOWNSCALE,
-	TEST_PLANES_UPSCALE_DOWNSCALE
+	TEST_PLANES_UPSCALE_DOWNSCALE,
+	TEST_PLANES_DOWNSCALE_UPSCALE
 };
 
 typedef struct {
@@ -286,6 +287,69 @@ const struct {
 		0.75,
 		TEST_PLANES_UPSCALE_DOWNSCALE,
 	},
+	{
+		"Tests downscaling (scaling factor 0.25) and upscaling (20x20) of 2 planes.",
+		"planes-downscale-factor-0-25-upscale-20x20",
+		0.25,
+		0.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.25) and upscaling (scaling factor 0.25) of 2 planes.",
+		"planes-downscale-factor-0-25-upscale-0-25",
+		0.25,
+		0.25,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.25) and scaling (unity) of 2 planes.",
+		"planes-downscale-factor-0-25-unity-scaling",
+		0.25,
+		1.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.5) and upscaling (20x20) of 2 planes.",
+		"planes-downscale-factor-0-5-upscale-20x20",
+		0.5,
+		0.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.5) and upscaling (scaling factor 0.25) of 2 planes.",
+		"planes-downscale-factor-0-5-upscale-0-25",
+		0.5,
+		0.25,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.5) and scaling (unity) of 2 planes.",
+		"planes-downscale-factor-0-5-unity-scaling",
+		0.5,
+		1.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.75) and upscaling (20x20) of 2 planes.",
+		"planes-downscale-factor-0-75-upscale-20x20",
+		0.75,
+		0.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.75) and upscaling (scaling factor 0.25) of 2 planes.",
+		"planes-downscale-factor-0-75-upscale-0-25",
+		0.75,
+		0.25,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
+	{
+		"Tests downscaling (scaling factor 0.75) and scaling (unity) of 2 planes.",
+		"planes-downscale-factor-0-75-unity-scaling",
+		0.75,
+		1.0,
+		TEST_PLANES_DOWNSCALE_UPSCALE,
+	},
 };
 
 static int get_width(drmModeModeInfo *mode, double scaling_factor)
-- 
2.25.1
