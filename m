Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE16113616
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:45 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:51 +0300
Message-Id: <20220614233100.13834-15-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 14/23] tools/intel_vbt_decode: Make copies
 of the BDB blocks
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

Make a copy of the BDB blocks. For the moment we just do a
1:1 copy but later on we can specify a minimum size for
the copy and stop worrying about going out of bounds during
parsing in case the version checks are wrong of the VBT is
malformed.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 92 +++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index deeb82050528..48755164ec91 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -69,7 +69,7 @@ typedef uint64_t u64;
 struct bdb_block {
 	uint8_t id;
 	uint32_t size;
-	const void *data;
+	uint8_t data[];
 };
 
 struct context {
@@ -93,11 +93,16 @@ static uint32_t _get_blocksize(const uint8_t *block_base)
 		return *((const uint16_t *)(block_base + 1));
 }
 
-static struct bdb_block *find_section(struct context *context, int section_id)
+/* Get BDB block size give a pointer to data after Block ID and Block Size. */
+static u32 get_blocksize(const void *block_data)
+{
+	return _get_blocksize(block_data - 3);
+}
+
+static const void *find_raw_section(const struct context *context, int section_id)
 {
 	const struct bdb_header *bdb = context->bdb;
 	int length = context->size;
-	struct bdb_block *block;
 	const uint8_t *base = (const uint8_t *)bdb;
 	int index = 0;
 	uint32_t total, current_size;
@@ -109,12 +114,6 @@ static struct bdb_block *find_section(struct context *context, int section_id)
 	if (total > length)
 		total = length;
 
-	block = malloc(sizeof(*block));
-	if (!block) {
-		fprintf(stderr, "out of memory\n");
-		exit(EXIT_FAILURE);
-	}
-
 	/* walk the sections looking for section_id */
 	while (index + 3 < total) {
 		current_id = *(base + index);
@@ -124,20 +123,43 @@ static struct bdb_block *find_section(struct context *context, int section_id)
 		if (index + current_size > total)
 			return NULL;
 
-		if (current_id == section_id) {
-			block->id = current_id;
-			block->size = current_size;
-			block->data = base + index;
-			return block;
-		}
+		if (current_id == section_id)
+			return base + index;
 
 		index += current_size;
 	}
 
-	free(block);
 	return NULL;
 }
 
