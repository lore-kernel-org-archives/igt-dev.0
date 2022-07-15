Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8110E275
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:10 +0300
Message-Id: <20220715202520.23677-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/14] tools/intel_vbt_decode: Introduce
 panel_bits()/panel_bool()
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

Add a few helpers for extracting panel specific bits from
the bitfields.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 78 +++++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 4bb8437bffb0..97db885aee63 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -507,6 +507,16 @@ static struct bdb_block *find_section(const struct context *context, int section
 	return block;
 }
 
+static unsigned int panel_bits(unsigned int value, int panel_type, int num_bits)
+{
+	return (value >> (panel_type * num_bits)) & (BIT(num_bits) - 1);
+}
+
+static bool panel_bool(unsigned int value, int panel_type)
+{
+	return panel_bits(value, panel_type, 1);
+}
+
 static int decode_ssc_freq(struct context *context, bool alternate)
 {
 	switch (intel_gen(context->devid)) {
@@ -1101,58 +1111,58 @@ static void dump_lvds_options(struct context *context,
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
 
-		val = (options->lvds_panel_channel_bits >> (i * 2)) & 3;
+		val = panel_bits(options->lvds_panel_channel_bits, i, 2);
 		printf("\t\tChannel type: %s (0x%x)\n",
 		       channel_type[val], val);
 
-		val = (options->ssc_bits >> i) & 1;
+		val = panel_bool(options->ssc_bits, i);
 		printf("\t\tSSC: %s (0x%x)\n",
 		       YESNO(val), val);
 
-		val = (options->ssc_freq >> i) & 1;
+		val = panel_bool(options->ssc_freq, i);
 		printf("\t\tSSC frequency: %d MHz (0x%x)\n",
 		       decode_ssc_freq(context, val), val);
 
-		val = (options->ssc_ddt >> i) & 1;
+		val = panel_bool(options->ssc_ddt, i);
 		printf("\t\tDisable SSC in dual display twin: %s (0x%x)\n",
 		       YESNO(val), val);
 
 		if (block->size < 16)
 			continue;
 
-		val = (options->panel_color_depth >> i) & 1;
+		val = panel_bool(options->panel_color_depth, i);
 		printf("\t\tPanel color depth: %d (0x%x)\n",
 		       val ? 24 : 18, val);
 
 		if (block->size < 24)
 			continue;
 
-		val = (options->dps_panel_type_bits >> (i * 2)) & 3;
+		val = panel_bits(options->dps_panel_type_bits, i, 2);
 		printf("\t\tDPS type: %s (0x%x)\n",
 		       dps_type[val], val);
 
-		val = (options->blt_control_type_bits >> (i * 2)) & 3;
+		val = panel_bits(options->blt_control_type_bits, i, 2);
 		printf("\t\tBacklight type: %s (0x%x)\n",
 		       blt_type[val], val);
 
 		if (context->bdb->version < 200)
 			continue;
 
-		val = (options->lcdvcc_s0_enable >> i) & 1;
+		val = panel_bool(options->lcdvcc_s0_enable, i);
 		printf("\t\tLCDVCC on during S0 state: %s (0x%x)\n",
 		       YESNO(val), val);
 
 		if (context->bdb->version < 228)
 			continue;
 
-		val = ((options->rotation) >> (i * 2)) & 3;
+		val = panel_bits((options->rotation), i, 2);
 		printf("\t\tPanel rotation: %d degrees (0x%x)\n",
 		       val * 90, val);
 
 		if (context->bdb->version < 240)
 			continue;
 
-		val = ((options->position) >> (i * 2)) & 3;
+		val = panel_bits((options->position), i, 2);
 		printf("\t\tPanel position: %s (0x%x)\n",
 		       pos_type[val], val);
 	}
@@ -1291,7 +1301,7 @@ static void dump_lvds_data(struct context *context,
 			continue;
 
 		printf("\t\tScaling enable: %s\n",
-		       YESNO((tail->scaling_enable >> i) & 1));
+		       YESNO(panel_bool(tail->scaling_enable, i)));
 
 		if (context->bdb->version < 188)
 			continue;
@@ -1318,13 +1328,13 @@ static void dump_lvds_data(struct context *context,
 			continue;
 
 		printf("\t\tDual LFP port sync enable: %s\n",
-		       YESNO((tail->dual_lfp_port_sync_enable >> i) & 1));
+		       YESNO(panel_bool(tail->dual_lfp_port_sync_enable, i)));
 
 		if (context->bdb->version < 245)
 			continue;
 
 		printf("\t\tGPU dithering for banding artifacts: %s\n",
-		       YESNO((tail->gpu_dithering_for_banding_artifacts >> i) & 1));
+		       YESNO(panel_bool(tail->gpu_dithering_for_banding_artifacts, i)));
 	}
 
 	free(ptrs_block);
@@ -1419,7 +1429,7 @@ static void dump_edp(struct context *context,
 		       edp->power_seqs[i].t10,
 		       edp->power_seqs[i].t12);
 
