Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42ED710E9CA
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 09:09:52 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 13 Jan 2023 14:40:40 +0530
Message-Id: <20230113091041.27032-2-jeevan.b@intel.com>
In-Reply-To: <20230113091041.27032-1-jeevan.b@intel.com>
References: <20230113091041.27032-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] lib/igt_draw: Use intel_get_uc_mocs to get
 MOCS value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Use intel_get_uc_mocs instead of hardcoding to get table entry.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_draw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 975d65cd..bfe9cd50 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -36,6 +36,7 @@
 #include "i830_reg.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
+#include "i915/intel_mocs.h"
 
 #ifndef PAGE_ALIGN
 #ifndef PAGE_SIZE
@@ -703,7 +704,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
 		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
+		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
-- 
2.19.1
