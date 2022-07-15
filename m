Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E28410E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:59 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:18 +0300
Message-Id: <20220715202520.23677-13-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/14] tools/intel_vbt_decode: Decode AUX CH
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

Decode the AUX CH to a human readable name.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 90ae7c667f16..10db394b3748 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -777,6 +777,29 @@ static const char *dvo_port(uint8_t type)
 		return "unknown";
 }
 
+static const char *aux_ch_names[] = {
+	[0] = "none",
+	[DP_AUX_A >> 4] = "AUX-A",
+	[DP_AUX_B >> 4] = "AUX-B",
+	[DP_AUX_C >> 4] = "AUX-C",
+	[DP_AUX_D >> 4] = "AUX-D",
+	[DP_AUX_E >> 4] = "AUX-E",
+	[DP_AUX_F >> 4] = "AUX-F",
+	[DP_AUX_G >> 4] = "AUX-G",
+	[DP_AUX_H >> 4] = "AUX-H",
+	[DP_AUX_I >> 4] = "AUX-I",
+};
+
+static const char *aux_ch(uint8_t aux_ch)
+{
+	aux_ch >>= 4;
+
+	if (aux_ch < ARRAY_SIZE(aux_ch_names) && aux_ch_names[aux_ch])
+		return aux_ch_names[aux_ch];
+	else
+		return "unknown";
+}
+
 static const char *mipi_bridge_type(uint8_t type)
 {
 	switch (type) {
@@ -973,7 +996,8 @@ static void dump_child_device(struct context *context,
 		printf("\t\tHDMI compatible? %s\n", YESNO(child->hdmi_support));
 		printf("\t\tDP compatible? %s\n", YESNO(child->dp_support));
 		printf("\t\tTMDS compatible? %s\n", YESNO(child->tmds_support));
-		printf("\t\tAux channel: 0x%02x\n", child->aux_channel);
+		printf("\t\tAux channel: %s (0x%02x)\n",
+		       aux_ch(child->aux_channel), child->aux_channel);
 		printf("\t\tDongle detect: 0x%02x\n", child->dongle_detect);
 	}
 
-- 
2.35.1
