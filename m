Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE0510E99E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jan 2023 16:56:04 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Jan 2023 22:27:01 +0530
Message-Id: <20230119165702.9558-2-jeevan.b@intel.com>
In-Reply-To: <20230119165702.9558-1-jeevan.b@intel.com>
References: <20230119165702.9558-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_draw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 975d65cd..58ce0539 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -36,6 +36,7 @@
 #include "i830_reg.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
+#include "i915/intel_mocs.h"
 
 #ifndef PAGE_ALIGN
 #ifndef PAGE_SIZE
@@ -702,8 +703,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		pitch = tiling ? buf->stride / 4 : buf->stride;
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
-		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
+		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
-- 
2.19.1
