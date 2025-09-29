Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6971DCAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A210E486;
	Mon, 29 Sep 2025 19:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z96RfKzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF0410E485
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759172849; x=1790708849;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Y3K8pR7H27v9PPC8njdGvAiAVllE245+ZoQ19tSbJus=;
 b=Z96RfKzCzaYx6aA4H/8uWxmjmhdwkN7y9jYko89aH6Kr5jEb+N4sEQLp
 zIEuGGHNFGrrshlbxMWyrUXRanen+bBsAJXSzrk62OBnTElDIt3uhYvzv
 J8O7G6s2wCXCF4X8Kf7e5q+XnR4/MHSu2RwNKRDBbkH/Qj+l/mYo8XWRh
 vpLO9MD5zMonBuECA847TY3NL62DEQr9Ew0G9cuX32S8PFGOUAeqx4UUU
 /rVDgs0C5L1u6I6DpoLjtYeVCTRKBPvr59gCRfUQyNujjpPBicV/0nmXy
 LO8YQ6rMefmVCBMcPD/3XdOB934dKRgkT+eamWWDIaAPb8/9spgyVJ8dW Q==;
X-CSE-ConnectionGUID: nHQ+0Zp4RuO/gmrgC5l0Yw==
X-CSE-MsgGUID: Uf1KzejDReaMMO4b1uFkUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="65058560"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="65058560"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:07:29 -0700
X-CSE-ConnectionGUID: Em4RE4WYQFSw+SI0+XVRUA==
X-CSE-MsgGUID: OL0oMAaaR0+QO+8H8cUlHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178120755"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:07:28 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/6] tools/intel_vbt_decode: Introduce to_str()
Date: Mon, 29 Sep 2025 22:07:16 +0300
Message-ID: <20250929190721.29997-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
References: <20250929190721.29997-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Introduce a to_str() macro that gives us a standard way
to decode a value we got from the VBT into a string.

All the cases converted here were implemented as a custom
function to deal with out of bounds/sparse values. All of
that is now taken care of by to_str(), so the strings can
just be defined as an array.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 137 +++++++++++++++++----------------------
 1 file changed, 60 insertions(+), 77 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a4e76b7559d2..dbcba3b9cd3b 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -631,6 +631,17 @@ static bool panel_bool(unsigned int value, int panel_type)
 	return panel_bits(value, panel_type, 1);
 }
 
