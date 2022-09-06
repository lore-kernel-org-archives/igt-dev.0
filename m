Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E281410E655
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:30:14 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Sep 2022 15:29:36 +0300
Message-Id: <20220906122944.8838-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
References: <20220906122944.8838-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 09/17] tools/intel_vbt_decode: Parse HDMI
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
index 74e6fcd6b833..dc8d0c4fc57a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -882,6 +882,19 @@ static const char *dp_preemph(u8 preemph)
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
@@ -925,6 +938,14 @@ static void dump_child_device(struct context *context,
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
