Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C1E11362A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:32:03 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:57 +0300
Message-Id: <20220614233100.13834-21-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 20/23] tools/intel_vbt_decode: Dump the LVDS
 data ptrs
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

Decoede the LVDS data pointers. The offsets are specificed from
the start of the whole VBT, but we've fixed them up to be relative
to the start of the block already. For human parsing printing
them as relative from the start of the block seems more useful
anywya.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 574aa25530fd..29857e4154e8 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -903,6 +903,39 @@ static void dump_lvds_ptr_data(struct context *context,
 	const struct bdb_lvds_lfp_data_ptrs *ptrs = block_data(block);
 
 	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
+
+	for (int i = 0; i < 16; i++) {
+		if (i != context->panel_type && !context->dump_all_panel_types)
+			continue;
+
+		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+
+		if (ptrs->lvds_entries >= 1) {
+			printf("\t\tFP timing offset: %d\n",
+			       ptrs->ptr[i].fp_timing.offset);
+			printf("\t\tFP timing table size: %d\n",
+			       ptrs->ptr[i].fp_timing.table_size);
+		}
+		if (ptrs->lvds_entries >= 2) {
+			printf("\t\tDVO timing offset: %d\n",
+			       ptrs->ptr[i].dvo_timing.offset);
+			printf("\t\tDVO timing table size: %d\n",
+			       ptrs->ptr[i].dvo_timing.table_size);
+		}
+		if (ptrs->lvds_entries >= 3) {
+			printf("\t\tPanel PnP ID offset: %d\n",
+			       ptrs->ptr[i].panel_pnp_id.offset);
+			printf("\t\tPanel PnP ID table size: %d\n",
+			       ptrs->ptr[i].panel_pnp_id.table_size);
+		}
+	}
+
+	if (ptrs->panel_name.table_size) {
+		printf("\tPanel name offset: %d\n",
+		       ptrs->panel_name.offset);
+		printf("\tPanel name table size: %d\n",
+		       ptrs->panel_name.table_size);
+	}
 }
 
 static char *decode_pnp_id(u16 mfg_name, char str[4])
-- 
2.35.1
