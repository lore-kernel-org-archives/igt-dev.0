Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499D510E65B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:30:35 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:43 +0300
Message-Id: <20220906122944.8838-17-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 16/17] tools/intel_vbt_decode: Dump all
 panels from MIPI blocks
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

Respect the --all-panels in the MIPI blocks dumping
and dump all six possible panels.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 264 ++++++++++++++++++++++-----------------
 1 file changed, 150 insertions(+), 114 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index d34f017cad73..8f48d43abe58 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1842,94 +1842,121 @@ static void dump_mipi_config(struct context *context,
 			     const struct bdb_block *block)
 {
 	const struct bdb_mipi_config *start = block_data(block);
-	const struct mipi_config *config;
-	const struct mipi_pps_data *pps;
 
-	config = &start->config[context->panel_type];
-	pps = &start->pps[context->panel_type];
+	for (int i = 0; i < ARRAY_SIZE(start->config); i++) {
+		const struct mipi_config *config =
+			&start->config[context->panel_type];
+		const struct mipi_pps_data *pps =
+			&start->pps[context->panel_type];
+		const struct edp_pwm_delays *pwm_delays =
+			&start->pwm_delays[context->panel_type];
 
-	printf("\tGeneral Param\n");
-	printf("\t\t BTA disable: %s\n", config->bta ? "Disabled" : "Enabled");
-	printf("\t\t Panel Rotation: %d degrees\n", config->rotation * 90);
+		if (i != context->panel_type && !context->dump_all_panel_types)
+			continue;
 
-	printf("\t\t Video Mode Color Format: ");
-	if (config->videomode_color_format == 0)
-		printf("Not supported\n");
-	else if (config->videomode_color_format == 1)
-		printf("RGB565\n");
-	else if (config->videomode_color_format == 2)
-		printf("RGB666\n");
-	else if (config->videomode_color_format == 3)
-		printf("RGB666 Loosely Packed\n");
-	else if (config->videomode_color_format == 4)
-		printf("RGB888\n");
-	printf("\t\t PPS GPIO Pins: %s \n", config->pwm_blc ? "Using SOC" : "Using PMIC");
-	printf("\t\t CABC Support: %s\n", config->cabc ? "supported" : "not supported");
-	printf("\t\t Mode: %s\n", config->cmd_mode ? "COMMAND" : "VIDEO");
-	printf("\t\t Video transfer mode: %s (0x%x)\n",
-	       config->vtm == 1 ? "non-burst with sync pulse" :
-	       config->vtm == 2 ? "non-burst with sync events" :
-	       config->vtm == 3 ? "burst" : "<unknown>",
-	       config->vtm);
-	printf("\t\t Dithering: %s\n", config->dithering ? "done in Display Controller" : "done in Panel Controller");
+		printf("\tPanel %d%s\n", i,
+		       context->panel_type == i ? " *" : "");
 
-	printf("\tPort Desc\n");
-	printf("\t\t Pixel overlap: %d\n", config->pixel_overlap);
-	printf("\t\t Lane Count: %d\n", config->lane_cnt + 1);
-	printf("\t\t Dual Link Support: ");
-	if (config->dual_link == 0)
-		printf("not supported\n");
-	else if (config->dual_link == 1)
-		printf("Front Back mode\n");
-	else
-		printf("Pixel Alternative Mode\n");
+		printf("\t\tGeneral Param\n");
+		printf("\t\t\t BTA disable: %s\n", config->bta ? "Disabled" : "Enabled");
+		printf("\t\t\t Panel Rotation: %d degrees\n", config->rotation * 90);
 
-	printf("\tDphy Flags\n");
-	printf("\t\t Clock Stop: %s\n", config->clk_stop ? "ENABLED" : "DISABLED");
-	printf("\t\t EOT disabled: %s\n\n", config->eot_disabled ? "EOT not to be sent" : "EOT to be sent");
+		printf("\t\t\t Video Mode Color Format: ");
+		if (config->videomode_color_format == 0)
+			printf("Not supported\n");
+		else if (config->videomode_color_format == 1)
+			printf("RGB565\n");
+		else if (config->videomode_color_format == 2)
+			printf("RGB666\n");
+		else if (config->videomode_color_format == 3)
+			printf("RGB666 Loosely Packed\n");
+		else if (config->videomode_color_format == 4)
+			printf("RGB888\n");
+		printf("\t\t\t PPS GPIO Pins: %s \n",
+		       config->pwm_blc ? "Using SOC" : "Using PMIC");
+		printf("\t\t\t CABC Support: %s\n",
+		       config->cabc ? "supported" : "not supported");
+		printf("\t\t\t Mode: %s\n",
+		       config->cmd_mode ? "COMMAND" : "VIDEO");
+		printf("\t\t\t Video transfer mode: %s (0x%x)\n",
+		       config->vtm == 1 ? "non-burst with sync pulse" :
+		       config->vtm == 2 ? "non-burst with sync events" :
+		       config->vtm == 3 ? "burst" : "<unknown>",
+		       config->vtm);
+		printf("\t\t\t Dithering: %s\n",
+		       config->dithering ? "done in Display Controller" : "done in Panel Controller");
 
-	printf("\tHSTxTimeOut: 0x%x\n", config->hs_tx_timeout);
-	printf("\tLPRXTimeOut: 0x%x\n", config->lp_rx_timeout);
-	printf("\tTurnAroundTimeOut: 0x%x\n", config->turn_around_timeout);
-	printf("\tDeviceResetTimer: 0x%x\n", config->device_reset_timer);
-	printf("\tMasterinitTimer: 0x%x\n", config->master_init_timer);
-	printf("\tDBIBandwidthTimer: 0x%x\n", config->dbi_bw_timer);
-	printf("\tLpByteClkValue: 0x%x\n\n", config->lp_byte_clk_val);
+		printf("\t\tPort Desc\n");
+		printf("\t\t\t Pixel overlap: %d\n", config->pixel_overlap);
+		printf("\t\t\t Lane Count: %d\n", config->lane_cnt + 1);
+		printf("\t\t\t Dual Link Support: ");
+		if (config->dual_link == 0)
+			printf("not supported\n");
+		else if (config->dual_link == 1)
+			printf("Front Back mode\n");
+		else
+			printf("Pixel Alternative Mode\n");
 
-	printf("\tDphy Params\n");
-	printf("\t\tExit to zero Count: 0x%x\n", config->exit_zero_cnt);
-	printf("\t\tTrail Count: 0x%X\n", config->trail_cnt);
-	printf("\t\tClk zero count: 0x%x\n", config->clk_zero_cnt);
-	printf("\t\tPrepare count:0x%x\n\n", config->prepare_cnt);
+		printf("\t\tDphy Flags\n");
+		printf("\t\t\t Clock Stop: %s\n",
+		       config->clk_stop ? "ENABLED" : "DISABLED");
+		printf("\t\t\t EOT disabled: %s\n\n",
+		       config->eot_disabled ? "EOT not to be sent" : "EOT to be sent");
 
-	printf("\tClockLaneSwitchingCount: 0x%x\n", config->clk_lane_switch_cnt);
-	printf("\tHighToLowSwitchingCount: 0x%x\n\n", config->hl_switch_cnt);
+		printf("\t\tHSTxTimeOut: 0x%x\n", config->hs_tx_timeout);
+		printf("\t\tLPRXTimeOut: 0x%x\n", config->lp_rx_timeout);
+		printf("\t\tTurnAroundTimeOut: 0x%x\n", config->turn_around_timeout);
+		printf("\t\tDeviceResetTimer: 0x%x\n", config->device_reset_timer);
+		printf("\t\tMasterinitTimer: 0x%x\n", config->master_init_timer);
+		printf("\t\tDBIBandwidthTimer: 0x%x\n", config->dbi_bw_timer);
+		printf("\t\tLpByteClkValue: 0x%x\n\n", config->lp_byte_clk_val);
 
-	printf("\tTimings based on Dphy spec\n");
-	printf("\t\tTClkMiss: 0x%x\n", config->tclk_miss);
-	printf("\t\tTClkPost: 0x%x\n", config->tclk_post);
-	printf("\t\tTClkPre: 0x%x\n", config->tclk_pre);
-	printf("\t\tTClkPrepare: 0x%x\n", config->tclk_prepare);
-	printf("\t\tTClkSettle: 0x%x\n", config->tclk_settle);
-	printf("\t\tTClkTermEnable: 0x%x\n\n", config->tclk_term_enable);
+		printf("\t\tDphy Params\n");
+		printf("\t\t\tExit to zero Count: 0x%x\n", config->exit_zero_cnt);
+		printf("\t\t\tTrail Count: 0x%X\n", config->trail_cnt);
+		printf("\t\t\tClk zero count: 0x%x\n", config->clk_zero_cnt);
+		printf("\t\t\tPrepare count:0x%x\n\n", config->prepare_cnt);
 
-	printf("\tTClkTrail: 0x%x\n", config->tclk_trail);
-	printf("\tTClkPrepareTClkZero: 0x%x\n", config->tclk_prepare_clkzero);
-	printf("\tTHSExit: 0x%x\n", config->ths_exit);
-	printf("\tTHsPrepare: 0x%x\n", config->ths_prepare);
-	printf("\tTHsPrepareTHsZero: 0x%x\n", config->ths_prepare_hszero);
-	printf("\tTHSSettle: 0x%x\n", config->ths_settle);
-	printf("\tTHSSkip: 0x%x\n", config->ths_skip);
-	printf("\tTHsTrail: 0x%x\n", config->ths_trail);
-	printf("\tTInit: 0x%x\n", config->tinit);
-	printf("\tTLPX: 0x%x\n", config->tlpx);
+		printf("\t\tClockLaneSwitchingCount: 0x%x\n", config->clk_lane_switch_cnt);
+		printf("\t\tHighToLowSwitchingCount: 0x%x\n\n", config->hl_switch_cnt);
 
-	printf("\tMIPI PPS\n");
-	printf("\t\tPanel power ON delay: %d\n", pps->panel_on_delay);
-	printf("\t\tPanel power on to Backlight enable delay: %d\n", pps->bl_enable_delay);
-	printf("\t\tBacklight disable to Panel power OFF delay: %d\n", pps->bl_disable_delay);
-	printf("\t\tPanel power OFF delay: %d\n", pps->panel_off_delay);
-	printf("\t\tPanel power cycle delay: %d\n", pps->panel_power_cycle_delay);
+		printf("\t\tTimings based on Dphy spec\n");
+		printf("\t\t\tTClkMiss: 0x%x\n", config->tclk_miss);
+		printf("\t\t\tTClkPost: 0x%x\n", config->tclk_post);
+		printf("\t\t\tTClkPre: 0x%x\n", config->tclk_pre);
+		printf("\t\t\tTClkPrepare: 0x%x\n", config->tclk_prepare);
+		printf("\t\t\tTClkSettle: 0x%x\n", config->tclk_settle);
+		printf("\t\t\tTClkTermEnable: 0x%x\n\n", config->tclk_term_enable);
+
+		printf("\t\tTClkTrail: 0x%x\n", config->tclk_trail);
+		printf("\t\tTClkPrepareTClkZero: 0x%x\n", config->tclk_prepare_clkzero);
+		printf("\t\tTHSExit: 0x%x\n", config->ths_exit);
+		printf("\t\tTHsPrepare: 0x%x\n", config->ths_prepare);
+		printf("\t\tTHsPrepareTHsZero: 0x%x\n", config->ths_prepare_hszero);
+		printf("\t\tTHSSettle: 0x%x\n", config->ths_settle);
+		printf("\t\tTHSSkip: 0x%x\n", config->ths_skip);
+		printf("\t\tTHsTrail: 0x%x\n", config->ths_trail);
+		printf("\t\tTInit: 0x%x\n", config->tinit);
+		printf("\t\tTLPX: 0x%x\n", config->tlpx);
+
+		printf("\t\tMIPI PPS\n");
+		printf("\t\t\tPanel power ON delay: %d\n", pps->panel_on_delay);
+		printf("\t\t\tPanel power on to Backlight enable delay: %d\n", pps->bl_enable_delay);
+		printf("\t\t\tBacklight disable to Panel power OFF delay: %d\n", pps->bl_disable_delay);
+		printf("\t\t\tPanel power OFF delay: %d\n", pps->panel_off_delay);
+		printf("\t\t\tPanel power cycle delay: %d\n", pps->panel_power_cycle_delay);
+
+		if (context->bdb->version >= 186)
+			printf("\t\tMIPI PWM delays:\n"
+			       "\t\t\tPWM on to backlight enable: %d\n"
+			       "\t\t\tBacklight disable to PWM off: %d\n",
+			       pwm_delays->pwm_on_to_backlight_enable,
+			       pwm_delays->backlight_disable_to_pwm_off);
+
+		if (context->bdb->version >= 190)
+			printf("\t\tMIPI PMIC I2C Bus Number: %d\n",
+			       start->pmic_i2c_bus_number[i]);
+	}
 }
 
 static const uint8_t *mipi_dump_send_packet(const uint8_t *data, uint8_t seq_version)
