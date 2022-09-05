Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9788510E034
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:10:11 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  5 Sep 2022 10:12:21 +0530
Message-Id: <20220905044221.30116-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/mtl: Use same path for MTL as DG2 for
 draw_rect_blt()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>

This is due to legacy commands are no longer Supported in MTL+

Signed-off-by: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
---
 lib/igt_draw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 056101b9..1124cadc 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -666,7 +666,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	ibb = intel_bb_create(fd, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (IS_DG2(intel_get_drm_devid(fd))) {
+	if (HAS_4TILE(intel_get_drm_devid(fd))) {
 		int buf_height = buf->size / buf->stride;
 
 		switch (buf->bpp) {
-- 
2.22.0
