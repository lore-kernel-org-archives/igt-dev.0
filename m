Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0869910E04D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Dec 2022 15:35:52 +0000 (UTC)
Date: Thu, 22 Dec 2022 07:35:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20221222153547.3qhikzpgv4fcdf67@ldmartin-desk2.lan>
References: <20221222093821.7471-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221222093821.7471-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] lib/igt_draw: Change MOCS settings
 for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 22, 2022 at 03:08:21PM +0530, Jeevan B wrote:
>On MTL, we want the table entry labelled "UC (GO:Mem)"
>which has index 5.  This means that the MOCS value is 10.
>
>v2: Add define for MOCS settings. (Lucas)
>v3: Extending get_mocs_index and using get_mocs_index
>    to get mocs val. (Zbigniew)
>
>Signed-off-by: Jeevan B <jeevan.b@intel.com>
>---
> lib/i915/intel_mocs.c | 6 +++++-
> lib/igt_draw.c        | 4 ++--
> 2 files changed, 7 insertions(+), 3 deletions(-)
>
>diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
>index df541ab0..d2994480 100644
>--- a/lib/i915/intel_mocs.c
>+++ b/lib/i915/intel_mocs.c
>@@ -11,6 +11,8 @@
> #define DG1_MOCS_WB_IDX				5
> #define DG2_MOCS_UC_IDX				1
> #define DG2_MOCS_WB_IDX				3
>+#define MTL_MOCS_UC_IDX				5
>+#define MTL_MOCS_WB_IDX				10
> #define GEN12_MOCS_UC_IDX			3
> #define GEN12_MOCS_WB_IDX			2
> #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
>@@ -38,7 +40,9 @@ static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
> 	} else if (IS_DG2(devid)) {
> 		mocs->uc_index = DG2_MOCS_UC_IDX;
> 		mocs->wb_index = DG2_MOCS_WB_IDX;
>-
>+	} else if (IS_METEORLAKE(devid)) {
>+		mocs->uc_index = MTL_MOCS_UC_IDX;
>+		mocs->wb_index = MTL_MOCS_WB_IDX;

convention is latest platform first, so this needs to come above  DG2.

MTL
DG2
DG1
GEN12
..

> 	} else if (IS_GEN12(devid)) {
> 		mocs->uc_index = GEN12_MOCS_UC_IDX;
> 		mocs->wb_index = GEN12_MOCS_WB_IDX;
>diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>index 975d65cd..b02ad2a8 100644
>--- a/lib/igt_draw.c
>+++ b/lib/igt_draw.c
>@@ -36,6 +36,7 @@
> #include "i830_reg.h"
> #include "i915/gem_create.h"
> #include "i915/gem_mman.h"
>+#include "i915/intel_mocs.h"
>
> #ifndef PAGE_ALIGN
> #ifndef PAGE_SIZE
>@@ -702,8 +703,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
> 		pitch = tiling ? buf->stride / 4 : buf->stride;
>
> 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>-		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
>-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
>+		intel_bb_out(ibb, blt_cmd_tiling | intel_get_wb_mocs(fd) << 21 | (pitch-1));

weren't you supposed to use the intel_get_uc_mocs()?

Lucas De Marchi

> 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
> 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
> 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
>-- 
>2.36.0
>
