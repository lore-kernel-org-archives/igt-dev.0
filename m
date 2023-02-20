Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A28610E28E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Feb 2023 16:49:31 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Feb 2023 18:49:27 +0200
Message-Id: <20230220164927.27283-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: Dump mode backlight
 data
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

Dump the new stuff from the backlight block:
- brightness_level
- brightness_min_level
- brightness_precision_bits
- hdr_dpcd_refresh_timeout

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 8f707c1f822a..7caa71dac793 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -626,6 +626,21 @@ static void dump_backlight_info(struct context *context,
 
 		printf("\t\tControl type: %u\n", control->type);
 		printf("\t\tController: %u\n", control->controller);
+
+		if (context->bdb->version >= 234) {
+			printf("\t\tBrightness level: %u\n",
+			       backlight->brightness_level[i].level);
+			printf("\t\tBrightness min level: %u\n",
+			       backlight->brightness_min_level[i].level);
+		}
+
+		if (context->bdb->version >= 236)
+			printf("\t\tBrigthness precision bits: %u\n",
+			       backlight->brightness_precision_bits[i]);
+
+		if (context->bdb->version >= 239)
+			printf("\t\tHDR DPCD refresh timeout: %.2f ms\n",
+			       backlight->hdr_dpcd_refresh_timeout[i] / 100.0);
 	}
 }
 
-- 
2.39.2
