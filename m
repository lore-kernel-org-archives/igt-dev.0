Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1A710F357
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:13:28 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu, 16 Dec 2021 16:56:08 +0530
Message-Id: <20211216112608.14535-3-swati2.sharma@intel.com>
In-Reply-To: <20211216112608.14535-1-swati2.sharma@intel.com>
References: <20211216112608.14535-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_flip_scaled_crc: Add
 upscaling tests
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
List-ID: <igt-dev@lists.freedesktop.org>

In this patch, added upscaling tests 960x540->1920x1080.
Existing downscaled tests reused for upscaling scenarios.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 9ffcf080..67ccef31 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -105,6 +105,62 @@ const struct {
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
 };
 
 enum subrval {CONNECTORFAIL, CONNECTORSUCCESS, TESTSKIP, NOREQUESTEDFORMATONPIPE};
-- 
2.25.1
