Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E730D11360A
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:32 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:46 +0300
Message-Id: <20220614233100.13834-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/23] tools/intel_vbt_decode: Dump the LVDS
 panel options
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

Decode per-panel stuff from the LVDS options block.

Not at all sure which version have which fields since the spec
only goes back to v155. But earlier VBTs do have some of this
stuff already so going by block size instead for the older
stuff.

Here's a quick list from my VBT stash:
mgm version 108 -> 4 bytes
alv version 120 -> 4 bytes
cst version 134 -> 14 bytes
pnv version 144 -> 14 bytes
cl  version 142 -> 16 bytes
ctg version 155 -> 24 bytes

The pnv VBT is particularly interesting since it has a higher version
number that the cl VBT and yet has a smaller LVDS options block.
I guess the "Atom==let's not follow any rules" rule started already
back then.

All the more modern VBTs I have are 24 bytes (or more).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 95 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 37f627561a1f..48b56808d9fa 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -637,6 +637,34 @@ static void dump_legacy_child_devices(struct context *context,
 			   child_dev_num, defs->child_dev_size);
 }
 
+static const char * const channel_type[] = {
+	[0] = "automatic",
+	[1] = "single",
+	[2] = "dual",
+	[3] = "reserved",
+};
+
+static const char * const dps_type[] = {
+	[0] = "static DRRS",
+	[1] = "D2PO",
+	[2] = "seamless DRRS",
+	[3] = "reserved",
+};
+
+static const char * const blt_type[] = {
+	[0] = "default",
+	[1] = "CCFL",
+	[2] = "LED",
+	[3] = "reserved",
+};
+
+static const char * const pos_type[] = {
+	[0] = "inside shell",
+	[1] = "outside shell",
+	[2] = "reserved",
+	[3] = "reserved",
+};
+
 static void dump_lvds_options(struct context *context,
 			      const struct bdb_block *block)
 {
@@ -655,6 +683,73 @@ static void dump_lvds_options(struct context *context,
 	printf("\tPFIT enhanced text mode: %s\n",
 	       YESNO(options->pfit_text_mode_enhanced));
 	printf("\tPFIT mode: %d\n", options->pfit_mode);
+
+	if (block->size < 14)
+		return;
+
+	for (int i = 0; i < 16; i++) {
+		unsigned int val;
+
+		if (i != context->panel_type && !context->dump_all_panel_types)
+			continue;
+
+		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+
+		val = (options->lvds_panel_channel_bits >> (i * 2)) & 3;
+		printf("\t\tChannel type: %s (0x%x)\n",
+		       channel_type[val], val);
+
+		val = (options->ssc_bits >> i) & 1;
+		printf("\t\tSSC: %s (0x%x)\n",
+		       YESNO(val), val);
+
+		val = (options->ssc_freq >> i) & 1;
+		printf("\t\tSSC frequency: %d MHz (0x%x)\n",
+		       decode_ssc_freq(context, val), val);
+
+		val = (options->ssc_ddt >> i) & 1;
+		printf("\t\tDisable SSC in dual display twin: %s (0x%x)\n",
+		       YESNO(val), val);
+
+		if (block->size < 16)
+			continue;
+
+		val = (options->panel_color_depth >> i) & 1;
+		printf("\t\tPanel color depth: %d (0x%x)\n",
+		       val ? 24 : 18, val);
+
+		if (block->size < 24)
+			continue;
+
+		val = (options->dps_panel_type_bits >> (i * 2)) & 3;
+		printf("\t\tDPS type: %s (0x%x)\n",
+		       dps_type[val], val);
+
+		val = (options->blt_control_type_bits >> (i * 2)) & 3;
+		printf("\t\tBacklight type: %s (0x%x)\n",
+		       blt_type[val], val);
+
+		if (context->bdb->version < 200)
+			continue;
+
+		val = (options->lcdvcc_s0_enable >> i) & 1;
+		printf("\t\tLCDVCC on during S0 state: %s (0x%x)\n",
+		       YESNO(val), val);
+
+		if (context->bdb->version < 228)
+			continue;
+
+		val = ((options->rotation) >> (i * 2)) & 3;
+		printf("\t\tPanel rotation: %d degrees (0x%x)\n",
+		       val * 90, val);
+
+		if (context->bdb->version < 240)
+			continue;
+
+		val = ((options->position) >> (i * 2)) & 3;
+		printf("\t\tPanel position: %s (0x%x)\n",
+		       pos_type[val], val);
+	}
 }
 
 static void dump_lvds_ptr_data(struct context *context,
-- 
2.35.1
