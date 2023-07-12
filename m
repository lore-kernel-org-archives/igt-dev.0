Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D6410E5A9
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jul 2023 17:13:54 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 12 Jul 2023 19:12:19 +0200
Message-Id: <20230712171231.290555-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
References: <20230712171231.290555-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 09/21] lib/xe_query: Use vramN when
 returning string region name
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

For tests which are mixing regions (like xe_ccs) name is confusing.
As an example might be example "subtest-name-vram-1-vram-1". It's
more readable when it will be renamed to "subtest-name-vram1-vram1".

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/xe/xe_query.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 48fb5afba7..830b7e401d 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -445,7 +445,7 @@ struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
  * xe_region_name:
  * @region: region mask
  *
- * Returns region string like "system" or "vram-n" where n=0...62.
+ * Returns region string like "system" or "vramN" where N=0...62.
  */
 const char *xe_region_name(uint64_t region)
 {
@@ -457,7 +457,7 @@ const char *xe_region_name(uint64_t region)
 		vrams = calloc(64, sizeof(char *));
 		for (int i = 0; i < 64; i++) {
 			if (i != 0)
-				asprintf(&vrams[i], "vram-%d", i - 1);
+				asprintf(&vrams[i], "vram%d", i - 1);
 			else
 				asprintf(&vrams[i], "system");
 			igt_assert(vrams[i]);
-- 
2.34.1
