Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8F10F178
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 09:17:12 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 31 Mar 2023 11:16:59 +0200
Message-Id: <20230331091700.69801-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
References: <20230331091700.69801-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] lib/xe_query: Add memory region getter
 from region mask
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

Due to xe is strict regarding bo create size we need to be aware
what's driver allocations restrictions. Add a getter for memory
region which describes requirements.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.c | 12 ++++++++++++
 lib/xe/xe_query.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index f281bc4a31..24a258a5e1 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -426,6 +426,18 @@ struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx)
 	return &xe_dev->hw_engines[idx];
 }
 
+struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region)
+{
+	struct xe_device *xe_dev;
+	int region_idx = ffs(region) - 1;
+
+	xe_dev = find_in_cache(fd);
+	igt_assert(xe_dev);
+	igt_assert(xe_dev->mem_usage->num_regions > region_idx);
+
+	return &xe_dev->mem_usage->regions[region_idx];
+}
+
 /**
  * xe_number_hw_engine:
  * @fd: xe device fd
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index fddd05cf73..0d4b810a10 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -83,6 +83,7 @@ uint64_t vram_memory(int fd, int gt);
 uint64_t vram_if_possible(int fd, int gt);
 struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
 struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
+struct drm_xe_query_mem_region *xe_mem_region(int fd, uint64_t region);
 unsigned int xe_number_hw_engines(int fd);
 bool xe_has_vram(int fd);
 //uint64_t xe_vram_size(int fd);
-- 
2.34.1
