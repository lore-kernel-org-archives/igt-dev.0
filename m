Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8DD10E05A
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 20:25:47 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Jul 2022 23:25:14 +0300
Message-Id: <20220715202520.23677-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
References: <20220715202520.23677-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/14] tools/intel_vbt_decode: Parse HDMI
 FRL rate
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

Parse the max HDMI FRL rate stuff.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b5b60723baa8..e05fed69b242 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -881,6 +881,19 @@ static const char *dp_preemph(u8 preemph)
 	}
 }
 
+static const char *hdmi_frl_rate(u8 frl_rate)
+{
+	switch (frl_rate) {
+	case 0: return "FRL not supported";
+	case 1: return "3 GT/s";
+	case 2: return "6 GT/s";
+	case 3: return "8 GT/s";
+	case 4: return "10 GT/s";
+	case 5: return "12 GT/s";
+	default: return "<unknown>";
+	}
+}
+
 static void dump_child_device(struct context *context,
 			      const struct child_device_config *child)
 {
@@ -924,6 +937,14 @@ static void dump_child_device(struct context *context,
 		printf("\t\tCompression method CPS: %s\n", YESNO(child->compression_method_cps));
 		printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
 		printf("\t\tCompression structure index: 0x%02x)\n", child->compression_structure_index);
+
+		if (context->bdb->version >= 237) {
+			printf("\t\tHDMI Max FRL rate valid: %s\n",
+			       YESNO(child->hdmi_max_frl_rate_valid));
+			printf("\t\tHDMI Max FRL rate: %s (0x%x)\n",
+			       hdmi_frl_rate(child->hdmi_max_frl_rate),
+			       child->hdmi_max_frl_rate);
+		}
 	}
 
 	printf("\t\tAIM offset: %d\n", child->addin_offset);
-- 
2.35.1
