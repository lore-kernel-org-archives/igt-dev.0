Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Jun 2022 20:06:56 +0100
Message-Id: <20220629190658.395463-7-matthew.auld@intel.com>
In-Reply-To: <20220629190658.395463-1-matthew.auld@intel.com>
References: <20220629190658.395463-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/9] lib/i915/intel_memory_region: plumb
 through the cpu_size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Will be useful later.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/i915/intel_memory_region.c | 2 ++
 lib/i915/intel_memory_region.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index 3173507f..93a18982 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -956,6 +956,8 @@ struct gem_memory_region *__gem_get_memory_regions(int i915)
 
 		r->ci = info->regions[i].region;
 		r->size = info->regions[i].probed_size;
+		/* XXX: replace with probed_cpu_visible_size */
+		r->cpu_size = info->regions[i].rsvd1[0];
 		if (r->size == -1ull)
 			r->size = igt_get_avail_ram_mb() << 20;
 
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 40ff832d..e1bfe0ca 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -176,6 +176,7 @@ struct gem_memory_region {
 
 	struct drm_i915_gem_memory_class_instance ci;
 	uint64_t size;
+	uint64_t cpu_size;
 };
 
 struct igt_collection *
-- 
2.36.1