-		bpp = (edp->color_depth >> (i * 2)) & 3;
+		bpp = panel_bits(edp->color_depth, i, 2);
 
 		printf("\t\tPanel color depth: ");
 		switch (bpp) {
@@ -1437,7 +1447,7 @@ static void dump_edp(struct context *context,
 			break;
 		}
 
-		msa = (edp->sdrrs_msa_timing_delay >> (i * 2)) & 3;
+		msa = panel_bits(edp->sdrrs_msa_timing_delay, i, 2);
 		printf("\t\teDP sDRRS MSA Delay: Lane %d\n", msa + 1);
 
 		printf("\t\tFast link params:\n");
@@ -1467,12 +1477,12 @@ static void dump_edp(struct context *context,
 		       edp->fast_link_params[i].vswing);
 
 		if (context->bdb->version >= 162) {
-			bool val = (edp->edp_s3d_feature >> i) & 1;
+			bool val = panel_bool(edp->edp_s3d_feature, i);
 			printf("\t\tStereo 3D feature: %s\n", YESNO(val));
 		}
 
 		if (context->bdb->version >= 165) {
-			bool val = (edp->edp_t3_optimization >> i) & 1;
+			bool val = panel_bool(edp->edp_t3_optimization, i);
 			printf("\t\tT3 optimization: %s\n", YESNO(val));
 		}
 
@@ -1494,12 +1504,12 @@ static void dump_edp(struct context *context,
 		}
 
 		if (context->bdb->version >= 182) {
-			bool val = (edp->fast_link_training >> i) & 1;
+			bool val = panel_bool(edp->fast_link_training, i);
 			printf("\t\tFast link training: %s\n", YESNO(val));
 		}
 
 		if (context->bdb->version >= 185) {
-			bool val = (edp->dpcd_600h_write_required >> i) & 1;
+			bool val = panel_bool(edp->dpcd_600h_write_required, i);
 			printf("\t\tDPCD 600h write required: %s\n", YESNO(val));
 		}
 
@@ -1512,7 +1522,7 @@ static void dump_edp(struct context *context,
 		}
 
 		if (context->bdb->version >= 199) {
-			bool val = (edp->full_link_params_provided >> i) & 1;
+			bool val = panel_bool(edp->full_link_params_provided, i);
 
 			printf("\t\tFull link params provided: %s\n", YESNO(val));
 			printf("\t\tFull link params:\n");
@@ -1595,7 +1605,8 @@ static void dump_psr(struct context *context,
 			int index;
 			static const uint16_t psr2_tp_times[] = {500, 100, 2500, 5};
 
-			index = (psr2_tp_time >> (i * 2)) & 0x3;
+			index = panel_bits(psr2_tp_time, i, 2);
+
 			printf("\t\tPSR2 TP2/TP3 wakeup time: %d usec (0x%x)\n",
 			       psr2_tp_times[index], index);
 		}
@@ -1637,20 +1648,21 @@ static void dump_lfp_power(struct context *context,
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
 
 		printf("\t\tDPST: %s\n",
-		       YESNO((lfp_block->dpst >> i) & 1));
+		       YESNO(panel_bool(lfp_block->dpst, i)));
 		printf("\t\tPSR: %s\n",
-		       YESNO((lfp_block->psr >> i) & 1));
+		       YESNO(panel_bool(lfp_block->psr, i)));
 		printf("\t\tDRRS: %s\n",
-		       YESNO((lfp_block->drrs >> i) & 1));
+		       YESNO(panel_bool(lfp_block->drrs, i)));
 		printf("\t\tDisplay LACE support: %s\n",
-		       YESNO((lfp_block->lace_support >> i) & 1));
+		       YESNO(panel_bool(lfp_block->lace_support, i)));
 		printf("\t\tADT: %s\n",
-		       YESNO((lfp_block->adt >> i) & 1));
+		       YESNO(panel_bool(lfp_block->adt, i)));
 		printf("\t\tDMRRS: %s\n",
-		       YESNO((lfp_block->dmrrs >> i) & 1));
-		printf("\t\tADB: %s\n", YESNO((lfp_block->adb >> i) & 1));
+		       YESNO(panel_bool(lfp_block->dmrrs, i)));
+		printf("\t\tADB: %s\n",
+		       YESNO(panel_bool(lfp_block->adb, i)));
 		printf("\t\tDefault Display LACE enabled: %s\n",
-		       YESNO((lfp_block->lace_enabled_status >> i) & 1));
+		       YESNO(panel_bool(lfp_block->lace_enabled_status, i)));
 		printf("\t\tLACE Aggressiveness: %d\n",
 		       lfp_block->aggressiveness[i].lace_aggressiveness);
 		printf("\t\tDPST Aggressiveness: %d\n",
@@ -1660,21 +1672,21 @@ static void dump_lfp_power(struct context *context,
 			continue;
 
 		printf("\t\tEDP 4k/2k HOBL feature: %s\n",
-		       YESNO((lfp_block->hobl >> i) & 1));
+		       YESNO(panel_bool(lfp_block->hobl, i)));
 
 		if (context->bdb->version < 233)
 			continue;
 
 		printf("\t\tVRR feature: %s\n",
-		       YESNO((lfp_block->vrr_feature_enabled >> i) & 1));
+		       YESNO(panel_bool(lfp_block->vrr_feature_enabled, i)));
 
 		if (context->bdb->version < 247)
 			continue;
 
 		printf("\t\tELP: %s\n",
-		       YESNO((lfp_block->elp >> i) & 1));
+		       YESNO(panel_bool(lfp_block->elp, i)));
 		printf("\t\tOPST: %s\n",
-		       YESNO((lfp_block->opst >> i) & 1));
+		       YESNO(panel_bool(lfp_block->opst, i)));
 		printf("\t\tELP Aggressiveness: %d\n",
 		       lfp_block->aggressiveness2[i].elp_aggressiveness);
 		printf("\t\tOPST Aggrgessiveness: %d\n",
-- 
2.35.1
