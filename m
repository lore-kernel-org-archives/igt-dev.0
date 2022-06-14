Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29111362C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:32:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:58 +0300
Message-Id: <20220614233100.13834-22-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 21/23] tools/intel_vbt_decode: Validate LVDS
 data table pointers
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

Do a reasonably exhaustive check to make sure the LVDS
data table pointers are sane.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 91 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 29857e4154e8..2ec9990279d9 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -148,6 +148,18 @@ static u32 raw_block_offset(const struct context *context, enum bdb_block_id sec
 	return block - (const void *)context->bdb;
 }
 
+/* size of the block excluding the header */
+static u32 raw_block_size(const struct context *context, enum bdb_block_id section_id)
+{
+	const void *block;
+
+	block = find_raw_section(context, section_id);
+	if (!block)
+		return 0;
+
+	return get_blocksize(block);
+}
+
 static const void *block_data(const struct bdb_block *block)
 {
 	return block->data + 3;
@@ -221,6 +233,83 @@ static size_t block_min_size(const struct context *context, int section_id)
 	}
 }
 
+static bool validate_lfp_data_ptrs(const struct context *context,
+				   const struct bdb_lvds_lfp_data_ptrs *ptrs)
+{
+	int fp_timing_size, dvo_timing_size, panel_pnp_id_size, panel_name_size;
+	int data_block_size, lfp_data_size;
+	int i;
+
+	data_block_size = raw_block_size(context, BDB_LVDS_LFP_DATA);
+	if (data_block_size == 0)
+		return false;
+
+	/* always 3 indicating the presence of fp_timing+dvo_timing+panel_pnp_id */
+	if (ptrs->lvds_entries != 3)
+		return false;
+
+	fp_timing_size = ptrs->ptr[0].fp_timing.table_size;
+	dvo_timing_size = ptrs->ptr[0].dvo_timing.table_size;
+	panel_pnp_id_size = ptrs->ptr[0].panel_pnp_id.table_size;
+	panel_name_size = ptrs->panel_name.table_size;
+
+	/* fp_timing has variable size */
+	if (fp_timing_size < 32 ||
+	    dvo_timing_size != sizeof(struct lvds_dvo_timing) ||
+	    panel_pnp_id_size != sizeof(struct lvds_pnp_id))
+		return false;
+
+	/* panel_name is not present in old VBTs */
+	if (panel_name_size != 0 &&
+	    panel_name_size != sizeof(struct lvds_lfp_panel_name))
+		return false;
+
+	lfp_data_size = ptrs->ptr[1].fp_timing.offset - ptrs->ptr[0].fp_timing.offset;
+	if (16 * lfp_data_size > data_block_size)
+		return false;
+
+	/*
+	 * Except for vlv/chv machines all real VBTs seem to have 6
+	 * unaccounted bytes in the fp_timing table. And it doesn't
+	 * appear to be a really intentional hole as the fp_timing
+	 * 0xffff terminator is always within those 6 missing bytes.
+	 */
+	if (fp_timing_size + dvo_timing_size + panel_pnp_id_size != lfp_data_size &&
+	    fp_timing_size + 6 + dvo_timing_size + panel_pnp_id_size != lfp_data_size)
+		return false;
+
+	if (ptrs->ptr[0].fp_timing.offset + fp_timing_size > ptrs->ptr[0].dvo_timing.offset ||
+	    ptrs->ptr[0].dvo_timing.offset + dvo_timing_size != ptrs->ptr[0].panel_pnp_id.offset ||
+	    ptrs->ptr[0].panel_pnp_id.offset + panel_pnp_id_size != lfp_data_size)
+		return false;
+
+	/* make sure the table entries have uniform size */
+	for (i = 1; i < 16; i++) {
+		if (ptrs->ptr[i].fp_timing.table_size != fp_timing_size ||
+		    ptrs->ptr[i].dvo_timing.table_size != dvo_timing_size ||
+		    ptrs->ptr[i].panel_pnp_id.table_size != panel_pnp_id_size)
+			return false;
+
+		if (ptrs->ptr[i].fp_timing.offset - ptrs->ptr[i-1].fp_timing.offset != lfp_data_size ||
+		    ptrs->ptr[i].dvo_timing.offset - ptrs->ptr[i-1].dvo_timing.offset != lfp_data_size ||
+		    ptrs->ptr[i].panel_pnp_id.offset - ptrs->ptr[i-1].panel_pnp_id.offset != lfp_data_size)
+			return false;
+	}
+
+	/* make sure the tables fit inside the data block */
+	for (i = 0; i < 16; i++) {
+		if (ptrs->ptr[i].fp_timing.offset + fp_timing_size > data_block_size ||
+		    ptrs->ptr[i].dvo_timing.offset + dvo_timing_size > data_block_size ||
+		    ptrs->ptr[i].panel_pnp_id.offset + panel_pnp_id_size > data_block_size)
+			return false;
+	}
+
+	if (ptrs->panel_name.offset + 16 * panel_name_size > data_block_size)
+		return false;
+
+	return true;
+}
+
 /* make the data table offsets relative to the data block */
 static bool fixup_lfp_data_ptrs(const struct context *context,
 				void *ptrs_block)
@@ -249,7 +338,7 @@ static bool fixup_lfp_data_ptrs(const struct context *context,
 		ptrs->panel_name.offset -= offset;
 	}
 
-	return true;
+	return validate_lfp_data_ptrs(context, ptrs);
 }
 
 static struct bdb_block *find_section(const struct context *context, int section_id)
-- 
2.35.1
