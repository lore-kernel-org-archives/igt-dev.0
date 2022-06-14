Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98625113633
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:32:09 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:59 +0300
Message-Id: <20220614233100.13834-23-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 22/23] tools/intel_vbt_decode: Generate LVDS
 data table pointes if not provided
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

Modern VBTs (at least observed on TGL machines) no longer provide the
LVDS data table pointers block. Thus we can't currently decode the
contents of the LVDS data table block.

I see two options how to handle this:
1) Just hardocode the offsets/sizes (+ some checks to make sure the
   hardcoded values makes sense)
2) Deduce the offsets/sizes from the actual LVDS data table block
   contents

I've chosen option 2 here. The fp_timing table 0xffff terminator
is what allows us to do this. We just look up the first two
of those from the LVDS data block and calculate the offsets/sizes
from there. Only the fp_timing entries should have a variable size,
and the dvo_timings and panel_pnp_id have fixed size (in fact IIRC
they are 1:1 match for the equivalent EDID stuff).

This is the same thing we do in the kernel parser as well since
commit a87d0a847607 ("drm/i915/bios: Generate LFP data table
pointers if the VBT lacks them")

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 128 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 2ec9990279d9..e45bab4a3e01 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -189,6 +189,121 @@ static size_t lfp_data_min_size(const struct context *context)
 	return size;
 }
 
+static const uint8_t *find_fp_timing_terminator(const uint8_t *data, int size)
+{
+	if (!data)
+		return NULL;
+
+	for (int i = 0; i < size - 1; i++) {
+		if (data[i] == 0xff && data[i+1] == 0xff)
+			return &data[i];
+	}
+
+	return NULL;
+}
+
+static int make_lvds_data_ptr(struct lvds_lfp_data_ptr_table *table,
+			      int table_size, int total_size)
+{
+	if (total_size < table_size)
+		return total_size;
+
+	table->table_size = table_size;
+	table->offset = total_size - table_size;
+
+	return total_size - table_size;
+}
+
+static void next_lvds_data_ptr(struct lvds_lfp_data_ptr_table *next,
+			       const struct lvds_lfp_data_ptr_table *prev,
+			       int size)
+{
+	next->table_size = prev->table_size;
+	next->offset = prev->offset + size;
+}
+
+static void *generate_lvds_data_ptrs(const struct context *context)
+{
+	int size, table_size, block_size, offset;
+	const void *t0, *t1, *block;
+	struct bdb_lvds_lfp_data_ptrs *ptrs;
+	void *ptrs_block;
+
+	block = find_raw_section(context, BDB_LVDS_LFP_DATA);
+	if (!block)
+		return NULL;
+
+	block_size = get_blocksize(block);
+
+	size = block_size;
+	t0 = find_fp_timing_terminator(block, size);
+	if (!t0)
+		return NULL;
+
+	size -= t0 - block - 2;
+	t1 = find_fp_timing_terminator(t0 + 2, size);
+	if (!t1)
+		return NULL;
+
+	size = t1 - t0;
+	if (size * 16 > block_size)
+		return NULL;
+
+	ptrs_block = calloc(1, sizeof(*ptrs) + 3);
+	if (!ptrs_block)
+		return NULL;
+
+	*(uint8_t *)(ptrs_block + 0) = BDB_LVDS_LFP_DATA_PTRS;
+	*(uint16_t *)(ptrs_block + 1) = sizeof(*ptrs);
+	ptrs = ptrs_block + 3;
+
+	table_size = sizeof(struct lvds_pnp_id);
+	size = make_lvds_data_ptr(&ptrs->ptr[0].panel_pnp_id, table_size, size);
+
+	table_size = sizeof(struct lvds_dvo_timing);
+	size = make_lvds_data_ptr(&ptrs->ptr[0].dvo_timing, table_size, size);
+
+	table_size = t0 - block + 2;
+	size = make_lvds_data_ptr(&ptrs->ptr[0].fp_timing, table_size, size);
+
+	if (ptrs->ptr[0].fp_timing.table_size)
+		ptrs->lvds_entries++;
+	if (ptrs->ptr[0].dvo_timing.table_size)
+		ptrs->lvds_entries++;
+	if (ptrs->ptr[0].panel_pnp_id.table_size)
+		ptrs->lvds_entries++;
+
+	if (size != 0 || ptrs->lvds_entries != 3)
+		return NULL;
+
+	size = t1 - t0;
+	for (int i = 1; i < 16; i++) {
+		next_lvds_data_ptr(&ptrs->ptr[i].fp_timing, &ptrs->ptr[i-1].fp_timing, size);
+		next_lvds_data_ptr(&ptrs->ptr[i].dvo_timing, &ptrs->ptr[i-1].dvo_timing, size);
+		next_lvds_data_ptr(&ptrs->ptr[i].panel_pnp_id, &ptrs->ptr[i-1].panel_pnp_id, size);
+	}
+
+	size = t1 - t0;
+	table_size = sizeof(struct lvds_lfp_panel_name);
+
+	if (16 * (size + table_size) <= block_size) {
+		ptrs->panel_name.table_size = table_size;
+		ptrs->panel_name.offset = size * 16;
+	}
+
+	offset = block - (const void *)context->bdb;
+	for (int i = 0; i < 16; i++) {
+		ptrs->ptr[i].fp_timing.offset += offset;
+		ptrs->ptr[i].dvo_timing.offset += offset;
+		ptrs->ptr[i].panel_pnp_id.offset += offset;
+	}
+
+	if (ptrs->panel_name.offset)
+		ptrs->panel_name.offset += offset;
+
+	return ptrs_block;
+}
+
 static size_t block_min_size(const struct context *context, int section_id)
 {
 	switch (section_id) {
@@ -345,23 +460,34 @@ static struct bdb_block *find_section(const struct context *context, int section
 {
 	size_t min_size = block_min_size(context, section_id);
 	struct bdb_block *block;
+	void *temp_block = NULL;
 	const void *data;
 	size_t size;
 
 	data = find_raw_section(context, section_id);
+	if (!data && section_id == BDB_LVDS_LFP_DATA_PTRS) {
+		printf("Generating LVDS data table pointers\n");
+		temp_block = generate_lvds_data_ptrs(context);
+		if (temp_block)
+			data = temp_block + 3;
+	}
 	if (!data)
 		return NULL;
 
 	size = get_blocksize(data);
 
 	block = calloc(1, sizeof(*block) + 3 + max(size, min_size));
-	if (!block)
+	if (!block) {
+		free(temp_block);
 		return NULL;
+	}
 
 	block->id = section_id;
 	block->size = size;
 	memcpy(block->data, data - 3, 3 + size);
 
+	free(temp_block);
+
 	if (section_id == BDB_LVDS_LFP_DATA_PTRS &&
 	    !fixup_lfp_data_ptrs(context, 3 + block->data)) {
 		fprintf(stderr, "VBT has malformed LFP data table pointers\n");
-- 
2.35.1
