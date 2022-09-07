Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373E210E4CA
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:47:04 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:46:50 +0300
Message-Id: <20220907094651.29527-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
References: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tools/intel_vbt_decode: Add version
 checks for a lot of child dev fields
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

Stop decoding most child dev fields if the BDB version
is too old.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 90 ++++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 36 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 3bd4d4b70fb3..0af7902c5102 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -948,37 +948,47 @@ static void dump_child_device(struct context *context,
 		printf("\t\tI2C speed: %s (0x%02x)\n",
 		       i2c_speed(child->i2c_speed), child->i2c_speed);
 
-		printf("\t\tDP onboard redriver:\n");
-		printf("\t\t\tpresent: %s\n",
-		       YESNO((child->dp_onboard_redriver_present)));
-		printf("\t\t\tvswing: %s (0x%x)\n",
-		       dp_vswing(child->dp_onboard_redriver_vswing),
-		       child->dp_onboard_redriver_vswing);
-		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-		       dp_preemph(child->dp_onboard_redriver_preemph),
-		       child->dp_onboard_redriver_preemph);
+		if (context->bdb->version >= 158) {
+			printf("\t\tDP onboard redriver:\n");
+			printf("\t\t\tpresent: %s\n",
+			       YESNO((child->dp_onboard_redriver_present)));
+			printf("\t\t\tvswing: %s (0x%x)\n",
+			       dp_vswing(child->dp_onboard_redriver_vswing),
+			       child->dp_onboard_redriver_vswing);
+			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+			       dp_preemph(child->dp_onboard_redriver_preemph),
+			       child->dp_onboard_redriver_preemph);
 
-		printf("\t\tDP ondock redriver:\n");
-		printf("\t\t\tpresent: %s\n",
-		       YESNO((child->dp_ondock_redriver_present)));
-		printf("\t\t\tvswing: %s (0x%x)\n",
-		       dp_vswing(child->dp_ondock_redriver_vswing),
-		       child->dp_ondock_redriver_vswing);
-		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-		       dp_preemph(child->dp_ondock_redriver_preemph),
-		       child->dp_ondock_redriver_preemph);
+			printf("\t\tDP ondock redriver:\n");
+			printf("\t\t\tpresent: %s\n",
+			       YESNO((child->dp_ondock_redriver_present)));
+			printf("\t\t\tvswing: %s (0x%x)\n",
+			       dp_vswing(child->dp_ondock_redriver_vswing),
+			       child->dp_ondock_redriver_vswing);
+			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
+			       dp_preemph(child->dp_ondock_redriver_preemph),
+			       child->dp_ondock_redriver_preemph);
+		}
 
-		dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
-		printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shifter_value);
+		if (context->bdb->version >= 204)
+			dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
+		if (context->bdb->version >= 169)
+			printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shifter_value);
 
-		printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
+		if (context->bdb->version >= 161)
+			printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
 
-		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
-		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
-		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
-		printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
+		if (context->bdb->version >= 202)
+			printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
+		if (context->bdb->version >= 198) {
+			printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
+			printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
+		}
+		if (context->bdb->version >= 161)
+			printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
 
-		printf("\t\tCompression structure index: %d\n", child->compression_structure_index);
+		if (context->bdb->version >= 198)
+			printf("\t\tCompression structure index: %d\n", child->compression_structure_index);
 
 		if (context->bdb->version >= 237) {
 			printf("\t\tHDMI Max FRL rate valid: %s\n",
@@ -1007,16 +1017,24 @@ static void dump_child_device(struct context *context,
 	} else {
 		if (context->bdb->version >= 244)
 			printf("\t\teDP/DP max lane count: X%d\n", child->dp_max_lane_count + 1);
-		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
-		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
-		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
-		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
-		printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
-		printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
-
-		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
-		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
-		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
+		if (context->bdb->version >= 218)
+			printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
+		if (context->bdb->version >= 196) {
+			printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
+			printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
+		}
+		if (context->bdb->version >= 192)
+			printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
+		if (context->bdb->version >= 184)
+			printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
+		if (context->bdb->version >= 158)
+			printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
+
+		if (context->bdb->version >= 158) {
+			printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
+			printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
+			printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
+		}
 
 		printf("\t\tAux channel: %s (0x%02x)\n",
 		       aux_ch(child->aux_channel), child->aux_channel);
-- 
2.35.1
