Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 25 May 2022 19:37:00 +0100
Message-Id: <20220525183702.490989-8-matthew.auld@intel.com>
In-Reply-To: <20220525183702.490989-1-matthew.auld@intel.com>
References: <20220525183702.490989-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Will be useful later.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/i915/intel_memory_region.c | 2 ++
 lib/i915/intel_memory_region.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
index da81650d..2dd4c156 100644
--- a/lib/i915/intel_memory_region.c
+++ b/lib/i915/intel_memory_region.c
@@ -956,6 +956,8 @@ struct gem_memory_region *__gem_get_memory_regions(int i915)
 
 		r->ci = info->regions[i].region;
 		r->size = info->regions[i].probed_size;
+		/* XXX: replace with probed_cpu_visible_size */
+		r->cpu_size = info->regions[i].rsvd1[0];
 		if (r->size == -1ull)
 			r->size = intel_get_avail_ram_mb() << 20;
 
diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
index 5aa163dd..8ee1ed9b 100644
--- a/lib/i915/intel_memory_region.h
+++ b/lib/i915/intel_memory_region.h
@@ -155,6 +155,7 @@ struct gem_memory_region {
 
 	struct drm_i915_gem_memory_class_instance ci;
 	uint64_t size;
+	uint64_t cpu_size;
 };
 
 struct igt_collection *
-- 
2.34.3
