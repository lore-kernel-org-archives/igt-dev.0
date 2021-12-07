Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5517BC16
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Dec 2021 05:53:02 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Tue,  7 Dec 2021 11:20:33 +0530
Message-Id: <20211207055033.164494-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_rotation_crc: MPO subtest-
 mixing pixel formats and tiling on different planes.
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

 Added P010 pixel format with already existing pixel formats like RGB565, XRGB8888, NV12.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index e2b41b81..eeb8e75c 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -666,7 +666,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	 * case with tiling are 2 bpp, 4 bpp and NV12.
 	 */
 	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
-		DRM_FORMAT_XRGB8888, DRM_FORMAT_P010};
+		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12, DRM_FORMAT_P010};
 
 	static struct {
 		igt_rotation_t rotation;
@@ -751,16 +751,21 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 * no need to redo comparison image and
 						 * just use stored crc.
 						 */
-						if (p[0].format != DRM_FORMAT_P010 &&
-						    p[1].format != DRM_FORMAT_P010 &&
-						    crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
+						if  (p[0].format!=DRM_FORMAT_NV12 &&
+						     p[1].format != DRM_FORMAT_NV12 &&
+						     p[0].format != DRM_FORMAT_P010 &&
+						     p[1].format != DRM_FORMAT_P010 &&
+						     crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)].frame != 0) {
 							retcrc_sw = crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)];
 							have_crc = true;
-						} else if (p[0].format == DRM_FORMAT_P010 &&
-							   p[1].format != DRM_FORMAT_P010 &&
-							   lastroundjformat != DRM_FORMAT_P010 &&
-							   planeconfigs[i].rotation == lastroundirotation &&
-							   planeconfigs[j].rotation == lastroundjrotation) {
+						} else if (p[0].format == DRM_FORMAT_NV12 &&
+							p[1].format != DRM_FORMAT_NV12 &&
+							lastroundjformat != DRM_FORMAT_NV12 &&
+							p[0].format == DRM_FORMAT_P010 &&
+							p[1].format != DRM_FORMAT_P010 &&
+							lastroundjformat != DRM_FORMAT_P010 &&
+							planeconfigs[i].rotation == lastroundirotation && 
+							planeconfigs[j].rotation == lastroundjrotation) {
 							/*
 							 * With NV12 can benefit from
 							 * previous crc if rotations
@@ -771,7 +776,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 							 * had NV12 need to skip this.
 							 */
 							have_crc = true;
-						} else {
+						}else {
 							/*
 							 * here will be created
 							 * comparison image and get crc
@@ -793,7 +798,6 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 							flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
 							have_crc = false;
 						}
-
 						/*
 						 * create hw rotated image and
 						 * get vblank where interesting
@@ -819,10 +823,12 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 										   flipsw,
 										   &retcrc_sw);
 
-							if (p[0].format !=DRM_FORMAT_P010 && p[1].format != DRM_FORMAT_P010)
-								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
-								= retcrc_sw;
+							if (p[0].format !=DRM_FORMAT_NV12 && p[1].format != DRM_FORMAT_NV12 &&
+							    p[0].format !=DRM_FORMAT_P010 && p[1].format != DRM_FORMAT_P010)
+							  crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
+							  =retcrc_sw;
 						}
+
 						igt_pipe_crc_get_for_frame(data->gfx_fd, data->pipe_crc, fliphw, &retcrc_hw);
 
 						str1 = igt_crc_to_string(&retcrc_sw);
-- 
2.25.1