@@ -1942,7 +1969,7 @@ static const uint8_t *mipi_dump_send_packet(const uint8_t *data, uint8_t seq_ver
 	len = *((const uint16_t *) data);
 	data += 2;
 
-	printf("\t\tSend DCS: Port %s, VC %d, %s, Type %02x, Length %u, Data",
+	printf("\t\t\tSend DCS: Port %s, VC %d, %s, Type %02x, Length %u, Data",
 	       (flags >> 3) & 1 ? "C" : "A",
 	       (flags >> 1) & 3,
 	       flags & 1 ? "HS" : "LP",
@@ -1957,7 +1984,7 @@ static const uint8_t *mipi_dump_send_packet(const uint8_t *data, uint8_t seq_ver
 
 static const uint8_t *mipi_dump_delay(const uint8_t *data, uint8_t seq_version)
 {
-	printf("\t\tDelay: %u us\n", *((const uint32_t *)data));
+	printf("\t\t\tDelay: %u us\n", *((const uint32_t *)data));
 
 	return data + 4;
 }
@@ -1971,13 +1998,13 @@ static const uint8_t *mipi_dump_gpio(const uint8_t *data, uint8_t seq_version)
 		number = *data++;
 		flags = *data++;
 
-		printf("\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
+		printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
 		       index, number, flags & 1, flags);
 	} else {
 		index = *data++;
 		flags = *data++;
 
-		printf("\t\tGPIO index %u, source %d, set %d (0x%02x)\n",
+		printf("\t\t\tGPIO index %u, source %d, set %d (0x%02x)\n",
 		       index, (flags >> 1) & 3, flags & 1, flags);
 	}
 
@@ -1997,7 +2024,7 @@ static const uint8_t *mipi_dump_i2c(const uint8_t *data, uint8_t seq_version)
 	offset = *data++;
 	len = *data++;
 
-	printf("\t\tSend I2C: Flags %02x, Index %02x, Bus %02x, Address %04x, Offset %02x, Length %u, Data",
+	printf("\t\t\tSend I2C: Flags %02x, Index %02x, Bus %02x, Address %04x, Offset %02x, Length %u, Data",
 	       flags, index, bus, address, offset, len);
 	for (i = 0; i < len; i++)
 		printf(" %02x", *data++);
@@ -2041,7 +2068,7 @@ static const uint8_t *dump_sequence(const uint8_t *data, uint8_t seq_version)
 {
 	fn_mipi_elem_dump mipi_elem_dump;
 
-	printf("\tSequence %u - %s\n", *data, sequence_name(*data));
+	printf("\t\tSequence %u - %s\n", *data, sequence_name(*data));
 
 	/* Skip Sequence Byte. */
 	data++;
@@ -2247,10 +2274,6 @@ static void dump_mipi_sequence(struct context *context,
 			       const struct bdb_block *block)
 {
 	const struct bdb_mipi_sequence *sequence = block_data(block);
-	const uint8_t *data;
-	uint32_t seq_size;
-	int index = 0, i;
-	const uint8_t *sequence_ptrs[MIPI_SEQ_MAX] = {};
 
 	/* Check if we have sequence block as well */
 	if (!sequence) {
@@ -2267,38 +2290,51 @@ static void dump_mipi_sequence(struct context *context,
 		return;
 	}
 
-	data = find_panel_sequence_block(sequence, context->panel_type,
-					 block->size, &seq_size);
-	if (!data)
-		return;
-
-	/* Parse the sequences. Corresponds to VBT parsing in the kernel. */
-	for (;;) {
-		uint8_t seq_id = *(data + index);
-		if (seq_id == MIPI_SEQ_END)
-			break;
-
-		if (seq_id >= MIPI_SEQ_MAX) {
-			fprintf(stderr, "Unknown sequence %u\n", seq_id);
-			return;
-		}
+	for (int i = 0; i < MAX_MIPI_CONFIGURATIONS; i++) {
+		const uint8_t *sequence_ptrs[MIPI_SEQ_MAX] = {};
+		const uint8_t *data;
+		uint32_t seq_size;
+		int index = 0;
 
-		sequence_ptrs[seq_id] = data + index;
+		if (i != context->panel_type && !context->dump_all_panel_types)
+			continue;
 
-		if (sequence->version >= 3)
-			index = goto_next_sequence_v3(data, index, seq_size);
-		else
-			index = goto_next_sequence(data, index, seq_size);
-		if (!index) {
-			fprintf(stderr, "Invalid sequence %u\n", seq_id);
+		data = find_panel_sequence_block(sequence, i,
+						 block->size, &seq_size);
+		if (!data)
 			return;
+
+		printf("\tPanel %d%s\n", i,
+		       context->panel_type == i ? " *" : "");
+
+		/* Parse the sequences. Corresponds to VBT parsing in the kernel. */
+		for (;;) {
+			uint8_t seq_id = *(data + index);
+			if (seq_id == MIPI_SEQ_END)
+				break;
+
+			if (seq_id >= MIPI_SEQ_MAX) {
+				fprintf(stderr, "Unknown sequence %u\n", seq_id);
+				return;
+			}
+
+			sequence_ptrs[seq_id] = data + index;
+
+			if (sequence->version >= 3)
+				index = goto_next_sequence_v3(data, index, seq_size);
+			else
+				index = goto_next_sequence(data, index, seq_size);
+			if (!index) {
+				fprintf(stderr, "Invalid sequence %u\n", seq_id);
+				return;
+			}
 		}
+
+		/* Dump the sequences. Corresponds to sequence execution in kernel. */
+		for (int j = 0; j < ARRAY_SIZE(sequence_ptrs); j++)
+			if (sequence_ptrs[j])
+				dump_sequence(sequence_ptrs[j], sequence->version);
 	}
-
-	/* Dump the sequences. Corresponds to sequence execution in kernel. */
-	for (i = 0; i < ARRAY_SIZE(sequence_ptrs); i++)
-		if (sequence_ptrs[i])
-			dump_sequence(sequence_ptrs[i], sequence->version);
 }
 
 #define KB(x) ((x) * 1024)
-- 
2.35.1
