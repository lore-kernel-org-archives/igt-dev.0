Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF3B11B3AC
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Dec 2021 13:03:34 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Mon, 20 Dec 2021 18:27:41 +0530
Message-Id: <20211220125741.283879-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_rotation_crc: MPO
 subtest-mixing of pixel format and tiling on different planes.
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

P010 pixel format is newly added to the already existing list of pixel formats(RGB565,XRGB8888,NV12).

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 37f6abe9..3f716002 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -683,7 +683,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	 * case with modifier are 2 bpp, 4 bpp and NV12.
 	 */
 	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
-		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
 
 	static struct {
 		igt_rotation_t rotation;
@@ -769,14 +769,13 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 * no need to redo comparison image and
 						 * just use stored crc.
 						 */
-						if (p[0].format != DRM_FORMAT_NV12 &&
-						    p[1].format != DRM_FORMAT_NV12 &&
+						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
 						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
 							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
 							have_crc = true;
-						} else if (p[0].format == DRM_FORMAT_NV12 &&
-							   p[1].format != DRM_FORMAT_NV12 &&
-							   lastroundjformat != DRM_FORMAT_NV12 &&
+						} else if((p[0].format == DRM_FORMAT_NV12 || p[0].format == DRM_FORMAT_P010) &&
+							   p[1].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_P010 &&
+							   lastroundjformat != DRM_FORMAT_NV12 && lastroundjformat != DRM_FORMAT_P010 &&
 							   planeconfigs[i].rotation == lastroundirotation &&
 							   planeconfigs[j].rotation == lastroundjrotation) {
 							/*
@@ -837,7 +836,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 										   flipsw,
 										   &retcrc_sw);
 
-							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
+							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
 								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
 								= retcrc_sw;
 						}
-- 
2.25.1
