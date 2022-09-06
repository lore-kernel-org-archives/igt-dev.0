Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17C910E655
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:29:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:29 +0300
Message-Id: <20220906122944.8838-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/17] tools/intel_vbt_decode: Validate
 fp_timing terminator presence
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

Validate the LFP data block a bit hardwer by making sure the
fp_timing terminators (0xffff) are where we expect them to be.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 59 +++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 28 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 98edeb385635..09ed4bd0c1f8 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -148,18 +148,6 @@ static u32 raw_block_offset(const struct context *context, enum bdb_block_id sec
 	return block - (const void *)context->bdb;
 }
 
-/* size of the block excluding the header */
-static u32 raw_block_size(const struct context *context, enum bdb_block_id section_id)
-{
-	const void *block;
-
-	block = find_raw_section(context, section_id);
-	if (!block)
-		return 0;
-
-	return get_blocksize(block);
-}
-
 static const void *block_data(const struct bdb_block *block)
 {
 	return block->data + 3;
@@ -353,9 +341,14 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 {
 	int fp_timing_size, dvo_timing_size, panel_pnp_id_size, panel_name_size;
 	int data_block_size, lfp_data_size;
+	const void *block;
 	int i;
 
-	data_block_size = raw_block_size(context, BDB_LVDS_LFP_DATA);
+	block = find_raw_section(context, BDB_LVDS_LFP_DATA);
+	if (!block)
+		return false;
+
+	data_block_size = get_blocksize(block);
 	if (data_block_size == 0)
 		return false;
 
@@ -383,21 +376,6 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 	if (16 * lfp_data_size > data_block_size)
 		return false;
 
-	/*
-	 * Except for vlv/chv machines all real VBTs seem to have 6
-	 * unaccounted bytes in the fp_timing table. And it doesn't
-	 * appear to be a really intentional hole as the fp_timing
-	 * 0xffff terminator is always within those 6 missing bytes.
-	 */
-	if (fp_timing_size + dvo_timing_size + panel_pnp_id_size != lfp_data_size &&
-	    fp_timing_size + 6 + dvo_timing_size + panel_pnp_id_size != lfp_data_size)
-		return false;
-
-	if (ptrs->ptr[0].fp_timing.offset + fp_timing_size > ptrs->ptr[0].dvo_timing.offset ||
-	    ptrs->ptr[0].dvo_timing.offset + dvo_timing_size != ptrs->ptr[0].panel_pnp_id.offset ||
-	    ptrs->ptr[0].panel_pnp_id.offset + panel_pnp_id_size != lfp_data_size)
-		return false;
-
 	/* make sure the table entries have uniform size */
 	for (i = 1; i < 16; i++) {
 		if (ptrs->ptr[i].fp_timing.table_size != fp_timing_size ||
@@ -411,6 +389,23 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 			return false;
 	}
 
+	/*
+	 * Except for vlv/chv machines all real VBTs seem to have 6
+	 * unaccounted bytes in the fp_timing table. And it doesn't
+	 * appear to be a really intentional hole as the fp_timing
+	 * 0xffff terminator is always within those 6 missing bytes.
+	 */
+	if (fp_timing_size + 6 + dvo_timing_size + panel_pnp_id_size == lfp_data_size)
+		fp_timing_size += 6;
+
+	if (fp_timing_size + dvo_timing_size + panel_pnp_id_size != lfp_data_size)
+		return false;
+
+	if (ptrs->ptr[0].fp_timing.offset + fp_timing_size != ptrs->ptr[0].dvo_timing.offset ||
+	    ptrs->ptr[0].dvo_timing.offset + dvo_timing_size != ptrs->ptr[0].panel_pnp_id.offset ||
+	    ptrs->ptr[0].panel_pnp_id.offset + panel_pnp_id_size != lfp_data_size)
+		return false;
+
 	/* make sure the tables fit inside the data block */
 	for (i = 0; i < 16; i++) {
 		if (ptrs->ptr[i].fp_timing.offset + fp_timing_size > data_block_size ||
@@ -422,6 +417,14 @@ static bool validate_lfp_data_ptrs(const struct context *context,
 	if (ptrs->panel_name.offset + 16 * panel_name_size > data_block_size)
 		return false;
 
+	/* make sure fp_timing terminators are present at expected locations */
+	for (i = 0; i < 16; i++) {
+		const u16 *t = block + ptrs->ptr[i].fp_timing.offset + fp_timing_size - 2;
+
+		if (*t != 0xffff)
+			return false;
+	}
+
 	return true;
 }
 
-- 
2.35.1
