Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D655210E21E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Dec 2021 09:24:26 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Wed, 15 Dec 2021 14:51:21 +0530
Message-Id: <20211215092121.233152-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_rotation_crc-MPO subtets-pixel
 format mixing and tiling on different planes.
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

Already existing pixel format RGB565, XRGB8888, NV12. Addition of new pixel formats.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 1497120c..0963db41 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
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
+							if (!igt_format_is_yuv_semiplanar(p[0].format) && !igt_format_is_yuv_semiplanar(p[1].format))
 								crclog[ctz(planeconfigs[i].rotation) | (ctz(planeconfigs[j].rotation) << 2)]
 								= retcrc_sw;
 						}
-- 
2.25.1
