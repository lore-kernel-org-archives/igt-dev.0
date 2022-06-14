Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AAC11362A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:32:03 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:56 +0300
Message-Id: <20220614233100.13834-20-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 19/23] tools/intel_vbt_decode: Decode the
 end of the LFP data
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

Decode the tail end of the LFP data, if available.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 73 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index e49831e2529d..574aa25530fd 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -153,6 +153,30 @@ static const void *block_data(const struct bdb_block *block)
 	return block->data + 3;
 }
 
+static struct bdb_block *find_section(const struct context *context, int section_id);
+
+static size_t lfp_data_min_size(const struct context *context)
+{
+	const struct bdb_lvds_lfp_data_ptrs *ptrs;
+	struct bdb_block *ptrs_block;
+	size_t size;
+
+	ptrs_block = find_section(context, BDB_LVDS_LFP_DATA_PTRS);
+	if (!ptrs_block)
+		return 0;
+
+	ptrs = block_data(ptrs_block);
+
+	size = sizeof(struct bdb_lvds_lfp_data);
+	if (ptrs->panel_name.table_size)
+		size = max(size, ptrs->panel_name.offset +
+			   sizeof(struct bdb_lvds_lfp_data_tail));
+
+	free(ptrs_block);
+
+	return size;
+}
+
 static size_t block_min_size(const struct context *context, int section_id)
 {
 	switch (section_id) {
@@ -178,7 +202,7 @@ static size_t block_min_size(const struct context *context, int section_id)
 	case BDB_LVDS_LFP_DATA_PTRS:
 		return sizeof(struct bdb_lvds_lfp_data_ptrs);
 	case BDB_LVDS_LFP_DATA:
-		return sizeof(struct bdb_lvds_lfp_data);
+		return lfp_data_min_size(context);
 	case BDB_LVDS_BACKLIGHT:
 		return sizeof(struct bdb_lfp_backlight_data);
 	case BDB_LFP_POWER:
@@ -916,6 +940,8 @@ static void dump_lvds_data(struct context *context,
 			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
 		const struct lvds_pnp_id *pnp_id =
 			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
+		const struct bdb_lvds_lfp_data_tail *tail =
+			block_data(block) + ptrs->panel_name.offset;
 		char mfg[4];
 
 		if (i != context->panel_type && !context->dump_all_panel_types)
@@ -960,6 +986,51 @@ static void dump_lvds_data(struct context *context,
 		printf("\t\t  Serial: %u\n", pnp_id->serial);
 		printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
 		printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
+
+		if (!ptrs->panel_name.table_size)
+			continue;
+
+		printf("\t\tPanel name: %.*s\n",
+		       (int)sizeof(tail->panel_name[0].name), tail->panel_name[i].name);
+
+		if (context->bdb->version < 187)
+			continue;
+
+		printf("\t\tScaling enable: %s\n",
+		       YESNO((tail->scaling_enable >> i) & 1));
+
+		if (context->bdb->version < 188)
+			continue;
+
+		printf("\t\tSeamless DRRS min refresh rate: %d\n",
+		       tail->seamless_drrs_min_refresh_rate[i]);
+
+		if (context->bdb->version < 208)
+			continue;
+
+		printf("\t\tPixel overlap count: %d\n",
+		       tail->pixel_overlap_count[i]);
+
+		if (context->bdb->version < 227)
+			continue;
+
+		printf("\t\tBlack border:\n");
+		printf("\t\t  Top: %d\n", tail->black_border[i].top);
+		printf("\t\t  Bottom: %d\n", tail->black_border[i].top);
+		printf("\t\t  Left: %d\n", tail->black_border[i].left);
+		printf("\t\t  Right: %d\n", tail->black_border[i].right);
+
+		if (context->bdb->version < 231)
+			continue;
+
+		printf("\t\tDual LFP port sync enable: %s\n",
+		       YESNO((tail->dual_lfp_port_sync_enable >> i) & 1));
+
+		if (context->bdb->version < 245)
+			continue;
+
+		printf("\t\tGPU dithering for banding artifacts: %s\n",
+		       YESNO((tail->gpu_dithering_for_banding_artifacts >> i) & 1));
 	}
 
 	free(ptrs_block);
-- 
2.35.1
