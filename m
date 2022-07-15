Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9093210E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:43 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:11 +0300
Message-Id: <20220715202520.23677-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/14] tools/intel_vbt_decode: Remove
 pointless variables
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

A bunch of places assign some random variable just to
print out its value with YESNO(). Skip the pointless
intermediate step.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 50 +++++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 97db885aee63..072c1d969c14 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1115,17 +1115,15 @@ static void dump_lvds_options(struct context *context,
 		printf("\t\tChannel type: %s (0x%x)\n",
 		       channel_type[val], val);
 
-		val = panel_bool(options->ssc_bits, i);
-		printf("\t\tSSC: %s (0x%x)\n",
-		       YESNO(val), val);
+		printf("\t\tSSC: %s\n",
+		       YESNO(panel_bool(options->ssc_bits, i)));
 
 		val = panel_bool(options->ssc_freq, i);
 		printf("\t\tSSC frequency: %d MHz (0x%x)\n",
 		       decode_ssc_freq(context, val), val);
 
-		val = panel_bool(options->ssc_ddt, i);
-		printf("\t\tDisable SSC in dual display twin: %s (0x%x)\n",
-		       YESNO(val), val);
+		printf("\t\tDisable SSC in dual display twin: %s\n",
+		       YESNO(panel_bool(options->ssc_ddt, i)));
 
 		if (block->size < 16)
 			continue;
@@ -1148,9 +1146,8 @@ static void dump_lvds_options(struct context *context,
 		if (context->bdb->version < 200)
 			continue;
 
-		val = panel_bool(options->lcdvcc_s0_enable, i);
-		printf("\t\tLCDVCC on during S0 state: %s (0x%x)\n",
-		       YESNO(val), val);
+		printf("\t\tLCDVCC on during S0 state: %s\n",
+		       YESNO(panel_bool(options->lcdvcc_s0_enable, i)));
 
 		if (context->bdb->version < 228)
 			continue;
@@ -1476,15 +1473,13 @@ static void dump_edp(struct context *context,
 		       dp_preemph(edp->fast_link_params[i].vswing),
 		       edp->fast_link_params[i].vswing);
 
-		if (context->bdb->version >= 162) {
-			bool val = panel_bool(edp->edp_s3d_feature, i);
-			printf("\t\tStereo 3D feature: %s\n", YESNO(val));
-		}
+		if (context->bdb->version >= 162)
+			printf("\t\tStereo 3D feature: %s\n",
+			       YESNO(panel_bool(edp->edp_s3d_feature, i)));
 
-		if (context->bdb->version >= 165) {
-			bool val = panel_bool(edp->edp_t3_optimization, i);
-			printf("\t\tT3 optimization: %s\n", YESNO(val));
-		}
+		if (context->bdb->version >= 165)
+			printf("\t\tT3 optimization: %s\n",
+			       YESNO(panel_bool(edp->edp_t3_optimization, i)));
 
 		if (context->bdb->version >= 173) {
 			int val = (edp->edp_vswing_preemph >> (i * 4)) & 0xf;
@@ -1503,28 +1498,25 @@ static void dump_edp(struct context *context,
 			}
 		}
 
-		if (context->bdb->version >= 182) {
-			bool val = panel_bool(edp->fast_link_training, i);
-			printf("\t\tFast link training: %s\n", YESNO(val));
-		}
+		if (context->bdb->version >= 182)
+			printf("\t\tFast link training: %s\n",
+			       YESNO(panel_bool(edp->fast_link_training, i)));
 
-		if (context->bdb->version >= 185) {
-			bool val = panel_bool(edp->dpcd_600h_write_required, i);
-			printf("\t\tDPCD 600h write required: %s\n", YESNO(val));
-		}
+		if (context->bdb->version >= 185)
+			printf("\t\tDPCD 600h write required: %s\n",
+			       YESNO(panel_bool(edp->dpcd_600h_write_required, i)));
 
-		if (context->bdb->version >= 186) {
+		if (context->bdb->version >= 186)
 			printf("\t\tPWM delays:\n"
 			       "\t\t\tPWM on to backlight enable: %d\n"
 			       "\t\t\tBacklight disable to PWM off: %d\n",
 			       edp->pwm_delays[i].pwm_on_to_backlight_enable,
 			       edp->pwm_delays[i].backlight_disable_to_pwm_off);
-		}
 
 		if (context->bdb->version >= 199) {
-			bool val = panel_bool(edp->full_link_params_provided, i);
+			printf("\t\tFull link params provided: %s\n",
+			       YESNO(panel_bool(edp->full_link_params_provided, i)));
 
-			printf("\t\tFull link params provided: %s\n", YESNO(val));
 			printf("\t\tFull link params:\n");
 			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
 			       dp_preemph(edp->full_link_params[i].preemphasis),
-- 
2.35.1
