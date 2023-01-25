Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EACC10E718
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:21 +0200
Message-Id: <20230125045522.18169-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/10] tools/intel_watermark: Introduce
 skl_has_nv12_buf_cfg()
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

Replace the hand rolled display_ver>=11 checks with
a more descriptive helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index 7991e80ac876..e598cf122159 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -179,6 +179,11 @@ static bool skl_has_sagv_wm(uint32_t d)
 	return intel_display_ver(d) >= 13;
 }
 
+static bool skl_has_nv12_buf_cfg(uint32_t d)
+{
+	return intel_display_ver(d) < 11;
+}
+
 static int skl_num_wm_levels(uint32_t d)
 {
 	if (skl_has_sagv_wm(d))
@@ -339,7 +344,7 @@ static void skl_wm_dump(void)
 			plane_ctl[pipe][plane] = read_reg(addr + 0x80);
 			wm_trans[pipe][plane] = read_reg(addr + 0x00168);
 			buf_cfg[pipe][plane] = read_reg(addr + 0x0017C);
-			if (!is_cursor(plane) && intel_display_ver(devid) < 11)
+			if (!is_cursor(plane) && skl_has_nv12_buf_cfg(devid))
 				nv12_buf_cfg[pipe][plane] = read_reg(addr + 0x00178);
 			else
 				nv12_buf_cfg[pipe][plane] = 0;
@@ -439,7 +444,7 @@ static void skl_wm_dump(void)
 		}
 		printf("\n");
 
-		if (intel_display_ver(devid) >= 11)
+		if (!skl_has_nv12_buf_cfg(devid))
 			continue;
 
 		if (is_cursor(plane))
@@ -575,7 +580,7 @@ static void skl_wm_dump(void)
 		}
 		printf("\n");
 
-		if (intel_display_ver(devid) < 11) {
+		if (skl_has_nv12_buf_cfg(devid)) {
 			printf("\nNV12 DDB allocation:");
 
 			printf("\nstart");
-- 
2.39.1
