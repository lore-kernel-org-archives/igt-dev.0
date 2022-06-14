Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75043113621
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:54 +0300
Message-Id: <20220614233100.13834-18-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 17/23] tools/intel_vbt_decode: Simplify LVDS
 data block parsing
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Get rid of the mess in the LVDS data block parsing and juse
use the offsets straight from the LVDS data table pointers
block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 40 ++++++++++++----------------------------
 1 file changed, 12 insertions(+), 28 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 8f80c79ace4c..ef00a173d7af 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -883,40 +883,24 @@ static void dump_lvds_ptr_data(struct context *context,
 static void dump_lvds_data(struct context *context,
 			   const struct bdb_block *block)
 {
-	const struct bdb_lvds_lfp_data *lvds_data = block_data(block);
 	struct bdb_block *ptrs_block;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
-	int num_entries;
 	int i;
 	int hdisplay, hsyncstart, hsyncend, htotal;
 	int vdisplay, vsyncstart, vsyncend, vtotal;
 	float clock;
-	int lfp_data_size, dvo_offset;
 
 	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
-	if (!ptrs_block) {
-		printf("No LVDS ptr block\n");
+	if (!ptrs_block)
 		return;
-	}
 
 	ptrs = block_data(ptrs_block);
 
-	lfp_data_size =
-	    ptrs->ptr[1].fp_timing.offset - ptrs->ptr[0].fp_timing.offset;
-	dvo_offset =
-	    ptrs->ptr[0].dvo_timing.offset - ptrs->ptr[0].fp_timing.offset;
-
-	num_entries = block->size / lfp_data_size;
-
-	printf("  Number of entries: %d (preferred block marked with '*')\n",
-	       num_entries);
-
-	for (i = 0; i < num_entries; i++) {
-		const uint8_t *lfp_data_ptr =
-		    (const uint8_t *) lvds_data->data + lfp_data_size * i;
-		const uint8_t *timing_data = lfp_data_ptr + dvo_offset;
-		const struct lvds_lfp_data_entry *lfp_data =
-		    (const struct lvds_lfp_data_entry *)lfp_data_ptr;
+	for (i = 0; i < 16; i++) {
+		const struct lvds_fp_timing *fp_timing =
+			block_data(block) + ptrs->ptr[i].fp_timing.offset;
+		const uint8_t *timing_data =
+			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
 
 		if (i != context->panel_type && !context->dump_all_panel_types)
 			continue;
@@ -934,19 +918,19 @@ static void dump_lvds_data(struct context *context,
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
 		printf("\t\t%dx%d clock %d\n",
-		       lfp_data->fp_timing.x_res, lfp_data->fp_timing.y_res,
+		       fp_timing->x_res, fp_timing->y_res,
 		       _PIXEL_CLOCK(timing_data));
 		printf("\t\tinfo:\n");
 		printf("\t\t  LVDS: 0x%08lx\n",
-		       (unsigned long)lfp_data->fp_timing.lvds_reg_val);
+		       (unsigned long)fp_timing->lvds_reg_val);
 		printf("\t\t  PP_ON_DELAYS: 0x%08lx\n",
-		       (unsigned long)lfp_data->fp_timing.pp_on_reg_val);
+		       (unsigned long)fp_timing->pp_on_reg_val);
 		printf("\t\t  PP_OFF_DELAYS: 0x%08lx\n",
-		       (unsigned long)lfp_data->fp_timing.pp_off_reg_val);
+		       (unsigned long)fp_timing->pp_off_reg_val);
 		printf("\t\t  PP_DIVISOR: 0x%08lx\n",
-		       (unsigned long)lfp_data->fp_timing.pp_cycle_reg_val);
+		       (unsigned long)fp_timing->pp_cycle_reg_val);
 		printf("\t\t  PFIT: 0x%08lx\n",
-		       (unsigned long)lfp_data->fp_timing.pfit_reg_val);
+		       (unsigned long)fp_timing->pfit_reg_val);
 		printf("\t\ttimings: %d %d %d %d %d %d %d %d %.2f (%s)\n",
 		       hdisplay, hsyncstart, hsyncend, htotal,
 		       vdisplay, vsyncstart, vsyncend, vtotal, clock,
-- 
2.35.1
