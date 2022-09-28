Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FAF10E5A5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 18:06:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Sep 2022 20:06:38 +0200
Message-Id: <20220928180638.52913-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
References: <20220928180638.52913-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] lib/intel_memory_region: Remove
 function which returns batch size in regions
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

Function gem_get_batch_size() is confusing as it might return different
size thus deceiving reader of object real size created in different
memory regions.

Let's remove it and enforce igt user to be aware that kernel may alter
size where it is necessary.

v2: reword commit message (Kamil)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/i915/intel_memory_region.c | 14 --------------
 lib/i915/intel_memory_region.h |  1 -
 2 files changed, 15 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 568bace949..d80cb3a061 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -92,20 +92,6 @@ const char *get_memory_region_name(uint32_t region)
 	igt_assert_f(false, "Unknown memory region");
 }
 
-/**
- *  gem_get_batch_size:
- *  @fd: open i915 drm file descriptor
- *  @mem_region_type: used memory_region type
- *
- *  With introduction of LMEM we observe different page sizes for those two
- *  memory regions. Without this helper funtion we may be prone to forget
- *  about setting proper page size.
- */
-uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type)
-{
-	return (mem_region_type == I915_MEMORY_CLASS_DEVICE) ? 65536 : 4096;
-}
-
 /**
  * gem_get_query_memory_regions:
  * @fd: open i915 drm file descriptor
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index fd04df83b5..425bda0ec7 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -56,7 +56,6 @@
 bool gem_has_query_support(int fd);
 
 const char *get_memory_region_name(uint32_t region);
-uint32_t gem_get_batch_size(int fd, uint8_t mem_region_type);
 
 struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int fd);
 
-- 
2.34.1