+static const char *_to_str(const char * const strings[],
+			   int num_strings, int value)
+{
+	if (value >= num_strings || strings[value] == NULL)
+		return "<unknown>";
+
+	return strings[value];
+}
+
+#define to_str(strings, value) _to_str((strings), ARRAY_SIZE(strings), (value))
+
 static int decode_ssc_freq(struct context *context, bool alternate)
 {
 	switch (intel_gen(context->devid)) {
@@ -705,26 +716,18 @@ static void dump_general_features(struct context *context,
 	printf("\tDP SSC dongle supported: %s\n", YESNO(features->dp_ssc_dongle_supported));
 }
 
-static const char *inverter_type(u8 type)
-{
-	switch (type) {
-	case 0: return "none/external";
-	case 1: return "I2C";
-	case 2: return "PWM";
-	default: return "<reserved>";
-	}
-}
+static const char * const inverter_type_str[] = {
+	[0] = "none/external",
+	[1] = "I2C",
+	[2] = "PWM",
+};
 
-static const char *i2c_speed(u8 i2c_speed)
-{
-	switch (i2c_speed) {
-	case 0: return "100 kHz";
-	case 1: return "50 kHz";
-	case 2: return "400 kHz";
-	case 3: return "1 MHz";
-	default: return "<unknown>";
-	}
-}
+static const char * const i2c_speed_str[] = {
+	[0] = "100 kHz",
+	[1] = "50 kHz",
+	[2] = "400 kHz",
+	[3] = "1 MHz",
+};
 
 static void dump_backlight_info(struct context *context,
 				const struct bdb_block *block)
@@ -751,7 +754,7 @@ static void dump_backlight_info(struct context *context,
 		blc = &backlight->data[i];
 
 		printf("\t\tInverter type: %s (%u)\n",
-		       inverter_type(blc->type), blc->type);
+		       to_str(inverter_type_str, blc->type), blc->type);
 		printf("\t\tActive low: %s\n", YESNO(blc->active_low_pwm));
 		printf("\t\tPWM freq: %u\n", blc->pwm_freq_hz);
 		printf("\t\tMinimum brightness: %u\n", blc->min_brightness);
@@ -759,7 +762,7 @@ static void dump_backlight_info(struct context *context,
 		if (blc->type == 1) {
 			printf("\t\tI2C pin: 0x%02x\n", blc->i2c_pin);
 			printf("\t\tI2C speed: %s (0x%02x)\n",
-			       i2c_speed(blc->i2c_speed), blc->i2c_speed);
+			       to_str(i2c_speed_str, blc->i2c_speed), blc->i2c_speed);
 			printf("\t\tI2C address: 0x%02x\n", blc->i2c_address);
 			printf("\t\tI2C command: 0x%02x\n", blc->i2c_command);
 		}
@@ -1008,19 +1011,11 @@ static const char *aux_ch(uint8_t aux_ch)
 		return "unknown";
 }
 
-static const char *mipi_bridge_type(uint8_t type)
-{
-	switch (type) {
-	case 1:
-		return "ASUS";
-	case 2:
-		return "Toshiba";
-	case 3:
-		return "Renesas";
-	default:
-		return "unknown";
-	}
-}
+static const char * const mipi_bridge_type_str[] = {
+	[1] = "ASUS",
+	[2] = "Toshiba",
+	[3] = "Renesas",
+};
 
 static void dump_hmdi_max_data_rate(uint8_t hdmi_max_data_rate)
 {
@@ -1090,40 +1085,28 @@ static void dump_dp_max_link_rate(uint16_t version, uint8_t dp_max_link_rate)
 		       link_rate / 100.0f, dp_max_link_rate);
 }
 
-static const char *dp_vswing(u8 vswing)
-{
-	switch (vswing) {
-	case 0: return "0.4V";
-	case 1: return "0.6V";
-	case 2: return "0.8V";
-	case 3: return "1.2V";
-	default: return "<unknown>";
-	}
-}
+static const char * const dp_vswing_str[] = {
+	[0] = "0.4V",
+	[1] = "0.6V",
+	[2] = "0.8V",
+	[3] = "1.2V",
+};
 
-static const char *dp_preemph(u8 preemph)
-{
-	switch (preemph) {
-	case 0: return "0dB";
-	case 1: return "3.5dB";
-	case 2: return "6dB";
-	case 3: return "9.5dB";
-	default: return "<unknown>";
-	}
-}
+static const char * const dp_preemph_str[] = {
+	[0] = "0dB",
+	[1] = "3.5dB",
+	[2] = "6dB",
+	[3] = "9.5dB",
+};
 
