Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E4410E694
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:44:56 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:32 +0200
Message-Id: <20220901114442.55071-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/12] lib/i915: Mark gem_create as handling
 const memory regions
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Make the memory regions passed to gem_crate_in_memory_region_list() as
being const.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 lib/i915/intel_memory_region.c | 4 ++--
 lib/i915/intel_memory_region.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 93a18982c1..568bace949 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -198,7 +198,7 @@ bool gem_has_lmem(int fd)
 /* A version of gem_create_in_memory_region_list which can be allowed to
    fail so that the object creation can be retried */
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
-				       struct drm_i915_gem_memory_class_instance *mem_regions,
+				       const struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions)
 {
 	struct drm_i915_gem_create_ext_memory_regions ext_regions = {
@@ -234,7 +234,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
  * @num_regions: @mem_regions length
  */
 uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
-					  struct drm_i915_gem_memory_class_instance *mem_regions,
+					  const struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions)
 {
 	uint32_t handle;
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index e1bfe0ca65..fd04df83b5 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -65,11 +65,11 @@ unsigned int gem_get_lmem_region_count(int fd);
 bool gem_has_lmem(int fd);
 
 int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size, uint32_t flags,
-				       struct drm_i915_gem_memory_class_instance *mem_regions,
+				       const struct drm_i915_gem_memory_class_instance *mem_regions,
 				       int num_regions);
 
 uint32_t gem_create_in_memory_region_list(int fd, uint64_t size, uint32_t flags,
-					  struct drm_i915_gem_memory_class_instance *mem_regions,
+					  const struct drm_i915_gem_memory_class_instance *mem_regions,
 					  int num_regions);
 
 /*
-- 
2.34.1
