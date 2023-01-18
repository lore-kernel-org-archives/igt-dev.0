Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17A010E68D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:13:58 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:32 -0800
Message-Id: <20230118071350.17498-2-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
References: <20230118071350.17498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v10 01/19] lib/i915: memory region
 gtt_alignment support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update library to include gtt_alignment field to support
platforms with 64K device memory pages.

v2: Do not pull in gtt_alignment uapi

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/intel_memory_region.c | 6 ++++++
 lib/i915/intel_memory_region.h | 1 +
 lib/intel_chipset.h            | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 84e1bceb3..964962ebb 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -948,6 +948,12 @@ struct gem_memory_region *__gem_get_memory_regions(int i915)
 		if (r->size == -1ull)
 			r->size = igt_get_avail_ram_mb() << 20;
 
+		if (HAS_64K_PAGES(intel_get_drm_devid(i915)) &&
+		    r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
+			r->gtt_alignment = 16 * PAGE_SIZE;
+		else
+			r->gtt_alignment = PAGE_SIZE;
+
 		asprintf(&r->name, "%s%d",
 			 region_repr(&r->ci), r->ci.memory_instance);
 
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 425bda0ec..84abb95b1 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -174,6 +174,7 @@ struct gem_memory_region {
 	char *name;
 
 	struct drm_i915_gem_memory_class_instance ci;
+	uint64_t gtt_alignment;
 	uint64_t size;
 	uint64_t cpu_size;
 };
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 9b39472ad..0d825d42c 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -227,4 +227,6 @@ void intel_check_pch(void);
 
 #define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
 
+#define HAS_64K_PAGES(devid)	(IS_DG2(devid))
+
 #endif /* _INTEL_CHIPSET_H */
-- 
2.21.0.rc0.32.g243a4c7e27
