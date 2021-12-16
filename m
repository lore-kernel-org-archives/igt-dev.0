Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8558A10F376
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Dec 2021 11:13:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Thu, 16 Dec 2021 16:56:07 +0530
Message-Id: <20211216112608.14535-2-swati2.sharma@intel.com>
In-Reply-To: <20211216112608.14535-1-swati2.sharma@intel.com>
References: <20211216112608.14535-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_flip_scaled_crc: Rename
 downscaling tests
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/kms_flip_scaled_crc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 24ca1224..9ffcf080 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
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
@@ -98,7 +98,7 @@ const struct {
 		2.0,
 	},
 	{
-		"flip-64bpp-ytile-to-32bpp-ytilercccs",
+		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
-- 
2.25.1
