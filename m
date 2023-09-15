Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE9310E63B
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 14:47:51 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 14:46:49 +0000
Message-Id: <20230915144649.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/intel/xe_query: Print
 XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY value
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

The key XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY has been added to the
info array provided in struct drm_xe_query_config. It represents
the value of the highest available exec queue priority. The existing
test is extended to also print the value returned for this key.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_query.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9835b895d..5966968d3 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -381,6 +381,8 @@ test_query_config(int fd)
 		config->info[XE_QUERY_CONFIG_GT_COUNT]);
 	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
 		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
+	igt_info("XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY\t%llu\n",
+		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY]);
 	dump_hex_debug(config, query.size);
 
 	free(config);
-- 
2.34.1
