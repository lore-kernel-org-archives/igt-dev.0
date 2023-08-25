Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F405110E699
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 13:50:58 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 25 Aug 2023 09:50:53 -0400
Message-ID: <20230825135053.196364-3-aurabindo.pillai@amd.com>
In-Reply-To: <20230825135053.196364-1-aurabindo.pillai@amd.com>
References: <20230825135053.196364-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH v2 3/3] lib/amdgpu: checkpatch.pl fixes
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

fix checkpatch.pl identified issue: typo and braces

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index b67cc9be0..84c6d7545 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1154,7 +1154,8 @@ void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool ena
 	close(hpd_fd);
 }
 
-static bool get_dm_capabilites(int drm_fd, char *buf, size_t size) {
+static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
+{
 	int ret, fd;
 	bool has_capablities = amd_has_debugfs(drm_fd, DEBUGFS_DM_CAPABILITIES);
 
@@ -1183,7 +1184,7 @@ static bool get_dm_capabilites(int drm_fd, char *buf, size_t size) {
  *
  * @param drm_fd DRM file descriptor
  * @return true if dm capabilities interface exists and MALL is supported
- * @return false if capabilites could not be read.
+ * @return false if capabilities could not be read.
  */
 void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 {
@@ -1193,7 +1194,7 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 	*supported = false;
 	*enabled = false;
 
-	if (!get_dm_capabilites(drm_fd, buf, 1024))
+	if (!get_dm_capabilities(drm_fd, buf, 1024))
 		return;
 
 	mall_loc = strstr(buf, "mall supported: yes");
-- 
2.41.0
