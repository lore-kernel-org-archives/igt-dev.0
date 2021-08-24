Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5EB89A1E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Aug 2021 10:54:02 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 24 Aug 2021 16:34:59 +0530
Message-Id: <20210824110459.27235-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip_scaled_crc: Add upscaling
 tests
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
Cc: Swati Sharma <swati2.sharma@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

In this patch, added upscaling tests 960x540->1920x1080.
Existing downscaled tests reused for upscaling scenarios.
Also, renaming of subtests done (downscaling, upscaling).

TODO: Add more modifier combinations

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_flip_scaled_crc.c | 71 +++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index 24ca1224..0d97b8ad 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -50,7 +50,7 @@ const struct {
 	const double secondmultiplier;
 } flip_scenario_test[] = {
 	{
-		"flip-32bpp-ytile-to-64bpp-ytile",
+		"flip-32bpp-ytile-to-64bpp-ytile-downscaling",
 		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
@@ -58,7 +58,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-64bpp-ytile-to-32bpp-ytile",
+		"flip-64bpp-ytile-to-32bpp-ytile-downscaling",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
@@ -66,7 +66,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-64bpp-ytile-to-16bpp-ytile",
+		"flip-64bpp-ytile-to-16bpp-ytile-downscaling",
 		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
@@ -74,7 +74,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-32bpp-ytileccs-to-64bpp-ytile",
+		"flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
 		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
@@ -82,7 +82,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs",
+		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
@@ -90,7 +90,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-32bpp-ytile-to-32bpp-ytileccs",
+		"flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
@@ -98,13 +98,70 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-64bpp-ytile-to-32bpp-ytilercccs",
+		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
 	},
+	{
+		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-ytile-to-32bpp-ytile-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-ytile-to-16bpp-ytile-upscaling",
+		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
+		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
+		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+
 };
 
 enum subrval {CONNECTORFAIL, CONNECTORSUCCESS, TESTSKIP, NOREQUESTEDFORMATONPIPE};
-- 
2.25.1
