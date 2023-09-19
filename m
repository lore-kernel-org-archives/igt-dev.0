Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:56 -0400
Message-ID: <20230919142000.91363-14-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/16] drm-uapi/xe: Fix naming of
 XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with kernel commit
("drm/xe/uapi: Fix naming of XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 4 ++--
 tests/intel/xe_query.c    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 69b62e84f..9bef90b1f 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -330,8 +330,8 @@ struct drm_xe_query_config {
 #define XE_QUERY_CONFIG_VA_BITS			3
 #define XE_QUERY_CONFIG_GT_COUNT		4
 #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
-#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
-#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
+#define XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	6
+#define XE_QUERY_CONFIG_NUM_PARAM		(XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1)
 	/** @info: array of elements containing the config info */
 	__u64 info[];
 };
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index e0d14966b..17215fd72 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -380,8 +380,8 @@ test_query_config(int fd)
 		config->info[XE_QUERY_CONFIG_GT_COUNT]);
 	igt_info("XE_QUERY_CONFIG_MEM_REGION_COUNT\t%llu\n",
 		config->info[XE_QUERY_CONFIG_MEM_REGION_COUNT]);
-	igt_info("XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY\t%llu\n",
-		config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY]);
+	igt_info("XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY\t%llu\n",
+		config->info[XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY]);
 	dump_hex_debug(config, query.size);
 
 	free(config);
-- 
2.41.0
