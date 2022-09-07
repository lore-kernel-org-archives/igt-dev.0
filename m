Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FA710E4AF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:46:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:46:48 +0300
Message-Id: <20220907094651.29527-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
References: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tools/intel_vbt_decode: Decode the i2c
 speed
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

Decode the i2c speed, just for kicks.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index ee3b5effee92..7e3bad3583cd 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -918,6 +918,17 @@ static const char *hdmi_frl_rate(u8 frl_rate)
 	}
 }
 
+static const char *i2c_speed(u8 i2c_speed)
+{
+	switch (i2c_speed) {
+	case 0: return "100 kHz";
+	case 1: return "50 kHz";
+	case 2: return "400 kHz";
+	case 3: return "1 MHz";
+	default: return "<unknown>";
+	}
+}
+
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
@@ -934,7 +945,8 @@ static void dump_child_device(struct context *context,
 	if (context->bdb->version < 152) {
 		printf("\t\tSignature: %.*s\n", (int)sizeof(child->device_id), child->device_id);
 	} else {
-		printf("\t\tI2C speed: 0x%02x\n", child->i2c_speed);
+		printf("\t\tI2C speed: %s (0x%02x)\n",
+		       i2c_speed(child->i2c_speed), child->i2c_speed);
 		printf("\t\tDP onboard redriver:\n");
 		printf("\t\t\tpresent: %s\n",
 		       YESNO((child->dp_onboard_redriver_present)));
-- 
2.35.1
