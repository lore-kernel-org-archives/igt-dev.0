Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB86610E716
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 04:55:36 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jan 2023 06:55:17 +0200
Message-Id: <20230125045522.18169-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
References: <20230125045522.18169-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/10] tools/intel_watermark: Extract
 is_cursor()
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

Make the code a bit less magical by pulling the
"is this plane cursor?" check into helper.

v2: One more

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_watermark.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/tools/intel_watermark.c b/tools/intel_watermark.c
index eac40e4a5d17..19372db4506b 100644
--- a/tools/intel_watermark.c
+++ b/tools/intel_watermark.c
@@ -131,6 +131,11 @@ static char endis_ast(bool enabled)
 	return enabled ? '*' : ' ';
 }
 
+static bool is_cursor(int plane)
+{
+	return plane == 0;
+}
+
 static int skl_num_pipes(uint32_t d)
 {
 	return intel_gen(d) >= 12 ? 4 : 3;
@@ -183,7 +188,7 @@ static const char *skl_plane_name(int plane)
 {
 	static char name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(name, sizeof(name), "CURSOR");
 	else
 		snprintf(name, sizeof(name), "PLANE_%1d", plane);
@@ -204,7 +209,7 @@ static const char *skl_plane_ctl_reg_name(int plane)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_CTL");
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_CTL_%1d", plane);
@@ -216,7 +221,7 @@ static const char *skl_wm_reg_name(int plane, int level)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_WM_%1d", level);
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_%1d_%1d", plane, level);
@@ -228,7 +233,7 @@ static const char *skl_wm_trans_reg_name(int plane)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_WM_TRANS");
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_TRANS_%1d", plane);
@@ -240,7 +245,7 @@ static const char *skl_wm_sagv_reg_name(int plane)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_WM_SAGV");
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_SAGV_%1d", plane);
@@ -252,7 +257,7 @@ static const char *skl_wm_sagv_trans_reg_name(int plane)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_WM_SAGV_TRANS");
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_WM_SAGV_TRANS_%1d", plane);
@@ -264,7 +269,7 @@ static const char *skl_buf_cfg_reg_name(int plane)
 {
 	static char reg_name[32];
 
-	if (plane == 0)
+	if (is_cursor(plane))
 		snprintf(reg_name, sizeof(reg_name), "CUR_BUF_CFG");
 	else
 		snprintf(reg_name, sizeof(reg_name), "PLANE_BUF_CFG_%1d", plane);
@@ -328,7 +333,7 @@ static void skl_wm_dump(void)
 			plane_ctl[pipe][plane] = read_reg(addr + 0x80);
 			wm_trans[pipe][plane] = read_reg(addr + 0x00168);
 			buf_cfg[pipe][plane] = read_reg(addr + 0x0017C);
-			if (plane != 0 && intel_gen(devid) < 11)
+			if (!is_cursor(plane) && intel_gen(devid) < 11)
 				nv12_buf_cfg[pipe][plane] = read_reg(addr + 0x00178);
 			else
 				nv12_buf_cfg[pipe][plane] = 0;
@@ -431,7 +436,7 @@ static void skl_wm_dump(void)
 		if (intel_gen(devid) >= 11)
 			continue;
 
-		if (plane == 0)
+		if (is_cursor(plane))
 			continue;
 
 		printf("%21s\t", skl_nv12_buf_cfg_reg_name(plane));
@@ -458,7 +463,7 @@ static void skl_wm_dump(void)
 
 		printf("     LEVEL");
 		for (plane = 0; plane < num_planes; plane++) {
-			if (plane == 0)
+			if (is_cursor(plane))
 				enable = REG_DECODE1(plane_ctl[pipe][plane], 0, 3) ||
 					REG_DECODE1(plane_ctl[pipe][plane], 5, 1);
 			else
-- 
2.39.1
