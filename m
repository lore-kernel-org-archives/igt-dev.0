Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C4610E65B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:29:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:30 +0300
Message-Id: <20220906122944.8838-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/17] tools/intel_vbt_decode: Use
 hardcoded fp_timing size for generating LFP data pointers
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

The current scheme for generating the LFP data table pointers
(when the block including them is missing from the VBT) expects
the 0xffff sequence to only appear in the fp_timing terminator
entries. However some VBTs also have extra 0xffff sequences
elsewhere in the LFP data. When looking for the terminators
we may end up finding those extra sequeneces insted, which means
we deduce the wrong size for the fp_timing table. The code
then notices the inconsistent looking values and gives up on
the generated data table pointers, preventing us from parsing
the LFP data table entirely.

Let's give up on the "search for the terminators" approach
and instead just hardcode the expected size for the fp_timing
table.

We have enough sanity checks in place to make sure we
shouldn't end up parsing total garbage even if that size
should change in the future (although that seems unlikely
as the fp_timing and dvo_timing tables have been declared
obsolete as of VBT version 229).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 45 ++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 09ed4bd0c1f8..1ef565b93565 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -177,19 +177,6 @@ static size_t lfp_data_min_size(const struct context *context)
 	return size;
 }
 
-static const uint8_t *find_fp_timing_terminator(const uint8_t *data, int size)
-{
-	if (!data)
-		return NULL;
-
-	for (int i = 0; i < size - 1; i++) {
-		if (data[i] == 0xff && data[i+1] == 0xff)
-			return &data[i];
-	}
-
-	return NULL;
-}
-
 static int make_lvds_data_ptr(struct lvds_lfp_data_ptr_table *table,
 			      int table_size, int total_size)
 {
@@ -212,11 +199,22 @@ static void next_lvds_data_ptr(struct lvds_lfp_data_ptr_table *next,
 
 static void *generate_lvds_data_ptrs(const struct context *context)
 {
-	int size, table_size, block_size, offset;
-	const void *t0, *t1, *block;
+	int size, table_size, block_size, offset, fp_timing_size;
+	const void *block;
 	struct bdb_lvds_lfp_data_ptrs *ptrs;
 	void *ptrs_block;
 
+	/*
+	 * The hardcoded fp_timing_size is only valid for
+	 * modernish VBTs. All older VBTs definitely should
+	 * include block 41 and thus we don't need to
+	 * generate one.
+	 */
+	if (context->bdb->version < 155)
+		return NULL;
+
+	fp_timing_size = 38;
+
 	block = find_raw_section(context, BDB_LVDS_LFP_DATA);
 	if (!block)
 		return NULL;
@@ -224,16 +222,9 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	block_size = get_blocksize(block);
 
 	size = block_size;
-	t0 = find_fp_timing_terminator(block, size);
-	if (!t0)
-		return NULL;
 
-	size -= t0 - block - 2;
-	t1 = find_fp_timing_terminator(t0 + 2, size);
-	if (!t1)
-		return NULL;
-
-	size = t1 - t0;
+	size = fp_timing_size + sizeof(struct lvds_dvo_timing) +
+		sizeof(struct lvds_pnp_id);
 	if (size * 16 > block_size)
 		return NULL;
 
@@ -251,7 +242,7 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	table_size = sizeof(struct lvds_dvo_timing);
 	size = make_lvds_data_ptr(&ptrs->ptr[0].dvo_timing, table_size, size);
 
-	table_size = t0 - block + 2;
+	table_size = fp_timing_size;
 	size = make_lvds_data_ptr(&ptrs->ptr[0].fp_timing, table_size, size);
 
 	if (ptrs->ptr[0].fp_timing.table_size)
@@ -264,14 +255,14 @@ static void *generate_lvds_data_ptrs(const struct context *context)
 	if (size != 0 || ptrs->lvds_entries != 3)
 		return NULL;
 
-	size = t1 - t0;
+	size = fp_timing_size + sizeof(struct lvds_dvo_timing) +
+		sizeof(struct lvds_pnp_id);
 	for (int i = 1; i < 16; i++) {
 		next_lvds_data_ptr(&ptrs->ptr[i].fp_timing, &ptrs->ptr[i-1].fp_timing, size);
 		next_lvds_data_ptr(&ptrs->ptr[i].dvo_timing, &ptrs->ptr[i-1].dvo_timing, size);
 		next_lvds_data_ptr(&ptrs->ptr[i].panel_pnp_id, &ptrs->ptr[i-1].panel_pnp_id, size);
 	}
 
-	size = t1 - t0;
 	table_size = sizeof(struct lvds_lfp_panel_name);
 
 	if (16 * (size + table_size) <= block_size) {
-- 
2.35.1
