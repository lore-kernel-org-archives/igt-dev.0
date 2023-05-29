Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5410E283
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 12:12:22 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 17:41:43 +0530
Message-Id: <20230529121143.327907-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc: enable and
 optimize test for sim
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

To reduce execution time in simulation dropping RGB565 and PO10
formats (coverage is not compromised, we do have NV12 and RGB888
formats being validated).
Also, skipping buffered CRC reusecrcfromlastround() in simulation.

v2: -Add checks inside multiplaneskiproundcheck() and
     reusecrcfromlastround() (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_rotation_crc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 28b4fd27..0a22cc22 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -719,6 +719,16 @@ static bool multiplaneskiproundcheck(data_t *data, planeinfos p[2])
 	if (!igt_plane_has_rotation(p[1].plane, p[1].fbinfo->rotation))
 		return false;
 
+	if (igt_run_in_simulation() &&
+	   (multiplaneformatlist[p[0].formatindex] == DRM_FORMAT_P010 ||
+	    multiplaneformatlist[p[0].formatindex] == DRM_FORMAT_RGB565))
+		return false;
+
+	if (igt_run_in_simulation() &&
+	   (multiplaneformatlist[p[1].formatindex] == DRM_FORMAT_P010 ||
+	    multiplaneformatlist[p[1].formatindex] == DRM_FORMAT_RGB565))
+		return false;
+
 	return true;
 }
 
@@ -765,6 +775,9 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
 				  int lastroundp0rotation,
 				  int lastroundp1rotation)
 {
+	if (igt_run_in_simulation())
+		return false;
+
 	if (planarcheck != 1)
 		return false;
 
-- 
2.25.1
