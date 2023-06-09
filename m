Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F1010E6C9
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 15:44:24 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 16:43:35 +0100
Message-Id: <20230609154336.516503-6-matthew.auld@intel.com>
In-Reply-To: <20230609154336.516503-1-matthew.auld@intel.com>
References: <20230609154336.516503-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/6] tests/xe/query: extend for CPU
 visible accounting
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

Print the visible size and how much is used. Also sanity check the
values.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 tests/xe/xe_query.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index 40bd19ae7..6c74a96a0 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -230,6 +230,23 @@ test_query_mem_usage(int fd)
 		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
 		       mem_usage->regions[i].min_page_size,
 		       mem_usage->regions[i].max_page_size);
+
+		igt_info("visible size=%lluMiB\n",
+			 mem_usage->regions[i].cpu_visible_size >> 20);
+		igt_info("visible used=%lluMiB\n",
+			 mem_usage->regions[i].cpu_visible_used >> 20);
+
+		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_size,
+				   mem_usage->regions[i].total_size);
+		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
+				   mem_usage->regions[i].cpu_visible_size);
+		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
+				   mem_usage->regions[i].used);
+		igt_assert_lte_u64(mem_usage->regions[i].used,
+				   mem_usage->regions[i].total_size);
+		igt_assert_lte_u64(mem_usage->regions[i].used -
+				   mem_usage->regions[i].cpu_visible_used,
+				   mem_usage->regions[i].total_size);
 	}
 	dump_hex_debug(mem_usage, query.size);
 	free(mem_usage);
-- 
2.40.1
