Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4919C10E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:56 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:17 +0300
Message-Id: <20220715202520.23677-12-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/14] tools/intel_vbt_decode: Clean up
 driver features block decoding
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

Print all the stuff from the driver features block, and print
it in the same order as the spec lists it to make it a bit
easier to compare the two.

Also use consistent naming for a bunch of the fields that
exist in both the driver features block and the power conservation
block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 93 ++++++++++++++++++++++++++++++----------
 1 file changed, 70 insertions(+), 23 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 37b195ab8c16..90ae7c667f16 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1367,23 +1367,28 @@ static void dump_driver_feature(struct context *context,
 {
 	const struct bdb_driver_features *feature = block_data(block);
 
-	printf("\tBoot Device Algorithm: %s\n", feature->boot_dev_algorithm ?
-	       "driver default" : "os default");
-	printf("\tBlock display switching when DVD active: %s\n",
-	       YESNO(feature->allow_display_switch_dvd));
-	printf("\tAllow display switching when in Full Screen DOS: %s\n",
-	       YESNO(feature->allow_display_switch_dos));
-	printf("\tHot Plug DVO: %s\n", YESNO(feature->hotplug_dvo));
-	printf("\tDual View Zoom: %s\n", YESNO(feature->dual_view_zoom));
-	printf("\tDriver INT 15h hook: %s\n", YESNO(feature->int15h_hook));
-	printf("\tEnable Sprite in Clone Mode: %s\n",
-	       YESNO(feature->sprite_in_clone));
 	printf("\tUse 00000110h ID for Primary LFP: %s\n",
 	       YESNO(feature->primary_lfp_id));
+	printf("\tEnable Sprite in Clone Mode: %s\n",
+	       YESNO(feature->sprite_in_clone));
+	printf("\tDriver INT 15h hook: %s\n",
+	       YESNO(feature->int15h_hook));
+	printf("\tDual View Zoom: %s\n",
+	       YESNO(feature->dual_view_zoom));
+	printf("\tHot Plug DVO: %s\n",
+	       YESNO(feature->hotplug_dvo));
+	printf("\tAllow display switching when in Full Screen DOS: %s\n",
+	       YESNO(feature->allow_display_switch_dos));
+	printf("\tAllow display switching when DVD active: %s\n",
+	       YESNO(feature->allow_display_switch_dvd));
+	printf("\tBoot Device Algorithm: %s\n",
+	       feature->boot_dev_algorithm ? "driver default" : "os default");
+
 	printf("\tBoot Mode X: %u\n", feature->boot_mode_x);
 	printf("\tBoot Mode Y: %u\n", feature->boot_mode_y);
 	printf("\tBoot Mode Bpp: %u\n", feature->boot_mode_bpp);
 	printf("\tBoot Mode Refresh: %u\n", feature->boot_mode_refresh);
+
 	printf("\tEnable LFP as primary: %s\n",
 	       YESNO(feature->enable_lfp_primary));
 	printf("\tSelective Mode Pruning: %s\n",
@@ -1396,9 +1401,8 @@ static void dump_driver_feature(struct context *context,
 	       YESNO(feature->nt_clone_support));
 	printf("\tDefault Power Scheme user interface: %s\n",
 	       feature->power_scheme_ui ? "3rd party" : "CUI");
-	printf
-	    ("\tSprite Display Assignment when Overlay is Active in Clone Mode: %s\n",
-	     feature->sprite_display_assign ? "primary" : "secondary");
+	printf("\tSprite Display Assignment when Overlay is Active in Clone Mode: %s\n",
+	       feature->sprite_display_assign ? "primary" : "secondary");
 	printf("\tDisplay Maintain Aspect Scaling via CUI: %s\n",
 	       YESNO(feature->cui_aspect_scaling));
 	printf("\tPreserve Aspect Ratio: %s\n",
@@ -1406,16 +1410,59 @@ static void dump_driver_feature(struct context *context,
 	printf("\tEnable SDVO device power down: %s\n",
 	       YESNO(feature->sdvo_device_power_down));
 	printf("\tCRT hotplug: %s\n", YESNO(feature->crt_hotplug));
+
 	printf("\tLVDS config: %s (0x%x)\n",
 	       lvds_config[feature->lvds_config], feature->lvds_config);
+	printf("\tTV hotplug: %s\n",
+	       YESNO(feature->tv_hotplug));
+
+	printf("\tDisplay subsystem enable: %s\n",
+	       YESNO(feature->display_subsystem_enable));
+	printf("\tEmbedded platform: %s\n",
+	       YESNO(feature->embedded_platform));
 	printf("\tDefine Display statically: %s\n",
 	       YESNO(feature->static_display));
+
 	printf("\tLegacy CRT max X: %d\n", feature->legacy_crt_max_x);
 	printf("\tLegacy CRT max Y: %d\n", feature->legacy_crt_max_y);
 	printf("\tLegacy CRT max refresh: %d\n",
 	       feature->legacy_crt_max_refresh);
-	printf("\tEnable DRRS: %s\n", YESNO(feature->drrs_enabled));
-	printf("\tEnable PSR: %s\n", YESNO(feature->psr_enabled));
+
+	printf("\tInternal source termination for HDMI: %s\n",
+	       YESNO(feature->hdmi_termination));
+	printf("\tCEA 861-D HDMI support: %s\n",
+	       YESNO(feature->cea861d_hdmi_support));
+	printf("\tSelf refresh enable: %s\n",
+	       YESNO(feature->self_refresh_enable));
+
+	printf("\tCustom VBT number: 0x%x\n", feature->custom_vbt_version);
+
+	printf("\tPC Features field validity: %s\n",
+	       YESNO(feature->pc_feature_valid));
+	printf("\tDynamic Media Refresh Rate Switching (DMRRS): %s\n",
+	       YESNO(feature->dmrrs_enabled));
+	printf("\tIntermediate Pixel Storage (IPS): %s\n",
+	       YESNO(feature->ips_enabled));
+	printf("\tPanel Self Refresh (PSR): %s\n",
+	       YESNO(feature->psr_enabled));
+	printf("\tTurbo Boost Technology: %s\n",
+	       YESNO(feature->tbt_enabled));
+	printf("\tGraphics Power Management (GPMT): %s\n",
+	       YESNO(feature->gpmt_enabled));
+	printf("\tGraphics Render Standby (RS): %s\n",
+	       YESNO(feature->grs_enabled));
+	printf("\tDynamic Refresh Rate Switching (DRRS): %s\n",
+	       YESNO(feature->drrs_enabled));
+	printf("\tAutomatic Display Brightness (ADB): %s\n",
+	       YESNO(feature->adb_enabled));
+	printf("\tDxgkDDI Backlight Control (DxgkDdiBLC): %s\n",
+	       YESNO(feature->bltclt_enabled));
+	printf("\tDisplay Power Saving Technology (DPST): %s\n",
+	       YESNO(feature->dpst_enabled));
+	printf("\tSmart 2D Display Technology (S2DDT): %s\n",
+	       YESNO(feature->s2ddt_enabled));
+	printf("\tRapid Memory Power Management (RMPM): %s\n",
+	       YESNO(feature->rmpm_enabled));
 }
 
 static void dump_edp(struct context *context,
@@ -1651,19 +1698,19 @@ static void dump_lfp_power(struct context *context,
 
 		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
 
-		printf("\t\tDPST: %s\n",
+		printf("\t\tDisplay Power Saving Technology (DPST): %s\n",
 		       YESNO(panel_bool(lfp_block->dpst, i)));
-		printf("\t\tPSR: %s\n",
+		printf("\t\tPanel Self Refresh (PSR): %s\n",
 		       YESNO(panel_bool(lfp_block->psr, i)));
-		printf("\t\tDRRS: %s\n",
+		printf("\t\tDynamic Refresh Rate Switching (DRRS): %s\n",
 		       YESNO(panel_bool(lfp_block->drrs, i)));
 		printf("\t\tDisplay LACE support: %s\n",
 		       YESNO(panel_bool(lfp_block->lace_support, i)));
-		printf("\t\tADT: %s\n",
+		printf("\t\tAssertive Display Technology (ADT): %s\n",
 		       YESNO(panel_bool(lfp_block->adt, i)));
-		printf("\t\tDMRRS: %s\n",
+		printf("\t\tDynamic Media Refresh Rate Switching (DMRRS): %s\n",
 		       YESNO(panel_bool(lfp_block->dmrrs, i)));
-		printf("\t\tADB: %s\n",
+		printf("\t\tAutomatic Display Brightness (ADB): %s\n",
 		       YESNO(panel_bool(lfp_block->adb, i)));
 		printf("\t\tDefault Display LACE enabled: %s\n",
 		       YESNO(panel_bool(lfp_block->lace_enabled_status, i)));
@@ -1681,7 +1728,7 @@ static void dump_lfp_power(struct context *context,
 		if (context->bdb->version < 233)
 			continue;
 
-		printf("\t\tVRR feature: %s\n",
+		printf("\t\tVariable Refresh Rate (VRR): %s\n",
 		       YESNO(panel_bool(lfp_block->vrr_feature_enabled, i)));
 
 		if (context->bdb->version < 247)
-- 
2.35.1