-static const char *hdmi_frl_rate(u8 frl_rate)
-{
-	switch (frl_rate) {
-	case 0: return "FRL not supported";
-	case 1: return "3 GT/s";
-	case 2: return "6 GT/s";
-	case 3: return "8 GT/s";
-	case 4: return "10 GT/s";
-	case 5: return "12 GT/s";
-	default: return "<unknown>";
-	}
-}
+static const char * const hdmi_frl_rate_str[] = {
+	[0] = "FRL not supported",
+	[1] = "3 GT/s",
+	[2] = "6 GT/s",
+	[3] = "8 GT/s",
+	[4] = "10 GT/s",
+	[5] = "12 GT/s",
+};
 
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
@@ -1142,27 +1125,27 @@ static void dump_child_device(struct context *context,
 		printf("\t\tSignature: %.*s\n", (int)sizeof(child->device_id), child->device_id);
 	} else {
 		printf("\t\tI2C speed: %s (0x%02x)\n",
-		       i2c_speed(child->i2c_speed), child->i2c_speed);
+		       to_str(i2c_speed_str, child->i2c_speed), child->i2c_speed);
 
 		if (context->bdb->version >= 158) {
 			printf("\t\tDP onboard redriver:\n");
 			printf("\t\t\tpresent: %s\n",
 			       YESNO((child->dp_onboard_redriver_present)));
 			printf("\t\t\tvswing: %s (0x%x)\n",
-			       dp_vswing(child->dp_onboard_redriver_vswing),
+			       to_str(dp_vswing_str, child->dp_onboard_redriver_vswing),
 			       child->dp_onboard_redriver_vswing);
 			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-			       dp_preemph(child->dp_onboard_redriver_preemph),
+			       to_str(dp_preemph_str, child->dp_onboard_redriver_preemph),
 			       child->dp_onboard_redriver_preemph);
 
 			printf("\t\tDP ondock redriver:\n");
 			printf("\t\t\tpresent: %s\n",
 			       YESNO((child->dp_ondock_redriver_present)));
 			printf("\t\t\tvswing: %s (0x%x)\n",
-			       dp_vswing(child->dp_ondock_redriver_vswing),
+			       to_str(dp_vswing_str, child->dp_ondock_redriver_vswing),
 			       child->dp_ondock_redriver_vswing);
 			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-			       dp_preemph(child->dp_ondock_redriver_preemph),
+			       to_str(dp_preemph_str, child->dp_ondock_redriver_preemph),
 			       child->dp_ondock_redriver_preemph);
 		}
 
@@ -1196,7 +1179,7 @@ static void dump_child_device(struct context *context,
 			printf("\t\tHDMI Max FRL rate valid: %s\n",
 			       YESNO(child->hdmi_max_frl_rate_valid));
 			printf("\t\tHDMI Max FRL rate: %s (0x%x)\n",
-			       hdmi_frl_rate(child->hdmi_max_frl_rate),
+			       to_str(hdmi_frl_rate_str, child->hdmi_max_frl_rate),
 			       child->hdmi_max_frl_rate);
 		}
 	}
@@ -1255,7 +1238,7 @@ static void dump_child_device(struct context *context,
 		printf("\t\tDVO2 wiring: 0x%02x\n", child->dvo2_wiring);
 	} else {
 		printf("\t\tMIPI bridge type: %02x (%s)\n", child->mipi_bridge_type,
-		       mipi_bridge_type(child->mipi_bridge_type));
+		       to_str(mipi_bridge_type_str, child->mipi_bridge_type));
 	}
 
 	printf("\t\tDevice class extension: 0x%02x\n", child->extended_type);
@@ -2425,10 +2408,10 @@ static void dump_edp(struct context *context,
 		printf("\t\t\tlanes: X%d\n",
 		       edp->fast_link_params[i].lanes + 1);
 		printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-		       dp_preemph(edp->fast_link_params[i].preemphasis),
+		       to_str(dp_preemph_str, edp->fast_link_params[i].preemphasis),
 		       edp->fast_link_params[i].preemphasis);
 		printf("\t\t\tvswing: %s (0x%x)\n",
-		       dp_vswing(edp->fast_link_params[i].vswing),
+		       to_str(dp_vswing_str, edp->fast_link_params[i].vswing),
 		       edp->fast_link_params[i].vswing);
 
 		if (context->bdb->version >= 162)
@@ -2477,10 +2460,10 @@ static void dump_edp(struct context *context,
 
 			printf("\t\tFull link params:\n");
 			printf("\t\t\tpre-emphasis: %s (0x%x)\n",
-			       dp_preemph(edp->full_link_params[i].preemphasis),
+			       to_str(dp_preemph_str, edp->full_link_params[i].preemphasis),
 			       edp->full_link_params[i].preemphasis);
 			printf("\t\t\tvswing: %s (0x%x)\n",
-			       dp_vswing(edp->full_link_params[i].vswing),
+			       to_str(dp_vswing_str, edp->full_link_params[i].vswing),
 			       edp->full_link_params[i].vswing);
 		}
 
-- 
2.49.1

