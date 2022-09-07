Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C863210E4AF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:47:00 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:46:49 +0300
Message-Id: <20220907094651.29527-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
References: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tools/intel_vbt_decode: Resort block 2
 decoding
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

Dump out block 2 contents in the same (big endianish)
order as it's listed in the spec. Also group each bitfield
into its own little block. Makes it a bit easier to cross
check between the two.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 53 +++++++++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 7e3bad3583cd..3bd4d4b70fb3 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -947,6 +947,7 @@ static void dump_child_device(struct context *context,
 	} else {
 		printf("\t\tI2C speed: %s (0x%02x)\n",
 		       i2c_speed(child->i2c_speed), child->i2c_speed);
+
 		printf("\t\tDP onboard redriver:\n");
 		printf("\t\t\tpresent: %s\n",
 		       YESNO((child->dp_onboard_redriver_present)));
@@ -956,6 +957,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
 		       dp_preemph(child->dp_onboard_redriver_preemph),
 		       child->dp_onboard_redriver_preemph);
+
 		printf("\t\tDP ondock redriver:\n");
 		printf("\t\t\tpresent: %s\n",
 		       YESNO((child->dp_ondock_redriver_present)));
@@ -965,13 +967,17 @@ static void dump_child_device(struct context *context,
 		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
 		       dp_preemph(child->dp_ondock_redriver_preemph),
 		       child->dp_ondock_redriver_preemph);
-		printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shifter_value);
+
 		dump_hmdi_max_data_rate(child->hdmi_max_data_rate);
+		printf("\t\tHDMI level shifter value: 0x%02x\n", child->hdmi_level_shifter_value);
+
 		printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
-		printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
-		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
-		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
+
 		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
+		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
+		printf("\t\tCompression enable: %s\n", YESNO(child->compression_enable));
+		printf("\t\tEdidless EFP: %s\n", YESNO(child->edidless_efp));
+
 		printf("\t\tCompression structure index: %d\n", child->compression_structure_index);
 
 		if (context->bdb->version >= 237) {
@@ -999,26 +1005,30 @@ static void dump_child_device(struct context *context,
 		printf("\t\tSlave2 address: 0x%02x\n", child->slave2_addr);
 		printf("\t\tDDC2 pin: 0x%02x\n", child->ddc2_pin);
 	} else {
-		printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
-		printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
-		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
-		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
-		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
-		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
 		if (context->bdb->version >= 244)
 			printf("\t\teDP/DP max lane count: X%d\n", child->dp_max_lane_count + 1);
-		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
-		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
+		printf("\t\tUse VBT vswing/premph table: %s\n", YESNO(child->use_vbt_vswing));
+		printf("\t\tHPD sense invert: %s\n", YESNO(child->hpd_invert));
+		printf("\t\tIboost enable: %s\n", YESNO(child->iboost));
+		printf("\t\tOnboard LSPCON: %s\n", YESNO(child->lspcon));
+		printf("\t\tLane reversal: %s\n", YESNO(child->lane_reversal));
+		printf("\t\tEFP routed through dock: %s\n", YESNO(child->efp_routed));
+
 		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
+		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
+		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
+
 		printf("\t\tAux channel: %s (0x%02x)\n",
 		       aux_ch(child->aux_channel), child->aux_channel);
+
 		printf("\t\tDongle detect: 0x%02x\n", child->dongle_detect);
 	}
 
-	printf("\t\tPipe capabilities: 0x%02x\n", child->pipe_cap);
-	printf("\t\tSDVO stall signal available: %s\n", YESNO(child->sdvo_stall));
-	printf("\t\tHotplug connect status: 0x%02x\n", child->hpd_status);
 	printf("\t\tIntegrated encoder instead of SDVO: %s\n", YESNO(child->integrated_encoder));
+	printf("\t\tHotplug connect status: 0x%02x\n", child->hpd_status);
+	printf("\t\tSDVO stall signal available: %s\n", YESNO(child->sdvo_stall));
+	printf("\t\tPipe capabilities: 0x%02x\n", child->pipe_cap);
+
 	printf("\t\tDVO wiring: 0x%02x\n", child->dvo_wiring);
 
 	if (context->bdb->version < 171) {
@@ -1029,17 +1039,20 @@ static void dump_child_device(struct context *context,
 	}
 
 	printf("\t\tDevice class extension: 0x%02x\n", child->extended_type);
+
 	printf("\t\tDVO function: 0x%02x\n", child->dvo_function);
 
-	if (context->bdb->version >= 195) {
+	if (context->bdb->version >= 195)
 		printf("\t\tDP USB type C support: %s\n", YESNO(child->dp_usb_type_c));
+
+	if (context->bdb->version >= 195) {
 		printf("\t\t2X DP GPIO index: 0x%02x\n", child->dp_gpio_index);
 		printf("\t\t2X DP GPIO pin number: 0x%02x\n", child->dp_gpio_pin_num);
 	}
 
 	if (context->bdb->version >= 196) {
-		printf("\t\tIBoost level for HDMI: 0x%02x\n", child->hdmi_iboost_level);
 		printf("\t\tIBoost level for DP/eDP: 0x%02x\n", child->dp_iboost_level);
+		printf("\t\tIBoost level for HDMI: 0x%02x\n", child->hdmi_iboost_level);
 	}
 
 	if (context->bdb->version >= 216)
@@ -1080,11 +1093,11 @@ static void dump_general_definitions(struct context *context,
 	child_dev_num = (block->size - sizeof(*defs)) / defs->child_dev_size;
 
 	printf("\tCRT DDC GMBUS addr: 0x%02x\n", defs->crt_ddc_gmbus_pin);
-	printf("\tUse Non ACPI DPMS CRT power states: %s\n",
-	       YESNO(defs->dpms_non_acpi));
+	printf("\tUse DPMS on AIM devices: %s\n", YESNO(defs->dpms_aim));
 	printf("\tSkip CRT detect at boot: %s\n",
 	       YESNO(defs->skip_boot_crt_detect));
-	printf("\tUse DPMS on AIM devices: %s\n", YESNO(defs->dpms_aim));
+	printf("\tUse Non ACPI DPMS CRT power states: %s\n",
+	       YESNO(defs->dpms_non_acpi));
 	printf("\tBoot display type: 0x%02x%02x\n", defs->boot_display[1],
 	       defs->boot_display[0]);
 	printf("\tChild device size: %d\n", defs->child_dev_size);
-- 
2.35.1
