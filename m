Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7718C11360F
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:18 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:42 +0300
Message-Id: <20220614233100.13834-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/23] tools/intel_vbt_decode: Decode DP max
 link rate
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

Decode the child device DP max link rate stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 50 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a91273d89355..77de75068e12 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -441,6 +441,51 @@ static void dump_hmdi_max_data_rate(uint8_t hdmi_max_data_rate)
 		       hdmi_max_data_rate);
 }
 
+static int parse_dp_max_link_rate_216(uint8_t dp_max_link_rate)
+{
+	static const uint16_t max_link_rate[] = {
+		[BDB_216_VBT_DP_MAX_LINK_RATE_HBR3] = 810,
+		[BDB_216_VBT_DP_MAX_LINK_RATE_HBR2] = 540,
+		[BDB_216_VBT_DP_MAX_LINK_RATE_HBR] = 270,
+		[BDB_216_VBT_DP_MAX_LINK_RATE_LBR] = 162,
+	};
+
+	return max_link_rate[dp_max_link_rate & 0x3];
+}
+
+static int parse_dp_max_link_rate_230(uint8_t dp_max_link_rate)
+{
+	static const uint16_t max_link_rate[] = {
+		[BDB_230_VBT_DP_MAX_LINK_RATE_DEF] = 0,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_LBR] = 162,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_HBR] = 270,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_HBR2] = 540,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_HBR3] = 810,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_UHBR10] = 1000,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5] = 1350,
+		[BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20] = 2000,
+	};
+
+	return max_link_rate[dp_max_link_rate];
+}
+
+static void dump_dp_max_link_rate(uint16_t version, uint8_t dp_max_link_rate)
+{
+	int link_rate;
+
+	if (version >= 230)
+		link_rate = parse_dp_max_link_rate_230(dp_max_link_rate);
+	else
+		link_rate = parse_dp_max_link_rate_216(dp_max_link_rate);
+
+	if (link_rate == 0)
+		printf("\t\tDP max link rate: <platform max> (0x%02x)\n",
+		       dp_max_link_rate);
+	else
+		printf("\t\tDP max link rate: %g Gbps (0x%02x)\n",
+		       link_rate / 100.0f, dp_max_link_rate);
+}
+
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
@@ -524,8 +569,11 @@ static void dump_child_device(struct context *context,
 		printf("\t\tIBoost level for HDMI: 0x%02x\n", child->hdmi_iboost_level);
 		printf("\t\tIBoost level for DP/eDP: 0x%02x\n", child->dp_iboost_level);
 	}
-}
 
+	if (context->bdb->version >= 216)
+		dump_dp_max_link_rate(context->bdb->version,
+				      child->dp_max_link_rate);
+}
 
 static void dump_child_devices(struct context *context, const uint8_t *devices,
 			       uint8_t child_dev_num, uint8_t child_dev_size)
-- 
2.35.1
