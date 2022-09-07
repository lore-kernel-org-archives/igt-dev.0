Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E00A10E4CA
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Sep 2022 09:47:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  7 Sep 2022 12:46:51 +0300
Message-Id: <20220907094651.29527-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
References: <20220907094651.29527-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] tools/intel_vbt_decode: Decode more
 child dev fields
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

Decode a bunch of newish child dev fields:
- disable_compression_for_ext_disp
- lttpr_non_transparent
- dp_port_trace_length
- tbt

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 0af7902c5102..a63bfdda142a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -978,6 +978,12 @@ static void dump_child_device(struct context *context,
 		if (context->bdb->version >= 161)
 			printf("\t\tOffset to DTD buffer for edidless CHILD: 0x%02x\n", child->dtd_buf_ptr);
 
+		if (context->bdb->version >= 251)
+			printf("\t\tDisable compression for external DP/HDMI: %s\n",
+			       YESNO(child->disable_compression_for_ext_disp));
+		if (context->bdb->version >= 235)
+			printf("\t\tLTTPR Mode: %stransparent\n",
+			       child->lttpr_non_transparent ? "non-" : "");
 		if (context->bdb->version >= 202)
 			printf("\t\tDual pipe ganged eDP: %s\n", YESNO(child->ganged_edp));
 		if (context->bdb->version >= 198) {
@@ -1060,6 +1066,10 @@ static void dump_child_device(struct context *context,
 
 	printf("\t\tDVO function: 0x%02x\n", child->dvo_function);
 
+	if (context->bdb->version >= 209) {
+		printf("\t\tDP port trace length: 0x%x\n", child->dp_port_trace_length);
+		printf("\t\tThunderbolt port: %s\n", YESNO(child->tbt));
+	}
 	if (context->bdb->version >= 195)
 		printf("\t\tDP USB type C support: %s\n", YESNO(child->dp_usb_type_c));
 
-- 
2.35.1
