Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC1110E18D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 18:22:39 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Nov 2023 14:22:27 -0400
Message-ID: <20231103182230.1039191-3-aurabindo.pillai@amd.com>
In-Reply-To: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
References: <20231103182230.1039191-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 2/5] llib/amd: Update function
 documentation
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

The existing documetation incorrectly specifies the return value.
Update the doc entry for functions that check MALL status

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index f0fbe97ef..8c736b3e2 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1178,8 +1178,8 @@ static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
  * @brief check if AMDGPU mall_capable interface entry exist and defined
  *
  * @param drm_fd DRM file descriptor
- * @return true if dm capabilities interface exists and MALL is supported
- * @return false if capabilities could not be read.
+ * @param supported will be set to true if hardware supports MALL
+ * @param enabled will be set to true if MALL is currently in use
  */
 void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
 {
-- 
2.39.2
