Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EDC113605
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jun 2022 23:31:21 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 02:30:43 +0300
Message-Id: <20220614233100.13834-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
References: <20220614233100.13834-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/23] tools/intel_vbt_decode: Unify panel
 type handling
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

Print the panel type(s) the same way in dump_lvds_data() as
elsewhere.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 77de75068e12..e16e12d0423c 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -702,16 +702,10 @@ static void dump_lvds_data(struct context *context,
 		const uint8_t *timing_data = lfp_data_ptr + dvo_offset;
 		const struct lvds_lfp_data_entry *lfp_data =
 		    (const struct lvds_lfp_data_entry *)lfp_data_ptr;
-		char marker;
 
 		if (i != context->panel_type && !context->dump_all_panel_types)
 			continue;
 
-		if (i == context->panel_type)
-			marker = '*';
-		else
-			marker = ' ';
-
 		hdisplay = _H_ACTIVE(timing_data);
 		hsyncstart = hdisplay + _H_SYNC_OFF(timing_data);
 		hsyncend = hsyncstart + _H_SYNC_WIDTH(timing_data);
@@ -723,8 +717,9 @@ static void dump_lvds_data(struct context *context,
 		vtotal = vdisplay + _V_BLANK(timing_data);
 		clock = _PIXEL_CLOCK(timing_data) / 1000;
 
-		printf("%c\tpanel type %02i: %dx%d clock %d\n", marker,
-		       i, lfp_data->fp_timing.x_res, lfp_data->fp_timing.y_res,
+		printf("\tPanel %d%s\n", i, context->panel_type == i ? " *" : "");
+		printf("\t\t%dx%d clock %d\n",
+		       lfp_data->fp_timing.x_res, lfp_data->fp_timing.y_res,
 		       _PIXEL_CLOCK(timing_data));
 		printf("\t\tinfo:\n");
 		printf("\t\t  LVDS: 0x%08lx\n",
-- 
2.35.1
