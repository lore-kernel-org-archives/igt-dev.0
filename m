Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB7710E9A1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 20:00:09 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Nov 2023 15:59:57 -0400
Message-ID: <20231102200000.969208-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/4] lib/amd: improve MALL capabilities
 checking logic
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

improve strstr() arguments to be more accurate when
multiple features are exposed in DM capabilities end point

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 84c6d7545..85afec99e 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -45,6 +45,12 @@
 #define Y6 64
 #define Y7 128
 
+#define SUPP "supported: yes"
+#define EN ", enabled: yes"
+
+#define MALL_SUPP "mall " SUPP
+#define MALL_EN MALL_SUPP EN
+
 struct dim2d
 {
     int w;
@@ -1197,11 +1203,11 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 	if (!get_dm_capabilities(drm_fd, buf, 1024))
 		return;
 
-	mall_loc = strstr(buf, "mall supported: yes");
+	mall_loc = strstr(buf, MALL_SUPP);
 	if (mall_loc)
 		*supported = true;
 
-	mall_loc = strstr(buf, "enabled: yes");
+	mall_loc = strstr(buf, MALL_EN);
 	if (mall_loc && *supported)
 		*enabled = true;
 }
-- 
2.39.2
