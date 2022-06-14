Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077C91135FA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:15 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:41 +0300
Message-Id: <20220614233100.13834-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 04/23] tools/intel_vbt_decode: Clean up SSC
 freq decoding
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

Use the same logic as we use in the kernel to decode
the SSC frequency.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 46 +++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index c626f0e94659..a91273d89355 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -138,6 +138,19 @@ static struct bdb_block *find_section(struct context *context, int section_id)
 	return NULL;
 }
 
+static int decode_ssc_freq(struct context *context, bool alternate)
+{
+	switch (intel_gen(context->devid)) {
+	case 2:
+		return alternate ? 66 : 48;
+	case 3:
+	case 4:
+		return alternate ? 100 : 96;
+	default:
+		return alternate ? 100 : 120;
+	}
+}
+
 static void dump_general_features(struct context *context,
 				  const struct bdb_block *block)
 {
@@ -164,21 +177,10 @@ static void dump_general_features(struct context *context,
 	printf("\tDVO color flip required: %s\n", YESNO(features->color_flip));
 
 	printf("\tExternal VBT: %s\n", YESNO(features->download_ext_vbt));
-	printf("\tEnable SSC: %s\n", YESNO(features->enable_ssc));
-	if (features->enable_ssc) {
-		if (!context->devid)
-			printf("\tSSC frequency: <unknown platform>\n");
-		else if (IS_VALLEYVIEW(context->devid) ||
-			 IS_CHERRYVIEW(context->devid) ||
-			 IS_BROXTON(context->devid))
-			printf("\tSSC frequency: 100 MHz\n");
-		else if (HAS_PCH_SPLIT(context->devid))
-			printf("\tSSC frequency: %s\n", features->ssc_freq ?
-			       "100 MHz" : "120 MHz");
-		else
-			printf("\tSSC frequency: %s\n", features->ssc_freq ?
-			       "100 MHz (66 MHz on 855)" : "96 MHz (48 MHz on 855)");
-	}
+	printf("\tLVDS SSC Enable: %s\n", YESNO(features->enable_ssc));
+	printf("\tLVDS SSC frequency: %d MHz (0x%x)\n",
+	       decode_ssc_freq(context, features->ssc_freq),
+	       features->ssc_freq);
 	printf("\tLFP on override: %s\n",
 	       YESNO(features->enable_lfp_on_override));
 	printf("\tDisable SSC on clone: %s\n",
@@ -210,17 +212,9 @@ static void dump_general_features(struct context *context,
 	printf("\tIntegrated TV: %s\n", YESNO(features->int_tv_support));
 	printf("\tIntegrated EFP: %s\n", YESNO(features->int_efp_support));
 	printf("\tDP SSC enable: %s\n", YESNO(features->dp_ssc_enable));
-	if (features->dp_ssc_enable) {
-		if (IS_VALLEYVIEW(context->devid) || IS_CHERRYVIEW(context->devid) ||
-		    IS_BROXTON(context->devid))
-			printf("\tSSC frequency: 100 MHz\n");
-		else if (HAS_PCH_SPLIT(context->devid))
-			printf("\tSSC frequency: %s\n", features->dp_ssc_freq ?
-			       "100 MHz" : "120 MHz");
-		else
-			printf("\tSSC frequency: %s\n", features->dp_ssc_freq ?
-			       "100 MHz" : "96 MHz");
-	}
+	printf("\tDP SSC frequency: %d MHz (0x%x)\n",
+	       decode_ssc_freq(context, features->dp_ssc_freq),
+	       features->dp_ssc_freq);
 	printf("\tDP SSC dongle supported: %s\n", YESNO(features->dp_ssc_dongle_supported));
 }
 
-- 
2.35.1
