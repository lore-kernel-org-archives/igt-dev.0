Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9131410E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:44 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:13 +0300
Message-Id: <20220715202520.23677-8-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 07/14] tools/intel_vbt_decode: Extract
 panel_fitting[]
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

Extract the panel_fitting string representation into an array.
Less clutter in the code this way.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index cffc385306f2..b5b60723baa8 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -530,26 +530,20 @@ static int decode_ssc_freq(struct context *context, bool alternate)
 	}
 }
 
+static const char * const panel_fitting[] = {
+	[0] = "disabled",
+	[1] = "text only",
+	[2] = "graphics only",
+	[3] = "text & graphics",
+};
+
 static void dump_general_features(struct context *context,
 				  const struct bdb_block *block)
 {
 	const struct bdb_general_features *features = block_data(block);
 
-	printf("\tPanel fitting: ");
-	switch (features->panel_fitting) {
-	case 0:
-		printf("disabled\n");
-		break;
-	case 1:
-		printf("text only\n");
-		break;
-	case 2:
-		printf("graphics only\n");
-		break;
-	case 3:
-		printf("text & graphics\n");
-		break;
-	}
+	printf("\tPanel fitting: %s (0x%x)\n",
+	       panel_fitting[features->panel_fitting], features->panel_fitting);
 	printf("\tFlexaim: %s\n", YESNO(features->flexaim));
 	printf("\tMessage: %s\n", YESNO(features->msg_enable));
 	printf("\tClear screen: %d\n", features->clear_screen);
-- 
2.35.1
