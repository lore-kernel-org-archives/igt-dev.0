Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D446EBA6E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 12:28:54 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Tue,  7 Dec 2021 17:56:22 +0530
Message-Id: <20211207122622.169176-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc- MPO subtest:
 Mixing different pixel formats and tiling on different planes.
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

Addition of P010 pixel format with already existing pixel formats.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 1497120c..b39ae576 100644
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
@@ -753,12 +753,17 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 */
 						if (p[0].format != DRM_FORMAT_NV12 &&
 						    p[1].format != DRM_FORMAT_NV12 &&
+						    p[0].format != DRM_FORMAT_P010 &&
+						    p[1].format != DRM_FORMAT_P010 &&
 						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
 							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
 							have_crc = true;
 						} else if (p[0].format == DRM_FORMAT_NV12 &&
 							   p[1].format != DRM_FORMAT_NV12 &&
 							   lastroundjformat != DRM_FORMAT_NV12 &&
+							   p[0].format == DRM_FORMAT_P010 &&
+							   p[1].format != DRM_FORMAT_P010 &&
+							   lastroundjformat !=DRM_FORMAT_P010 &&
 							   planeconfigs[i].rotation == lastroundirotation &&
 							   planeconfigs[j].rotation == lastroundjrotation) {
 							/*
@@ -819,7 +824,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 										   flipsw,
 										   &retcrc_sw);
 
-							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12)
+							if (p[0].format != DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12 &&
+									p[0].format != DRM_FORMAT_P010 && p[1].format != DRM_FORMAT_P010)
 								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
 								= retcrc_sw;
 						}
-- 
2.25.1
