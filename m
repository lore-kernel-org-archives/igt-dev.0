Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE76510E18D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 18:22:39 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 14:22:28 -0400
Message-ID: <20231103182230.1039191-4-aurabindo.pillai@amd.com>
In-Reply-To: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 3/5] lib/amd: improve readablity for MALL
 capability check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Move the hard coded string out of the function and define
an identifier for checking MALL supported/enabled status

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 8c736b3e2..177a1094d 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -45,6 +45,8 @@
 #define Y6 64
 #define Y7 128
 
+#define mall_supported "mall supported: yes"
+#define mall_enabled "mall supported: yes, enabled: yes"
 
 uint32_t igt_amd_create_bo(int fd, uint64_t size)
 {
@@ -1192,11 +1194,11 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 	if (!get_dm_capabilities(drm_fd, buf, 1024))
 		return;
 
-	mall_loc = strstr(buf, "mall supported: yes");
+	mall_loc = strstr(buf, mall_supported);
 	if (mall_loc)
 		*supported = true;
 
-	mall_loc = strstr(buf, "enabled: yes");
+	mall_loc = strstr(buf, mall_enabled);
 	if (mall_loc && *supported)
 		*enabled = true;
 }
-- 
2.39.2
