Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC2210E19B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 21:52:40 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:52:32 -0700
Message-Id: <20230922215233.2438200-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
References: <20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/i915: Export engine to gt mapping
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

Some tests benefit from this helper. Export it.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 lib/i915/gem_engine_topology.c | 2 +-
 lib/i915/gem_engine_topology.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 7c6cd9ba9..a823e47a1 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -370,7 +370,7 @@ mtl_engine_to_gt_map(const struct i915_engine_class_instance *e)
 	}
 }
 
-static int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
+int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine)
 {
 	uint32_t devid = intel_get_drm_devid(i915);
 
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 89642c317..8964ce5f7 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -61,6 +61,7 @@ intel_get_current_physical_engine(struct intel_engine_data *ed);
 
 void intel_next_engine(struct intel_engine_data *ed);
 
+int gem_engine_to_gt_map(int i915, const struct i915_engine_class_instance *engine);
 struct i915_engine_class_instance *
 gem_list_engines(int i915,
 		 uint32_t gt_mask,
-- 
2.38.1
