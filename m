Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291EE10E0B1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 08:24:09 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Dec 2022 13:49:34 +0530
Message-Id: <20221215081934.13919-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_draw: Change MOCS settings for MTL
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

On MTL, we want the table entry labelled "UC (GO:Mem)"
which has index 5.  This means that the MOCS value is 10.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_draw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 975d65cd..d8cc60f9 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -703,7 +703,10 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
 		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
+		if (IS_METEORLAKE(intel_get_drm_devid(fd)))
+			intel_bb_out(ibb, blt_cmd_tiling | 10 << 21 | (pitch-1));
+		else
+			intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
-- 
2.36.0
