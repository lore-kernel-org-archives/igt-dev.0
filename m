Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B9F10E4BC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Dec 2021 16:56:45 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Wed, 15 Dec 2021 22:16:10 +0530
Message-Id: <20211215164610.236302-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_rotation_crc- MPO subtest:
 Mixing up of pixel formats and tiling on different planes.
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

 already existing pixel format RGB565, XRGB8888, NV12. New addition of P010 pixel format.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 1497120c..7d813598 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -666,7 +666,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	 * case with tiling are 2 bpp, 4 bpp and NV12.
 	 */
 	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
-		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
 
 	static struct {
 		igt_rotation_t rotation;
@@ -751,8 +751,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 * no need to redo comparison image and
 						 * just use stored crc.
 						 */
-						if (p[0].format != DRM_FORMAT_NV12 &&
-						    p[1].format != DRM_FORMAT_NV12 &&
+						if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format) &&
 						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
 							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
 							have_crc = true;
@@ -819,7 +818,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 										   flipsw,
 										   &retcrc_sw);
 
-							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
+							if (!igt_format_is_yuv_semiplanar(p[0].format) &&!igt_format_is_yuv_semiplanar(p[1].format))
 								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
 								= retcrc_sw;
 						}
-- 
2.25.1
