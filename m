Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C2D6ECF0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 09:48:57 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Thu, 12 Dec 2019 11:45:59 +0200
Message-Id: <20191212094601.21940-2-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212094601.21940-1-stanislav.lisovskiy@intel.com>
References: <20191212094601.21940-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v15 1/3] igt/lib: Check if query_info is null
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com, juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>

On TGL ocassionally got a crash, as query_info
was 0, which caused crash. Don't know why it
wasn't(or if it was) noticed else where.

Regardless of what's the reason probably
checking is still better than crashing.

Change-Id: Ia407e44592a6357126bad3ed0c5fcaed1bd365d6
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 lib/i915/intel_memory_region.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index c3d9c814..c62ac6ad 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -127,6 +127,10 @@ uint8_t gem_get_lmem_region_count(int fd)
 	uint8_t lmem_regions = 0;
 
 	query_info = gem_get_query_memory_regions(fd);
+
+	if (!query_info)
+		return 0;
+
 	num_regions = query_info->num_regions;
 
 	for (int i = 0; i < num_regions; i++) {
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
