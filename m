Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADB211361A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:51 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:53 +0300
Message-Id: <20220614233100.13834-17-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 16/23] tools/intel_vbt_decode: Convert LFP
 data pointers to be relative to the data block
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

For some crazy reason the LFP data pointer offsets are specified
as relative to the BDB header. That won't work with out private
BDB block copies, so let's convert them to be relative to the
start of the LFP data block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 740940f9f29a..8f80c79ace4c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -132,6 +132,21 @@ static const void *find_raw_section(const struct context *context, int section_i
 	return NULL;
 }
 
+/*
+ * Offset from the start of BDB to the start of the
+ * block data (just past the block header).
+ */
+static u32 raw_block_offset(const struct context *context, enum bdb_block_id section_id)
+{
+	const void *block;
+
+	block = find_raw_section(context, section_id);
+	if (!block)
+		return 0;
+
+	return block - (const void *)context->bdb;
+}
+
 static const void *block_data(const struct bdb_block *block)
 {
 	return block->data + 3;
@@ -181,6 +196,37 @@ static size_t block_min_size(const struct context *context, int section_id)
 	}
 }
 
+/* make the data table offsets relative to the data block */
+static bool fixup_lfp_data_ptrs(const struct context *context,
+				void *ptrs_block)
+{
+	struct bdb_lvds_lfp_data_ptrs *ptrs = ptrs_block;
+	u32 offset;
+	int i;
+
+	offset = raw_block_offset(context, BDB_LVDS_LFP_DATA);
+
+	for (i = 0; i < 16; i++) {
+		if (ptrs->ptr[i].fp_timing.offset < offset ||
+		    ptrs->ptr[i].dvo_timing.offset < offset ||
+		    ptrs->ptr[i].panel_pnp_id.offset < offset)
+			return false;
+
+		ptrs->ptr[i].fp_timing.offset -= offset;
+		ptrs->ptr[i].dvo_timing.offset -= offset;
+		ptrs->ptr[i].panel_pnp_id.offset -= offset;
+	}
+
+	if (ptrs->panel_name.table_size) {
+		if (ptrs->panel_name.offset < offset)
+			return false;
+
+		ptrs->panel_name.offset -= offset;
+	}
+
+	return true;
+}
+
 static struct bdb_block *find_section(const struct context *context, int section_id)
 {
 	size_t min_size = block_min_size(context, section_id);
@@ -202,6 +248,13 @@ static struct bdb_block *find_section(const struct context *context, int section
 	block->size = size;
 	memcpy(block->data, data - 3, 3 + size);
 
+	if (section_id == BDB_LVDS_LFP_DATA_PTRS &&
+	    !fixup_lfp_data_ptrs(context, 3 + block->data)) {
+		fprintf(stderr, "VBT has malformed LFP data table pointers\n");
+		free(block);
+		return NULL;
+	}
+
 	return block;
 }
 
-- 
2.35.1
