Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A393510E9A2
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 20:00:12 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 2 Nov 2023 15:59:59 -0400
Message-ID: <20231102200000.969208-3-aurabindo.pillai@amd.com>
In-Reply-To: <20231102200000.969208-1-aurabindo.pillai@amd.com>
References: <20231102200000.969208-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/amd: Update function documentation
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

The existing documetation incorrectly specifies the return value.
Update the doc entry for functions that check MALL and SubVP status

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 lib/igt_amd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index e0c9d6a6d..355daf26f 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -1192,8 +1192,8 @@ static bool get_dm_capabilities(int drm_fd, char *buf, size_t size)
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
@@ -1219,8 +1219,8 @@ void igt_amd_get_mall_status(int drm_fd, bool *supported, bool *enabled)
  * @brief check if AMDGPU sub-viewport support exists
  *
  * @param drm_fd DRM file descriptor
- * @return true if dm capabilities interface exists and SubVP is supported
- * @return false if capabilities could not be read.
+ * @param supported set to true if harwdare supports subviewport
+ * @param enabled set tot true if subviewport is currently in use
  */
 void igt_amd_get_subvp_status(int drm_fd, bool *supported, bool *enabled)
 {
-- 
2.39.2
