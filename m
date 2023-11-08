Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A79310E7E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 16:40:43 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 11:39:58 -0500
Message-ID: <20231108164006.106967-10-harry.wentland@amd.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
References: <20231108164006.106967-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH v3 09/12] drm-uapi: Add 3x4 CTM
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c49526bca034..358c5c313bd8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -847,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -859,7 +875,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.42.0
