Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5496E442
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 15:33:06 +0000 (UTC)
From: Kamati Srinivas <srinivasx.k@intel.com>
Date: Tue,  1 Sep 2020 21:03:02 +0530
Message-Id: <20200901153302.26667-1-srinivasx.k@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Stripping rendercopy implementation to use
 Cairo for restoring test image
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: tejaskumarx.surendrakumar.upadhyay@intel.com, srinivasx.k@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Cc: Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>
Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
Cc: Tejask Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: K Srinivas <srinivasx.k@intel.com>
Signed-off-by: Kamati Srinivas <srinivasx.k@intel.com>
---
 tests/kms_cursor_crc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index e9491847..079abe88 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -831,15 +831,7 @@ igt_main
 
 		igt_display_require(&data.display, data.drm_fd);
 
-		if (is_i915_device(data.drm_fd)) {
-			data.bufmgr = drm_intel_bufmgr_gem_init(data.drm_fd, 4096);
-			igt_assert(data.bufmgr);
-			drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
-
-			data.devid = intel_get_drm_devid(data.drm_fd);
-			data.rendercopy = igt_get_render_copyfunc(data.devid);
-		}
-		igt_debug("Using %s for restoring test image\n", (data.rendercopy == NULL)?"Cairo":"rendercopy");
+		igt_debug("Using Cairo for restoring test image\n");
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
