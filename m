Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D333113623
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:55 +0300
Message-Id: <20220614233100.13834-19-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 18/23] tools/intel_vbt_decode: Dump the
 panel PNP ID
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

Decode the panel PNP ID from the LVDS data block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ef00a173d7af..e49831e2529d 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -33,6 +33,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <arpa/inet.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
 #include <sys/types.h>
@@ -880,6 +881,18 @@ static void dump_lvds_ptr_data(struct context *context,
 	printf("\tNumber of entries: %d\n", ptrs->lvds_entries);
 }
 
+static char *decode_pnp_id(u16 mfg_name, char str[4])
+{
+	mfg_name = ntohs(mfg_name);
+
+	str[0] = '@' + ((mfg_name >> 10) & 0x1f);
+	str[1] = '@' + ((mfg_name >> 5) & 0x1f);
+	str[2] = '@' + ((mfg_name >> 0) & 0x1f);
+	str[3] = '\0';
+
+	return str;
+}
+
 static void dump_lvds_data(struct context *context,
 			   const struct bdb_block *block)
 {
@@ -901,6 +914,9 @@ static void dump_lvds_data(struct context *context,
 			block_data(block) + ptrs->ptr[i].fp_timing.offset;
 		const uint8_t *timing_data =
 			block_data(block) + ptrs->ptr[i].dvo_timing.offset;
+		const struct lvds_pnp_id *pnp_id =
+			block_data(block) + ptrs->ptr[i].panel_pnp_id.offset;
+		char mfg[4];
 
 		if (i != context->panel_type && !context->dump_all_panel_types)
 			continue;
@@ -936,6 +952,14 @@ static void dump_lvds_data(struct context *context,
 		       vdisplay, vsyncstart, vsyncend, vtotal, clock,
 		       (hsyncend > htotal || vsyncend > vtotal) ?
 		       "BAD!" : "good");
+
+		printf("\t\tPnP ID:\n");
+		printf("\t\t  Mfg name: %s (0x%x)\n",
+		       decode_pnp_id(pnp_id->mfg_name, mfg), pnp_id->mfg_name);
+		printf("\t\t  Product code: %u\n", pnp_id->product_code);
+		printf("\t\t  Serial: %u\n", pnp_id->serial);
+		printf("\t\t  Mfg week: %d\n", pnp_id->mfg_week);
+		printf("\t\t  Mfg year: %d\n", 1990 + pnp_id->mfg_year);
 	}
 
 	free(ptrs_block);
-- 
2.35.1
