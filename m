Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27F113603
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:27 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:45 +0300
Message-Id: <20220614233100.13834-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/23] tools/intel_vbt_decode: Decode the
 LFP power block
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

Decode the contents of the LFP power conservation block (44).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 85 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index fdee0a41e071..37f627561a1f 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1067,6 +1067,86 @@ static void dump_psr(struct context *context,
 	}
 }
 
+static void dump_lfp_power(struct context *context,
+			   const struct bdb_block *block)
+{
+	const struct bdb_lfp_power *lfp_block = block->data;
+	int i;
+
+	printf("\tALS enable: %s\n",
+	       YESNO(lfp_block->features.als_enable));
+	printf("\tDisplay LACE support: %s\n",
+	       YESNO(lfp_block->features.lace_support));
+	printf("\tDefault Display LACE enabled status: %s\n",
+	       YESNO(lfp_block->features.lace_enabled_status));
+	printf("\tPower conservation preference level: %d\n",
+	       lfp_block->features.power_conservation_pref);
+
+	for (i = 0; i < 5; i++) {
+		printf("\tALS backlight adjust: %d\n",
+		       lfp_block->als[i].backlight_adjust);
+		printf("\tALS Lux: %d\n",
+		       lfp_block->als[i].lux);
+	}
+
+	printf("\tDisplay LACE aggressiveness profile: %d\n",
+	       lfp_block->lace_aggressiveness_profile);
+
+	if (context->bdb->version < 228)
+		return;
+
+	for (i = 0; i < 16; i++) {
+		if (i != context->panel_type && !context->dump_all_panel_types)
+			continue;
+
+		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+
+		printf("\t\tDPST: %s\n",
+		       YESNO((lfp_block->dpst >> i) & 1));
+		printf("\t\tPSR: %s\n",
+		       YESNO((lfp_block->psr >> i) & 1));
+		printf("\t\tDRRS: %s\n",
+		       YESNO((lfp_block->drrs >> i) & 1));
+		printf("\t\tDisplay LACE support: %s\n",
+		       YESNO((lfp_block->lace_support >> i) & 1));
+		printf("\t\tADT: %s\n",
+		       YESNO((lfp_block->adt >> i) & 1));
+		printf("\t\tDMRRS: %s\n",
+		       YESNO((lfp_block->dmrrs >> i) & 1));
+		printf("\t\tADB: %s\n", YESNO((lfp_block->adb >> i) & 1));
+		printf("\t\tDefault Display LACE enabled: %s\n",
+		       YESNO((lfp_block->lace_enabled_status >> i) & 1));
+		printf("\t\tLACE Aggressiveness: %d\n",
+		       lfp_block->aggressiveness[i].lace_aggressiveness);
+		printf("\t\tDPST Aggressiveness: %d\n",
+		       lfp_block->aggressiveness[i].dpst_aggressiveness);
+
+		if (context->bdb->version < 232)
+			continue;
+
+		printf("\t\tEDP 4k/2k HOBL feature: %s\n",
+		       YESNO((lfp_block->hobl >> i) & 1));
+
+		if (context->bdb->version < 233)
+			continue;
+
+		printf("\t\tVRR feature: %s\n",
+		       YESNO((lfp_block->vrr_feature_enabled >> i) & 1));
+
+		if (context->bdb->version < 247)
+			continue;
+
+		printf("\t\tELP: %s\n",
+		       YESNO((lfp_block->elp >> i) & 1));
+		printf("\t\tOPST: %s\n",
+		       YESNO((lfp_block->opst >> i) & 1));
+		printf("\t\tELP Aggressiveness: %d\n",
+		       lfp_block->aggressiveness2[i].elp_aggressiveness);
+		printf("\t\tOPST Aggrgessiveness: %d\n",
+		       lfp_block->aggressiveness2[i].opst_aggressiveness);
+	}
+}
+
 static void
 print_detail_timing_data(const struct lvds_dvo_timing *dvo_timing)
 {
@@ -1761,6 +1841,11 @@ struct dumper dumpers[] = {
 		.name = "Backlight info block",
 		.dump = dump_backlight_info,
 	},
+	{
+		.id = BDB_LFP_POWER,
+		.name = "LFP power conservation features block",
+		.dump = dump_lfp_power,
+	},
 	{
 		.id = BDB_SDVO_LVDS_OPTIONS,
 		.name = "SDVO LVDS options block",
-- 
2.35.1
