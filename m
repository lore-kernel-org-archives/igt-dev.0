Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A18A10E65C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:30:42 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:44 +0300
Message-Id: <20220906122944.8838-18-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 17/17] tools/intel_vbt_decode: Print
 panel_type2
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

Print out the second panel type as well.

I decided to just get rid of the "(override %d)" stuff
as it doesn't really get us anything and doesn't really
make sense anyway when we have two possible panel types
to consider. The command line override may or may not match
either of those.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 8f48d43abe58..767853b64b3d 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1130,11 +1130,9 @@ static void dump_lvds_options(struct context *context,
 {
 	const struct bdb_lvds_options *options = block_data(block);
 
-	if (context->panel_type == options->panel_type)
-		printf("\tPanel type: %d\n", options->panel_type);
-	else
-		printf("\tPanel type: %d (override %d)\n",
-		       options->panel_type, context->panel_type);
+	printf("\tPanel type: %d\n", options->panel_type);
+	if (context->bdb->version >= 212)
+		printf("\tPanel type 2: %d\n", options->panel_type2);
 	printf("\tLVDS EDID available: %s\n", YESNO(options->lvds_edid));
 	printf("\tPixel dither: %s\n", YESNO(options->pixel_dither));
 	printf("\tPFIT auto ratio: %s\n", YESNO(options->pfit_ratio_auto));
-- 
2.35.1
