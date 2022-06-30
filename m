Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6610ED6C
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 10:15:18 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id o23so22425419ljg.13
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 03:15:18 -0700 (PDT)
Received: from localhost.localdomain (d13t31k5fs-hc7m1cn8-4.rev.dnainternet.fi.
 [2001:14bb:ad:e17a:a324:7fcc:2daa:a25f])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a197511000000b0047f6590af3asm3019363lfe.107.2022.06.30.03.15.15
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 03:15:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jun 2022 13:15:11 +0300
Message-Id: <20220630101513.24054-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20220630101513.24054-1-juhapekka.heikkila@gmail.com>
References: <20220630101513.24054-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/i915/kms_flip_scaled_crc: Add new
 tests covering modifiers and pixel-formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

New test cases are added covering various modifiers and
pixel-formats.

v2: fixed typo

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_flip_scaled_crc.c | 258 ++++++++++++++++++++++++++++++-
 1 file changed, 257 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index d6edb01c..88640da2 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -57,6 +57,38 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-32bpp-yftile-to-64bpp-yftile-downscaling",
+		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-32bpp-xtile-to-64bpp-xtile-downscaling",
+		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-32bpp-4tile-to-64bpp-4tile-downscaling",
+		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-32bpp-linear-to-64bpp-linear-downscaling",
+		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytile-downscaling",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
@@ -65,6 +97,38 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-64bpp-yftile-to-32bpp-yftile-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-xtile-to-32bpp-xtile-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tile-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-linear-to-32bpp-linear-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-64bpp-ytile-to-16bpp-ytile-downscaling",
 		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
@@ -73,6 +137,38 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-64bpp-yftile-to-16bpp-yftile-downscaling",
+		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-xtile-to-16bpp-xtile-downscaling",
+		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-4tile-to-16bpp-4tile-downscaling",
+		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-linear-to-16bpp-linear-downscaling",
+		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
 		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
@@ -81,6 +177,14 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-32bpp-yftileccs-to-64bpp-yftile-downscaling",
+		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
@@ -89,6 +193,14 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
+		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
@@ -97,6 +209,14 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-32bpp-yftile-to-32bpp-yftileccs-downscaling",
+		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
@@ -105,6 +225,14 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
 		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
@@ -113,6 +241,38 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-32bpp-yftile-to-64bpp-yftile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-xtile-to-64bpp-xtile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-4tile-to-64bpp-4tile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-32bpp-linear-to-64bpp-linear-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytile-upscaling",
 		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
@@ -121,6 +281,38 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-64bpp-yftile-to-32bpp-yftile-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-xtile-to-32bpp-xtile-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tile-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-linear-to-32bpp-linear-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
 	{
 		"flip-64bpp-ytile-to-16bpp-ytile-upscaling",
 		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
@@ -129,6 +321,38 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-64bpp-yftile-to-16bpp-yftile-upscaling",
+		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-xtile-to-16bpp-xtile-upscaling",
+		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-4tile-to-16bpp-4tile-upscaling",
+		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-linear-to-16bpp-linear-upscaling",
+		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
+		0.5,
+		1.0,
+	},
 	{
 		"flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
 		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
@@ -137,6 +361,14 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-32bpp-yftileccs-to-64bpp-yftile-upscaling",
+		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
 		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
@@ -145,6 +377,14 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
+		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
 		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
@@ -154,13 +394,29 @@ const struct {
 		1.0,
 	},
 	{
-		"flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling",
+		"flip-32bpp-yftile-to-32bpp-yftileccs-upscaling",
+		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
 		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
+		0.5,
+		1.0,
+	},
 };
 
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-- 
2.25.1
