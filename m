Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64EBA11361F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:52 +0300
Message-Id: <20220614233100.13834-16-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 15/23] tools/intel_vbt_decode: Specify a
 minimum size for the BDB block copy
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

Guarantee that we have enough memory allocated for the structure
we use to decode the BDB blocks. We no longer have to worry about
going out of bounds in case of malformed VBT or incorrect version
checks.

The BDB_SDVO_PANEL_DTDS and BDB_GENERIC_DTD code looks a bit
bit suspicious so those probably need a full review. Also
BDB_LVDS_LFP_DATA and BDB_LVDS_LFP_DATA_PTRS will need further
work due to the variable size nature of the data.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 47 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 48755164ec91..740940f9f29a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -137,8 +137,53 @@ static const void *block_data(const struct bdb_block *block)
 	return block->data + 3;
 }
 
+static size_t block_min_size(const struct context *context, int section_id)
+{
+	switch (section_id) {
+	case BDB_GENERAL_FEATURES:
+		return sizeof(struct bdb_general_features);
+	case BDB_GENERAL_DEFINITIONS:
+		return sizeof(struct bdb_general_definitions);
+	case BDB_PSR:
+		return sizeof(struct bdb_psr);
+	case BDB_CHILD_DEVICE_TABLE:
+		return sizeof(struct bdb_legacy_child_devices);
+	case BDB_DRIVER_FEATURES:
+		return sizeof(struct bdb_driver_features);
+	case BDB_SDVO_LVDS_OPTIONS:
+		return sizeof(struct bdb_sdvo_lvds_options);
+	case BDB_SDVO_PANEL_DTDS:
+		/* FIXME? */
+		return 0;
+	case BDB_EDP:
+		return sizeof(struct bdb_edp);
+	case BDB_LVDS_OPTIONS:
+		return sizeof(struct bdb_lvds_options);
+	case BDB_LVDS_LFP_DATA_PTRS:
+		return sizeof(struct bdb_lvds_lfp_data_ptrs);
+	case BDB_LVDS_LFP_DATA:
+		return sizeof(struct bdb_lvds_lfp_data);
+	case BDB_LVDS_BACKLIGHT:
+		return sizeof(struct bdb_lfp_backlight_data);
+	case BDB_LFP_POWER:
+		return sizeof(struct bdb_lfp_power);
+	case BDB_MIPI_CONFIG:
+		return sizeof(struct bdb_mipi_config);
+	case BDB_MIPI_SEQUENCE:
+		return sizeof(struct bdb_mipi_sequence);
+	case BDB_COMPRESSION_PARAMETERS:
+		return sizeof(struct bdb_compression_parameters);
+	case BDB_GENERIC_DTD:
+		/* FIXME check spec */
+		return sizeof(struct bdb_generic_dtd);
+	default:
+		return 0;
+	}
+}
+
 static struct bdb_block *find_section(const struct context *context, int section_id)
 {
+	size_t min_size = block_min_size(context, section_id);
 	struct bdb_block *block;
 	const void *data;
 	size_t size;
@@ -149,7 +194,7 @@ static struct bdb_block *find_section(const struct context *context, int section
 
 	size = get_blocksize(data);
 
-	block = calloc(1, sizeof(*block) + 3 + size);
+	block = calloc(1, sizeof(*block) + 3 + max(size, min_size));
 	if (!block)
 		return NULL;
 
-- 
2.35.1
