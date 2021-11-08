Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F336E05F
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Nov 2021 05:32:39 +0000 (UTC)
From: Ananya Sharma <ananya.sharma@intel.com>
Date: Mon,  8 Nov 2021 10:58:36 +0530
Message-Id: <20211108052836.374567-1-ananya.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: MPO subtest- mixing
 pixel formats and tiling on different planes.
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
Cc: kunal1.joshi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

 Added P010 pixel format with already existing pixel formats like RGB565, XRGB8888, NV12.

Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 1497120c..9c208315 100644
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
-- 
2.25.1
