Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EEF10E41D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 09:01:32 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 21 Jun 2023 14:30:32 +0530
Message-Id: <20230621090032.611560-4-swati2.sharma@intel.com>
In-Reply-To: <20230621090032.611560-1-swati2.sharma@intel.com>
References: <20230621090032.611560-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] lib/igt_draw: Use
 intel_display_ver() for drawing with blits
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

From: Matt Roper <matthew.d.roper@intel.com>

Display code should check the display version of the platform
rather than the graphics version; on some platforms these
versions won't be the same.

v2: -fixed subject (Kamil)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_draw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 6f362994..1f814bfc 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -674,7 +674,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	struct intel_buf *dst;
 	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth;
 	uint32_t devid = intel_get_drm_devid(fd);
-	int gen = intel_gen(devid);
+	int ver = intel_display_ver(devid);
 	int pitch;
 
 	if (tiling)
@@ -751,9 +751,9 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 			igt_assert(false);
 		}
 
-		blt_cmd_len = (gen >= 8) ?  0x5 : 0x4;
+		blt_cmd_len = (ver >= 8) ?  0x5 : 0x4;
 		blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
-		pitch = (gen >= 4 && tiling) ? buf->stride / 4 : buf->stride;
+		pitch = (ver >= 4 && tiling) ? buf->stride / 4 : buf->stride;
 
 		switch_blt_tiling(ibb, tiling, true);
 
-- 
2.25.1