+static const void *block_data(const struct bdb_block *block)
+{
+	return block->data + 3;
+}
+
+static struct bdb_block *find_section(const struct context *context, int section_id)
+{
+	struct bdb_block *block;
+	const void *data;
+	size_t size;
+
+	data = find_raw_section(context, section_id);
+	if (!data)
+		return NULL;
+
+	size = get_blocksize(data);
+
+	block = calloc(1, sizeof(*block) + 3 + size);
+	if (!block)
+		return NULL;
+
+	block->id = section_id;
+	block->size = size;
+	memcpy(block->data, data - 3, 3 + size);
+
+	return block;
+}
+
 static int decode_ssc_freq(struct context *context, bool alternate)
 {
 	switch (intel_gen(context->devid)) {
@@ -154,7 +176,7 @@ static int decode_ssc_freq(struct context *context, bool alternate)
 static void dump_general_features(struct context *context,
 				  const struct bdb_block *block)
 {
-	const struct bdb_general_features *features = block->data;
+	const struct bdb_general_features *features = block_data(block);
 
 	printf("\tPanel fitting: ");
 	switch (features->panel_fitting) {
@@ -221,7 +243,7 @@ static void dump_general_features(struct context *context,
 static void dump_backlight_info(struct context *context,
 				const struct bdb_block *block)
 {
-	const struct bdb_lfp_backlight_data *backlight = block->data;
+	const struct bdb_lfp_backlight_data *backlight = block_data(block);
 	const struct lfp_backlight_data_entry *blc;
 	const struct lfp_backlight_control_method *control;
 	int i;
@@ -602,7 +624,7 @@ static void dump_child_devices(struct context *context, const uint8_t *devices,
 static void dump_general_definitions(struct context *context,
 				     const struct bdb_block *block)
 {
-	const struct bdb_general_definitions *defs = block->data;
+	const struct bdb_general_definitions *defs = block_data(block);
 	int child_dev_num;
 
 	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
@@ -625,7 +647,7 @@ static void dump_general_definitions(struct context *context,
 static void dump_legacy_child_devices(struct context *context,
 				      const struct bdb_block *block)
 {
-	const struct bdb_legacy_child_devices *defs = block->data;
+	const struct bdb_legacy_child_devices *defs = block_data(block);
 	int child_dev_num;
 
 	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
@@ -668,7 +690,7 @@ static const char * const pos_type[] = {
 static void dump_lvds_options(struct context *context,
 			      const struct bdb_block *block)
 {
-	const struct bdb_lvds_options *options = block->data;
+	const struct bdb_lvds_options *options = block_data(block);
 
 	if (context->panel_type == options->panel_type)
 		printf("\tPanel type: %d\n", options->panel_type);
@@ -755,7 +777,7 @@ static void dump_lvds_options(struct context *context,
 static void dump_lvds_ptr_data(struct context *context,
 			       const struct bdb_block *block)
 {
-	const struct bdb_lvds_lfp_data_ptrs *ptrs = block->data;
+	const struct bdb_lvds_lfp_data_ptrs *ptrs = block_data(block);
 
 	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
 }
@@ -763,7 +785,7 @@ static void dump_lvds_ptr_data(struct context *context,
 static void dump_lvds_data(struct context *context,
 			   const struct bdb_block *block)
 {
-	const struct bdb_lvds_lfp_data *lvds_data = block->data;
+	const struct bdb_lvds_lfp_data *lvds_data = block_data(block);
 	struct bdb_block *ptrs_block;
 	const struct bdb_lvds_lfp_data_ptrs *ptrs;
 	int num_entries;
@@ -779,7 +801,7 @@ static void dump_lvds_data(struct context *context,
 		return;
 	}
 
-	ptrs = ptrs_block->data;
+	ptrs = block_data(ptrs_block);
 
 	lfp_data_size =
 	    ptrs->ptr[1].fp_timing.offset - ptrs->ptr[0].fp_timing.offset;
@@ -840,7 +862,7 @@ static void dump_lvds_data(struct context *context,
 static void dump_driver_feature(struct context *context,
 				const struct bdb_block *block)
 {
-	const struct bdb_driver_features *feature = block->data;
+	const struct bdb_driver_features *feature = block_data(block);
 
 	printf("\tBoot Device Algorithm: %s\n", feature->boot_dev_algorithm ?
 	       "driver default" : "os default");
@@ -909,7 +931,7 @@ static void dump_driver_feature(struct context *context,
 static void dump_edp(struct context *context,
 		     const struct bdb_block *block)
 {
-	const struct bdb_edp *edp = block->data;
+	const struct bdb_edp *edp = block_data(block);
 	int bpp, msa;
 	int i;
 
@@ -1128,7 +1150,7 @@ static void dump_edp(struct context *context,
 static void dump_psr(struct context *context,
 		     const struct bdb_block *block)
 {
-	const struct bdb_psr *psr_block = block->data;
+	const struct bdb_psr *psr_block = block_data(block);
 	int i;
 	uint32_t psr2_tp_time;
 
@@ -1190,7 +1212,7 @@ static void dump_psr(struct context *context,
 static void dump_lfp_power(struct context *context,
 			   const struct bdb_block *block)
 {
-	const struct bdb_lfp_power *lfp_block = block->data;
+	const struct bdb_lfp_power *lfp_block = block_data(block);
 	int i;
 
 	printf("\tALS enable: %s\n",
@@ -1302,7 +1324,7 @@ print_detail_timing_data(const struct lvds_dvo_timing *dvo_timing)
 static void dump_sdvo_panel_dtds(struct context *context,
 				 const struct bdb_block *block)
 {
-	const struct lvds_dvo_timing *dvo_timing = block->data;
+	const struct lvds_dvo_timing *dvo_timing = block_data(block);
 	int n, count;
 
 	count = block->size / sizeof(struct lvds_dvo_timing);
@@ -1315,7 +1337,7 @@ static void dump_sdvo_panel_dtds(struct context *context,
 static void dump_sdvo_lvds_options(struct context *context,
 				   const struct bdb_block *block)
 {
-	const struct bdb_sdvo_lvds_options *options = block->data;
+	const struct bdb_sdvo_lvds_options *options = block_data(block);
 
 	printf("\tbacklight: %d\n", options->panel_backlight);
 	printf("\th40 type: %d\n", options->h40_set_panel_type);
@@ -1337,7 +1359,7 @@ static void dump_sdvo_lvds_options(struct context *context,
 static void dump_mipi_config(struct context *context,
 			     const struct bdb_block *block)
 {
-	const struct bdb_mipi_config *start = block->data;
+	const struct bdb_mipi_config *start = block_data(block);
 	const struct mipi_config *config;
 	const struct mipi_pps_data *pps;
 
@@ -1742,7 +1764,7 @@ static int goto_next_sequence_v3(const uint8_t *data, int index, int total)
 static void dump_mipi_sequence(struct context *context,
 			       const struct bdb_block *block)
 {
-	const struct bdb_mipi_sequence *sequence = block->data;
+	const struct bdb_mipi_sequence *sequence = block_data(block);
 	const uint8_t *data;
 	uint32_t seq_size;
 	int index = 0, i;
@@ -1843,7 +1865,7 @@ static const char *dsc_max_bpp(u8 value)
 static void dump_compression_parameters(struct context *context,
 					const struct bdb_block *block)
 {
-	const struct bdb_compression_parameters *dsc = block->data;
+	const struct bdb_compression_parameters *dsc = block_data(block);
 	const struct dsc_compression_parameters_entry *data;
 	int i;
 
@@ -1890,7 +1912,7 @@ static int get_panel_type(struct context *context)
 	if (!block)
 		return -1;
 
-	options = block->data;
+	options = block_data(block);
 	panel_type = options->panel_type;
 
 	free(block);
@@ -2031,7 +2053,7 @@ static void hex_dump(const void *data, uint32_t size)
 
 static void hex_dump_block(const struct bdb_block *block)
 {
-	hex_dump(block->data - 3, 3 + block->size);
+	hex_dump(block->data, 3 + block->size);
 }
 
 static bool dump_section(struct context *context, int section_id)
-- 
2.35.1
